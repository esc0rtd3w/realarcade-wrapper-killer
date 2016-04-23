unit Debugger;

{
  Inno Pascal
  Copyright (C) 2000 Jordan Russell

  www:    http://www.jrsoftware.org/
          or http://www.jordanr.cjb.net/
  email:  jr@jrsoftware.org

  This program is free software; you can redistribute it and/or
  modify it under the terms of the GNU General Public License
  as published by the Free Software Foundation; either version 2
  of the License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
}

interface

uses
  Windows, SysUtils;

procedure StartDebug (const AImageFilename, AParams: String;
  const ACommWnd: HWND; const ACommMsg: UINT);
procedure StopDebug;

const
  dmLog = 0;
  dmCriticalError = 1;
  dmPaused = 2;
  dmStopped = 3;

type
  PDebugMsgLogData = ^TDebugMsgLogData;
  TDebugMsgLogData = record
    Typ, Details: String;
  end;

  PDebugMsgPauseData = ^TDebugMsgPauseData;
  TDebugMsgPauseData = record
    Context: PContext;
    Address: Cardinal;
    AlwaysWait: Boolean;
  end;

var
  { read-only: }
  Debugging: Boolean;
  DebugContinueEvent: THandle;
  { writable: }
  DebugSingleStep: Boolean;
  DebugWantBreakpointAt: Cardinal;

implementation

uses
  CmnFunc2, DebuggerProcs;

var
  DebugThread: THandle;
  DebugProcess: THandle;

type
  PDebugThreadData = ^TDebugThreadData;
  TDebugThreadData = record
    ImageFilename, Params: String;
    CommWnd: HWND;
    CommMsg: UINT;
  end;

function DebugThreadProc (Data: PDebugThreadData): Integer; forward;

procedure StartDebug (const AImageFilename, AParams: String;
  const ACommWnd: HWND; const ACommMsg: UINT);
var
  Data: PDebugThreadData;
  ThreadId: DWORD;
begin
  New (Data);
  try
    Data.ImageFilename := ExpandFileName(AImageFilename);
    Data.Params := AParams;
    Data.CommWnd := ACommWnd;
    Data.CommMsg := ACommMsg;
    DebugProcess := 0;

    if DebugThread <> 0 then begin
      { Close handle to last debug thread }
      CloseHandle (DebugThread);
      DebugThread := 0;
    end;
    Debugging := True;
    DebugThread := BeginThread(nil, 0, @DebugThreadProc, Data, 0, ThreadId);
    if DebugThread = 0 then
      RaiseLastWin32Error;
    Data := nil;  { the thread will free Data; prevent it from being freed below }
  except
    Debugging := False;
    FreeMem (Data);
    raise;
  end;
end;

procedure StopDebug;
var
  Msg: TMsg;
begin
  if not Debugging then
    Exit;
  Win32Check (TerminateProcess(DebugProcess, 0));
  { If paused, upon continuing it'll get an EXIT_PROCESS_DEBUG_EVENT }
  SetEvent (DebugContinueEvent);
  { Wait for the debug thread to terminate. When a message sent from another
    thread is waiting, call PeekMessage so that it gets processed right now.
    We have to do that because the debug thread sends WM_Debug* messages
    during termination. }
  while True do
    case MsgWaitForMultipleObjects(1, DebugThread, False, INFINITE, QS_SENDMESSAGE) of
      WAIT_OBJECT_0: Break;
      WAIT_OBJECT_0 + 1: PeekMessage (Msg, 0, 0, 0, PM_NOREMOVE);
    else
      RaiseLastWin32Error;
    end;
end;

function DebugThreadProc (Data: PDebugThreadData): Integer;

  procedure DebugLog (const AType, ADetails: String);
  var
    LogData: TDebugMsgLogData;
  begin
    LogData.Typ := AType;
    LogData.Details := ADetails;
    SendMessage (Data.CommWnd, Data.CommMsg, dmLog, LPARAM(@LogData));
  end;

  procedure CriticalError (const Msg: String);
  begin
    SendMessage (Data.CommWnd, Data.CommMsg, dmCriticalError, LPARAM(Msg));
  end;

var
  ErrorMsg: LPARAM;
  CmdLine, S: String;
  L: Integer;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  DE: TDebugEvent;
  ContinueStatus: DWORD;
  Process, Thread: THandle;
  Context: TContext;
  SaveByte: Byte;
  BkptAddr, StepBkptAddr: Cardinal;
  ImageBase: Cardinal;
  FirstBreakpoint: Boolean;
  JumpInstr: packed record
    Opcode: Word;
    JumpAddrAt: LongWord;
  end;
  ReturnAddr: LongWord;
  Buf: Pointer;
  Addr, AddrWanted: Pointer;
const
  Int3 = $CC;
  TraceFlag = $100;
  ReadWriteText: array[Boolean] of String = ('Read', 'Write');

  procedure WriteByte (const VA: Cardinal; const NewByte: Byte;
    const OldByte: PByte);
  begin
    if Assigned(OldByte) then
      Win32Check (ReadProcessMemory (Process, Pointer(VA), OldByte, 1, Cardinal(nil^)));
    Win32Check (WriteProcessMemory (Process, Pointer(VA), @NewByte, 1, Cardinal(nil^)));
    Win32Check (FlushInstructionCache (Process, nil, 0));
  end;

  procedure Pause (const WaitOnlyIfSourceLineFound: Boolean);
  var
    PauseData: TDebugMsgPauseData;
  begin
    PauseData.Context := @Context;
    PauseData.Address := Context.Eip - ImageBase;
    PauseData.AlwaysWait := not WaitOnlyIfSourceLineFound;
    ResetEvent (DebugContinueEvent);
    if SendMessage(Data.CommWnd, Data.CommMsg, dmPaused,
       LPARAM(@PauseData)) = 1 then begin
      { If "1" was returned, a source code line was found matching Context.Eip.
        Now wait until the user chooses the next course of action (continue
        single stepping, run, stop, etc.) }
      WaitForSingleObject (DebugContinueEvent, INFINITE);
      { Did the user choose "Run to Cursor"? If so, set up a breakpoint on the
        next single step exception. (Can't set breakpoint now, or else it would
        get the breakpoint over and over on the same instruction if the user
        chose "Run to Cursor" on the line it was already stopped on.) }
      StepBkptAddr := InterlockedExchange(Integer(DebugWantBreakpointAt), 0);
      if StepBkptAddr <> 0 then begin
        Inc (StepBkptAddr, ImageBase);
        Context.EFlags := Context.EFlags or TraceFlag;
        Context.ContextFlags := CONTEXT_CONTROL;
        Win32Check (SetThreadContext (Thread, Context));
      end;
    end;
  end;

begin
  Result := 0;
  ErrorMsg := 0;
  Process := 0;
  Thread := 0;
  try
    FillChar (StartupInfo, SizeOf(StartupInfo), 0);
    StartupInfo.cb := SizeOf(StartupInfo);
    CmdLine := AddQuotes(Data.ImageFilename);
    if Data.Params <> '' then
      CmdLine := CmdLine + ' ' + Data.Params;
    Win32Check (CreateProcess(nil, PChar(CmdLine),
      nil, nil, False, {DEBUG_PROCESS or} DEBUG_ONLY_THIS_PROCESS,
      nil, Pointer(ExtractFilePath(Data.ImageFilename)), StartupInfo, ProcessInfo));
    DebugProcess := ProcessInfo.hProcess;
    CloseHandle (ProcessInfo.hThread);

    BkptAddr := 0;
    StepBkptAddr := 0;
    FirstBreakpoint := True;
    SaveByte := 0;
    ImageBase := 0;
    while WaitForDebugEvent(DE, INFINITE) do begin
      ContinueStatus := DBG_EXCEPTION_NOT_HANDLED;
      case DE.dwDebugEventCode of
        CREATE_PROCESS_DEBUG_EVENT: begin
            Process := DE.CreateProcessInfo.hProcess;
            Thread := DE.CreateProcessInfo.hThread;
            ImageBase := Cardinal(DE.CreateProcessInfo.lpBaseOfImage);
            DebugLog ('Process created', Format('Base: $%.8x', [ImageBase]));
            CloseHandle (DE.CreateProcessInfo.hFile);
            Assert (Process <> 0);
            Assert (Thread <> 0);
          end;
        EXIT_PROCESS_DEBUG_EVENT: begin
            DebugLog ('Process exited', '');
            Break;
          end;
        CREATE_THREAD_DEBUG_EVENT: begin
            DebugLog ('Thread created', '');
          end;
        EXIT_THREAD_DEBUG_EVENT: begin
            DebugLog ('Thread exited', '');
          end;
        LOAD_DLL_DEBUG_EVENT: begin
            //DebugLog ('DLL loaded', Format('Base: $%.8x', [Cardinal(DE.LoadDll.lpBaseOfDll)]));
            Addr := DE.LoadDll.lpBaseOfDll;
            AddrWanted := DebugGetPreferredLoadAddress(DebugProcess, Addr);
            s := Format('%s, Base: $%.8x',
              [DebugProcessGetModuleName(DebugProcess, Addr), Cardinal(Addr)]);
            if (AddrWanted <> nil) and (AddrWanted <> Addr) then
              s := s + Format(', Relocated from $%.8x', [Cardinal(AddrWanted)]);
            DebugLog ('DLL loaded', s);
            S := '';
            CloseHandle (DE.LoadDll.hFile);
          end;
        UNLOAD_DLL_DEBUG_EVENT: begin
            DebugLog ('DLL unloaded', '');
          end;
        OUTPUT_DEBUG_STRING_EVENT: begin
            ContinueStatus := DBG_CONTINUE;
            with DE.DebugString do begin
              L := nDebugStringLength - 1;  { don't need the terminating null character }
              if fUniCode <> 0 then
                L := L * 2;
              GetMem (Buf, L);
              try
                if not ReadProcessMemory(Process, lpDebugStringData, Buf, L, Cardinal(nil^)) then
                  S := '<invalid string address>'
                else begin
                  if fUnicode = 0 then
                    SetString (S, PAnsiChar(Buf), L)
                  else
                    WideCharLenToStrVar (PWideChar(Buf), L div 2, S);
                end;
                DebugLog ('String', S);
                S := '';
              finally
                FreeMem (Buf);
              end;
            end;
          end;
        EXCEPTION_DEBUG_EVENT: begin
            case DE.Exception.ExceptionRecord.ExceptionCode of
              EXCEPTION_BREAKPOINT: begin
                  ContinueStatus := DBG_CONTINUE;
                  if FirstBreakpoint then begin
                    { When a process starts, the system generates its own
                      breakpoint exception. Use this opportunity to set up
                      an initial breakpoint in our program. }
                    FirstBreakpoint := False;
                    BkptAddr := InterlockedExchange(Integer(DebugWantBreakpointAt), 0);
                    if BkptAddr <> 0 then
                      Inc (BkptAddr, ImageBase)
                    else if DebugSingleStep then
                      { Set a breakpoint at the program's entry point, so single
                        stepping can begin there. }
                      BkptAddr := ImageBase + $2000;
                    if BkptAddr <> 0 then
                      WriteByte (BkptAddr, Int3, @SaveByte);
                  end
                  else begin
                    Context.ContextFlags := CONTEXT_CONTROL or CONTEXT_INTEGER or
                      CONTEXT_SEGMENTS;
                    Win32Check (GetThreadContext (Thread, Context));
                    { When a breakpoint exception is raised, EIP points to the
                      instruction following the breakpoint instruction (INT3).
                      So, if EIP is one byte past BkptAddr, we have gotten to
                      the breakpoint we were waiting for. }
                    if (BkptAddr <> 0) and (Context.Eip = BkptAddr + 1) then begin
                      { Move EIP back to the INT3 byte ($CC), and replace it
                        with the original byte. }
                      Context.Eip := BkptAddr;
                      WriteByte (BkptAddr, SaveByte, nil);
                      BkptAddr := 0;
                      Pause (True);
                      if DebugSingleStep then
                        Context.EFlags := Context.EFlags or TraceFlag;
                      Context.ContextFlags := CONTEXT_CONTROL;
                      Win32Check (SetThreadContext (Thread, Context));
                    end;
                  end;
                end;
              EXCEPTION_SINGLE_STEP: begin
                  ContinueStatus := DBG_CONTINUE;
                  if StepBkptAddr <> 0 then begin
                    BkptAddr := StepBkptAddr;
                    StepBkptAddr := 0;
                    WriteByte (BkptAddr, Int3, @SaveByte);
                  end;
                  if DebugSingleStep then begin
                    Context.ContextFlags := CONTEXT_CONTROL or CONTEXT_INTEGER or
                      CONTEXT_SEGMENTS;
                    GetThreadContext (Thread, Context);
                    { Note: When a single step exception is raised, EIP points
                      to the instruction that will be executed next. }

                    if (Context.Eip < ImageBase + $2000) or
                       (Context.Eip >= ImageBase + $3000) then begin
                      { We've left our code! Stop single stepping. }
                      //OutputDebugString (PChar(Format('untracable step - %.8x', [Context.Eip])));
                    end
                    else begin
                      //OutputDebugString (PChar(Format('step - %.8x', [Context.Eip])));
                      Pause (True);
                      if DebugSingleStep then begin
                        { Don't trace into jmp [xxxxxxxx] instructions that are
                          outside our code; instead set a breakpoint on the return
                          address at the top of the stack to resume single
                          stepping there. }
                        if ReadProcessMemory(Process, Pointer(Context.Eip), @JumpInstr, SizeOf(JumpInstr), Cardinal(nil^)) and
                           (JumpInstr.Opcode = $25FF) and
                           ReadProcessMemory(Process, Pointer(Context.Esp), @ReturnAddr, SizeOf(ReturnAddr), Cardinal(nil^)) then begin
                          BkptAddr := ReturnAddr;
                          WriteByte (BkptAddr, Int3, @SaveByte);
                        end
                        else begin
                          { The trace flag is reset after each single step
                            exception, so we have to set it back in order to
                            continue single stepping. }
                          Context.EFlags := Context.EFlags or TraceFlag;
                          Context.ContextFlags := CONTEXT_CONTROL;
                          SetThreadContext (Thread, Context);
                        end;
                      end;
                    end;
                  end;
                end;
              EXCEPTION_ACCESS_VIOLATION: begin
                  Context.ContextFlags := CONTEXT_CONTROL or CONTEXT_INTEGER or
                    CONTEXT_SEGMENTS;
                  GetThreadContext (Thread, Context);
                  CriticalError (Format('Access violation in process at %.8x. %s of address %.8x.',
                    [Context.Eip,
                    ReadWriteText[DE.Exception.ExceptionRecord.ExceptionInformation[0] <> 0],
                    DE.Exception.ExceptionRecord.ExceptionInformation[1]]));
                  Pause (False);
                end;
            else
              {DebugLog ('Unhandled exception',
                IntToHex(DE.Exception.ExceptionRecord.ExceptionCode, 8));}
              CriticalError (Format('Unhandled exception %.8x in process.',
                [DE.Exception.ExceptionRecord.ExceptionCode]));
            end;
          end;
      else
        DebugLog (Format('Unknown (%d)', [DE.dwDebugEventCode]), '');
      end;
      if not ContinueDebugEvent(DE.dwProcessId, DE.dwThreadId, ContinueStatus) then
        Exit;
    end;
  except
    on E: Exception do
      ErrorMsg := LPARAM(StrNew(PChar(E.ClassName + ': ' + E.Message)));
  end;

  if Process <> 0 then
    CloseHandle (Process);
  if Thread <> 0 then
    CloseHandle (Thread);
  Debugging := False;
  CloseHandle (DebugProcess);
  DebugProcess := 0;

  SendMessage (Data.CommWnd, Data.CommMsg, dmStopped, ErrorMsg);
  Dispose (Data);
end;

initialization
  DebugContinueEvent := CreateEvent(nil, True, False, nil);
finalization
  CloseHandle (DebugContinueEvent);
  DebugContinueEvent := 0;
  if DebugThread <> 0 then
    CloseHandle (DebugThread);
end.

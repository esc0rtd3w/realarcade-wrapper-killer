program RunProgram;

// This program calls CreateProcess to run "notepad.exe"

type
  UINT = Cardinal;
  BOOL = Integer;
  DWORD = Cardinal;
  THandle = Cardinal;
  LPSECURITY_ATTRIBUTES = Integer;
  LPOVERLAPPED = Integer;
  Pointer = Integer;
  PByte = Integer;
  TStartupInfo = record
    cb: DWORD;
    lpReserved: Pointer;
    lpDesktop: Pointer;
    lpTitle: Pointer;
    dwX: DWORD;
    dwY: DWORD;
    dwXSize: DWORD;
    dwYSize: DWORD;
    dwXCountChars: DWORD;
    dwYCountChars: DWORD;
    dwFillAttribute: DWORD;
    dwFlags: DWORD;
    wShowWindow: Word;
    cbReserved2: Word;
    lpReserved2: PByte;
    hStdInput: THandle;
    hStdOutput: THandle;
    hStdError: THandle;
  end;
  TProcessInformation = record
    hProcess: THandle;
    hThread: THandle;
    dwProcessId: DWORD;
    dwThreadId: DWORD;
  end;

function CreateProcess(lpApplicationName: Integer; lpCommandLine: PChar;
  lpProcessAttributes, lpThreadAttributes: LPSECURITY_ATTRIBUTES;
  bInheritHandles: BOOL; dwCreationFlags: DWORD; lpEnvironment: Pointer;
  lpCurrentDirectory: Integer; var lpStartupInfo: TStartupInfo;
  var lpProcessInformation: TProcessInformation): BOOL; stdcall;
  external 'kernel32.dll' name 'CreateProcessA';
function CloseHandle(hObject: THandle): BOOL; stdcall; external 'kernel32.dll';
procedure ExitProcess(uExitCode: UINT); stdcall; external 'kernel32.dll';

var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  // yes, a FillChar function would be useful here...
  StartupInfo.cb := SizeOf(TStartupInfo);
  StartupInfo.lpReserved := 0;
  StartupInfo.lpDesktop := 0;
  StartupInfo.lpTitle := 0;
  StartupInfo.dwFlags := 0;
  StartupInfo.cbReserved2 := 0;
  StartupInfo.lpReserved2 := 0;
  CreateProcess(0, 'notepad.exe', 0, 0, 0, 0, 0, 0, StartupInfo, ProcessInfo);
  CloseHandle(ProcessInfo.hProcess);
  CloseHandle(ProcessInfo.hThread);

  ExitProcess(0);
end.

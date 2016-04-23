program TestCode;

// This demonstrates displaying of message boxes, as well as procedure,
// constant, and variable declarations.

// Note: See the file 'limitations.txt' for a list of some of the things that
// aren't supported.

type
  HWND = Integer;
  UINT = Cardinal;
  BOOL = Integer;

// Simplified declarations for some functions
function MessageBox(hWnd: HWND; lpText, lpCaption: PChar;
  uType: UINT): Integer; stdcall; external 'user32.dll' name 'MessageBoxA';
function MessageBeep(uType: UINT): BOOL; stdcall; external 'user32.dll';
function sndPlaySoundA(lpszSound: PChar; fuSound: UINT): BOOL; stdcall;
  external 'winmm.dll';
procedure ExitProcess(uExitCode: UINT); stdcall; external 'kernel32.dll';

// Constants for MessageBox
const
  MB_ICONINFORMATION = $40;
  MB_ICONQUESTION = $20;

procedure MyProcedure; stdcall;

  procedure NestedProc; stdcall;
  const
    someconstant = MB_ICONINFORMATION;  // this constant is local
  begin
    MessageBox(0, 'This is NestedProc.', 'Title', someconstant);
  end;
  
begin
  NestedProc;
  MessageBox(0, 'This is MyProcedure.', 'Title', MB_ICONINFORMATION);
end;

var
  A, B: Integer;
begin
  A := 1;  { only simple assignments are currently supported; no expressions }
  B := A;

  MyProcedure;
  MessageBox(0, 'Now for a chimes sound...', 'Title', MB_ICONQUESTION);

  sndPlaySoundA('chimes.wav', 0);

  { For some reason, on Windows 2000 it will hang if we don't call 
    ExitProcess after playing a sound. (The RET instruction that Inno
    Pascal puts at the end of the code doesn't suffice.) }
  ExitProcess(0);
end.

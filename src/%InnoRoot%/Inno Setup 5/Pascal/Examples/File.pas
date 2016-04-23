program TestFile;

// This program will create a file named "testfileoutput.txt" in the current
// directory containing the text "Hello!"

type
  UINT = Cardinal;
  BOOL = Integer;
  DWORD = Cardinal;
  THandle = Cardinal;
  LPSECURITY_ATTRIBUTES = Integer;
  LPOVERLAPPED = Integer;

function CreateFile(lpFileName: PChar; dwDesiredAccess, dwShareMode: DWORD;
  lpSecurityAttributes: LPSECURITY_ATTRIBUTES; dwCreationDisposition,
  dwFlagsAndAttributes: DWORD; hTemplateFile: THandle): THandle; stdcall;
  external 'kernel32.dll' name 'CreateFileA';
function WriteFile(hFile: THandle; lpBuffer: PChar;
  nNumberOfBytesToWrite: DWORD; var lpNumberOfBytesWritten: DWORD;
  lpOverlapped: LPOVERLAPPED): BOOL; stdcall; external 'kernel32.dll';
function CloseHandle(hObject: THandle): BOOL; stdcall; external 'kernel32.dll';
procedure ExitProcess(uExitCode: UINT); stdcall; external 'kernel32.dll';

const
  GENERIC_READ = $80000000;
  GENERIC_WRITE = $40000000;
  CREATE_ALWAYS = 2;

var
  FileHandle: THandle;
  BytesWritten: DWORD;
begin
  FileHandle := CreateFile('testfileoutput.txt', GENERIC_READ + GENERIC_WRITE,
    0, 0, CREATE_ALWAYS, 0, 0);
  WriteFile(FileHandle, 'Hello!', 6, BytesWritten, 0);
  CloseHandle(FileHandle);

  ExitProcess(0);
end.

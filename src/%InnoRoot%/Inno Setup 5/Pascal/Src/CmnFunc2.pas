unit CmnFunc2;
{$B-}
{ v2.25 }
{ This is a general toolchest of non-VCL functions I use in my programs. }

interface

uses
  WinProcs, WinTypes, SysUtils;

{$IFNDEF VER80} {$IFNDEF VER90} {$IFNDEF VER93}
  {$DEFINE Delphi3orHigher}
{$ENDIF} {$ENDIF} {$ENDIF}

{ Delphi 2 and Win32 compatibility types, constants, and functions }
{$IFNDEF WIN32}
type
  UINT = Word;
  DWORD = Longint;

const
  MAX_PATH = 255;
  Full_MAX_PATH = 260;
  VK_APPS = 93;

procedure SetLength (var S: OpenString; NewLength: Integer);
procedure SetString (var S: OpenString; const Buffer: PChar; Len: Integer);
function StringAsPChar (var S: OpenString): PChar;
function Trim (const S: String): String;
function TrimLeft (const S: String): String;
function TrimRight (const S: String): String;
function GetCurrentDir: String;
function SetCurrentDir (const Dir: String): Boolean;
function ExtractFileDrive(const FileName: string): string;
{$ELSE}
const
  Full_MAX_PATH = MAX_PATH;
type
  StringAsPChar = PChar;
{$ENDIF}

{ Delphi 2.01's RegStr unit should never be used because it contains many
  wrong declarations. Delphi 3's RegStr unit doesn't have this problem, but
  for backward compatibility, it defines a few of the correct registry key
  constants here. }
{$IFDEF WIN32}
const
  { Do NOT localize any of these }
  NEWREGSTR_PATH_SETUP = 'Software\Microsoft\Windows\CurrentVersion';
  NEWREGSTR_PATH_EXPLORER = NEWREGSTR_PATH_SETUP + '\Explorer';
  NEWREGSTR_PATH_SPECIAL_FOLDERS = NEWREGSTR_PATH_EXPLORER + '\Shell Folders';
  NEWREGSTR_PATH_UNINSTALL = NEWREGSTR_PATH_SETUP + '\Uninstall';
  NEWREGSTR_VAL_UNINSTALLER_DISPLAYNAME = 'DisplayName';
  NEWREGSTR_VAL_UNINSTALLER_COMMANDLINE = 'UninstallString';
{$ENDIF}

function DirExists (const Name: String): Boolean;
function FileOrDirExists (const Name: String): Boolean;
function GetIniString ({$IFDEF WIN32}const{$ENDIF} Section, Key, Default, Filename: String): String;
function GetIniInt (const Section, Key: String; const Default, Min, Max: Longint; const Filename: String): Longint;
function GetIniBool (const Section, Key: String; const Default: Boolean; const Filename: String): Boolean;
function IniKeyExists ({$IFDEF WIN32}const{$ENDIF} Section, Key, Filename: String): Boolean;
function IsIniSectionEmpty ({$IFDEF WIN32}const{$ENDIF} Section, Filename: String): Boolean;
function SetIniString ({$IFDEF WIN32}const{$ENDIF} Section, Key, Value, Filename: String): Boolean;
function SetIniInt (const Section, Key: String; const Value: Longint; const Filename: String): Boolean;
function SetIniBool (const Section, Key: String; const Value: Boolean; const Filename: String): Boolean;
procedure DeleteIniEntry ({$IFDEF WIN32}const{$ENDIF} Section, Key, Filename: String);
procedure DeleteIniSection ({$IFDEF WIN32}const{$ENDIF} Section, Filename: String);
function GetEnv (const EnvVar: String): String;
function GetCmdTail: String;
function NewParamCount: Integer;
function NewParamStr (Index: Integer): string;
function AddBackslash (const S: String): String;
function RemoveBackslash (const S: String): String;
function RemoveBackslashUnlessRoot (const S: String): String;
function AddQuotes (const S: String): String;
function RemoveQuotes (const S: String): String;
function GetShortName (const LongName: String): String;
function GetWinDir: String;
function GetSystemDir: String;
function GetTempDir: String;
procedure StringChange (var S: String; const FromStr, ToStr: String);
function AdjustLength (var S: String; const Res: Cardinal): Boolean;
function UsingWinNT: Boolean;
function UsingNewGUI: Boolean;
function FileCopy (const ExistingFile, NewFile: String; const FailIfExists: Boolean;
  const AReadMode: Byte): Boolean;
{$IFDEF WIN32}
function UsingWindows4: Boolean;
function RegQueryStringValue (H: HKEY; Name: PChar; var ResultStr: String): Boolean;
function RegQueryMultiStringValue (H: HKEY; Name: PChar; var ResultStr: String): Boolean;
function RegValueExists (H: HKEY; Name: PChar): Boolean;
function RegDeleteKeyIncludingSubkeys (const Key: HKEY; const Name: PChar): Boolean;
function GetShellFolderPath (const FolderID: Integer): String;
function GetProgramFilesPath: String;
function GetCommonFilesPath: String;
function IsAdminLoggedOn: Boolean;
{$ENDIF}

implementation

{$IFDEF WIN32}
uses
  {$IFDEF VER90} OLE2, {$ELSE} ActiveX, {$ENDIF} ShlObj;

var
  IsWindows4: Boolean;
{$ENDIF}

{$IFNDEF WIN32}
procedure SetLength (var S: OpenString; NewLength: Integer);
begin
  if NewLength > 255 then NewLength := 255;
  Byte(S[0]) := NewLength;
end;

procedure SetString (var S: OpenString; const Buffer: PChar; Len: Integer);
begin
  if Len > 255 then Len := 255;
  Byte(S[0]) := Len;
  if Buffer <> nil then
    Move (Buffer^, S[1], Len);
end;

function StringAsPChar (var S: OpenString): PChar;
begin
  if Length(S) = High(S) then Dec (S[0]);
  S[Length(S)+1] := #0;
  Result := @S[1];
end;

function Trim (const S: String): String;
begin
  Result := TrimLeft(TrimRight(S));
end;

function TrimLeft (const S: String): String;
var
  I, L: Integer;
begin
  L := Length(S);
  I := 1;
  while (I <= L) and (S[I] <= ' ') do Inc (I);
  Result := Copy(S, I, Maxint);
end;

function TrimRight (const S: String): String;
begin
  Result := S;
  while (Result <> '') and (Result[Length(Result)] <= ' ') do
    Dec (Result[0]);
end;

function GetCurrentDir: String;
begin
  GetDir (0, Result);
end;

function SetCurrentDir (const Dir: String): Boolean;
begin
  Result := False;
  if not DirExists(Dir) then Exit;
  try
    ChDir (Dir);
  except
    Exit;
  end;
  Result := True;
end;

function ExtractFileDrive(const FileName: string): string;
var
  I, J: Integer;
begin
  if (Length(FileName) >= 2) and (FileName[2] = ':') then
    Result := Copy(FileName, 1, 2)
  else if (Length(FileName) >= 2) and (FileName[1] = '\') and
    (FileName[2] = '\') then
  begin
    J := 0;
    I := 3;
    While (I < Length(FileName)) and (J < 2) do
    begin
      if FileName[I] = '\' then Inc(J);
      if J < 2 then Inc(I);
    end;
    if FileName[I] = '\' then Dec(I);
    Result := Copy(FileName, 1, I);
  end else Result := '';
end;
{$ENDIF}

function InternalGetFileAttr (const Name: String): Integer;
var
  OldErrorMode: UINT;
begin
  OldErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);  { Prevent "Network Error" boxes }
  try
    {$IFDEF WIN32}
    Result := GetFileAttributes(PChar(RemoveBackslashUnlessRoot(Name)));
    {$ELSE}
    Result := FileGetAttr(RemoveBackslashUnlessRoot(Name));
    {$ENDIF}
  finally
    SetErrorMode (OldErrorMode);
  end;
end;

function DirExists (const Name: String): Boolean;
{ Returns True if the specified directory name exists. The specified name
  may include a trailing backslash.
  NOTE: Delphi's FileCtrl unit has a similar function called DirectoryExists.
  However, the implementation is different between Delphi 1 and 2. (Delphi 1
  does not count hidden or system directories as existing.) }
var
  Attr: Integer;
begin
  Attr := InternalGetFileAttr(Name);
  Result := (Attr >= 0) and (Attr and faDirectory <> 0);
end;

function FileOrDirExists (const Name: String): Boolean;
{ Returns True if the specified directory or file name exists. The specified
  name may include a trailing backslash. }
begin
  Result := InternalGetFileAttr(Name) >= 0;
end;

function GetIniString ({$IFDEF WIN32}const{$ENDIF} Section, Key, Default, Filename: String): String;
{$IFNDEF WIN32}
var
  Buf: array[0..255] of Char;
{$ENDIF}
begin
  {$IFDEF WIN32}
  SetLength (Result, 1023);
  if Filename <> '' then
    SetLength (Result, GetPrivateProfileString(
      StringAsPChar(Section), StringAsPChar(Key), StringAsPChar(Default),
      @Result[1], 1024, StringAsPChar(Filename)))
  else
    SetLength (Result, GetProfileString(
      StringAsPChar(Section), StringAsPChar(Key), StringAsPChar(Default),
      @Result[1], 1024));
  {$ELSE}
  if Filename <> '' then
    GetPrivateProfileString (StringAsPChar(Section), StringAsPChar(Key),
      StringAsPChar(Default), Buf, SizeOf(Buf), StringAsPChar(Filename))
  else
    GetProfileString (StringAsPChar(Section), StringAsPChar(Key),
      StringAsPChar(Default), Buf, SizeOf(Buf));
  Result := StrPas(Buf);
  {$ENDIF}
end;

function GetIniInt (const Section, Key: String;
  const Default, Min, Max: Longint; const Filename: String): Longint;
{ Reads a Longint from an INI file. If the Longint read is not between Min/Max
  then it returns Default. If Min=Max then Min/Max are ignored }
var
  S: String;
  E: Integer;
begin
  S := GetIniString(Section, Key, '', Filename);
  if S = '' then
    Result := Default
  else begin
    Val (S, Result, E);
    if (E <> 0) or ((Min <> Max) and ((Result < Min) or (Result > Max))) then
      Result := Default;
  end;
end;

function GetIniBool (const Section, Key: String; const Default: Boolean;
  const Filename: String): Boolean;
begin
  Result := GetIniInt(Section, Key, Ord(Default), 0, 0, Filename) <> 0;
end;

function IniKeyExists ({$IFDEF WIN32}const{$ENDIF} Section, Key, Filename: String): Boolean;
  function Equals (const Default: PChar): Boolean;
  var
    Test: array[0..7] of Char;
  begin
    Test[0] := #0;
    if Filename <> '' then
      GetPrivateProfileString (StringAsPChar(Section), StringAsPChar(Key), Default,
        Test, SizeOf(Test), StringAsPChar(Filename))
    else
      GetProfileString (StringAsPChar(Section), StringAsPChar(Key), Default,
        Test, SizeOf(Test));
    Result := lstrcmp(Test, Default) = 0;
  end;
begin
  { If the key does not exist, a default string is returned both times. }
  Result := not Equals('x1234x') or not Equals('x5678x');  { <- don't change }
end;

function IsIniSectionEmpty ({$IFDEF WIN32}const{$ENDIF} Section, Filename: String): Boolean;
var
  Test: array[0..255] of Char;
begin
  Test[0] := #0;
  if Filename <> '' then
    GetPrivateProfileString (StringAsPChar(Section), nil, '', Test,
      SizeOf(Test), StringAsPChar(Filename))
  else
    GetProfileString (StringAsPChar(Section), nil, '', Test, SizeOf(Test));
  Result := Test[0] = #0;
end;

function SetIniString ({$IFDEF WIN32}const{$ENDIF} Section, Key, Value, Filename: String): Boolean;
begin
  if Filename <> '' then
    Result := WritePrivateProfileString(StringAsPChar(Section), StringAsPChar(Key),
      StringAsPChar(Value), StringAsPChar(Filename))
  else
    Result := WriteProfileString(StringAsPChar(Section), StringAsPChar(Key),
      StringAsPChar(Value));
end;

function SetIniInt (const Section, Key: String; const Value: Longint;
  const Filename: String): Boolean;
begin
  Result := SetIniString(Section, Key, IntToStr(Value), Filename);
end;

function SetIniBool (const Section, Key: String; const Value: Boolean;
  const Filename: String): Boolean;
begin
  Result := SetIniInt(Section, Key, Ord(Value), Filename);
end;

procedure DeleteIniEntry ({$IFDEF WIN32}const{$ENDIF} Section, Key, Filename: String);
begin
  if Filename <> '' then
    WritePrivateProfileString (StringAsPChar(Section), StringAsPChar(Key),
      nil, StringAsPChar(Filename))
  else
    WriteProfileString (StringAsPChar(Section), StringAsPChar(Key),
      nil);
end;

procedure DeleteIniSection ({$IFDEF WIN32}const{$ENDIF} Section, Filename: String);
begin
  if Filename <> '' then
    WritePrivateProfileString (StringAsPChar(Section), nil, nil,
      StringAsPChar(Filename))
  else
    WriteProfileString (StringAsPChar(Section), nil, nil);
end;

function GetEnv (const EnvVar: String): String;
{ Gets the value of the specified environment variable. (Just like TP's GetEnv) }
var
  {$IFDEF WIN32}
  Res: DWORD;
  {$ELSE}
  Env, Value: PChar;
  Len, VarLen, ValueLen: Integer;
  {$ENDIF}
begin
  {$IFDEF WIN32}
  SetLength (Result, 255);
  repeat
    Res := GetEnvironmentVariable(PChar(EnvVar), PChar(Result), Length(Result));
    if Res = 0 then begin
      Result := '';
      Break;
    end;
  until AdjustLength(Result, Res);
  {$ELSE}
  Result[0] := #0;
  Env := GetDOSEnvironment;
  while Env^ <> #0 do begin
    Len := StrLen(Env);
    Value := StrScan(Env, '=');
    if Value <> nil then begin
      VarLen := Value-Env;
      if VarLen = Length(EnvVar) then begin
        if StrLIComp(Env, @EnvVar[1], VarLen) = 0 then begin
          ValueLen := Len-VarLen-1;
          if ValueLen > 255 then ValueLen := 255;
          Byte(Result[0]) := ValueLen;
          Inc (Value);
          Move (Value^, Result[1], ValueLen);
          Break;
        end;
      end;
    end;
    Inc (Env, Len+1);
  end;
  {$ENDIF}
end;

function GetCmdTail: String;
{ Returns all command line parameters passed to the process as a single
  string. }
{$IFNDEF WIN32}
var
  B: Word;
  S: String;
  I: Integer;
begin
  S := PString(Ptr(PrefixSeg, $80))^;
  Result := '';
  for I := 1 to Length(S) do
    if not(S[I] in [#9, ' ']) then begin
      Result := Copy(S, I, Maxint);
      Break;
    end;
end;
{$ELSE}
var
  CmdLine: PChar;
  InQuote: Boolean;
begin
  CmdLine := GetCommandLine;
  InQuote := False;
  while True do begin
    case CmdLine^ of
       #0: Break;
      '"': InQuote := not InQuote;
      ' ': if not InQuote then Break;
    end;
    Inc (CmdLine);
  end;
  while CmdLine^ = ' ' do
    Inc (CmdLine);
  Result := CmdLine;
end;
{$ENDIF}

function GetParamStr (P: PChar; var Param: String): PChar;
var
  Len: {$IFDEF WIN32} Integer; {$ELSE} Word; {$ENDIF}
  Buffer: array[0..4095] of Char;
begin
  while True do begin
    while (P[0] <> #0) and (P[0] <= ' ') do Inc (P);
    if (P[0] = '"') and (P[1] = '"') then Inc (P, 2) else Break;
  end;
  Len := 0;
  while (P[0] > ' ') and (Len < SizeOf(Buffer)) do
    if P[0] = '"' then begin
      Inc (P);
      while (P[0] <> #0) and (P[0] <> '"') do begin
        Buffer[Len] := P[0];
        Inc (Len);
        Inc (P);
      end;
      if P[0] <> #0 then Inc (P);
    end
    else begin
      Buffer[Len] := P[0];
      Inc (Len);
      Inc (P);
    end;
  SetString (Param, Buffer, Len);
  Result := P;
end;

function NewParamCount: Integer;
var
  P2: {$IFDEF WIN32} String; {$ELSE} array[0..255] of Char; {$ENDIF}
  P: PChar;
  S: string;
begin
  {$IFDEF WIN32}
  P2 := GetCmdTail;
  P := PChar(P2);
  {$ELSE}
  StrPCopy (P2, GetCmdTail);
  P := @P2;
  {$ENDIF}
  Result := 0;
  while True do begin
    P := GetParamStr(P, S);
    if S = '' then Break;
    Inc (Result);
  end;
end;

function NewParamStr (Index: Integer): string;
var
  {$IFDEF WIN32}
  Buffer: array[0..MAX_PATH-1] of Char;
  {$ENDIF}
  P2: {$IFDEF WIN32} String; {$ELSE} array[0..255] of Char; {$ENDIF}
  P: PChar;
begin
  if Index = 0 then begin
    {$IFDEF WIN32}
    SetString (Result, Buffer, GetModuleFileName(0, Buffer, SizeOf(Buffer)));
    {$ELSE}
    Result := ParamStr(0);
    { for some reason the following doesn't work on Win95, only NT...
    P := GetDOSEnvironment;
    while P^ <> #0 do
      Inc (P, StrLen(P)+1);
    Inc (P, 3);
    Result := StrPas(P); }
    {$ENDIF}
  end
  else begin
    {$IFDEF WIN32}
    P2 := GetCmdTail;
    P := PChar(P2);
    {$ELSE}
    StrPCopy (P2, GetCmdTail);
    P := @P2;
    {$ENDIF}
    while True do begin
      P := GetParamStr(P, Result);
      if (Index = 1) or (Result = '') then Break;
      Dec (Index);
    end;
  end;
end;

function AddBackslash (const S: String): String;
{ Adds a trailing backslash to the string, if one wasn't there already.
  But if S is an empty string, the function returns an empty string. }
begin
  Result := S;
  if (Result <> '') and (Result[Length(Result)] <> '\') then
    Result := Result + '\';
end;

function RemoveBackslash (const S: String): String;
{ Removes the trailing backslash from the string, if one exists }
begin
  Result := S;
  if (Result <> '') and (Result[Length(Result)] = '\') then
    {$IFNDEF WIN32}
    Dec (Result[0]);
    {$ELSE}
    SetLength (Result, Length(Result)-1);
    {$ENDIF}
end;

function RemoveBackslashUnlessRoot (const S: String): String;
{ Removes the trailing backslash from the string, if one exists and if does
  not specify a root directory of a drive (i.e. "C:\"}
begin
  Result := S;
  if (Length(Result) >= 2) and (Result[Length(Result)] = '\') and
     (Result[Length(Result)-1] <> ':') then
    {$IFNDEF WIN32}
    Dec (Result[0]);
    {$ELSE}
    SetLength (Result, Length(Result)-1);
    {$ENDIF}
end;

function AddQuotes (const S: String): String;
{ Adds a quote (") character to the left and right sides of the string if
  the string contains a space and it didn't have quotes already. This is
  primarily used when spawning another process with a long filename as one of
  the parameters. }
begin
  Result := Trim(S);
  if (Pos(' ', Result) <> 0) and
     ((Result[1] <> '"') or (Result[Length(Result)] <> '"')) then
    Result := '"' + Result + '"';
end;

function RemoveQuotes (const S: String): String;
{ Opposite of AddQuotes; removes any quotes around the string. }
begin
  Result := S;
  while (Result <> '') and (Result[1] = '"') do
    Delete (Result, 1, 1);
  while (Result <> '') and (Result[Length(Result)] = '"') do
    {$IFNDEF WIN32}
    Dec (Result[0]);
    {$ELSE}
    SetLength (Result, Length(Result)-1);
    {$ENDIF}
end;

function GetShortName (const LongName: String): String;
{ Gets the short version of the specified long filename. Does nothing on
  Win16 }
{$IFDEF WIN32}
var
  Res: DWORD;
{$ENDIF}
begin
  {$IFNDEF WIN32}
  Result := LongName;
  {$ELSE}
  SetLength (Result, MAX_PATH);
  repeat
    Res := GetShortPathName(PChar(LongName), PChar(Result), Length(Result));
    if Res = 0 then begin
      Result := LongName;
      Break;
    end;
  until AdjustLength(Result, Res);
  {$ENDIF}
end;

function GetWinDir: String;
{ Returns fully qualified path of the Windows directory. Only includes a
  trailing backslash if the Windows directory is the root directory. }
var
  Buf: array[0..Full_MAX_PATH-1] of Char;
begin
  GetWindowsDirectory (Buf, SizeOf(Buf));
  Result := StrPas(Buf);
end;

function GetSystemDir: String;
{ Returns fully qualified path of the Windows System directory. Only includes a
  trailing backslash if the Windows System directory is the root directory. }
var
  Buf: array[0..Full_MAX_PATH-1] of Char;
begin
  GetSystemDirectory (Buf, SizeOf(Buf));
  Result := StrPas(Buf);
end;

function GetTempDir: String;
{ Returns fully qualified path of the temporary directory, with trailing
  backslash. This does not use the Win32 function GetTempPath, due to platform
  differences.

  Gets the temporary file path as follows:
  1. The path specified by the TMP environment variable.
  2. The path specified by the TEMP environment variable, if TMP is not
     defined or if TMP specifies a directory that does not exist.
  3. The Windows directory, if both TMP and TEMP are not defined or specify
     nonexistent directories.
}
begin
  Result := GetEnv('TMP');
  if (Result = '') or not DirExists(Result) then
    Result := GetEnv('TEMP');
  if (Result = '') or not DirExists(Result) then
    Result := GetWinDir;
  Result := AddBackslash(ExpandFileName(Result));
end;

procedure StringChange (var S: String; const FromStr, ToStr: String);
{ Change all occurances in S of FromStr to ToStr }
var
  StartPos, I: Integer;
label 1;
begin
  if FromStr = '' then Exit;
  StartPos := 1;
1:for I := StartPos to Length(S)-Length(FromStr)+1 do begin
    if Copy(S, I, Length(FromStr)) = FromStr then begin
      Delete (S, I, Length(FromStr));
      Insert (ToStr, S, I);
      StartPos := I + Length(ToStr);
      goto 1;
    end;
  end;
end;

function AdjustLength (var S: String; const Res: Cardinal): Boolean;
{ Returns True if successful. Returns False if buffer wasn't large enough,
  and called AdjustLength to resize it. }
begin
  Result := {$IFDEF WIN32}Integer({$ENDIF} Res {$IFDEF WIN32}){$ENDIF} < Length(S);
  SetLength (S, Res);
end;

function UsingWinNT: Boolean;
{ Returns True if system is running any version of Windows NT. Never returns
  True on Windows 95 or 3.1. }
begin
  {$IFNDEF WIN32}
  Result := GetWinFlags and $4000{WF_WINNT} <> 0;
  {$ELSE}
  Result := Win32Platform = VER_PLATFORM_WIN32_NT;
  {$ENDIF}
end;

{$IFDEF WIN32}
function UsingWindows4: Boolean;
begin
  Result := IsWindows4;
end;
{$ENDIF}

function UsingNewGUI: Boolean;
{ Returns True if system is using Windows 95-style GUI. This means it will
  return True on Windows 95 or NT 4.0. }
{$IFNDEF WIN32}
const
  GUI: (guiOld, guiNew, guiNotChecked) = guiNotChecked;
var
  KernelHandle: THandle;
{$ENDIF}
begin
  {$IFDEF WIN32}
  Result := IsWindows4;
  {$ELSE}
  if GUI = guiNotChecked then begin
    KernelHandle := LoadLibrary('KERNEL');
    Boolean(GUI) := GetProcAddress(KernelHandle, 'GetVersionEx') <> nil;
    FreeLibrary (KernelHandle);
  end;
  Result := Boolean(GUI);
  {$ENDIF}
end;

function FileCopy (const ExistingFile, NewFile: String;
  const FailIfExists: Boolean; const AReadMode: Byte): Boolean;
{ Copies ExistingFile to NewFile, preserving time stamp and file attributes.
  If FailIfExists is True it will fail if NewFile already exists, otherwise it
  will overwrite it.
  Returns True if succesful; False if not. On Win32, the thread's last error
  code is also set. }
{$IFNDEF WIN32}
type
  PCopyBuffer = ^TCopyBuffer;
  TCopyBuffer = array[0..32767] of Byte;
var
  Buffer: PCopyBuffer;
  SaveFileMode: Byte;
  ExistingF, NewF: File;
  NumRead: Word;
  FileDate: Longint;
  FileAttr: Integer;
{$ENDIF}
begin
  {$IFDEF WIN32}
  Result := CopyFile(PChar(ExistingFile), PChar(NewFile), FailIfExists);
  {$ELSE}
  Result := False;
  try
    if FailIfExists and FileOrDirExists(NewFile) then Exit;
    New (Buffer);
    SaveFileMode := FileMode;
    try
      AssignFile (ExistingF, ExistingFile);
      FileMode := AReadMode;  Reset (ExistingF, 1);
      try
        AssignFile (NewF, NewFile);
        FileMode := fmOpenWrite or fmShareExclusive;  Rewrite (NewF, 1);
        try
          while not Eof(ExistingF) do begin
            BlockRead (ExistingF, Buffer^, SizeOf(TCopyBuffer), NumRead);
            BlockWrite (NewF, Buffer^, NumRead);
          end;
        except
          CloseFile (NewF);
          DeleteFile (NewFile);
          raise;
        end;
        FileDate := FileGetDate(TFileRec(ExistingF).Handle);
        FileSetDate (TFileRec(NewF).Handle, FileDate);
        CloseFile (NewF);
      finally
        CloseFile (ExistingF);
      end;
    finally
      FileMode := SaveFileMode;
      Dispose (Buffer);
    end;
    FileAttr := FileGetAttr(ExistingFile);
    if FileAttr >= 0 then FileSetAttr (NewFile, FileAttr);

    Result := True;
  except
    { To maintain compatibility with the Win32 function CopyFile, this
      function traps all exceptions. It returns False if unsuccessful. }
  end;
  {$ENDIF}
end;

{$IFDEF WIN32}
function InternalRegQueryStringValue (H: HKEY; Name: PChar; var ResultStr: String;
  Type1, Type2: DWORD): Boolean;
var
  Typ, Size: DWORD;
begin
  Result := False;
  if (RegQueryValueEx(H, Name, nil, @Typ, nil, @Size) = ERROR_SUCCESS) and
     ((Typ = Type1) or (Typ = Type2)) then begin
    if Size < 2 then begin  {for the following code to work properly, Size can't be 0 or 1}
      ResultStr := '';
      Result := True;
    end
    else begin
      SetLength (ResultStr, Size-1); {long strings implicity include a null terminator}
      if RegQueryValueEx(H, Name, nil, nil, @ResultStr[1], @Size) = ERROR_SUCCESS then
        Result := True
      else
        ResultStr := '';
    end;
  end;
end;

function RegQueryStringValue (H: HKEY; Name: PChar; var ResultStr: String): Boolean;
{ Queries the specified REG_SZ or REG_EXPAND_SZ registry key/value, and returns
  the value in ResultStr. Returns True if successful. }
begin
  Result := InternalRegQueryStringValue(H, Name, ResultStr, REG_SZ,
    REG_EXPAND_SZ);
end;

function RegQueryMultiStringValue (H: HKEY; Name: PChar; var ResultStr: String): Boolean;
{ Queries the specified REG_MULTI_SZ registry key/value, and returns the value
  in ResultStr. Returns True if successful. }
begin
  Result := InternalRegQueryStringValue(H, Name, ResultStr, REG_MULTI_SZ,
    REG_MULTI_SZ);
end;
{$ENDIF}

{$IFDEF WIN32}
function RegValueExists (H: HKEY; Name: PChar): Boolean;
{ Returns True if the specified value exists. Requires KEY_QUERY_VALUE and
  KEY_ENUMERATE_SUB_KEYS access to the key. }
var
  I: Integer;
  EnumName: array[0..1] of Char;
  Count: DWORD;
  ErrorCode: Longint;
begin
  Result := RegQueryValueEx(H, Name, nil, nil, nil, nil) = ERROR_SUCCESS;
  if Result and ((Name = nil) or (Name^ = #0)) then begin
    { On Win95/98 a default value always exists according to RegQueryValueEx,
      so it must use RegQueryValueEx instead to check if a default value
      really exists }
    Result := False;
    I := 0;
    while True do begin
      Count := SizeOf(EnumName);
      ErrorCode := RegEnumValue(H, I, EnumName, Count, nil, nil, nil, nil);
      if (ErrorCode <> ERROR_SUCCESS) and (ErrorCode <> ERROR_MORE_DATA) then
        Break;
      if EnumName[0] = #0 then begin  { is it the default value? }
        Result := True;
        Break;
      end;
      Inc (I);
    end;
  end;
end;
{$ENDIF}

{$IFDEF WIN32}
function RegDeleteKeyIncludingSubkeys (const Key: HKEY; const Name: PChar): Boolean;
var
  H: HKEY;
  KeyName: String;
  KeyNameCount, MaxCount: DWORD;
  FT: TFileTime;
  I: Integer;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then begin
    Result := False;
    if RegOpenKeyEx(Key, Name, 0, KEY_ENUMERATE_SUB_KEYS or KEY_QUERY_VALUE, H) <> ERROR_SUCCESS then
      Exit;
    if RegQueryInfoKey(H, nil, nil, nil, nil, @MaxCount, nil, nil, nil, nil,
       nil, nil) = ERROR_SUCCESS then begin
      if MaxCount < 1 then MaxCount := 1;
      SetLength (KeyName, MaxCount);
      I := 0;
      while True do begin
        KeyNameCount := MaxCount+1;
        if RegEnumKeyEx(H, I, PChar(KeyName), KeyNameCount, nil, nil, nil, @FT) <> ERROR_SUCCESS then
          Break;
        if not RegDeleteKeyIncludingSubkeys(H, PChar(KeyName)) then
          Inc (I);
      end;
    end;
    RegCloseKey (H);
  end;
  Result := RegDeleteKey(Key, Name) = ERROR_SUCCESS;
end;
{$ENDIF}

{$IFDEF WIN32}
function GetShellFolderPath (const FolderID: Integer): String;
var
  pidl: PItemIDList;
  Buffer: array[0..MAX_PATH-1] of Char;
  Malloc: IMalloc;
begin
  Result := '';
  if not IsWindows4 then Exit;
  if FAILED(SHGetMalloc(Malloc)) then
    Malloc := nil;
  if SUCCEEDED(SHGetSpecialFolderLocation(0, FolderID, pidl)) then begin
    if SHGetPathFromIDList(pidl, Buffer) then
      Result := Buffer;
    if Assigned(Malloc) then
      Malloc.Free (pidl);
  end;
end;
{$ENDIF}

{$IFDEF WIN32}
function GetPathFromRegistry (const Name: PChar): String;
var
  H: HKEY;
begin
  if IsWindows4 and (RegOpenKeyEx(HKEY_LOCAL_MACHINE,
      NEWREGSTR_PATH_SETUP, 0, KEY_QUERY_VALUE, H) = ERROR_SUCCESS) then begin
    if not RegQueryStringValue(H, Name, Result) then
      Result := '';
    RegCloseKey (H);
  end
  else
    Result := '';
end;

function GetProgramFilesPath: String;
{ Gets path of Program Files.
  Returns blank string if not found in registry. }
begin
  Result := GetPathFromRegistry('ProgramFilesDir');
end;

function GetCommonFilesPath: String;
{ Gets path of Common Files.
  Returns blank string if not found in registry. }
begin
  Result := GetPathFromRegistry('CommonFilesDir');
end;
{$ENDIF}

{$IFDEF WIN32}
type
  SC_HANDLE = THandle;
function OpenSCManager(lpMachineName, lpDatabaseName: PChar;
  dwDesiredAccess: DWORD): SC_HANDLE; stdcall;
  external 'advapi32.dll' name 'OpenSCManagerA';
function CloseServiceHandle(hSCObject: SC_HANDLE): BOOL; stdcall;
  external 'advapi32.dll' name 'CloseServiceHandle';
function IsAdminLoggedOn: Boolean;
{ Returns True if an administrator is logged onto the system. Always returns
  True on Windows 95/98. }
var
  hSC: SC_HANDLE;
begin
  if Win32Platform <> VER_PLATFORM_WIN32_NT then
    Result := True
  else begin
    { Try an admin privileged API }
    hSC := OpenSCManager(nil, nil, GENERIC_READ or GENERIC_WRITE or GENERIC_EXECUTE);
    Result := hSC <> 0;
    if Result then CloseServiceHandle (hSC);
  end;
end;
{$ENDIF}

{$IFDEF WIN32}
initialization
  IsWindows4 := Lo(GetVersion) >= 4;
{$ENDIF}
end.

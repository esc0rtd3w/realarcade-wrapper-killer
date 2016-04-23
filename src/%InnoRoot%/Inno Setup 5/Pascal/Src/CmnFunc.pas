unit CmnFunc;
{$B-}
{ v2.23b }
{ This is a general toolchest of VCL-specific functions I use in my programs. }

interface

uses
  WinProcs, WinTypes, SysUtils, Forms, Dialogs, Graphics, Controls, Classes,
  CmnFunc2;

{$IFNDEF VER80} {$IFNDEF VER90} {$IFNDEF VER93}
  {$DEFINE Delphi3orHigher}
{$ENDIF} {$ENDIF} {$ENDIF}

type
  TMsgBoxType = (mbInformation, mbConfirmation, mbError, mbCriticalError);

{ Useful constant }
const
  EnableColor: array[Boolean] of TColor = (clBtnFace, clWindow);

function MsgBoxP (const Text, Caption: PChar; const Typ: TMsgBoxType;
  const Buttons: Cardinal): Integer;
function MsgBox ({$IFDEF WIN32}const{$ENDIF} Text, Caption: String;
  const Typ: TMsgBoxType; const Buttons: Cardinal): Integer;
function MsgBoxFmt (const Text: String; const Args: array of const;
  const Caption: String; const Typ: TMsgBoxType; const Buttons: Cardinal): Integer;
procedure SetMessageBoxCaption (const Typ: TMsgBoxType; const NewCaption: PChar);

implementation

uses
  Consts;

var
  MessageBoxCaptions: array[TMsgBoxType] of PChar;

procedure SetMessageBoxCaption (const Typ: TMsgBoxType; const NewCaption: PChar);
begin
  StrDispose (MessageBoxCaptions[Typ]);
  MessageBoxCaptions[Typ] := nil;
  if Assigned(NewCaption) then
    MessageBoxCaptions[Typ] := StrNew(NewCaption);
end;

function MsgBoxP (const Text, Caption: PChar; const Typ: TMsgBoxType;
  const Buttons: Cardinal): Integer;
const
  IconFlags: array[TMsgBoxType] of Cardinal =
    (MB_ICONINFORMATION, MB_ICONQUESTION, MB_ICONEXCLAMATION, MB_ICONSTOP);
  {$IFNDEF Delphi3orHigher}
  DefaultCaptions: array[TMsgBoxType] of Word =
    (SMsgDlgInformation, SMsgDlgConfirm, SMsgDlgError, SMsgDlgError);
  {$ELSE}
  DefaultCaptions: array[TMsgBoxType] of Pointer =
    (@SMsgDlgInformation, @SMsgDlgConfirm, @SMsgDlgError, @SMsgDlgError);
  {$ENDIF}
var
  C: PChar;
  NewCaption: {$IFNDEF WIN32} array[0..255] of Char; {$ELSE} String; {$ENDIF}
  I: Integer;
  EnabledList, StayOnTopList: TList;
  ActiveCtl: TWinControl;
begin
  EnabledList := nil;
  StayOnTopList := nil;
  try
    EnabledList := TList.Create;
    StayOnTopList := TList.Create;
    { Save focus }
    ActiveCtl := Screen.ActiveControl;
    try
      { Normalize top-mosts, and disable all other forms (to make it modal) }
      for I := 0 to Application.ComponentCount-1 do
        if Application.Components[I] is TForm then
          with TForm(Application.Components[I]) do
            if HandleAllocated then begin
              { Temporarily disable all forms to make sure the message box is
                truly modal. This is needed for projects with multiple modeless
                forms visible }
              if IsWindowEnabled(Handle) then begin
                EnableWindow (Handle, False);
                EnabledList.Add (Application.Components[I]);
              end;
              { Temporarily change all top-most forms back to normal, so that the
                message box won't get hidden behind a top-most form. (Delphi
                includes a function called 'NormalizeTopMosts' but it doesn't
                work correctly in all cases.) }
              if IsWindowVisible(Handle) and (FormStyle = fsStayOnTop) then begin
                SetWindowPos (Handle, HWND_NOTOPMOST,
                  0, 0, 0, 0, SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
                SetWindowPos (Handle, HWND_TOP,
                  0, 0, 0, 0, SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
                StayOnTopList.Add (Application.Components[I]);
              end;
            end;
      { Show the message box }
      C := Caption;
      if (C = nil) or (C[0] = #0) then begin
        C := MessageBoxCaptions[Typ];
        if C = nil then begin
          {$IFNDEF WIN32}
            LoadString (HInstance, DefaultCaptions[Typ], NewCaption, SizeOf(NewCaption));
            C := @NewCaption;
          {$ELSE}
            {$IFNDEF Delphi3orHigher}
            NewCaption := LoadStr(DefaultCaptions[Typ]);
            {$ELSE}
            NewCaption := LoadResString(DefaultCaptions[Typ]);
            {$ENDIF}
            C := PChar(NewCaption);
          {$ENDIF}
        end;
      end;
      Result := Application.MessageBox(Text, C, Buttons or IconFlags[Typ]);
    finally
      { Reenable forms, restore top mosts, and restore focus }
      for I := 0 to StayOnTopList.Count-1 do
        SetWindowPos (TForm(StayOnTopList[I]).Handle, HWND_TOPMOST,
          0, 0, 0, 0, SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
      for I := 0 to EnabledList.Count-1 do
        EnableWindow (TForm(EnabledList[I]).Handle, True);
      { Restore focus }
      if ActiveCtl <> nil then
        SetFocus (ActiveCtl.Handle);
    end;
  finally
    StayOnTopList.Free;
    EnabledList.Free;
  end;
end;

function MsgBox ({$IFDEF WIN32}const{$ENDIF} Text, Caption: String;
  const Typ: TMsgBoxType; const Buttons: Cardinal): Integer;
begin
  Result := MsgBoxP(StringAsPChar(Text), StringAsPChar(Caption), Typ, Buttons);
end;

function MsgBoxFmt (const Text: String; const Args: array of const;
  const Caption: String; const Typ: TMsgBoxType; const Buttons: Cardinal): Integer;
begin
  Result := MsgBox(Format(Text, Args), Caption, Typ, Buttons);
end;

procedure FreeCaptions; far;
var
  T: TMsgBoxType;
begin
  for T := Low(T) to High(T) do begin
    StrDispose (MessageBoxCaptions[T]);
    MessageBoxCaptions[T] := nil;
  end;
end;

{$IFDEF WIN32}
initialization
finalization
  FreeCaptions;
{$ELSE}
begin
  AddExitProc (FreeCaptions);
{$ENDIF}
end.

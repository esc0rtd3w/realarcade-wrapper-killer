unit Main;

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
  WinTypes, WinProcs, SysUtils, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Menus, Buttons, TB97Tlbr, TB97Ctls,
  TB97, ComCtrls, SynEdit, SynMemo, SynEditHighlighter, SynHighlighterPas,
  IPascal, IPBase, ActnList;

const
  MRUListMaxCount = 8;
  WM_DebugMsg = WM_USER + 1111;

type
  TMainForm = class(TForm)
    OpenDialog: TOpenDialog;
    MainMenu1: TMainMenu;
    FMenu: TMenuItem;
    FNew: TMenuItem;
    FOpen: TMenuItem;
    FSave: TMenuItem;
    FSaveAs: TMenuItem;
    N1: TMenuItem;
    FExit: TMenuItem;
    EMenu: TMenuItem;
    EUndo: TMenuItem;
    N3: TMenuItem;
    ECut: TMenuItem;
    ECopy: TMenuItem;
    EPaste: TMenuItem;
    EDelete: TMenuItem;
    N4: TMenuItem;
    ESelectAll: TMenuItem;
    VMenu: TMenuItem;
    EFind: TMenuItem;
    EFindNext: TMenuItem;
    EReplace: TMenuItem;
    Help1: TMenuItem;
    HAbout: TMenuItem;
    SaveDialog: TSaveDialog;
    FMRUSep: TMenuItem;
    VCompilerMessages: TMenuItem;
    FindDialog: TFindDialog;
    ReplaceDialog: TReplaceDialog;
    MessageList: TListBox;
    VToolbar: TMenuItem;
    TopDock: TDock97;
    MainToolbar: TToolbar97;
    NewButton: TToolbarButton97;
    OpenButton: TToolbarButton97;
    SaveButton: TToolbarButton97;
    MainSep1: TToolbarSep97;
    CompileButton: TToolbarButton97;
    RunButton: TToolbarButton97;
    StopButton: TToolbarButton97;
    RightDock: TDock97;
    BottomDock: TDock97;
    LeftDock: TDock97;
    Project1: TMenuItem;
    RRun: TMenuItem;
    PCompile: TMenuItem;
    RStop: TMenuItem;
    StatusBar: TStatusBar;
    ToolbarSep971: TToolbarSep97;
    Memo: TSynMemo;
    Highlighter: TSynPasSyn;
    VEditorOptions: TMenuItem;
    VEHorizCaret: TMenuItem;
    N2: TMenuItem;
    Run1: TMenuItem;
    N5: TMenuItem;
    RStepOver: TMenuItem;
    ActionList: TActionList;
    actRun: TAction;
    actStop: TAction;
    actStepOver: TAction;
    actCompile: TAction;
    RParameters: TMenuItem;
    VD: TMenuItem;
    VDEventLog: TMenuItem;
    VDRegisters: TMenuItem;
    PBuild: TMenuItem;
    actBuild: TAction;
    N6: TMenuItem;
    actRunToCursor: TAction;
    RRunToCursor: TMenuItem;
    OuterPanel: TPanel;
    Splitter: TSplitter;
    N7: TMenuItem;
    HReadme: TMenuItem;
    HLicense: TMenuItem;
    MemoPopup: TPopupMenu;
    actUndo: TAction;
    actCut: TAction;
    actCopy: TAction;
    actPaste: TAction;
    MPUndo: TMenuItem;
    N8: TMenuItem;
    MPCut: TMenuItem;
    MPCopy: TMenuItem;
    MPPaste: TMenuItem;
    actDelete: TAction;
    MPDelete: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FExitClick(Sender: TObject);
    procedure FOpenClick(Sender: TObject);
    procedure actUndoClick(Sender: TObject);
    procedure EMenuClick(Sender: TObject);
    procedure actCutClick(Sender: TObject);
    procedure actCopyClick(Sender: TObject);
    procedure actPasteClick(Sender: TObject);
    procedure actDeleteClick(Sender: TObject);
    procedure FSaveClick(Sender: TObject);
    procedure ESelectAllClick(Sender: TObject);
    procedure FNewClick(Sender: TObject);
    procedure FSaveAsClick(Sender: TObject);
    procedure actCompileClick(Sender: TObject);
    procedure FMenuClick(Sender: TObject);
    procedure FMRUClick(Sender: TObject);
    procedure VCompilerMessagesClick(Sender: TObject);
    procedure HAboutClick(Sender: TObject);
    procedure EFindClick(Sender: TObject);
    procedure FindDialogFind(Sender: TObject);
    procedure EReplaceClick(Sender: TObject);
    procedure ReplaceDialogReplace(Sender: TObject);
    procedure EFindNextClick(Sender: TObject);
    procedure VMenuClick(Sender: TObject);
    procedure VToolbarClick(Sender: TObject);
    procedure actRunClick(Sender: TObject);
    procedure actStopClick(Sender: TObject);
    procedure MemoSpecialLineColors(Sender: TObject; Line: Integer;
      var Special: Boolean; var FG, BG: TColor);
    procedure MemoStatusChange(Sender: TObject;
      Changes: TSynStatusChanges);
    procedure VEditorOptionsClick(Sender: TObject);
    procedure VEHorizCaretClick(Sender: TObject);
    procedure actStepOverClick(Sender: TObject);
    procedure RParametersClick(Sender: TObject);
    procedure VDEventLogClick(Sender: TObject);
    procedure VDRegistersClick(Sender: TObject);
    procedure MemoPaint(Sender: TObject; ACanvas: TCanvas);
    procedure actBuildClick(Sender: TObject);
    procedure MemoChange(Sender: TObject);
    procedure actRunToCursorExecute(Sender: TObject);
    procedure MessageListDblClick(Sender: TObject);
    procedure HReadmeClick(Sender: TObject);
    procedure HLicenseClick(Sender: TObject);
  private
    { Private declarations }
    FBreakLine: Integer;
    FDebugBreaked: Boolean;
    FErrorLine: Integer;
    FFilename: String;
    FModifiedSinceLastCompile, FModifiedWhileDebugging: Boolean;
    FMRUMenuItems: array[0..MRUListMaxCount-1] of TMenuItem;
    FMRUList: TStringList;
    FLineNumberInfo: PLineNumberInfoArray;
    FLineNumberInfoCount: Integer;
    FParameters: String;
    procedure AddToMRUList (const AFilename: String);
    function AskToSaveModifiedFile: Boolean;
    function AskToRestartIfModified: Boolean;
    procedure Compile;
    function CompileIfNecessary: Boolean;
    procedure CompilerStatusProc (AType: TCompilerStatusType;
      const AFilename: String; ALine, ACh: Integer; const AMsg: String);
    function GetOutFilename: String;
    procedure HideError;
    procedure NewFile;
    procedure OpenFile (AFilename: String);
    procedure ResetEditorState;
    procedure Run (const SingleStep: Boolean);
    function SaveFile (const SaveAs: Boolean): Boolean;
    procedure SetBreakLine (ALine: Integer);
    procedure SetErrorLine (ALine: Integer);
    procedure SetMessageListVisible (const AVisible: Boolean);
    procedure Stop;
    procedure UpdateCaption;
    procedure UpdateRunActions (const ADebugBreaked: Boolean);
    procedure WMDebugMsg (var Message: TMessage); message WM_DebugMsg;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  Clipbrd, ShellApi, Registry, CmnFunc, CmnFunc2,
  LinkerPE, CodeX86, Debugger, DebugEventLog, DebugRegisters;

{$R *.DFM}

const
  HistoryListSize = 8;

  SCompilerFormCaption = 'Inno Pascal';
  SNewLine = #13#10;
  SNewLine2 = #13#10#13#10;

procedure TMainForm.FormCreate(Sender: TObject);
var
  I: Integer;
  NewItem: TMenuItem;
  Ini: TRegIniFile;
  S: String;
  R: TRect;
  WindowPlacement: TWindowPlacement;
  Settings: TStringList;
  UseDelphiHighlightSettings: Boolean;
begin
  FModifiedSinceLastCompile := True;
  FBreakLine := -1;

  MessageList.Height := 0;

  { For some reason, if AutoScroll=False is set on the form Delphi ignores the
    'poDefault' Position setting }
  AutoScroll := False;

  { Append 'Del' to the end of the Delete item. Don't actually use Del as
    the shortcut key so that the Del key still works when the menu item is
    disabled because there is no selection. }
  EDelete.Caption := EDelete.Caption + #9 + ShortCutToText(VK_DELETE);

  FMRUList := TStringList.Create;
  for I := 0 to High(FMRUMenuItems) do begin
    NewItem := TMenuItem.Create(Self);
    NewItem.OnClick := FMRUClick;
    FMenu.Insert (FMenu.IndexOf(FMRUSep), NewItem);
    FMRUMenuItems[I] := NewItem;
  end;

  UpdateCaption;

  Ini := TRegIniFile.Create('Software\Jordan Russell\Inno Pascal');
  try
    { Don't localize! }
    for I := 0 to High(FMRUMenuItems) do begin
      S := Ini.ReadString('FileHistory', 'History' + IntToStr(I), '');
      if S <> '' then FMRUList.Add (S);
    end;

    MainToolbar.Visible := Ini.ReadBool('Options', 'ShowToolbar', True);
    UseDelphiHighlightSettings := Ini.ReadBool('Options', 'UseDelphiHighlightSettings', True);

    R.Left := Ini.ReadInteger('Options', 'MainPosLeft', Left);
    R.Right := Ini.ReadInteger('Options', 'MainPosRight', Left + Width);
    R.Top := Ini.ReadInteger('Options', 'MainPosTop', Top);
    R.Bottom := Ini.ReadInteger('Options', 'MainPosBottom', Top + Height);
    WindowPlacement.length := SizeOf(WindowPlacement);
    GetWindowPlacement (Handle, @WindowPlacement);
    if Ini.ReadBool('Options', 'Maximized', False) then
      WindowPlacement.showCmd := SW_SHOWMAXIMIZED;
    WindowPlacement.rcNormalPosition := R;
    SetWindowPlacement (Handle, @WindowPlacement);
  finally
    Ini.Free;
  end;

  if UseDelphiHighlightSettings then begin
    Settings := TStringList.Create;
    try
      Highlighter.EnumUserSettings(Settings);
      if Settings.Count > 0 then
        Highlighter.UseUserSettings(Settings.Count - 1);
    finally
      Settings.Free;
    end;
  end;

  if ParamStr(1) <> '' then
    OpenFile (ParamStr(1));
end;

procedure TMainForm.FormDestroy(Sender: TObject);
var
  Ini: TRegIniFile;
  I: Integer;
  S: String;
  WindowPlacement: TWindowPlacement;
begin
  Ini := TRegIniFile.Create('Software\Jordan Russell\Inno Pascal');
  try
    { Don't localize! }
    for I := 0 to High(FMRUMenuItems) do begin
      if I < FMRUList.Count then
        S := FMRUList[I]
      else
        S := '';
      Ini.WriteString ('FileHistory', 'History' + IntToStr(I),
        S {work around Delphi 2 bug:} + #0);
    end;

    Ini.WriteBool ('Options', 'ShowToolbar', MainToolbar.Visible);

    WindowPlacement.length := SizeOf(WindowPlacement);
    GetWindowPlacement (Handle, @WindowPlacement);
    Ini.WriteInteger ('Options', 'MainPosLeft', WindowPlacement.rcNormalPosition.Left);
    Ini.WriteInteger ('Options', 'MainPosRight', WindowPlacement.rcNormalPosition.Right);
    Ini.WriteInteger ('Options', 'MainPosTop', WindowPlacement.rcNormalPosition.Top);
    Ini.WriteInteger ('Options', 'MainPosBottom', WindowPlacement.rcNormalPosition.Bottom);
    Ini.WriteBool ('Options', 'Maximized', WindowState = wsMaximized);
  finally
    Ini.Free;
  end;

  FMRUList.Free;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if Debugging then begin
    Application.MessageBox ('You must stop the running process before exiting.',
      nil, MB_OK or MB_ICONEXCLAMATION);
    CanClose := False;
    Exit;
  end;
  CanClose := AskToSaveModifiedFile;
end;

procedure TMainForm.UpdateCaption;
var
  NewCaption: String;
begin
  NewCaption := ExtractFileName(FFilename);
  if NewCaption = '' then NewCaption := 'Untitled';
  NewCaption := NewCaption + ' - ' + SCompilerFormCaption + ' ' +
    InnoPascalVersion;
  if Debugging then begin
    if not FDebugBreaked then
      NewCaption := NewCaption + ' [Run]'
    else
      NewCaption := NewCaption + ' [Break]';
  end;
  Caption := NewCaption;
  Application.Title := NewCaption;
end;

procedure TMainForm.ResetEditorState;
{ Called after entirely new text is loaded into the editor }
begin
  FModifiedSinceLastCompile := True;
  Memo.Modified := False;
  StatusBar.Panels[1].Text := '';  { clear the 'Modified' indicator }
  StatusBar.Panels[3].Text := '';  { clear the compilation status }
  HideError;
  SetMessageListVisible (False);
  MessageList.Clear;
end;

procedure TMainForm.NewFile;
begin
  Memo.Lines.Clear;
  ResetEditorState;
  FFilename := '';
  UpdateCaption;
end;

procedure TMainForm.OpenFile (AFilename: String);
begin
  AFilename := ExpandFileName(AFilename);
  AddToMRUList (AFilename);
  try
    Memo.Lines.LoadFromFile (AFilename);
  except
    on EInvalidOperation do begin
      MsgBox ('Script file is too large to open in the Inno Setup editor.',
         SCompilerFormCaption, mbError, MB_OK);
      Exit;
    end;
  end;
  ResetEditorState;
  FFilename := AFilename;
  UpdateCaption;
end;

function TMainForm.SaveFile (const SaveAs: Boolean): Boolean;
begin
  Result := False;
  if SaveAs or (FFilename = '') then begin
    SaveDialog.Filename := FFilename;
    if not SaveDialog.Execute then Exit;
    Memo.Lines.SaveToFile (SaveDialog.Filename);
    FFilename := SaveDialog.Filename;
    UpdateCaption;
  end
  else
    Memo.Lines.SaveToFile (FFilename);
  Memo.Modified := False;
  Memo.ClearUndo;
  StatusBar.Panels[1].Text := '';
  Result := True;
  AddToMRUList (FFilename);
end;

function TMainForm.AskToSaveModifiedFile: Boolean;
var
  FileTitle: String;
begin
  Result := True;
  if Memo.Modified then begin
    FileTitle := FFilename;
    if FileTitle = '' then FileTitle := 'Untitled';
    case MsgBox('The text in the ' + FileTitle + ' file has changed.'#13#10#13#10 +
       'Do you want to save the changes?', SCompilerFormCaption, mbError,
       MB_YESNOCANCEL) of
      ID_YES: Result := SaveFile(False);
      ID_NO: ;
    else
      Result := False;
    end;
  end;
end;

procedure TMainForm.AddToMRUList (const AFilename: String);
var
  I: Integer;
begin
  I := 0;
  while I < FMRUList.Count do begin
    if CompareText(FMRUList[I], AFilename) = 0 then
      FMRUList.Delete (I)
    else
      Inc (I);
  end;
  FMRUList.Insert (0, AFilename);
  while FMRUList.Count > High(FMRUMenuItems)+1 do
    FMRUList.Delete (FMRUList.Count-1);
end;

procedure TMainForm.FMenuClick(Sender: TObject);
var
  I: Integer;
begin
  FMRUSep.Visible := FMRUList.Count <> 0;
  for I := 0 to High(FMRUMenuItems) do
    with FMRUMenuItems[I] do begin
      if I < FMRUList.Count then begin
        Visible := True;
        Caption := '&' + IntToStr(I+1) + ' ' + FMRUList[I];
      end
      else
        Visible := False;
    end;
end;

procedure TMainForm.FNewClick(Sender: TObject);
begin
  if not AskToSaveModifiedFile then Exit;
  NewFile;
end;

procedure TMainForm.FOpenClick(Sender: TObject);
begin
  OpenDialog.Filename := '';
  if not AskToSaveModifiedFile or not OpenDialog.Execute then
    Exit;
  OpenFile (OpenDialog.Filename);
end;

procedure TMainForm.FSaveClick(Sender: TObject);
begin
  SaveFile (False);
end;

procedure TMainForm.FSaveAsClick(Sender: TObject);
begin
  SaveFile (True);
end;

function TMainForm.GetOutFilename: String;
begin
  if FFilename <> '' then
    Result := ChangeFileExt(FFilename, '.exe')
  else
    Result := 'noname.exe';
end;

procedure TMainForm.CompilerStatusProc (AType: TCompilerStatusType;
  const AFilename: String; ALine, ACh: Integer; const AMsg: String);
const
  TypeText: array[TCompilerStatusType] of String = ('Warning', 'Hint');
begin
  SetMessageListVisible (True);
  MessageList.Items.AddObject (Format('%s: %s[%d,%d]: %s',
    [TypeText[AType], AFilename, ALine, ACh, AMsg]), Pointer(ALine));
end;

procedure TMainForm.Compile;
var
  S: String;
  NumWritten: Cardinal;
  I: Integer;
  StartTime, EndTime, Freq: Int64;
  InCurrentFile: Boolean;
begin
  MessageList.Clear;
  StatusBar.Panels[3].Text := '';
  SetErrorLine(-1);
  FreeMem (FLineNumberInfo);
  FLineNumberInfo := nil;
  Memo.InvalidateGutter;
  try
    FLineNumberInfoCount := Memo.Lines.Count;
    S := Memo.Text;
    I := Length(S);
    { Memo.Text puts a CR/LF at the end of the last line, even if there is
      no blank line after it. We have to remove the CR/LF so that we don't get
      error messages on lines past the end of the file.
      (Note: I'm not using TrimRight to do this because it causes a second
      string to be allocated.) }
    while (I > 0) and (S[I] <= ' ') do
      Dec (I);
    SetLength (S, I);
    QueryPerformanceFrequency (Freq);
    QueryPerformanceCounter (StartTime);
    NumWritten := IPCompileAndLink(FFilename, PChar(S), GetOutFilename,
      FLineNumberInfoCount, FLineNumberInfo, CompilerStatusProc, TIPPELinker,
      TX86CodeGen);
    QueryPerformanceCounter (EndTime);
  except
    on E: EIPCompilerError do begin
      { Move the caret to the line number the error occured on }
      SetMessageListVisible (True);
      InCurrentFile := E.Filename = FFilename;
      MessageList.Items.AddObject (Format('Error: %s[%d,%d]: %s',
        [E.Filename, E.Line, E.Ch, E.ErrorText]), Pointer(E.Line * Ord(InCurrentFile)));
      if InCurrentFile then begin
        Memo.CaretXY := Point(E.Ch, E.Line);
        Memo.SetFocus;
        SetErrorLine(E.Line);
      end;
      Abort;
      Exit;
    end;
  end;
  FModifiedSinceLastCompile := False;
  StatusBar.Panels[3].Text :=
    Format('Successful compile - %d bytes written, %.3f seconds',
      [NumWritten, (EndTime - StartTime) / Freq]);
  if MessageList.Items.Count = 0 then
    SetMessageListVisible (False);
  Memo.InvalidateGutter;
end;

function TMainForm.CompileIfNecessary: Boolean;
begin
  Result := FModifiedSinceLastCompile;
  if Result then
    Compile
  else
    StatusBar.Panels[3].Text := 'No changes to source, skipping compile';
  FModifiedWhileDebugging := False;
end;

procedure TMainForm.actCompileClick(Sender: TObject);
begin
  if not Debugging then
    CompileIfNecessary;
end;

procedure TMainForm.actBuildClick(Sender: TObject);
begin
  if not Debugging then
    Compile;
end;

procedure TMainForm.FMRUClick(Sender: TObject);
var
  I: Integer;
begin
  if not AskToSaveModifiedFile then Exit;
  for I := 0 to High(FMRUMenuItems) do
    if FMRUMenuItems[I] = Sender then begin
      OpenFile (FMRUList[I]);
      Break;
    end;
end;

procedure TMainForm.FExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.EMenuClick(Sender: TObject);
var
  HasFocus, HasSel: Boolean;
begin
  HasFocus := Memo.Focused;
  HasSel := HasFocus and Memo.SelAvail;
  EUndo.Enabled := HasFocus and Memo.CanUndo;
  ECut.Enabled := HasSel;
  ECopy.Enabled := HasSel;
  EDelete.Enabled := HasSel;
  EPaste.Enabled := HasFocus and Clipboard.HasFormat(CF_TEXT);
end;

procedure TMainForm.actUndoClick(Sender: TObject);
begin
  if Memo.Focused then
    Memo.Undo;
end;

procedure TMainForm.actCutClick(Sender: TObject);
begin
  if Memo.Focused then
    Memo.CutToClipboard;
end;

procedure TMainForm.actCopyClick(Sender: TObject);
begin
  if Memo.Focused then
    Memo.CopyToClipboard;
end;

procedure TMainForm.actPasteClick(Sender: TObject);
begin
  if Memo.Focused then
    Memo.PasteFromClipboard;
end;

procedure TMainForm.actDeleteClick(Sender: TObject);
begin
  if Memo.Focused then
    Memo.ClearSelection;
end;

procedure TMainForm.ESelectAllClick(Sender: TObject);
begin
  Memo.SelectAll;
end;

procedure TMainForm.VMenuClick(Sender: TObject);
begin
  VToolbar.Checked := MainToolbar.Visible;
  VCompilerMessages.Checked := MessageList.Height > 0;
end;

procedure TMainForm.VToolbarClick(Sender: TObject);
begin
  MainToolbar.Visible := not MainToolbar.Visible;
end;

procedure TMainForm.SetMessageListVisible (const AVisible: Boolean);
begin
  if AVisible then begin
    if MessageList.Height = 0 then
      MessageList.Height := MessageList.ItemHeight * 4 + 4;
  end
  else begin
    MessageList.Height := 0;
    { Don't let Status move above the splitter; force it to the bottom }
    MessageList.Top := OuterPanel.ClientHeight + 1;
  end;
end;

procedure TMainForm.VCompilerMessagesClick(Sender: TObject);
begin
  SetMessageListVisible (MessageList.Height = 0);
end;

procedure TMainForm.HReadmeClick(Sender: TObject);
begin
  ShellExecute (0, 'open', PChar(ExtractFilePath(ParamStr(0)) + 'README.htm'),
    nil, nil, SW_SHOW);
end;

procedure TMainForm.HLicenseClick(Sender: TObject);
begin
  ShellExecute (0, 'open', PChar(ExtractFilePath(ParamStr(0)) + 'LICENSE.txt'),
    nil, nil, SW_SHOW);
end;

procedure TMainForm.HAboutClick(Sender: TObject);
begin
  { Removing the About box or modifying the text inside it is a violation of the
    Inno Setup license agreement; see LICENSE.TXT. However, adding additional
    lines to the About box is permitted. }
  MsgBox ('Inno Pascal Compiler version ' + InnoPascalVersion + SNewLine +
    'Copyright (C) 2000 Jordan Russell. All rights reserved.' + SNewLine2 +
    'Home page:' + SNewLine +
    'http://www.jrsoftware.org/',
    'About Inno Pascal', mbInformation, MB_OK);
end;

(*procedure TCompileForm.CompileStatusProc (const S: String);
var
  DC: HDC;
  Size: TSize;
begin
  with Status do begin
    try
      TopIndex := Items.Add(S);
    except
      on EOutOfResources do begin
        Clear;
        SendMessage (Handle, LB_SETHORIZONTALEXTENT, 0, 0);
        Items.Add ('*** Log size limit reached, list reset.');
        TopIndex := Items.Add(S);
      end;
    end;
    DC := GetDC(0);
    try
      SelectObject (DC, Font.Handle);
      GetTextExtentPoint (DC, PChar(S), Length(S), Size);
    finally
      ReleaseDC (0, DC);
    end;
    Inc (Size.cx, 5);
    if Size.cx > SendMessage(Handle, LB_GETHORIZONTALEXTENT, 0, 0) then
      SendMessage (Handle, LB_SETHORIZONTALEXTENT, Size.cx, 0);
  end;
end;*)

function FindOptionsToSearchOptions (const FindOptions: TFindOptions): TSynSearchOptions;
begin
  Result := [];
  if frMatchCase in FindOptions then
    Include (Result, ssoMatchCase);
  if frWholeWord in FindOptions then
    Include (Result, ssoWholeWord);
  if frReplace in FindOptions then
    Include (Result, ssoReplace);
  if frReplaceAll in FindOptions then
    Include (Result, ssoReplaceAll);
  if not(frDown in FindOptions) then
    Include (Result, ssoBackwards);
end;

procedure TMainForm.EFindClick(Sender: TObject);
begin
  ReplaceDialog.CloseDialog;
  FindDialog.Execute;
end;

procedure TMainForm.EFindNextClick(Sender: TObject);
begin
  if FindDialog.FindText = '' then
    EFindClick (Sender)
  else
    FindDialogFind (FindDialog);
end;

procedure TMainForm.FindDialogFind(Sender: TObject);
begin
  { this event handler is shared between FindDialog & ReplaceDialog }
  with Sender as TFindDialog do
    if Memo.SearchReplace(FindText, '', FindOptionsToSearchOptions(Options)) = 0 then
      MsgBoxFmt ('Cannot find "%s"', [FindText], '', mbError, MB_OK);
end;

procedure TMainForm.EReplaceClick(Sender: TObject);
begin
  MsgBox ('Replace isn''t currently implemented.', '', mbError, MB_OK);
  exit;
  {}{ It doesn't work quite right... }
  FindDialog.CloseDialog;
  ReplaceDialog.Execute;
end;

procedure TMainForm.ReplaceDialogReplace(Sender: TObject);
begin
  with ReplaceDialog do begin
    {if AnsiCompareText(Memo.SelText, FindText) = 0 then
      Memo.SelText := ReplaceText;}
    if Memo.SearchReplace(FindText, ReplaceText, FindOptionsToSearchOptions(Options)) = 0 then
      MsgBoxFmt ('Cannot find "%s"', [FindText], '', mbError, MB_OK);
  end;
end;

procedure TMainForm.WMDebugMsg (var Message: TMessage);
var
  I, L: Integer;
  Wait: Boolean;
begin
  Message.Result := 0;
  case Message.WParam of
    dmLog: begin
        DebugEventLogForm.Log (PDebugMsgLogData(Message.LParam).Typ,
          PDebugMsgLogData(Message.LParam).Details);
      end;
    dmCriticalError: begin
        Application.MessageBox (PChar(String(Message.LParam)), 'Debugger',
          MB_OK or MB_ICONSTOP);
      end;
    dmPaused: begin
        with PDebugMsgPauseData(Message.LParam)^ do begin
          Wait := AlwaysWait;
          SetBreakLine (-1);
          L := -1;
          if Assigned(FLineNumberInfo) then
            for I := 1 to FLineNumberInfoCount do
              if FLineNumberInfo[I] = Address then begin
                Wait := True;
                L := I;
                Break;
              end;
          if Wait then begin
            UpdateRunActions (True);
            SetBreakLine (L);
            DebugRegistersForm.NewContext (Context^);
            Message.Result := 1;
          end;
        end;
      end;
    dmStopped: begin
        SetBreakLine (-1);
        UpdateRunActions (False);

        if Message.LParam <> 0 then begin
          Application.MessageBox (PChar(Message.LParam), 'Fatal Debugger Error',
            MB_OK or MB_ICONSTOP);
          StrDispose (PChar(Message.LParam));
        end;
      end;
  end;
end;

procedure TMainForm.UpdateRunActions (const ADebugBreaked: Boolean);
{ Enables/disables actions like Compile, Run, and Stop to match the current
  debugger state. Also updates caption. }
begin
  FDebugBreaked := ADebugBreaked;
  actCompile.Enabled := not Debugging;
  actBuild.Enabled := not Debugging;
  actRun.Enabled := not Debugging or ADebugBreaked;
  actStepOver.Enabled := not Debugging or ADebugBreaked;
  actRunToCursor.Enabled := not Debugging or ADebugBreaked;
  actStop.Enabled := Debugging;
  UpdateCaption;
end;

procedure TMainForm.Run (const SingleStep: Boolean);
begin
  SetBreakLine (-1);
  DebugRegistersForm.NoContext;
  if not Debugging then begin
    CompileIfNecessary;
    FModifiedWhileDebugging := False;

    DebugSingleStep := SingleStep;
    StartDebug (GetOutFilename, FParameters, Handle, WM_DebugMsg);
    UpdateRunActions (False);
  end
  else begin
    DebugSingleStep := SingleStep;
    UpdateRunActions (False);
    SetEvent (DebugContinueEvent);
  end;
end;

procedure TMainForm.Stop;
begin
  if not Debugging then
    Exit;

  StopDebug;
  UpdateCaption;
end;

function TMainForm.AskToRestartIfModified: Boolean;
begin
  Result := True;
  if Debugging and FModifiedWhileDebugging then
    case Application.MessageBox('The source has been modified. ' +
       'Rebuild and restart now?', 'Source Modified',
       MB_YESNOCANCEL or MB_ICONQUESTION) of
      ID_YES: Stop;
      ID_NO: FModifiedWhileDebugging := False;
    else
      Result := False;
    end;
end;

procedure TMainForm.actRunClick(Sender: TObject);
begin
  if AskToRestartIfModified then
    Run (False);
end;

procedure TMainForm.actStepOverClick(Sender: TObject);
begin
  if AskToRestartIfModified then
    Run (True);
end;

procedure TMainForm.actRunToCursorExecute(Sender: TObject);
var
  A: Cardinal;
  L: Integer;
begin
  if not AskToRestartIfModified then
    Exit;
  if not Debugging then
    { Need to compile now so that LineNumberInfo will be valid }
    CompileIfNecessary;
  L := Memo.CaretY;
  A := $FFFFFFFF;
  if Assigned(FLineNumberInfo) and (L <= FLineNumberInfoCount) then
    A := FLineNumberInfo[L];
  if A = $FFFFFFFF then begin
    Application.MessageBox ('Cannot run to cursor; no code was generated ' +
      'for the current line.', 'Run to Cursor', MB_OK or MB_ICONEXCLAMATION);
    Exit;
  end;
  DebugWantBreakpointAt := A;
  Run (False);
end;

procedure TMainForm.actStopClick(Sender: TObject);
begin
  Stop;
end;

procedure TMainForm.MemoSpecialLineColors(Sender: TObject; Line: Integer;
  var Special: Boolean; var FG, BG: TColor);
begin
  if FErrorLine = Line then begin
    Special := True;
    FG := clWhite;
    BG := clMaroon;
  end
  else
  if FBreakLine = Line then begin
    Special := True;
    FG := clWhite;
    BG := clBlue;
  end;
end;

procedure TMainForm.SetErrorLine (ALine: Integer);
begin
  if FErrorLine <> ALine then begin
    if FErrorLine > 0 then
      Memo.InvalidateLine (FErrorLine);
    FErrorLine := ALine;
    if FErrorLine > 0 then
      Memo.InvalidateLine (FErrorLine);
  end;
end;

procedure TMainForm.SetBreakLine (ALine: Integer);
begin
  if FBreakLine <> ALine then begin
    if FBreakLine > 0 then
      Memo.InvalidateLine (FBreakLine);
    FBreakLine := ALine;
    if FBreakLine > 0 then begin
      Memo.InvalidateLine (FBreakLine);
      Memo.CaretXY := Point(1, FBreakLine);
      Memo.SetFocus;
    end;
  end;
end;

procedure TMainForm.HideError;
begin
  SetErrorLine (-1);
end;

procedure TMainForm.MemoStatusChange(Sender: TObject;
  Changes: TSynStatusChanges);
const
  InsertText: array[Boolean] of String = ('Overwrite', 'Insert');
begin
  if (scCaretX in Changes) or (scCaretY in Changes) then begin
    HideError;
    StatusBar.Panels[0].Text := Format('%4d:%4d', [Memo.CaretY, Memo.CaretX]);
  end;
  if scModified in Changes then begin
    if Memo.Modified then
      StatusBar.Panels[1].Text := 'Modified'
    else
      StatusBar.Panels[1].Text := '';
  end;
  if scInsertMode in Changes then
    StatusBar.Panels[2].Text := InsertText[Memo.InsertMode];
end;

procedure TMainForm.MemoChange(Sender: TObject);
begin
  FModifiedSinceLastCompile := True;
  if Debugging then
    FModifiedWhileDebugging := True
  else
    { Modified while not debugging; free the line number info and clear the dots }
    if Assigned(FLineNumberInfo) then begin
      FreeMem (FLineNumberInfo);
      FLineNumberInfo := nil;
      Memo.InvalidateGutter;
    end;
  { Need HideError here because we don't get an OnStatusChange event when the
    Delete key is pressed }
  HideError;
end;

procedure TMainForm.VEditorOptionsClick(Sender: TObject);
begin
  VEHorizCaret.Checked := Memo.InsertCaret = ctHorizontalLine;
end;

procedure TMainForm.VEHorizCaretClick(Sender: TObject);
begin
  if Memo.InsertCaret <> ctHorizontalLine then
    Memo.InsertCaret := ctHorizontalLine
  else
    Memo.InsertCaret := ctVerticalLine;
end;

procedure TMainForm.RParametersClick(Sender: TObject);
begin
  InputQuery ('Run Parameters', 'Parameters:', FParameters);
end;

procedure TMainForm.VDEventLogClick(Sender: TObject);
begin
  DebugEventLogForm.Show;
end;

procedure TMainForm.VDRegistersClick(Sender: TObject);
begin
  DebugRegistersForm.Show;
end;

procedure TMainForm.MemoPaint(Sender: TObject; ACanvas: TCanvas);
var
  CR: TRect;
  H, Y, I: Integer;
begin
  ACanvas.Pen.Color := clGreen;
  ACanvas.Brush.Color := clLime;
  H := Memo.LineHeight;
  Y := 0;
  CR := ACanvas.ClipRect;
  for I := Memo.TopLine to Memo.Lines.Count do begin
    if Y >= CR.Bottom then
      Break;
    if (Y + H > CR.Top) and Assigned(FLineNumberInfo) and
       (I <= FLineNumberInfoCount) and (FLineNumberInfo[I] <> $FFFFFFFF) then
      ACanvas.Rectangle (19, Y + (H div 2) - 1, 22, Y + (H div 2) + 2);
    Inc (Y, H);
  end;
end;

procedure TMainForm.MessageListDblClick(Sender: TObject);
var
  I, L: Integer;
begin
  I := MessageList.ItemIndex;
  if I = -1 then
    Exit;
  L := Integer(MessageList.Items.Objects[I]);
  Memo.CaretXY := Point(1, L);
  Memo.SetFocus;
  SetErrorLine (L);
end;

end.

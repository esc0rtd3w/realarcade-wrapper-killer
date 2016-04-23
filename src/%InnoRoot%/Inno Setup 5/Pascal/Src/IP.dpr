program IP;

uses
  Controls,
  Forms,
  Compiler in 'Compiler.pas',
  Main in 'Main.pas' {MainForm},
  CodeX86 in 'CodeX86.pas',
  DebugEventLog in 'DebugEventLog.pas' {DebugEventLogForm},
  DebugRegisters in 'DebugRegisters.pas' {DebugRegistersForm},
  Debugger in 'Debugger.pas',
  LinkerPE in 'LinkerPE.pas',
  Common in 'Common.pas',
  IPascal in 'IPascal.pas',
  IPBase in 'IPBase.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Inno Pascal';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDebugEventLogForm, DebugEventLogForm);
  Application.CreateForm(TDebugRegistersForm, DebugRegistersForm);
  Application.Run;
end.

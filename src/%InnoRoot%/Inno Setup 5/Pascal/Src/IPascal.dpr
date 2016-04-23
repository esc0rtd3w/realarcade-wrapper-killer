program IPascal;

uses
  Controls,
  Forms,
  Compiler in 'Compiler.pas',
  Main in 'Main.pas' {MainForm},
  CodeX86 in 'CodeX86.pas',
  DebugEventLog in 'DebugEventLog.pas' {DebugEventLogForm},
  DebugRegisters in 'DebugRegisters.pas' {DebugRegistersForm},
  Debugger in 'Debugger.pas',
  Linker in 'Linker.pas',
  Common in 'Common.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Inno Pascal';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDebugEventLogForm, DebugEventLogForm);
  Application.CreateForm(TDebugRegistersForm, DebugRegistersForm);
  Application.Run;
end.

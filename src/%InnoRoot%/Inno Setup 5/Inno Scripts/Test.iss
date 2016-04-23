[Setup]
AppName=GAMENAME
AppVerName=GAMENAME
DefaultDirName={pf}\unRealArcade\GAMENAME\
OutputBaseFilename=GAMENAME
SolidCompression=true
Compression=lzma/ultra
DisableReadyMemo=true
DisableReadyPage=true
ShowLanguageDialog=auto
CreateUninstallRegKey=false
DisableDirPage=true
UsePreviousAppDir=false
AppendDefaultDirName=false
UsePreviousGroup=false
AppendDefaultGroupName=false
RestartIfNeededByRun=false
PrivilegesRequired=none
DisableProgramGroupPage=true
InternalCompressLevel=ultra
OutputDir=C:\URA\ra1_games\installer

[Run]
Filename: {app}\GAMEXE; WorkingDir: {app}; Flags: runmaximized

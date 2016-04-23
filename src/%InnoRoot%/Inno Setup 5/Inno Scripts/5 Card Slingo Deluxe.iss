[Setup]
AppName=5 Card Slingo Deluxe
AppVerName=5 Card Slingo Deluxe
DefaultDirName={pf}\unRealArcade\5 Card Slingo Deluxe\
OutputBaseFilename=5 Card Slingo Deluxe
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
DisableProgramGroupPage=false
InternalCompressLevel=ultra
OutputDir=C:\URA\ra1_games\installer
DefaultGroupName=unRealArcade
AlwaysUsePersonalGroup=true



[Run]
Filename: {app}\FiveCardSlingo.exe; WorkingDir: {app}; Flags: runmaximized
[Dirs]
Name: {app}\data
Name: {app}\HowToPlay
[Files]
Source: ..\..\..\Program Files\unRealArcade\5 Card Slingo Deluxe\data\save.dat; DestDir: {app}\data\
Source: ..\..\..\Program Files\unRealArcade\5 Card Slingo Deluxe\HowToPlay\Images\lgoslingo.5card.jpg; DestDir: {app}\HowToPlay\Images
Source: ..\..\..\Program Files\unRealArcade\5 Card Slingo Deluxe\HowToPlay\Pages\contents.htm; DestDir: {app}\HowToPlay\Pages
Source: ..\..\..\Program Files\unRealArcade\5 Card Slingo Deluxe\HowToPlay\Pages\faq.htm; DestDir: {app}\HowToPlay\Pages
Source: ..\..\..\Program Files\unRealArcade\5 Card Slingo Deluxe\HowToPlay\Pages\rules.htm; DestDir: {app}\HowToPlay\Pages
Source: ..\..\..\Program Files\unRealArcade\5 Card Slingo Deluxe\HowToPlay\Pages\slin1011.css; DestDir: {app}\HowToPlay\Pages
Source: ..\..\..\Program Files\unRealArcade\5 Card Slingo Deluxe\HowToPlay\Pages\strategy.htm; DestDir: {app}\HowToPlay\Pages
Source: ..\..\..\Program Files\unRealArcade\5 Card Slingo Deluxe\HowToPlay\Pages\welcome.htm; DestDir: {app}\HowToPlay\Pages
Source: ..\..\..\Program Files\unRealArcade\5 Card Slingo Deluxe\HowToPlay\howtoplay.htm; DestDir: {app}\HowToPlay\
Source: ..\..\..\Program Files\unRealArcade\5 Card Slingo Deluxe\bass.dll; DestDir: {app}
Source: ..\..\..\Program Files\unRealArcade\5 Card Slingo Deluxe\FiveCardSlingo.exe; DestDir: {app}
Source: ..\..\..\Program Files\unRealArcade\5 Card Slingo Deluxe\fivecardslingoresources.fun; DestDir: {app}
Source: ..\..\..\Program Files\unRealArcade\5 Card Slingo Deluxe\oleacc.dll; DestDir: {app}
Source: ..\..\..\Program Files\unRealArcade\5 Card Slingo Deluxe\shfolder.dll; DestDir: {app}
Source: ..\..\..\Program Files\unRealArcade\5 Card Slingo Deluxe\zlib.dll; DestDir: {app}

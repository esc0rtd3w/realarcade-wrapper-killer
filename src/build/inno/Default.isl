; *** Inno Setup version 5.1.11+ English messages ***
;
; To download user-contributed translations of this file, go to:
;   http://www.jrsoftware.org/files/istrans/
;
; Note: When translating this text, do not add periods (.) to the end of
; messages that didn't have them already, because on those messages Inno
; Setup adds the periods automatically (appending a period would result in
; two periods being displayed).

[LangOptions]
; The following three entries are very important. Be sure to read and 
; understand the '[LangOptions] section' topic in the help file.
LanguageName=English
LanguageID=$0409
LanguageCodePage=0
; If the language you are translating to requires special font faces or
; sizes, uncomment any of the following entries and change them accordingly.
;DialogFontName=
;DialogFontSize=8
;WelcomeFontName=Verdana
;WelcomeFontSize=12
;TitleFontName=Arial
;TitleFontSize=29
;CopyrightFontName=Arial
;CopyrightFontSize=8

[Messages]

; *** Application titles
SetupAppTitle=-[ RealArcade Wrapper Killer ]-
SetupWindowTitle=
UninstallAppTitle=
UninstallAppFullTitle=

; *** Misc. common
InformationTitle=Information
ConfirmTitle=Confirm
ErrorTitle=Error

; *** SetupLdr messages
SetupLdrStartupMessage=This will install %1. Do you wish to continue?
LdrCannotCreateTemp=Unable to create a temporary file. Setup aborted
LdrCannotExecTemp=Unable to execute file in the temporary directory. Setup aborted

; *** Startup error messages
LastErrorMessage=%1.%n%nError %2: %3
SetupFileMissing=The file %1 is missing from the installation directory. Please correct the problem or obtain a new copy of the program.
SetupFileCorrupt=The setup files are corrupted. Please obtain a new copy of the program.
SetupFileCorruptOrWrongVer=The setup files are corrupted, or are incompatible with this version of Setup. Please correct the problem or obtain a new copy of the program.
NotOnThisPlatform=This program will not run on %1.
OnlyOnThisPlatform=This program must be run on %1.
OnlyOnTheseArchitectures=This program can only be installed on versions of Windows designed for the following processor architectures:%n%n%1
MissingWOW64APIs=The version of Windows you are running does not include functionality required by Setup to perform a 64-bit installation. To correct this problem, please install Service Pack %1.
WinVersionTooLowError=This program requires %1 version %2 or later.
WinVersionTooHighError=This program cannot be installed on %1 version %2 or later.
AdminPrivilegesRequired=You must be logged in as an administrator when installing this program.
PowerUserPrivilegesRequired=You must be logged in as an administrator or as a member of the Power Users group when installing this program.
SetupAppRunningError=Setup has detected that %1 is currently running.%n%nPlease close all instances of it now, then click OK to continue, or Cancel to exit.
UninstallAppRunningError=Uninstall has detected that %1 is currently running.%n%nPlease close all instances of it now, then click OK to continue, or Cancel to exit.

; *** Misc. errors
ErrorCreatingDir=Setup was unable to create the directory "%1"
ErrorTooManyFilesInDir=Unable to create a file in the directory "%1" because it contains too many files

; *** Setup common messages
ExitSetupTitle=Really Close RA Wrapper Killer?
ExitSetupMessage=If you close this window, your game will still be in DEMO mode!
AboutSetupMenuItem=&About Setup...
AboutSetupTitle=About Setup
AboutSetupMessage=%1 version %2%n%3%n%n%1 home page:%n%4
AboutSetupNote=
TranslatorNote=

; *** Buttons
ButtonBack=[ < < < ]
ButtonNext=[ > > > ]
ButtonInstall=[ -Install- ]
ButtonOK=PICK THIS GAME
ButtonCancel=[ -X- ]
ButtonYes=[ -Y- ]
ButtonYesToAll=[ -Y 2 ALL- ]
ButtonNo=[ -N- ]
ButtonNoToAll=[ -N 2 ALL- ]
ButtonFinish=&Finish
ButtonBrowse=[ FIND GAME HERE ]
ButtonWizardBrowse=[ FIND GAME HERE ]
ButtonNewFolder=&

; *** "Select Language" dialog messages
SelectLanguageTitle=Select Setup Language
SelectLanguageLabel=Select the language to use during the installation:

; *** Common wizard text
ClickNext=Click [ > > > ] to proceed or [ -X- ] to leave!
BeveledLabel=RealArcade Wrapper Killer v5.6.2                     unWrap The Fun!                    cRypTiCwaRe 2o16
BrowseDialogTitle=DOUBLE CLICK THE MY GAMES FOLDER AND SELECT GAME
BrowseDialogLabel=DOUBLE CLICK THE MY GAMES FOLDER AND SELECT GAME
NewFolderName=

; *** "Welcome" wizard page
WelcomeLabel1=Supports XP, Vista, 7, 8, 8.1, 10
;WelcomeLabel2=This will remove the demo protection on any RealArcade / Gamehouse v1.2 (RGS) game (*_free.rgs).%n%nThese games can be downloaded using the older v1.2 player, or by using the included "ra1_games.htm" file.%n%nThis tool will also handle Gamehouse and Zylom game variants!%n%nCurrently the Gamehouse and Zylom RGA archives can only be extracted, but most newer games will still be in trial mode.%n%nPlease click > > > and then click [ FIND GAME HERE ] on the next page to select your game's folder [Default C:\My Games\GameName\]%n%nThe entire process takes about 30 seconds or less.
WelcomeLabel2=This will remove the demo protection on any RealArcade / Gamehouse v1.2 (RGS) game (*_free.rgs).%n%nThis protection scheme is now considered legacy and game installers are no longer available from GameHouse.%n%nThis tool will handle Gamehouse and Zylom RGA game variants, but archives can only be extracted.%n%nThere is now support for new 2016 RFS files. These files cannot currently be extracted locally, but can be extracted remotely from GameHouse servers by using the included activeMARK Instant Server menu, available as a hotkey.%n%nTo use the additional tools and options, choose the default [C:\My Games\] folder and options will be available. To use normally, choose [Default C:\My Games\GameName\].

; *** "Password" wizard page
WizardPassword=Password
PasswordLabel1=This installation is password protected.
PasswordLabel3=Please provide the password, then click Next to continue. Passwords are case-sensitive.
PasswordEditLabel=&Password:
IncorrectPassword=The password you entered is not correct. Please try again.

; *** "License Agreement" wizard page
WizardLicense=Anti-Piracy Agreement
LicenseLabel=Please help support our software developers.
LicenseLabel3=By proceeding, you MUST agree to the following terms:
LicenseAccepted=I Agree To These Terms
LicenseNotAccepted=Aye, me ship be sailin' t' other way!

; *** "Information" wizard pages
WizardInfoBefore=Legal Mumble Jumble
InfoBeforeLabel=By continuing, you are accepting the below terms!
InfoBeforeClickLabel=
WizardInfoAfter=Information
InfoAfterLabel=Please read the following important information before continuing.
InfoAfterClickLabel=When you are ready to continue with Setup, click Next.

; *** "User Information" wizard page
WizardUserInfo=User Information
UserInfoDesc=Please enter your information.
UserInfoName=&User Name:
UserInfoOrg=&Organization:
UserInfoSerial=&Serial Number:
UserInfoNameRequired=You must enter a name.

; *** "Select Destination Location" wizard page
;WizardSelectDir=RealNetworks RGS Game Unpacking Script Ready...
WizardSelectDir=RealNetworks/GameHouse Multi Scripting Engine Ready!
;Use spaces for non (x.x.x) releases like this (x.x  )

; 103 characters for one line
SelectDirDesc=Rls: 5.6.2   DB: RA/1.3.1   Cores: Main/3.1.0   RNA/1.9.4   GH/1.0.1   ZY/1.0.0    Loaders: RGS/2.1.3    RGA/1.0.2    DMG/1.0.1    RFS/1.0.2    AMI/1.0.0

SelectDirLabel3=YOU MUST SELECT YOUR GAMES FOLDER BEFORE CONTINUING!!!
;SelectDirBrowseLabel=Enter The Path of The Target Game Here:
SelectDirBrowseLabel=* Only RGS Installed Games Can Have Demo Limitations Removed! *
;DiskSpaceMBLabel=* Only RGS Installed Games Can Have Demo Limitations Removed! *
DiskSpaceMBLabel=* To use ADVANCED options, click > > > without choosing a path *
;DiskSpaceMBLabel=*DEVELOPER MODE IS ACTIVATED*
;DiskSpaceMBLabel=*DEBUG MODE IS ACTIVATED*
;DiskSpaceMBLabel=*USER MODE IS ACTIVATED*
;DiskSpaceMBLabel=PRIVATE USE ONLY! DO NOT USE THIS TO OVER-EXTEND YOUR TRIAL TIME!
ToUNCPathname=
InvalidPath=
InvalidDrive=
DiskSpaceWarningTitle=Not Enough Disk Space
DiskSpaceWarning=Setup requires at least %1 KB of free space to install, but the selected drive only has %2 KB available.%n%nDo you want to continue anyway?
DirNameTooLong=The folder name or path is too long.
InvalidDirName=The folder name is not valid.
BadDirName32=Folder names cannot include any of the following characters:%n%n%1
DirExistsTitle=LICENSE CHECK / PROPER FOLDER SELECTION VERIFY
DirExists=***************************************************************************%nBy clicking the "YES" button, you are verifying that you have purchased an unlock file from RealNetworks/Gamehouse for the selected game.%n***************************************************************************%n%nIf you are currently downloading a game with the RA Player please wait until it is finished, as this will kill the RA Player window while it is running.%n%nPlease make sure that you have selected the game you want to unpack already by pressing the [ FIND GAME HERE ] button and selecting the folder under C:\MY GAMES\.%n%nTHIS IS THE ONLY REQUIRED ACTION ON YOUR PART TO FULLY UNPACK THIS GAME!%n%n***************************************************************************%nBy clicking the "YES" button, you are verifying that you have purchased an unlock file from RealNetworks/Gamehouse for the selected game.%n***************************************************************************%n%n%nClick "Yes" to continue, or "No" to change a setting or exit!
DirDoesntExistTitle=Folder Does Not Exist
DirDoesntExist=The folder:%n%n%1%n%ndoes not exist. Would you like the folder to be created?

; *** "Select Components" wizard page
WizardSelectComponents=Select Components
SelectComponentsDesc=Which components should be installed?
SelectComponentsLabel2=Select the components you want to install; clear the components you do not want to install. Click Next when you are ready to continue.
FullInstallation=Full installation
; if possible don't translate 'Compact' as 'Minimal' (I mean 'Minimal' in your language)
CompactInstallation=Compact installation
CustomInstallation=Custom installation
NoUninstallWarningTitle=Components Exist
NoUninstallWarning=Setup has detected that the following components are already installed on your computer:%n%n%1%n%nDeselecting these components will not uninstall them.%n%nWould you like to continue anyway?
ComponentSize1=%1 KB
ComponentSize2=%1 MB
ComponentsDiskSpaceMBLabel=Current selection requires at least [mb] MB of disk space.

; *** "Select Additional Tasks" wizard page
WizardSelectTasks=Select Additional Tasks
SelectTasksDesc=Which additional tasks should be performed?
SelectTasksLabel2=Select the additional tasks you would like Setup to perform while installing [name], then click Next.

; *** "Select Start Menu Folder" wizard page
WizardSelectProgramGroup=Select Start Menu Folder
SelectStartMenuFolderDesc=Where should Setup place the program's shortcuts?
SelectStartMenuFolderLabel3=Setup will create the program's shortcuts in the following Start Menu folder.
SelectStartMenuFolderBrowseLabel=To continue, click Next. If you would like to select a different folder, click Browse.
MustEnterGroupName=You must enter a folder name.
GroupNameTooLong=The folder name or path is too long.
InvalidGroupName=The folder name is not valid.
BadGroupName=The folder name cannot include any of the following characters:%n%n%1
NoProgramGroupCheck2=&Don't create a Start Menu folder

; *** "Ready to Install" wizard page
WizardReady=Ready to Install
ReadyLabel1=Setup is now ready to begin installing [name] on your computer.
ReadyLabel2a=Click Install to continue with the installation, or click Back if you want to review or change any settings.
ReadyLabel2b=Click Install to continue with the installation.
ReadyMemoUserInfo=User information:
ReadyMemoDir=Destination location:
ReadyMemoType=Setup type:
ReadyMemoComponents=Selected components:
ReadyMemoGroup=Start Menu folder:
ReadyMemoTasks=Additional tasks:

; *** "Preparing to Install" wizard page
WizardPreparing=Preparing RealArcade Wrapper Killer files....
PreparingDesc=This should only take a few seconds
PreviousInstallNotCompleted=An unknown error has occurred. Please restart your computer and try again!
CannotContinue=Unable to continue. Please click [ -X- ] to exit.

; *** "Installing" wizard page
WizardInstalling=In Progress...
InstallingLabel=

; *** "Setup Completed" wizard page
FinishedHeadingLabel=Completing the [name] Setup Wizard
FinishedLabelNoIcons=Setup has finished installing [name] on your computer.
FinishedLabel=Setup has finished installing [name] on your computer. The application may be launched by selecting the installed icons.
ClickFinish=Click Finish to exit Setup.
FinishedRestartLabel=To complete the installation of [name], Setup must restart your computer. Would you like to restart now?
FinishedRestartMessage=To complete the installation of [name], Setup must restart your computer.%n%nWould you like to restart now?
ShowReadmeCheck=Yes, I would like to view the README file
YesRadio=&Yes, restart the computer now
NoRadio=&No, I will restart the computer later
; used for example as 'Run MyProg.exe'
RunEntryExec=Run %1
; used for example as 'View Readme.txt'
RunEntryShellExec=View %1

; *** "Setup Needs the Next Disk" stuff
ChangeDiskTitle=Setup Needs the Next Disk
SelectDiskLabel2=Please insert Disk %1 and click OK.%n%nIf the files on this disk can be found in a folder other than the one displayed below, enter the correct path or click Browse.
PathLabel=&Path:
FileNotInDir2=The file "%1" could not be located in "%2". Please insert the correct disk or select another folder.
SelectDirectoryLabel=Please specify the location of the next disk.

; *** Installation phase messages
SetupAborted=Setup was not completed.%n%nPlease correct the problem and run Setup again.
EntryAbortRetryIgnore=Click Retry to try again, Ignore to proceed anyway, or Abort to cancel installation.

; *** Installation status messages
StatusCreateDirs=Creating directories...
StatusExtractFiles=Extracting files...
StatusCreateIcons=Creating shortcuts...
StatusCreateIniEntries=Creating INI entries...
StatusCreateRegistryEntries=Creating registry entries...
StatusRegisterFiles=Registering files...
StatusSavingUninstall=Saving uninstall information...
StatusRunProgram=DO NOT CLOSE THIS WINDOW!
StatusRollback=Rolling back changes...

; *** Misc. errors
ErrorInternal2=Internal error: %1
ErrorFunctionFailedNoCode=%1 failed
ErrorFunctionFailed=%1 failed; code %2
ErrorFunctionFailedWithMessage=%1 failed; code %2.%n%3
ErrorExecutingProgram=Unable to execute file:%n%1

; *** Registry errors
ErrorRegOpenKey=Error opening registry key:%n%1\%2
ErrorRegCreateKey=Error creating registry key:%n%1\%2
ErrorRegWriteKey=Error writing to registry key:%n%1\%2

; *** INI errors
ErrorIniEntry=Error creating INI entry in file "%1".

; *** File copying errors
FileAbortRetryIgnore=Click Retry to try again, Ignore to skip this file (not recommended), or Abort to cancel installation.
FileAbortRetryIgnore2=Click Retry to try again, Ignore to proceed anyway (not recommended), or Abort to cancel installation.
SourceIsCorrupted=The source file is corrupted
SourceDoesntExist=The source file "%1" does not exist
ExistingFileReadOnly=The existing file is marked as read-only.%n%nClick Retry to remove the read-only attribute and try again, Ignore to skip this file, or Abort to cancel installation.
ErrorReadingExistingDest=An error occurred while trying to read the existing file:
FileExists=The file already exists.%n%nWould you like Setup to overwrite it?
ExistingFileNewer=The existing file is newer than the one Setup is trying to install. It is recommended that you keep the existing file.%n%nDo you want to keep the existing file?
ErrorChangingAttr=An error occurred while trying to change the attributes of the existing file:
ErrorCreatingTemp=An error occurred while trying to create a file in the destination directory:
ErrorReadingSource=An error occurred while trying to read the source file:
ErrorCopying=An error occurred while trying to copy a file:
ErrorReplacingExistingFile=An error occurred while trying to replace the existing file:
ErrorRestartReplace=RestartReplace failed:
ErrorRenamingTemp=An error occurred while trying to rename a file in the destination directory:
ErrorRegisterServer=Unable to register the DLL/OCX: %1
ErrorRegSvr32Failed=RegSvr32 failed with exit code %1
ErrorRegisterTypeLib=Unable to register the type library: %1

; *** Post-installation errors
ErrorOpeningReadme=An error occurred while trying to open the README file.
ErrorRestartingComputer=Setup was unable to restart the computer. Please do this manually.

; *** Uninstaller messages
UninstallNotFound=File "%1" does not exist. Cannot uninstall.
UninstallOpenError=File "%1" could not be opened. Cannot uninstall
UninstallUnsupportedVer=The uninstall log file "%1" is in a format not recognized by this version of the uninstaller. Cannot uninstall
UninstallUnknownEntry=An unknown entry (%1) was encountered in the uninstall log
ConfirmUninstall=Are you sure you want to completely remove %1 and all of its components?
UninstallOnlyOnWin64=This installation can only be uninstalled on 64-bit Windows.
OnlyAdminCanUninstall=This installation can only be uninstalled by a user with administrative privileges.
UninstallStatusLabel=Please wait while %1 is removed from your computer.
UninstalledAll=%1 was successfully removed from your computer.
UninstalledMost=%1 uninstall complete.%n%nSome elements could not be removed. These can be removed manually.
UninstalledAndNeedsRestart=To complete the uninstallation of %1, your computer must be restarted.%n%nWould you like to restart now?
UninstallDataCorrupted="%1" file is corrupted. Cannot uninstall

; *** Uninstallation phase messages
ConfirmDeleteSharedFileTitle=Remove Shared File?
ConfirmDeleteSharedFile2=The system indicates that the following shared file is no longer in use by any programs. Would you like for Uninstall to remove this shared file?%n%nIf any programs are still using this file and it is removed, those programs may not function properly. If you are unsure, choose No. Leaving the file on your system will not cause any harm.
SharedFileNameLabel=File name:
SharedFileLocationLabel=Location:
WizardUninstalling=Uninstall Status
StatusUninstalling=Uninstalling %1...

; The custom messages below aren't used by Setup itself, but if you make
; use of them in your scripts, you'll want to translate them.

[CustomMessages]

NameAndVersion=%1 version %2
AdditionalIcons=Additional icons:
CreateDesktopIcon=Create a &desktop icon
CreateQuickLaunchIcon=Create a &Quick Launch icon
ProgramOnTheWeb=%1 on the Web
UninstallProgram=Uninstall %1
LaunchProgram=Launch %1
AssocFileExtension=&Associate %1 with the %2 file extension
AssocingFileExtension=Associating %1 with the %2 file extension...

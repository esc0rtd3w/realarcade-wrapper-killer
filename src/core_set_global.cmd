@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Setting Global Variables +-^~`+-.)     [...cRypTiCwaRe 2o16...]

::-----------------------------------------------------------------------------------
:: Sample RNArcade.exe switch (this loads the game by GUID, which happens to be
:: Hole In One Golf).
:: Possibly use as an alternate way of loading based on %guid% variable in
:: the future.
:: Find more switches to use, preferrably one to silent install RGS files.
:: Cycling through starting at /launch 1 gives some interesting results.
::%raexec% /launch 6ADE04C1-B67D-11D5-B743-00D0B74C4519
::-----------------------------------------------------------------------------------

::-----------------------------------------------------------------------------------
::System Paths
::-----------------------------------------------------------------------------------

:: Common OS Paths
set pf=%systemdrive%\Program Files
set cf=%systemdrive%\Program Files\Common Files
set pf64=%systemdrive%\Program Files (x86)
set cf64=%systemdrive%\Program Files (x86)\Common Files
set pd=%ProgramData%
set pdxp=%UserProfile%\Application Data\
set adl=%LocalAppData%
set adll=%SystemDrive%%HomePath%\AppData\LocalLow
set adr=%AppData%
set au=%SystemDrive%\All Users
set auxp=%systemdrive%\Documents and Settings\All Users
set cu=%UserProfile%
set cuxp=%userprofile%\Application Data
set win=%windir%
set sys32=%windir%\system32
set sysprofile=%windir%\system32\config\systemprofile
set userdir=%userprofile%
set cookies=%AppData%\Microsoft\Windows\Cookies

:: Temp Paths
set temp1=%tempGlobal%
set temp2=%systemdrive%\Temp
set temp3=%windir%\Temp
set temp4=%windir%\system32\config\systemprofile\AppData\Local\Temp
set tempInit=%tempGlobal%
set tempDirectory=%tempInit%
set tempSys=%windir%\TEMP

:: Desktop Paths
set deskau=%public%\Desktop
set deskcu=%SystemDrive%%HomePath%\Desktop

:: Start Menu Paths
set startau=%systemdrive%\Users\All Users\Microsoft\Windows\Start Menu\Programs
set startcu=%AppData%\Microsoft\Windows\Start Menu\Programs

:: Documents Paths
set docsau=%Public%\Documents
set docscu=%UserProfile%\Documents

:: Misc paths used in backup routine (may be unreferenced)
set user=%UserProfile%
set appdata2=%user%\AppData

:: Default Common User Paths
set contacts=%UserProfile%\Contacts
set desktop=%UserProfile%\Desktop
set mydownloads=%UserProfile%\Downloads
set favorites=%UserProfile%\Favorites
set links=%UserProfile%\Links
set mydocuments=%UserProfile%\My Documents
set mymusic=%UserProfile%\My Music
set mypictures=%UserProfile%\My Pictures
set myvideos=%UserProfile%\My Videos
set savedgames=%UserProfile%\Saved Games
set searches=%UserProfile%\Searches

:: Alternate Default Common User Paths
set documents=%UserProfile%\Documents
set downloads=%UserProfile%\Downloads
set pictures=%UserProfile%\Pictures
set music=%UserProfile%\Music
set videos=%UserProfile%\Videos

:: System User Paths
set sysUserRoot=%windir%\system32\config\systemprofile
set sysUserAppData=%windir%\system32\config\systemprofile\AppData
set sysUserAppDataLocal=%windir%\system32\config\systemprofile\AppData\Local
set sysUserAppDataLocalLow=%windir%\system32\config\systemprofile\AppData\LocalLow
set sysUserAppDataRoaming=%windir%\system32\config\systemprofile\AppData\Roaming
set sysUserDesktop=%windir%\system32\config\systemprofile\Desktop
set sysUserDocuments=%windir%\system32\config\systemprofile\Documents
set sysUserDownloads=%windir%\system32\config\systemprofile\Downloads
set sysUserFavorites=%windir%\system32\config\systemprofile\Favorites
set sysUserMusic=%windir%\system32\config\systemprofile\Music
set sysUserPictures=%windir%\system32\config\systemprofile\Pictures
set sysUserVideos=%windir%\system32\config\systemprofile\Videos


::-----------------------------------------------------------------------------------
::RA Player Folder
::-----------------------------------------------------------------------------------

set raroot=C:\Program Files\Real\RealArcade
set catroot=C:\Program Files\Real\RealArcade\catalog
set dbroot=C:\Program Files\Real\RealArcade\db
set htmlroot=C:\Program Files\Real\RealArcade\Html
set rashort=C:\Program Files\Real\RealArcade\rawk_unwrapped
set raexec="C:\Program Files\Real\RealArcade\RNArcade.exe"
set raexec2=RNArcade.exe
::set rauninst="C:\Program Files\Real\RealArcade\Update\rnuninst.exe" "RealNetworks|RealArcade|1.2"
::set rauninst="C:\Program Files\unRealArcade\rnuninst\rnuninst.exe" "RealNetworks|RealArcade|1.2"
set rauninst="C:\Program Files\unRealArcade\rnuninst\dokill.lnk"
set rasetup="C:\Program Files\Real\RealArcade\Setup\setup_rac.exe"

::-----------------------------------------------------------------------------------
::Catalog Specific 
::-----------------------------------------------------------------------------------

set cover1=cover.jpg
set cover2=cover.png
set pdxml=predownload.xml

::-----------------------------------------------------------------------------------
::Games Installation and Download
::-----------------------------------------------------------------------------------

set gameroot=C:\My Games
set downroot=C:\My Download Files

:: Older GH RGA Path
::set ghroot_old=C:\Program Files\GameHouse Games

:: Newer GH RGA Path
set ghroot=C:\GameHouse Games

::-----------------------------------------------------------------------------------
::Web Links
::-----------------------------------------------------------------------------------

set rgsroot=http://games-dl2.real.com/gameconsole/games/demorgses

::-----------------------------------------------------------------------------------
::URA and RAWK Custom
::-----------------------------------------------------------------------------------

set uraRoot=C:\Program Files\unRealArcade
set uraStubRoot=C:\Program Files\unRealArcade\stubs
set rawkRoot=C:\Program Files\unRealArcade\rawk

::-----------------------------------------------------------------------------------
::Portable RGS Loader Specific
::-----------------------------------------------------------------------------------

::C:\\PROGRA~1\\Real\\REALAR~2\\RNArcade.exe /m application/vnd.rn-rn_secured_installer %1

set rgsinst= /m application/vnd.rn-rn_secured_installer
set rgsloader="%uraRoot%\temp\loaderRGSv1.exe"
set rgsloader2="%uraRoot%\temp\loaderRGSv2.exe"
set rgsloader3="%uraRoot%\temp\loaderRGA.exe"
set rgsloader4="%uraRoot%\temp\loaderDMG.exe"
set rgsloader5="%uraRoot%\temp\loaderRFS.exe"
set rnaspoof="%uraRoot%\temp\rnaspoof.exe"
::set rnaspoof=start "" /d "C:\Program Files\unRealArcade\temp" "rnaspoof.exe"
set rnamod="%uraRoot%\temp\rnamod.exe"


::-----------------------------------------------------------------------------------
::RealArcade removal stuff
::-----------------------------------------------------------------------------------

set rauninstall=0


::-----------------------------------------------------------------------------------
::unRealArcade Downloader Specific (added 20130611) (Requires .NET 4.0)
::-----------------------------------------------------------------------------------

set launchwebdl=0

:: Link to loader with autolaunch
set webdlpath="C:\Program Files\unRealArcade\temp\uradl.exe"

:: Link to actual web downloader exe
set webdlpath_loader="C:\Program Files\unRealArcade\uradl\uradl.exe"


::-----------------------------------------------------------------------------------
::Regblock Paths In Registry (DISABLED ON 08-02-2011)
::-----------------------------------------------------------------------------------

::set rb1=HKCR\Software\RealNetworks\Games
::set rb2=HKCU\Software\Classes\Software\RealNetworks\Games
::set rb3=HKCU\Software\RealNetworks\Games
::set rb4=HKCR\Software\Classes\Software\RealNetworks\Games
::set rb5=HKCU\Software\Classes

::-----------------------------------------------------------------------------------
::Often Used Commands
::-----------------------------------------------------------------------------------

set show=nircmd win activate ititle
set hide=nircmd win hide class
set hide2=nircmd win hide ititle
set gohide=nircmd exec hide
set gohide2=nircmd exec2 hide
set goshow=nircmd exec show
set kill=taskkill /f /t /im
set min=nircmd win min title
set waitfor=nircmd wait
set talk=nircmd speak text
set remove=del /s /q

set popup=nircmd trayballoon "RealArcade Wrapper Killer"

::-----------------------------------------------------------------------------------
::Displayed Windows
::-----------------------------------------------------------------------------------

set wdomain="RealArcadeMainWindow"
set wdoad="Internet Explorer_Server"
set wdojs="Internet Explorer_TridentDlgFrame"
set wdowapp="Wrapper Application"

::-----------------------------------------------------------------------------------
::User Messages
::-----------------------------------------------------------------------------------

set msgcfg=Please wait while the RealArcade software is configured...

::-----------------------------------------------------------------------------------
::Commonly used folder paths
::-----------------------------------------------------------------------------------

set savepathad=%adr%
set savepathpd=%pd%

::-----------------------------------------------------------------------------------
::Set Windows OS Version
::-----------------------------------------------------------------------------------

:: Check Architecture Bits
set bits=x86
if not exist "C:\Program Files (x86)" set bits=x86
if exist "C:\Program Files (x86)" set bits=x64
if not exist "%windir%\SysWOW64" set bits=x86
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" set bits=x64

:: Check common OS versions
ver | find "5.1"
if %errorlevel%==0 set os=xp
ver | find "6.0"
if %errorlevel%==0 set os=vista
ver | find "6.1"
if %errorlevel%==0 set os=win7
ver | find "6.2"
if %errorlevel%==0 set os=win8
ver | find "6.3"
if %errorlevel%==0 set os=win81
ver | find "6.4"
if %errorlevel%==0 set os=win10

:: This is the new versioning for Windows 10 (Started sometime in 2015/2016)
ver | find "10."
if %errorlevel%==0 set os=win10
ver | find "10.0"
if %errorlevel%==0 set os=win10
ver | find "10.1"
if %errorlevel%==0 set os=win10
ver | find "10.2"
if %errorlevel%==0 set os=win10
ver | find "10.3"
if %errorlevel%==0 set os=win10
ver | find "10.4"
if %errorlevel%==0 set os=win10
ver | find "10.5"
if %errorlevel%==0 set os=win10
ver | find "10.6"
if %errorlevel%==0 set os=win10
ver | find "10.7"
if %errorlevel%==0 set os=win10
ver | find "10.8"
if %errorlevel%==0 set os=win10
ver | find "10.9"
if %errorlevel%==0 set os=win10

ver | find "Version 5.1" >nul
if errorlevel 0 set os=XP
if errorlevel 1 set os=VISTA

::-----------------------------------------------------------------------------------
::Setting Misc Flags
::-----------------------------------------------------------------------------------

:: Setting "rip" (Removal In Progress) flag to "1". Applies to RA Player Uninstall
::set rip=0

set getsize=cscript /nologo filesize.vbs


::-----------------------------------------------------------------------------------
:: PDF Fix (Applies to Strategy Guide installs) (0=Off) (1=On)
::-----------------------------------------------------------------------------------

set pdffix=0


::-----------------------------------------------------------------------------------
:: Setting a default for "activemodule". This is used for debugging only.
:: It references a file called "core_set_breakpoint.cmd".
::-----------------------------------------------------------------------------------

set activemodule=0


::-----------------------------------------------------------------------------------
:: Override Menu Stuff
::-----------------------------------------------------------------------------------

set advancedloadoptions=0


::-----------------------------------------------------------------------------------
:: Color Control Crap
::-----------------------------------------------------------------------------------

set black=cocolor 00
set blue=cocolor 01
set green=cocolor 02
set aqua=cocolor 03
set red=cocolor 04
set purple=cocolor 05
set yellow=cocolor 06
set white=cocolor 07
set gray=cocolor 08
set lblue=cocolor 09
set lgreen=cocolor 0A
set laqua=cocolor 0B
set lred=cocolor 0C
set lpurple=cocolor 0D
set lyellow=cocolor 0E
set lwhite=cocolor 0F


::-----------------------------------------------------------------------------------
:: Setting this flag so that skipping normal manual mode does not give an error
::-----------------------------------------------------------------------------------
set spoofed=0


::-----------------------------------------------------------------------------------
:: Swiss File Knife Operations (added 20120301)
:: 
::
:: "sfk find" errorlevels
::
:: 0 = Search String Not Found
:: 1 = Search String Found
:: 9 = File or Folder Not Found
::
:: Default commandline (Looks for Type 1 Demo)
:: sfk find -c "%wrapped%" CorExitProcess
::
::-----------------------------------------------------------------------------------

set isDemo1=sfk find -c "%wrapped%" CorExitProcess


::-----------------------------------------------------------------------------------
:: FireCMD Tools (command line ONLY from \bin - added 20131017)
::-----------------------------------------------------------------------------------

set inputGetDecimal=getdecimal.exe
set inputGetDir=getdir.exe
set inputGetInt=getint.exe
set inputGetPassword=getpassword.exe
set inputGetText=gettext.exe
set fcKill=fckill.exe
set inputOpenFile=openfile.exe
set inputGetPath=pathc.exe
set inputSaveFile=savefile.exe



::-----------------------------------------------------------------------------------
:: Set Advanced Load Options Defaults (added 20131018)
::-----------------------------------------------------------------------------------

set dtor=0
set newguid=0
set custom_ini=0
set custom_mods=0
set custom_cheats=0
set custom_patches=0


::-----------------------------------------------------------------------------------
:: Set local Wrapper Killer variables (added 20131019)
::-----------------------------------------------------------------------------------

::set rawkLaunch="C:\Program Files\unRealArcade\rawk.exe"
set rawkLaunch="C:\Program Files\unRealArcade\rawk.exe"
set rawkDump="C:\Program Files\unRealArcade\rawk\dump"
set rawkLaunchCLI="C:\Program Files\unRealArcade\rawk\dump\{app}\*"

:: BEGIN OLD NON-WORKING CRAP -------------------------------------------------------------------------------------------------------

::for %%a in (WMIC path win32_process get Caption,Processid,Commandline | find "RAWrapperKiller.exe") do set rawkInnoLaunchPathTemp=%%a
::WMIC path win32_process get Caption,Processid,Commandline | find "RAWrapperKiller.exe"


::setlocal enableextensions 
::for /f "tokens=*" %%a in ("wmic process list full | find "RAWrapperKiller.exe" | find "ExecutablePath"") do ( 
::set rawkInnoLaunchPathTemp=%%a 
::) 
::echo/%%rawkInnoLaunchPathTemp%%=%rawkInnoLaunchPathTemp% 
::endlocal 



::for /f "tokens=* USEBACKQ" %%z in (`wmic process list full | find "RAWrapperKiller.exe" | find "ExecutablePath" `) do (
::set rawkInnoLaunchPathTemp=%%z
::)

::for /f "delims=" %%a in ('wmic process list full') do @set rawkInnoLaunchPathTemp1=%%a

::echo %rawkInnoLaunchPathTemp1%
::pause


::for /f "delims=" %%a in ('echo "%rawkInnoLaunchPathTemp1%" | find "RAWrapperKiller.exe"') do @set rawkInnoLaunchPathTemp2=%%a
::echo %rawkInnoLaunchPathTemp2%
::pause


::for /f "delims=" %%a in ('echo "%rawkInnoLaunchPathTemp2%" | find "ExecutablePath"') do @set rawkInnoLaunchPathTemp3=%%a
::echo %rawkInnoLaunchPathTemp3%
::pause


::set rawkInnoLaunchPathTemp=%rawkInnoLaunchPathTemp3%

:: END OLD NON-WORKING CRAP -------------------------------------------------------------------------------------------------------




wmic process list full | find "RAWrapperKiller.exe" | findstr /v "CommandLine" | findstr /v "Description" | findstr /v "Name" > "%temp%\ura_find_rawk.tmp"

(
set /p rawkInnoLaunchPathTemp1=
)<"%temp%\ura_find_rawk.tmp"

set rawkInnoLaunchPathTemp2=%rawkInnoLaunchPathTemp1:~15%


echo %rawkInnoLaunchPathTemp2%
::pause

set rawkInnoLaunchPath="%rawkInnoLaunchPathTemp2%"

del /f /q "%temp%\ura_find_rawk.tmp"



:: Setting rauninstalled flag to "0", meaning the Wrapper Killer has not uninstalled the RealArcade Software
:: added 20131103
set rauninstalled=0


:: For invalid folder selected
set invalidFolder=0


:: External CMD Options
set runShellNoTerminateAndWait=cmd /k
set runShellNoTerminate=start cmd /k
set runShellWaitNoTerminate=start /wait cmd /k
set runShellTerminateAndWait=cmd /c
set runShellTerminate=start cmd /c
set runShellWaitTerminate=start /wait cmd /c

set runTerminate=start ""
set runWaitTerminate=start "" /wait


:: AM Instant Server
set amInstantServer="C:\Program Files\unRealArcade\temp\aminstantservice.exe"
set amInstantServerQuiet="C:\Program Files\unRealArcade\temp\aminstantservice.exe" --quiet
set amInstantServerConsole="C:\Program Files\unRealArcade\temp\aminstantservice.exe" --console
set amInstantServerServiceRun="C:\Program Files\unRealArcade\temp\aminstantservice.exe" --service-run
set amInstantServerWaitAmEnd="C:\Program Files\unRealArcade\temp\aminstantservice.exe" --wait-am-end
set amInstantServerAutoUpgrade="C:\Program Files\unRealArcade\temp\aminstantservice.exe" --autoupgrade
set amInstantServerUpgrade="C:\Program Files\unRealArcade\temp\aminstantservice.exe" --upgrade
set amInstantServerUpgradeQuiet="C:\Program Files\unRealArcade\temp\aminstantservice.exe" --upgrade --quiet
set amInstantServerBringToTop="C:\Program Files\unRealArcade\temp\aminstantservice.exe" --bring-to-top
set amInstantServerVersion="C:\Program Files\unRealArcade\temp\aminstantservice.exe" --version
set amInstantServerHelp="C:\Program Files\unRealArcade\temp\aminstantservice.exe" --help
set amInstantServerServiceInstall="C:\Program Files\unRealArcade\temp\aminstantservice.exe" --service-install
set amInstantServerServiceUninstall="C:\Program Files\unRealArcade\temp\aminstantservice.exe" --service-uninstall
set amInstantServerServiceInstallAndStart="C:\Program Files\unRealArcade\temp\aminstantservice.exe" --service-install-and-start
set amInstantServerUninstall="C:\Program Files\unRealArcade\temp\aminstantservice.exe" --uninstall

:: ActiveMark Paths
set amInstantAppPath=%pd%\activeMARK\instant\apps

:: Remote GameHouse Player
set amInstantRemotePlayer=http://games-dl.gamehouse.com/gamehouse/activemark/aminstantservice/GameHouse_GamePlayer.exe


:end
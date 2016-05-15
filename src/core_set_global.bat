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
::RA Player Folder
::-----------------------------------------------------------------------------------

set raroot=%programfiles%\Real\RealArcade
set catroot=%programfiles%\Real\RealArcade\catalog
set dbroot=%programfiles%\Real\RealArcade\db
set htmlroot=%programfiles%\Real\RealArcade\Html
set rashort=%programfiles%\Real\RealArcade\rawk_unwrapped
set raexec="%programfiles%\Real\RealArcade\RNArcade.exe"
set raexec2=RNArcade.exe
::set rauninst="%programfiles%\Real\RealArcade\Update\rnuninst.exe" "RealNetworks|RealArcade|1.2"
::set rauninst="%programfiles%\unRealArcade\rnuninst\rnuninst.exe" "RealNetworks|RealArcade|1.2"
set rauninst="%programfiles%\unRealArcade\rnuninst\dokill.lnk"
set rasetup="%programfiles%\Real\RealArcade\Setup\setup_rac.exe"

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

set uraRoot=%programfiles%\unRealArcade
set uraStubRoot=%programfiles%\unRealArcade\stubs
set rawkRoot=%programfiles%\unRealArcade\rawk

::-----------------------------------------------------------------------------------
::Portable RGS Loader Specific
::-----------------------------------------------------------------------------------

::C:\\PROGRA~1\\Real\\REALAR~2\\RNArcade.exe /m application/vnd.rn-rn_secured_installer %1
::C:\\PROGRA~1\\UNREAL~1\\LOADER\\RGSinst.exe /m application/vnd.rn-rn_secured_installer %1

set rgsinst= /m application/vnd.rn-rn_secured_installer
set rgsloader="%ProgramFiles%\unRealArcade\temp\loader.exe"
set rgsloader2="%ProgramFiles%\unRealArcade\temp\loader2.exe"
set rgsloader3="%ProgramFiles%\unRealArcade\temp\loader3.exe"
set rgsloader4="%ProgramFiles%\unRealArcade\temp\loader4.exe"
set rgsloader5="%ProgramFiles%\unRealArcade\temp\loader5.exe"
set rnaspoof="%ProgramFiles%\unRealArcade\temp\rnaspoof.exe"
::set rnaspoof=start "" /d "C:\Program Files\unRealArcade\temp" "rnaspoof.exe"
set rnamod="%ProgramFiles%\unRealArcade\temp\rnamod.exe"


::-----------------------------------------------------------------------------------
::RealArcade removal stuff
::-----------------------------------------------------------------------------------

set rauninstall=0


::-----------------------------------------------------------------------------------
::unRealArcade Downloader Specific (added 20130611) (Requires .NET 4.0)
::-----------------------------------------------------------------------------------

set launchwebdl=0

:: Link to loader with autolaunch
set webdlpath="%ProgramFiles%\unRealArcade\temp\uradl.exe"

:: Link to actual web downloader exe
set webdlpath_loader="%ProgramFiles%\unRealArcade\uradl\uradl.exe"


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

set savepathad=%appdata%
set savepathpd=%programdata%

::-----------------------------------------------------------------------------------
::Set Windows OS Version
::-----------------------------------------------------------------------------------

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
:: It references a file called "core_set_breakpoint.bat".
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

::set rawkLaunch="%ProgramFiles%\unRealArcade\rawk.exe"
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


:: AM Instant Server
set amInstantServer="%ProgramFiles%\unRealArcade\temp\aminstantservice.exe"
set amInstantServerQuiet="%ProgramFiles%\unRealArcade\temp\aminstantservice.exe" --quiet
set amInstantServerConsole="%ProgramFiles%\unRealArcade\temp\aminstantservice.exe" --console
set amInstantServerServiceRun="%ProgramFiles%\unRealArcade\temp\aminstantservice.exe" --service-run
set amInstantServerWaitAmEnd="%ProgramFiles%\unRealArcade\temp\aminstantservice.exe" --wait-am-end
set amInstantServerAutoUpgrade="%ProgramFiles%\unRealArcade\temp\aminstantservice.exe" --autoupgrade
set amInstantServerUpgrade="%ProgramFiles%\unRealArcade\temp\aminstantservice.exe" --upgrade
set amInstantServerUpgradeQuiet="%ProgramFiles%\unRealArcade\temp\aminstantservice.exe" --upgrade --quiet
set amInstantServerBringToTop="%ProgramFiles%\unRealArcade\temp\aminstantservice.exe" --bring-to-top
set amInstantServerVersion="%ProgramFiles%\unRealArcade\temp\aminstantservice.exe" --version
set amInstantServerHelp="%ProgramFiles%\unRealArcade\temp\aminstantservice.exe" --help
set amInstantServerServiceInstall="%ProgramFiles%\unRealArcade\temp\aminstantservice.exe" --service-install
set amInstantServerServiceUninstall="%ProgramFiles%\unRealArcade\temp\aminstantservice.exe" --service-uninstall
set amInstantServerServiceInstallAndStart="%ProgramFiles%\unRealArcade\temp\aminstantservice.exe" --service-install-and-start
set amInstantServerUninstall="%ProgramFiles%\unRealArcade\temp\aminstantservice.exe" --uninstall


:end
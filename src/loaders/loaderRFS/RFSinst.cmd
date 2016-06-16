@echo off
title (.-+'~^-+ AMI Game Loader +-^~`+-.)     [...cRypTiCwaRe 2o16...]


:reset
color 0e

mode con lines=26

set root=%~dp0
set rootClean=%ProgramData%\activeMARK

rd /s /q "%rootClean%\data"
rd /s /q "%rootClean%\dynamicdata"
rd /s /q "%rootClean%\instant"
rd /s /q "%rootClean%\licenses"
rd /s /q "%rootClean%\stats"
rd /s /q "%rootClean%\streaming"


set bits=32

if not exist "C:\Program Files (x86)" set bits=32
if exist "C:\Program Files (x86)" set bits=64
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" set bits=64


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


set uraRoot=C:\Program Files\unRealArcade
set uraToolsRoot=C:\Program Files\unRealArcade\tools
set uraServicesRoot=C:\Program Files\unRealArcade\services
set uraStubRoot=C:\Program Files\unRealArcade\stubs
set uraTempRoot=C:\Program Files\unRealArcade\temp
set rawkRoot=C:\Program Files\unRealArcade\rawk

:: Unix Utilities
set unix=C:\Program Files\unRealArcade\tools\unix-utils

set agrep="%unix%\agrep.exe"
set bunzip2="%unix%\bunzip2.exe"
set bzip2="%unix%\bzip2.exe"
set bzip2recover="%unix%\bzip2recover.exe"
set cat="%unix%\cat.exe"
set cmp="%unix%\cmp.exe"
set dd="%unix%\dd.exe"
set diff="%unix%\diff.exe"
set diff3="%unix%\diff3.exe"
set du="%unix%\du.exe"
set egrep="%unix%\egrep.exe"
set env="%unix%\env.exe"
set fgrep="%unix%\fgrep.exe"
set gawk="%unix%\gawk.exe"
set grep="%unix%\grep.exe"
set gunzip="%unix%\gunzip.exe"
set gzip="%unix%\gzip.exe"
set head="%unix%\head.exe"
set ls="%unix%\ls.exe"
set printenv="%unix%\printenv.exe"
set mkdir="%unix%\mkdir.exe"
set sdiff="%unix%\sdiff.exe"
set sed="%unix%\sed.exe"
set tail="%unix%\tail.exe"
::set unrar="%unix%\unrar.exe"
set uudecode="%unix%\uudecode.exe"
set uuencode="%unix%\uuencode.exe"
set zcat="%unix%\zcat.exe"
::set zip="%unix%\zip.exe"


::-----------------------------------------------------------------------------------
::Set Windows OS Version
::-----------------------------------------------------------------------------------

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


:: External CMD Options
set runShellNoTerminateAndWait=cmd /k
set runShellNoTerminate=start cmd /k
set runShellWaitNoTerminate=start /wait cmd /k
set runShellTerminateAndWait=cmd /c
set runShellTerminate=start cmd /c
set runShellWaitTerminate=start /wait cmd /c

set runTerminate=start ""
set runWaitTerminate=start "" /wait


:: AM Instant Server Local
set amInstantServer="%uraServicesRoot%\ami\aminstantservice.exe"
set amInstantServerQuiet="%uraServicesRoot%\ami\aminstantservice.exe" --quiet
set amInstantServerConsole="%uraServicesRoot%\ami\aminstantservice.exe" --console
set amInstantServerServiceRun="%uraServicesRoot%\ami\aminstantservice.exe" --service-run
set amInstantServerWaitAmEnd="%uraServicesRoot%\ami\aminstantservice.exe" --wait-am-end
set amInstantServerAutoUpgrade="%uraServicesRoot%\ami\aminstantservice.exe" --autoupgrade
set amInstantServerUpgrade="%uraServicesRoot%\ami\aminstantservice.exe" --upgrade
set amInstantServerUpgradeQuiet="%uraServicesRoot%\ami\aminstantservice.exe" --upgrade --quiet
set amInstantServerBringToTop="%uraServicesRoot%\ami\aminstantservice.exe" --bring-to-top
set amInstantServerVersion="%uraServicesRoot%\ami\aminstantservice.exe" --version
set amInstantServerHelp="%uraServicesRoot%\ami\aminstantservice.exe" --help
set amInstantServerServiceInstall="%uraServicesRoot%\ami\aminstantservice.exe" --service-install
set amInstantServerServiceUninstall="%uraServicesRoot%\ami\aminstantservice.exe" --service-uninstall
set amInstantServerServiceInstallAndStart="%uraServicesRoot%\ami\aminstantservice.exe" --service-install-and-start
set amInstantServerUninstall="%uraServicesRoot%\ami\aminstantservice.exe" --uninstall

:: AMI Paths Local
set amPath=%pd%\activeMARK
set amInstantPath=%pd%\activeMARK\instant
set amInstantAppPath=%pd%\activeMARK\instant\apps

:: AMI Game List Local
set amiGameList="C:\Program Files\unRealArcade\gamelist\am-instant.txt"

:: AMI Log Local
set amInstantLog="%amInstantPath%\aminstant.log"

:: Remote GameHouse Player
set amInstantRemotePlayer=http://games-dl.gamehouse.com/gamehouse/activemark/aminstantservice/GameHouse_GamePlayer.exe




set wait=%root%loader\wait.exe
set zip="%root%sevenZ.exe" a -y -r



set amiRequest="%temp%\ami-request.txt"

set amiRequestInstallationTitle="%temp%\amiRequestInstallationTitle.txt"
set amiRequestInstallationTitleClean1="%temp%\amiRequestInstallationTitleClean1.txt"
set amiRequestInstallationTitleClean2="%temp%\amiRequestInstallationTitleClean2.txt"
set amiRequestContentId="%temp%\amiRequestContentId.txt"
set amiRequestRFS="%temp%\amiRequestRFS.txt"
set amiRequestTracking="%temp%\amiRequestTracking.txt"
set amiRequestDeviceId="%temp%\amiRequestDeviceID.txt"
set amiRequestSessionID="%temp%\amiRequestSessionID.txt"

set gameNameNoDashesSet="%temp%\gameNameNoDashesSet.txt"
set gameNameUnderscoresSet="%temp%\gameNameUnderscores.txt"

set sessionID=0000-00-00-00-00-00-000-0000000000000
set deviceID=0000000000000000000000000000000000000000

set amiVersion=0.00.00
set serverStatus=0
set unavailable=0


:: Sets default returnTo variable for cases where you must use 2 gotos in sequence
set returnTo=loader

set cid=00000000000000000000000000000000

set appDirName=UNDEFINED

set jsonRfsUrl=0


set outFileTemp=-O "%temp%\ami-request.txt"
set outFileRFS=-O "%desktop%\am-rfs-downloads\%gameNameDashes%.rfs"


set amLog=%desktop%\amiSvc.log

set memberCookie=--header="Cookie: gamehouseuser=true"

set pageNewGames=http://www.gamehouse.com/new-games

set dumpPage=wget -d %memberCookie% -O %outFileTemp% %pageNewGames%


:: Set localhost port
::set port=27021
set port=12072


set reqDeviceID=http://localhost:%port%/v1/init.json?query_id=0000000000000
set reqDeviceIDHeader=/v1/init.json?query_id=0000000000000


:: This must be rebuilt each time the game is changed
set reqGet1=--header="/v1/install.json?result=success
set reqGet2=^&installation_title=%gameNameTitleHTML%
set reqGet3=^&content_id=%cid%
set reqGet4=^&rfs=http://games-dl.gamehouse.com/gamehouse/pc/%gameNameFirstLetter%/%gameNameDashes%/%gameNameDashes%.rfs HTTP/1.1"
set reqGet=%reqGet1%%reqGet2%%reqGet3%%reqGet4%


set reqHost=--header="Host: localhost:%port%"
::set reqUserAgent=--header="User-Agent: AmHttpClient v1.0"
set reqUserAgent=--header="User-Agent: AmHttpGet 1.0"
set reqAccept=--header="Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
set reqAcceptLanguage=--header="Accept-Language: en-US,en;q=0.5"
set reqAcceptEncoding=--header="Accept-Encoding: gzip, deflate"
set reqReferer=--header="Referer: http://www.gamehouse.com/member/"
set reqOrigin=--header="Origin: http://www.gamehouse.com"
set reqConnection=--header="Connection: keep-alive"

:: Single DOUBLE QUOTE here on purpose
set baseReq=wget -d %reqHost% %reqUserAgent% %reqAccept% %reqAcceptLanguage% %reqAcceptEncoding% %reqReferer% %reqOrigin% %reqConnection% %outFileTemp% "
set baseReqExtractRFS=wget -d %reqGet% %reqHost% %reqUserAgent% %reqAccept% %reqAcceptLanguage% %reqAcceptEncoding% %reqReferer% %reqOrigin% %reqConnection% %outFileTemp% "
set baseReqDownloadRFS=wget %outFileRFS% "%jsonRfsUrl%

:: Device ID Request
set reqGetDeviceId=wget -d %reqDeviceIDHeader% %reqHost% %reqUserAgent% %reqAccept% %reqAcceptLanguage% %reqAcceptEncoding% %reqReferer% %reqOrigin% %reqConnection% %outFileTemp% "

set launch1=http://localhost:%port%/v1/play.json?content_id=
set launch2=^&auth_token=0000000000000000000000000000000000000000"

set download1=http://www.gamehouse.com/member/api/games/downloaddetails.json?amcontentid=

set getSessionID=http://www.gamehouse.com/member/api/player/getsessionid.json

set remoteRfsBase=http://games-dl.gamehouse.com/gamehouse/pc

set remoteRfsBase1=127.0.0.1:%port%/v1/install.json?result=success^&installation_title=
set remoteRfsBase2=^&content_id=
set remoteRfsBase3=^&rfs=http://games-dl.gamehouse.com/gamehouse/pc


:: AMI Service Stuff
set serviceBin=aminstantservice.exe
set serviceArgs=--service-run
set serviceName=AMInstantService
set serviceDisplayName=activeMARK Instant Service
set serviceDescription=activeMARK Instant Service
set serviceStartupType=demand
set errorType=ignore

set serviceDescription=Enhances gaming experience from the web browsers

set servicePathLocal=%SystemDrive%\Program Files\unRealArcade\services\ami
set servicePathEmbedded=%root%loader
set servicePathRemote=0

set serviceCreate="%SystemRoot%\system32\sc.exe" create %serviceName% binPath= "\"%servicePathEmbedded%\%serviceBin%\" %serviceArgs%" displayname= "%serviceDisplayName%" start= %serviceStartupType%
set serviceCreateAddDescription="%SystemRoot%\system32\sc.exe" description %serviceName% "%serviceDescription%"

set serviceDelete="%SystemRoot%\system32\sc.exe" delete "%serviceName%"

set serviceStart=net start "%serviceName%"
set serviceStop=net stop "%serviceName%"

set serviceRegAdd=regedit /s "%root%loader\ami-launch-fix-%bits%.reg"
set serviceRegRemove=regedit /s "%root%loader\ami-launch-fix-remove.reg"
set serviceRegRemoveLicensing=regedit /s "%root%loader\ami-remove-licensing.reg"

set serviceQuery="%SystemRoot%\system32\sc.exe" queryex "%serviceName%"


:: Force Remove AMI Service Upon Exit
%serviceQuery%
if %errorlevel% equ 0 (
	%serviceStop%
	%serviceDelete%
	%serviceRegRemove%
	%serviceRegRemoveLicensing%
	)

%kill% aminstantservice.exe

set amiServiceInstalled=0
set amiServiceInstalledCheck=2


set remoteDownloadFinished=0
set gamesJsonFile="%amPath%\instant\games.json"
set remoteDownloadPartialCheck=type "%amPath%\instant\games.json" | findstr "gamepartiallypreloaded"
set remoteDownloadInstalledCheck=type "%amPath%\instant\games.json" | findstr "gameinstalled"


set readIni="%root%loader\inifile.exe"

set gameExec=0


goto loader




:loader

%lyellow%
cls
title (.-+'~^-+ AMI Game Loader +-^~`+-.)     [...cRypTiCwaRe 2o16...]

:: Copy Source Files To Local For Launch
xcopy /y /e /i /r "%root%dynamicdata" "%amPath%\dynamicdata"
xcopy /y /e /i /r "%root%instant\apps" "%amPath%\instant\apps"
xcopy /y /e /i /r "%root%licenses" "%amPath%\licenses"
::xcopy /y /e /i /r "%root%loader" "%amPath%\loader"
xcopy /y /e /i /r "%root%streaming" "%amPath%\streaming"

%wait% 1

:: Merge games.json With Local
echo.>>%amInstantPath%\games.json
type %root%instant\games.json>>"%amInstantPath%\games.json"



:: Get settings from INI
set tmpIniRead="%temp%\tmpIniRead.cmd"

%readIni% "%root%loader\settings.ini" [main] content_id > %tmpIniRead%
call %tmpIniRead%
set cid=%content_id%

%readIni% "%root%loader\settings.ini" [main] game_name_dashes > %tmpIniRead%
call %tmpIniRead%
set gameNameDashes=%game_name_dashes%

%readIni% "%root%loader\settings.ini" [main] game_name > %tmpIniRead%
call %tmpIniRead%
set gameNameTitle=%game_name%

%readIni% "%root%loader\settings.ini" [main] exe_launch > %tmpIniRead%
call %tmpIniRead%
set gameExec=%exe_launch%


%lyellow%
cls
echo Preparing To Launch %gameNameTitle%....
echo.
echo.

%wait% 2

:: Get session ID
title (.-+'~^-+ AMI Game Loader +-^~`+-.)     [...cRypTiCwaRe 2o16...]
cls
%baseReq%%getSessionID%
copy /y %amiRequest% %amiRequestSessionID%

set /p sessionID=<%amiRequestSessionID%


:: Request JSON Config File
:: Single DOUBLE QUOTE here on purpose
::%runShellWaitTerminate% %baseReq%%download1%%cid%"
%baseReq%%download1%%cid%"

:: Get "installation_title" Part 1
for /f "delims=: tokens=3" %%a in ('type %amiRequest%') do (
	echo %%a>%amiRequestInstallationTitle%
)

:: Get "installation_title" Part 2
for /f "delims=, tokens=1" %%a in ('type %amiRequestInstallationTitle%') do (
	set jsonInstallationTitle=%%a
)


:: Get "rfs" Part 1
for /f "delims=: tokens=6" %%a in ('type %amiRequest%') do (
	echo %%a>%amiRequestRFS%
)

:: Get "rfs" Part 2
for /f "delims=, tokens=1" %%a in ('type %amiRequestRFS%') do (
	echo %%a>%amiRequestRFS%
)

:: Get "rfs" Part 3 (set URL to RFS here)
for /f "delims=, tokens=*" %%a in ('type %amiRequestRFS%') do (
	echo %%a>%amiRequestRFS%
	set jsonRfsUrl=http:%%a
)

:: Get "rfs" Part 4 (set gameNameDashes here)
for /f "delims=/ tokens=5" %%a in ('type %amiRequestRFS%') do (
	set gameNameDashes=%%a
	set gameNameFirstLetterTemp=%gameNameDashes%
	set gameNameFirstLetter=%gameNameFirstLetterTemp:~0,1%
)


:: Get "tracking" Part 1
for /f "delims=: tokens=7" %%a in ('type %amiRequest%') do (
	echo %%a>%amiRequestTracking%
)

:: Get "tracking" Part 2
for /f "delims=, tokens=1" %%a in ('type %amiRequestTracking%') do (
	set jsonTracking=%%a
)


:: Request JSON Init File

:: Get Device ID (from init.json)
::%runShellWaitTerminate% %reqGetDeviceId%%reqDeviceID%"
%reqGetDeviceId%%reqDeviceID%"

:: Get "device_id" Part 1 (only write 4th line with device_id. kinda clunky!!)
setlocal enabledelayedexpansion
for /f "tokens=*" %%a in ('type %amiRequest%') do (
    set /a amiRequest=!amiRequest! + 1
    set var!amiRequest!=%%a
	if !amiRequest!==4 echo %%a>%amiRequestDeviceID%
)
endlocal

:: Get "device_id" Part 2
for /f "delims=: tokens=2" %%a in ('type %amiRequestDeviceId%') do (
	set jsonDeviceID=%%a
)



:: Cleanup Variables
title (.-+'~^-+ AMI Game Loader +-^~`+-.)     [...cRypTiCwaRe 2o16...]
%lyellow%
cls
echo Preparing To Launch %gameNameTitle%....
echo.
echo.
setlocal enabledelayedexpansion

set jsonInstallationTitle=!jsonInstallationTitle:"=!
echo !jsonInstallationTitle!>%amiRequestInstallationTitle%

set jsonInstallationTitleClean1=!jsonInstallationTitle:'=!
echo !jsonInstallationTitleClean1!>%amiRequestInstallationTitleClean1%

set jsonInstallationTitleClean2=!jsonInstallationTitleClean1: -=!
echo !jsonInstallationTitleClean2!>%amiRequestInstallationTitleClean2%

set jsonRfsUrl=!jsonRfsUrl:"=!
echo !jsonRfsUrl!>%jsonRfsUrl%

set jsonTracking=!jsonTracking:"=!
echo !jsonTracking!>%amiRequestTracking%

set jsonDeviceID=!jsonDeviceID:"=!
set jsonDeviceID=!jsonDeviceID: =!
set jsonDeviceID=!jsonDeviceID:,=!
echo !jsonDeviceID!>%amiRequestDeviceID%

set gameNameNoDashes=!gameNameDashes:-=!
echo !gameNameNoDashes!>%gameNameNoDashesSet%

set gameNameUnderscores=!gameNameDashes:-=_!
echo !gameNameUnderscores!>%gameNameUnderscoresSet%

endlocal


:: Set new variable without quotes
cls
set /p jsonContentId=<%amiRequestContentId%
set /p jsonInstallationTitle=<%amiRequestInstallationTitle%
set /p jsonInstallationTitleClean1=<%amiRequestInstallationTitleClean1%
set /p jsonInstallationTitleClean2=<%amiRequestInstallationTitleClean2%
set /p jsonRfsUrl=<%jsonRfsUrl%
set /p jsonTracking=<%amiRequestTracking%
set /p jsonDeviceID=<%amiRequestDeviceID%

set /p gameNameNoDashes=<%gameNameNoDashesSet%
set /p gameNameUnderscoresSet=<%gameNameUnderscoresSet%

:: Store Game Name Title Original Format
set gameNameTitle=%jsonInstallationTitle%


:: Match to global variables
set gameNameTitleHTML=%jsonInstallationTitle%
set gameNameTitleClean1=%jsonInstallationTitleClean1%
set gameNameTitleClean2=%jsonInstallationTitleClean2%
set deviceID=%jsonDeviceID%

:: Get first 16 chars for app directory name
set cidHalfTemp=%cid%
set cidHalf=%cidHalfTemp:~0,16%


:: Set first letter of game name for valid download link
set gameNameFirstLetterTemp=%gameNameDashes%
set gameNameFirstLetter=%gameNameFirstLetterTemp:~0,1%


:: Get first 16 chars for app directory name
set gameNameDashesHalfTemp=%gameNameDashes%
set gameNameDashesHalf=%gameNameDashesHalfTemp:~0,16%



:: Convert "SPACES" to "%20" before passing as string
setlocal enabledelayedexpansion
set space=%%20
set gameNameTitleHTML=%gameNameTitleHTML: =!space!%
echo %gameNameTitleHTML%>"%temp%\tmp.tmp"
endlocal

set /p gameNameTitleHTML=<"%temp%\tmp.tmp"


:: Directories with a single quote in them will make a directory like this: "game-s-directory" instead of "game's-directory"
:: Set new AM Directory Name
set appDirName=%gameNameDashesHalf%%cidHalf%


:: Rebuild Headers
title (.-+'~^-+ AMI Game Loader +-^~`+-.)     [...cRypTiCwaRe 2o16...]
%lyellow%
cls
echo Preparing To Launch %gameNameTitle%....
echo.
echo.
set reqGet1=--header="/v1/install.json?result=success
set reqGet2=^&installation_title=%gameNameTitleHTML%
set reqGet3=^&content_id=%cid%
set reqGet4=^&rfs=http://games-dl.gamehouse.com/gamehouse/pc/%gameNameFirstLetter%/%gameNameDashes%/%gameNameDashes%.rfs HTTP/1.1"

set reqGet=%reqGet1%%reqGet2%%reqGet3%%reqGet4%

set reqGetDeviceId=wget -d %reqDeviceIDHeader% %reqHost% %reqUserAgent% %reqAccept% %reqAcceptLanguage% %reqAcceptEncoding% %reqReferer% %reqOrigin% %reqConnection% %outFileTemp% "

set baseReqExtractRFS=wget -d %reqGet% %reqHost% %reqUserAgent% %reqAccept% %reqAcceptLanguage% %reqAcceptEncoding% %reqReferer% %reqOrigin% %reqConnection% %outFileTemp% "

if not exist "%desktop%\am-rfs-downloads" md "%desktop%\am-rfs-downloads"
set outFileRFS=-O "%desktop%\am-rfs-downloads\%gameNameDashes%.rfs"
set baseReqDownloadRFS=wget %outFileRFS% "%jsonRfsUrl%

%wait% 2


:: Launch
title (.-+'~^-+ AMI Game Loader +-^~`+-.)     [...cRypTiCwaRe 2o16...]
%lgreen%
cls
echo Launching %gameNameTitle%....
echo.
echo.
%serviceCreate%
%serviceCreateAddDescription%
%serviceRegAdd%
%serviceStart%

%runShellWaitTerminate% %baseReq%%launch1%%cid%%launch2%

:: Kill Server As Soon As Game Launches To Stop Time Tracking (20160615)
%serviceStop%
%serviceDelete%
%serviceRegRemove%
%serviceRegRemoveLicensing%
set amiServiceInstalled=0
set serverStatus=0


goto end




:end
cls
echo Cleaning Up Files....
echo.
%kill% aminstantservice.exe
%kill% aminstantservice.exe
%kill% aminstantservice.exe

del /f /q "%temp%\tmp.tmp"

del /f /q %amiRequest%
del /f /q %amiRequestInstallationTitle%
del /f /q %amiRequestInstallationTitleClean1%
del /f /q %amiRequestInstallationTitleClean2%
del /f /q %amiRequestContentId%
del /f /q %amiRequestRFS%
del /f /q %amiRequestTracking%
del /f /q %amiRequestDeviceId%

del /f /q %gameNameNoDashesSet%
del /f /q %gameNameUnderscoresSet%

del /f /q %amiRequestSessionID%
del /f /q "%temp%\ami-json-parse.txt"
del /f /q "%temp%\amiVersion.cmd"


:: Force Remove AMI Service Upon Exit
%serviceQuery%
if %errorlevel% equ 0 (
	%serviceStop%
	%serviceDelete%
	%serviceRegRemove%
	%serviceRegRemoveLicensing%
	)

title (.-+'~^-+ AMI Game Loader +-^~`+-.)     [...cRypTiCwaRe 2o16...]
%laqua%
cls
echo %gameNameTitle% Is Running....
echo.
echo.
echo Press any key to kill %gameExec%....
echo.
echo.
pause>nul

taskkill /f /im "%gameExec%"

goto end



:end

%wait% 5

rd /s /q "%rootClean%\data"
rd /s /q "%rootClean%\dynamicdata"
rd /s /q "%rootClean%\instant"
rd /s /q "%rootClean%\licenses"
rd /s /q "%rootClean%\stats"
rd /s /q "%rootClean%\streaming"


exit
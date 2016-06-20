@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ AM Instant Server +-^~`+-.)     [...cRypTiCwaRe 2o16...]


:reset
mode con lines=26

set testMode=0

:: Get environment from the wrapper killer
echo.>"%temp%\rawkEnv.cmd"
for /f "tokens=* delims= " %%a in ('type "%temp%\rawkEnvTemp.cmd"') do (
echo set %%a>>"%temp%\rawkEnv.cmd"
)
call "%temp%\rawkEnv.cmd"


set bits=32

if not exist "C:\Program Files (x86)" set bits=32
if exist "C:\Program Files (x86)" set bits=64
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" set bits=64

set zip="%sys32RawkPath%\sevenZ.exe" a -y -r

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
set returnTo=amiMenu

set cid=00000000000000000000000000000000

set gameNameDashes=game-name-here
set gameNameNoDashes=gamenamehere
set gameNameTitle=Game Name Here
set gameNameTitleHTML=Game Name Here
set gameNameTitleClean1=Game Name Here
set gameNameTitleClean2=Game Name Here
set gameNameFirstLetter=g

set appDirName=UNDEFINED

set jsonRfsUrl=0


set outFileTemp=-O "%temp%\ami-request.txt"
set outFileRFS=-O "%desktop%\am-rfs-downloads\%gameNameDashes%.rfs"


set amLog=%desktop%\amiSvc.log

set memberCookie=--header="Cookie: gamehouseuser=true"

set pageNewGames=http://www.gamehouse.com/new-games

set dumpPage=wget -d %memberCookie% -O %outFileTemp% %pageNewGames%

:: Builds app folder name by taking the first 16 chars from name and cid and combining them

:: gameNameDashes: jewel-quest-solitaire
:: cid: 3675cb0b1a06f37e8c45f0fd3eab3393

:: appDirName=jewel-quest-soli3675cb0b1a06f37e


:: Set localhost port
::set port=27021
set port=12072


set reqDeviceID=http://localhost:%port%/v1/init.json?query_id=0000000000000
set reqDeviceIDHeader=/v1/init.json?query_id=0000000000000


:: This must be rebuilt each time the game is changed
::set reqGet=0
::set reqGet=/v1/install.json?result=success^&installation_title=%gameNameTitleHTML%^&content_id=%cid%^&rfs=http://games-dl.gamehouse.com/gamehouse/pc/%gameNameFirstLetter%/%gameNameDashes%/%gameNameDashes%.rfs HTTP/1.1
set reqGet1=--header="/v1/install.json?result=success
set reqGet2=^&installation_title=%gameNameTitleHTML%
set reqGet3=^&content_id=%cid%
set reqGet4=^&rfs=http://games-dl.gamehouse.com/gamehouse/pc/%gameNameFirstLetter%/%gameNameDashes%/%gameNameDashes%.rfs HTTP/1.1"
set reqGet=%reqGet1%%reqGet2%%reqGet3%%reqGet4%


:: Get Games List (BROKEN AS OF 20160615)
::set reqGetListGames1=/v1/listGames.json?include_uninstalled=false
::set reqGetListGames2=^&query_id=1463457306950
::set reqGetListGames=%reqGetListGames1%^%reqGetListGames2%
::echo %reqGetListGames1%
::echo %reqGetListGames2%
::echo %reqGetListGames%
::pause


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

:: A few name fixes for updated RFS files (make better later!!!)
::if %jsonRfsUrl%==clearit set baseReqDownloadRFS=wget %outFileRFS% "clearit_v2

::set baseReqListGames=wget -d %reqGetListGames% %reqHost% %reqUserAgent% %reqAccept% %reqAcceptLanguage% %reqAcceptEncoding% %reqReferer% %reqOrigin% %reqConnection% %outFileTemp% "http://localhost:%port%%reqGetListGames%"


:: Device ID Request
set reqGetDeviceId=wget -d %reqDeviceIDHeader% %reqHost% %reqUserAgent% %reqAccept% %reqAcceptLanguage% %reqAcceptEncoding% %reqReferer% %reqOrigin% %reqConnection% %outFileTemp% "

set launch1=http://localhost:%port%/v1/play.json?content_id=
set launch2=^&auth_token=0000000000000000000000000000000000000000"

set download1=http://www.gamehouse.com/member/api/games/downloaddetails.json?amcontentid=

set getSessionID=http://www.gamehouse.com/member/api/player/getsessionid.json

:: http://games-dl.gamehouse.com/gamehouse/pc/h/hoyle-official-card-games-collection/hoyle-official-card-games-collection.rfs
set remoteRfsBase=http://games-dl.gamehouse.com/gamehouse/pc

set remoteRfsBase1=127.0.0.1:%port%/v1/install.json?result=success^&installation_title=
set remoteRfsBase2=^&content_id=
set remoteRfsBase3=^&rfs=http://games-dl.gamehouse.com/gamehouse/pc


:: Successful Download Request
:: http://localhost:%port%/v1/install.json?result=success&installation_title=Strike%20Solitaire&content_id=9f6a8eae6c2af6791074094b9bd8f181&rfs=http%3A%2F%2Fgames-dl.gamehouse.com%2Fgamehouse%2Fpc%2Fs%2Fstrike-solitaire%2Fstrike-solitaire.rfs

:: /v1/install.json?result=success&installation_title=Strike%20Solitaire&content_id=9f6a8eae6c2af6791074094b9bd8f181&rfs=http%3A%2F%2Fgames-dl.gamehouse.com%2Fgamehouse%2Fpc%2Fs%2Fstrike-solitaire%2Fstrike-solitaire.rfs HTTP/1.1
:: Host: localhost:%port%
:: User-Agent: AmHttpClient 1.0
:: Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
:: Accept-Language: en-US,en;q=0.5
:: Accept-Encoding: gzip, deflate
:: Referer: http://www.gamehouse.com/member/
:: Origin: http://www.gamehouse.com
:: Connection: keep-alive


:: AMI Service Stuff
set serviceBin=aminstantservice.exe
::set args=--console
set serviceArgs=--service-run
set serviceName=AMInstantService
set serviceDisplayName=activeMARK Instant Service
set serviceDescription=Enhances gaming experience from the web browsers
set serviceStartupType=demand
::set startupType=auto
set errorType=ignore


set servicePath=%SystemDrive%\Program Files\unRealArcade\services\ami

set serviceCreate="%SystemRoot%\system32\sc.exe" create %serviceName% binPath= "\"%servicePath%\%serviceBin%\" %serviceArgs%" displayname= "%serviceDisplayName%" start= %serviceStartupType%
set serviceCreateAddDescription="%SystemRoot%\system32\sc.exe" description %serviceName% "%serviceDescription%"

set serviceDelete="%SystemRoot%\system32\sc.exe" delete "%serviceName%"

set serviceStart=net start "%serviceName%"
set serviceStop=net stop "%serviceName%"

set serviceRegAdd=regedit /s "ami-launch-fix-%bits%.reg"
set serviceRegRemove=regedit /s "ami-launch-fix-remove.reg"
set serviceRegRemoveLicensing=regedit /s "ami-remove-licensing.reg"

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

set gamesDynamicDataPath="%amPath%\dynamicdata"

goto amiMenu



:amiMenu
set returnTo=amiMenu

:: New Menu with working options only (20160515)
cls
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ AM Instant Server +-^~`+-.)     [...cRypTiCwaRe 2o16...]
%laqua%
echo Content ID: %cid%
echo Name: %gameNameDashes%
echo Title: %gameNameTitle%
echo App Directory Name: %appDirName%
echo Device ID: %deviceID%
echo Session ID: %sessionID%
echo.
echo.
%lyellow%
echo Select an option from below
echo.
if %serverStatus%==0 (
	%lred%
	echo 1^) Toggle AM Micro Server
)

if %serverStatus%==1 (
	%lgreen%
	echo 1^) Toggle AM Micro Server
)
echo.
%lyellow%
echo 2) Get Game Info (MUST Provide Content ID)
echo 3) Show Extended Game Info
echo 4) Show Compatible Games List
echo.
echo 5) Download Game
echo 6) Launch Game
echo.
echo 7) More Options
echo.
echo X) Exit
echo.

if %os%==XP choice /c:1234567x /n
if %os%==VISTA choice /c 123456x /n
if errorlevel 8 goto forceExit
if errorlevel 7 goto amiMenu2
if errorlevel 6 goto launch
if errorlevel 5 goto menuGameSelect
if errorlevel 4 goto showGames
if errorlevel 3 goto extGame
if errorlevel 2 goto info
if errorlevel 1 goto toggleSvr

goto end


:amiMenu2
set returnTo=amiMenu2

cls
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ AM Instant Server +-^~`+-.)     [...cRypTiCwaRe 2o16...]
%laqua%
echo Content ID: %cid%
echo Name: %gameNameDashes%
echo Title: %gameNameTitle%
echo App Directory Name: %appDirName%
echo Device ID: %deviceID%
echo Session ID: %sessionID%
echo.
echo.
%lyellow%
echo Select an option from below
echo.
echo 1) Check Remote Version [%amiVersion%]
echo.
echo 2) Open Default Apps Directory
echo.
echo 3) Write INI File Using Game Info
echo 4) Rebuild GET Request
echo.
echo 5) Service Options
echo 6) Testing Options
echo 7) Watch AM Instant Log
echo.
echo.
echo B) Go Back
echo.

if %os%==XP choice /c:1234567b /n
if %os%==VISTA choice /c 123456b /n
if errorlevel 8 goto amiMenu
if errorlevel 7 goto watchLog
if errorlevel 6 goto testing
if errorlevel 5 goto svcOptions
::if errorlevel 5 goto newCreds
::if errorlevel 4 goto listGames
if errorlevel 4 set returnTo=amiMenu2&&goto rebuildReq
if errorlevel 3 goto writeIni
if errorlevel 2 goto openApps
if errorlevel 1 goto chkRemote

goto end



:testing

set returnto=amiMenu2

cls
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ AM Instant Server +-^~`+-.)     [...cRypTiCwaRe 2o16...]
%laqua%
echo Content ID: %cid%
echo Name: %gameNameDashes%
echo Title: %gameNameTitle%
echo App Directory Name: %appDirName%
echo Device ID: %deviceID%
echo Session ID: %sessionID%
echo.
echo.
%lred%
echo *** CAUTION! TEST MODE OPTIONS ***
%lyellow%
echo.
echo.
echo Select an option from below
echo.
echo.
echo 1) Download and Prepare For Packaging
echo.
echo 2) Clean Working activeMARK Directory
echo.
echo.
echo B) Go Back
echo.

if %os%==XP choice /c:12b /n
if %os%==VISTA choice /c 12b /n
if errorlevel 3 set testMode=0&&goto amiMenu2
if errorlevel 2 goto cleanAmFull
if errorlevel 1 goto test1

goto %returnto%


:test1

set returnto=test2

cls
echo Enter New CID and press ENTER (MUST BE VALID!!):
echo.
echo.
set /p cid=

%serviceStop%
%serviceDelete%
%serviceRegRemove%
%serviceRegRemoveLicensing%

%kill% aminstantservice.exe
%kill% aminstantservice.exe
%kill% aminstantservice.exe

%serviceCreate%
%serviceCreateAddDescription%
%serviceRegAdd%
%serviceStart%

%baseReq%%getSessionID%
copy /y %amiRequest% %amiRequestSessionID%
set /p sessionID=<%amiRequestSessionID%

%baseReq%%download1%%cid%"

for /f "delims=: tokens=3" %%a in ('type %amiRequest%') do (
	echo %%a>%amiRequestInstallationTitle%
)

for /f "delims=, tokens=1" %%a in ('type %amiRequestInstallationTitle%') do (
	set jsonInstallationTitle=%%a
)

for /f "delims=: tokens=4" %%a in ('type %amiRequest%') do (
	echo %%a>%amiRequestContentId%
)

for /f "delims=, tokens=1" %%a in ('type %amiRequestContentId%') do (
	echo %%a>%amiRequestContentId%
	set jsonContentId=%%a
)

for /f "delims=: tokens=6" %%a in ('type %amiRequest%') do (
	echo %%a>%amiRequestRFS%
)

for /f "delims=, tokens=1" %%a in ('type %amiRequestRFS%') do (
	echo %%a>%amiRequestRFS%
)

for /f "delims=, tokens=*" %%a in ('type %amiRequestRFS%') do (
	echo %%a>%amiRequestRFS%
	set jsonRfsUrl=http:%%a
)

for /f "delims=/ tokens=5" %%a in ('type %amiRequestRFS%') do (
	set gameNameDashes=%%a
	set gameNameFirstLetterTemp=%gameNameDashes%
	set gameNameFirstLetter=%gameNameFirstLetterTemp:~0,1%
)

for /f "delims=: tokens=7" %%a in ('type %amiRequest%') do (
	echo %%a>%amiRequestTracking%
)

for /f "delims=, tokens=1" %%a in ('type %amiRequestTracking%') do (
	set jsonTracking=%%a
)

%reqGetDeviceId%%reqDeviceID%"

setlocal enabledelayedexpansion
for /f "tokens=*" %%a in ('type %amiRequest%') do (
	set /a amiRequest=!amiRequest! + 1
	set var!amiRequest!=%%a
	if !amiRequest!==4 echo %%a>%amiRequestDeviceID%
)
endlocal

for /f "delims=: tokens=2" %%a in ('type %amiRequestDeviceId%') do (
	set jsonDeviceID=%%a
)

setlocal enabledelayedexpansion

set jsonContentId=!jsonContentId:"=!
echo !jsonContentId!>%amiRequestContentId%

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

set /p jsonContentId=<%amiRequestContentId%
set /p jsonInstallationTitle=<%amiRequestInstallationTitle%
set /p jsonInstallationTitleClean1=<%amiRequestInstallationTitleClean1%
set /p jsonInstallationTitleClean2=<%amiRequestInstallationTitleClean2%
set /p jsonRfsUrl=<%jsonRfsUrl%
set /p jsonTracking=<%amiRequestTracking%
set /p jsonDeviceID=<%amiRequestDeviceID%

set /p gameNameNoDashes=<%gameNameNoDashesSet%
set /p gameNameUnderscoresSet=<%gameNameUnderscoresSet%

set gameNameTitle=%jsonInstallationTitle%

set cid=%jsonContentId%
set gameNameTitleHTML=%jsonInstallationTitle%
set gameNameTitleClean1=%jsonInstallationTitleClean1%
set gameNameTitleClean2=%jsonInstallationTitleClean2%
set deviceID=%jsonDeviceID%

set cidHalfTemp=%cid%
set cidHalf=%cidHalfTemp:~0,16%

set gameNameFirstLetterTemp=%gameNameDashes%
set gameNameFirstLetter=%gameNameFirstLetterTemp:~0,1%

set gameNameDashesHalfTemp=%gameNameDashes%
set gameNameDashesHalf=%gameNameDashesHalfTemp:~0,16%

setlocal enabledelayedexpansion
set space=%%20
set gameNameTitleHTML=%gameNameTitleHTML: =!space!%
echo %gameNameTitleHTML%>"%temp%\tmp.tmp"
endlocal

set /p gameNameTitleHTML=<"%temp%\tmp.tmp"

set appDirName=%gameNameDashesHalf%%cidHalf%

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


:: Download Extracted RFS
%runShellWaitTerminate% %baseReqExtractRFS%%remoteRfsBase1%%gameNameTitleHTML%%remoteRfsBase2%%cid%%remoteRfsBase3%/%gameNameFirstLetter%/%gameNameDashes%/%gameNameDashes%.rfs"
goto inProgress

goto testing


:test2

set returnto=testing

:: Launch Game
%runShellWaitTerminate% %baseReq%%launch1%%cid%%launch2%
%serviceStop%
%serviceDelete%
%serviceRegRemove%
%serviceRegRemoveLicensing%
set amiServiceInstalled=0
set serverStatus=0

:: Prepare For Packaging
set root=%ProgramData%\activeMARK
del /f /s /q "%root%\instant\aminstant.log"
del /f /s /q "%root%\instant\connection.json"
del /f /s /q "%root%\instant\datagathering.json"
del /f /s /q "%root%\instant\games.json.lock"
del /f /s /q "%root%\instant\info.json"
del /f /s /q "%root%\instant\pending-requests.json"
del /f /s /q "%root%\streaming\access.lock"
attrib -h -s -r "%root%\data"

%wait% 3


set dyn="%root%\dynamicdata\%cid%.json"
for /f "delims=\ tokens=7" %%a in ('type %dyn%') do (
	echo %%a>"%temp%\t0ken.txt"
)

%wait% 3

set /p getEXE=<"%temp%\t0ken.txt"

setlocal enabledelayedexpansion

	set getEXETemp=!getEXE:",=!
	echo !getEXETemp!>"%temp%\t0ken.txt"

endlocal

set /p exe_launch_temp=<"%temp%\t0ken.txt"

%wait% 1

taskkill /f /im "%exe_launch_temp%"

set testMode=1

goto %returnTo%


:cleanAmFull

set returnto=testing

set root=%ProgramData%\activeMARK

rd /s /q "%root%\data"
rd /s /q "%root%\dynamicdata"
rd /s /q "%root%\instant"
rd /s /q "%root%\licenses"
rd /s /q "%root%\stats"
rd /s /q "%root%\streaming"


goto testing



:writeIni

set iniFileLoader=%temp%\settings-add.txt

echo.>%iniFileLoader%
echo loader_version=1.0>>%iniFileLoader%
echo ami_server_version=8.45.43.0>>%iniFileLoader%
echo ami_server_local=0>>%iniFileLoader%
echo ami_server_embedded=1>>%iniFileLoader%
echo ami_server_remote=0>>%iniFileLoader%
echo ami_server_local_path=C:\Program Files\unRealArcade\services\ami\aminstantservice.exe>>%iniFileLoader%
echo ami_server_embedded_path=loader\aminstantservice.exe>>%iniFileLoader%
echo ami_server_remote_path=http://nowhereyet.com>>%iniFileLoader%
echo content_id=%cid%>>%iniFileLoader%
echo game_name=%jsonInstallationTitleClean2%>>%iniFileLoader%
echo game_name_dashes=%gameNameDashes%>>%iniFileLoader%
echo game_path=C:\ProgramData\activeMARK\instant\apps\%gameNameDashesHalf%%cidHalf%\>>%iniFileLoader%
echo disk_size=>>%iniFileLoader%
echo exe_launch=>>%iniFileLoader%

%runShellWaitTerminate% "notepad.exe %iniFileLoader%"

goto amiMenu2


:showGames

%runTerminate% notepad.exe %amiGameList%

goto amiMenu



:menuGameSelect

if %cid%==00000000000000000000000000000000 (
cls
echo No Valid Content ID Has Been Set!
echo.
echo.
pause
goto %returnTo%
)

if %gameNameDashes%==game-name-here (
cls
echo No Valid Game Name Has Been Set!
echo.
echo.
pause
goto %returnTo%
)

if "%gameNameTitleHTML%"=="Game Name Here" (
cls
echo No Valid Game Title Has Been Set!
echo.
echo.
pause
goto %returnTo%
)


set returnTo=menuGameSelect

cls
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ AM Instant Server +-^~`+-.)     [...cRypTiCwaRe 2o16...]
%laqua%
echo Content ID: %cid%
echo Name: %gameNameDashes%
echo Title: %gameNameTitle%
echo App Directory Name: %appDirName%
echo Device ID: %deviceID%
echo Session ID: %sessionID%
echo.
echo.
%lyellow%
echo Select an option from below
echo.

:: Not Downloading
if %remoteDownloadFinished%==0 (
	%lyellow%
)

:: Completed
if %remoteDownloadFinished%==1 (
	%lgreen%
)

:: In Progress
if %remoteDownloadFinished%==2 (
	%laqua%
)

:: Failed
if %remoteDownloadFinished%==3 (
	%lred%
)

echo 1) Extract Remote RFS File
%lyellow%
echo.
echo 2) Download RFS File
echo.
echo 3) Multi Extract Remote RFS Files
echo.
echo 4) Multi Download RFS Files
echo.
echo.
echo B) Go Back
echo.

if %os%==XP choice /c:1234b /n
if %os%==VISTA choice /c 1234b /n
if errorlevel 5 goto amiMenu
::if errorlevel 4 goto downloadMulti2
if errorlevel 4 goto buildMenu
if errorlevel 3 goto downloadMulti
if errorlevel 2 goto download2
if errorlevel 1 goto download

goto %returnTo%


:rebuildReq

cls
echo Rebuilding Custom GET Requests Using New Game Info....
echo.
echo.


:: If null value then game is not available for AM Instant
if %cid%==null (

	set unavailable=1

	cls
	echo Game Not Available For AM Instant
	echo.
	echo.
	pause
	
	set cid=00000000000000000000000000000000

	set gameNameDashes=game-name-here
	set gameNameNoDashes=gamenamehere
	set gameNameTitle=Game Name Here
	set gameNameTitleHTML=Game Name Here
	set gameNameTitleClean1=Game Name Here
	set gameNameTitleClean2=Game Name Here
	set gameNameFirstLetter=g
	
	echo.>>%amLog%
	echo ------------------------------------------------------------------------------>>%amLog%
	echo %cidTest% Is Unavailable For AM Instant>>%amLog%
	echo ------------------------------------------------------------------------------>>%amLog%
	echo.>>%amLog%
	
	set returnTo=amiMenu
	goto %returnTo%
)


:: This part doesnt work and not needed??
::if %unavailable%==1 (
::	set unavailable=0
::	goto amiMenu
::)

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

:: A few name fixes for updated RFS files (make better later!!!)
::if %jsonRfsUrl%==clearit set baseReqDownloadRFS=wget %outFileRFS% "clearit_v2


:: Logging

::time>"%temp%\time.txt"
::for /f "delims=  tokens=1" %%a in ('type "%temp%\time.txt"') do (
::	set /p timeDisplay=%%a>"%temp%\time.txt"
::)
	
echo.>>%amLog%
echo ------------------------------------------------------------------------------>>%amLog%
::echo Created By The RealArcade Wrapper Killer v%rawkver% [%date% / %time%]>>%amLog%
::echo.>>%amLog%
echo %cid%>>%amLog%
echo %gameNameDashes%>>%amLog%
echo %gameNameTitleHTML%>>%amLog%
echo %appDirName%>>%amLog%
echo ------------------------------------------------------------------------------>>%amLog%
echo.>>%amLog%


goto %returnTo%



:newCreds

cls
echo Current CID: %cid%
echo Current Game Name: %gameNameDashes%
echo Current Game Title: %gameNameTitleHTML%
echo.
echo.
echo.
echo Enter New CID and press ENTER:
echo.
echo.
echo *** TO KEEP EXISTING VALUE, JUST PRESS ENTER ***
echo.
echo.

set /p cid=
set cidTest=%cid%


cls
echo Current CID: %cid%
echo Current Game Name: %gameNameDashes%
echo Current Game Title: %gameNameTitleHTML%
echo.
echo.
echo.
echo Enter New Game Name and press ENTER:
echo.
echo.
echo *** TO KEEP EXISTING VALUE, JUST PRESS ENTER ***
echo.
echo.

set /p gameNameDashes=

cls
echo Current CID: %cid%
echo Current Game Name: %gameNameDashes%
echo Current Game Title: %gameNameTitleHTML%
echo.
echo.
echo.
echo Enter New Game Title and press ENTER:
echo.
echo.
echo *** TO KEEP EXISTING VALUE, JUST PRESS ENTER ***
echo.
echo.

set /p gameNameTitleHTML=


::set returnTo=amiMenu

goto info

::goto amiMenu


:norm

if %serverStatus%==1 (
	cls
	echo AM Server Already Running!
	echo.
	echo.
	pause
	goto amiMenu
)

%runShellTerminate% %amInstantServer%
::%gohide% %amInstantServer%
set serverStatus=1

goto amiMenu


:toggleSvr

%serviceQuery%
if %errorlevel% equ 1060 (
	set amiServiceInstalled=0
	) else if %errorlevel% equ 0 (
	set amiServiceInstalled=1
	)

if %amiServiceInstalled%==0 (
	cls
	echo Cleaning Stale Instances....
	echo.
	%kill% aminstantservice.exe
	%kill% aminstantservice.exe
	%kill% aminstantservice.exe
	
	cls
	%serviceCreate%
	%serviceCreateAddDescription%
	%serviceRegAdd%
	%serviceStart%
	
	set serverStatus=1
	goto amiMenu
)

if %amiServiceInstalled%==1 (
	
	cls
	%serviceStop%
	%serviceDelete%
	%serviceRegRemove%
	%serviceRegRemoveLicensing%
	
	cls
	echo Cleaning Stale Instances....
	echo.
	%kill% aminstantservice.exe
	%kill% aminstantservice.exe
	%kill% aminstantservice.exe
	
	set serverStatus=0
	goto amiMenu
)

goto amiMenu


:session

%baseReq%%getSessionID%

%runShellWaitTerminate% "notepad.exe %temp%\ami-request.txt"

goto amiMenu


:device

%reqGetDeviceId%%reqDeviceID%

%runShellWaitTerminate% "notepad.exe %temp%\ami-request.txt"

goto amiMenu


:info

::set returnTo=info

if %serverStatus%==0 (
	cls
	echo AM Server Not Running!
	echo.
	echo.
	pause
	goto amiMenu
)


cls
echo Enter New Content ID and press ENTER:
echo.
echo.
echo Example: %cid%
echo.
echo.

set /p cid=
set cidTest=%cid%


if %cid%==00000000000000000000000000000000 (
cls
echo No Valid Content ID Has Been Set!
echo.
echo.
pause
goto amiMenu
)

:: If null value then game is not available for AM Instant
if %cid%==null (

	set unavailable=1

	cls
	echo Game Not Available For AM Instant
	echo.
	echo.
	pause
	
	set cid=00000000000000000000000000000000

	set gameNameDashes=game-name-here
	set gameNameNoDashes=gamenamehere
	set gameNameTitle=Game Name Here
	set gameNameTitleHTML=Game Name Here
	set gameNameTitleClean1=Game Name Here
	set gameNameTitleClean2=Game Name Here
	set gameNameFirstLetter=g
	
	echo.>>%amLog%
	echo ------------------------------------------------------------------------------>>%amLog%
	echo %cidTest% Is Unavailable For AM Instant>>%amLog%
	echo ------------------------------------------------------------------------------>>%amLog%
	echo.>>%amLog%
	
	set returnTo=amiMenu
	goto %returnTo%
)


:: Get session ID
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


:: Get "content_id" Part 1
for /f "delims=: tokens=4" %%a in ('type %amiRequest%') do (
	echo %%a>%amiRequestContentId%
)

:: Get "content_id" Part 2
for /f "delims=, tokens=1" %%a in ('type %amiRequestContentId%') do (
	echo %%a>%amiRequestContentId%
	set jsonContentId=%%a
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
setlocal enabledelayedexpansion

set jsonContentId=!jsonContentId:"=!
echo !jsonContentId!>%amiRequestContentId%

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
set cid=%jsonContentId%
::set cidTest=%jsonContentId%
set gameNameTitleHTML=%jsonInstallationTitle%
set gameNameTitleClean1=%jsonInstallationTitleClean1%
set gameNameTitleClean2=%jsonInstallationTitleClean2%
set deviceID=%jsonDeviceID%

::%runShellWaitTerminate% "notepad.exe %temp%\ami-request.txt"


goto rebuildReq


:launch

if %cid%==00000000000000000000000000000000 (
cls
echo No Valid Content ID Has Been Set!
echo.
echo.
pause
goto amiMenu
)

if %serverStatus%==0 (
	cls
	echo AM Server Not Running!
	echo.
	echo.
	pause
	goto amiMenu
)

%runShellWaitTerminate% %baseReq%%launch1%%cid%%launch2%
::set serverStatus=1

:: Kill Server As Soon As Game Launches To Stop Time Tracking (20160615)
%serviceStop%
%serviceDelete%
%serviceRegRemove%
%serviceRegRemoveLicensing%
set amiServiceInstalled=0
set serverStatus=0

goto amiMenu


:download

set remoteDownloadFinished=2

:: Single DOUBLE QUOTE here on purpose
::%runShellWaitTerminate% %baseReq%%remoteRfsBase%/%gameNameFirstLetter%/%gameNameDashes%/%gameNameDashes%.rfs"
%runShellWaitTerminate% %baseReqExtractRFS%%remoteRfsBase1%%gameNameTitleHTML%%remoteRfsBase2%%cid%%remoteRfsBase3%/%gameNameFirstLetter%/%gameNameDashes%/%gameNameDashes%.rfs"
::set serverStatus=1

cls
echo Checking For Download Path....
echo.
echo.
%wait% 7

if not exist %amInstantAppPath% (
cls
echo No Valid Download Path Has Been Detected!
echo.
echo This usually means there is a problem with one of the required variables.
echo.
echo.
echo jsonContentId: %jsonContentId%
echo gameNameDashes: %gameNameDashes%
echo jsonInstallationTitle: %jsonInstallationTitle%
echo.
echo sessionID: %sessionID%
echo deviceID: %deviceID%
echo.
echo amInstantAppPath: "%amInstantAppPath%"
echo.
echo.
pause
set remoteDownloadFinished=3
goto %returnTo%
)
set remoteDownloadFinished=1

::goto %returnTo%
goto inProgress


:download2

set remoteDownloadFinished=2

%runShellWaitTerminate% %baseReqDownloadRFS%

set remoteDownloadFinished=1


::goto %returnTo%
goto inProgress


:inProgress

cls
%laqua%
echo.
echo Downloading In Progress....
echo.
echo Please Be Patient! Some Files May Be Very Large!
echo.
echo.
set remoteDownloadFinished=0

%wait% 6

if not exist "%gamesDynamicDataPath%" (
	cls
	%laqua%
	echo Downloading In Progress....
	echo.
	echo Please Be Patient! Some Files May Be Very Large!
	echo.
	echo.
	set remoteDownloadFinished=2
	goto inProgress
)

if exist "%gamesDynamicDataPath%" (
	cls
	%lgreen%
	echo Downloading Finished!
	echo.
	echo.
	echo Press any key to return to the main menu....
	echo.
	echo.
	set remoteDownloadFinished=1
	if %testMode%==0 pause>nul
	goto %returnTo%
)

%wait% 1

goto inProgress


:downloadMulti

cls
echo Not Implemented Yet!
echo.
echo.
pause
::%runShellWaitTerminate% %baseReqDownloadRFS%


goto %returnTo%


:downloadMulti2

cls
echo Not Implemented Yet!
echo.
echo.
pause
::%runShellWaitTerminate% %baseReqDownloadRFS%


goto %returnTo%


:stop

if %serverStatus%==0 (
	cls
	echo AM Server Not Running!
	echo.
	echo.
	pause
	goto amiMenu
)

%kill% aminstantservice.exe
%kill% aminstantservice.exe
%kill% aminstantservice.exe
%kill% aminstantservice.exe
%kill% aminstantservice.exe

set serverStatus=0

goto amiMenu


:openApps

%runShellTerminate% explorer.exe "%amInstantAppPath%"

goto amiMenu2


:watchLog

%runShellTerminate% tail.exe -f %amInstantLog%

goto amiMenu2


:chkRemote

%runShellWaitTerminate% wget -O "%temp%\GameHouse_GamePlayer.exe" %amInstantRemotePlayer%
::filver32.exe "%temp%\GameHouse_GamePlayer.exe">"%temp%\amiVersion.txt"
::%runShellWaitTerminate% "notepad.exe "%temp%\amiVersion.txt"
filver32.exe "%temp%\GameHouse_GamePlayer.exe">"%temp%\amiVersion.cmd"
call "%temp%\amiVersion.cmd"
set amiVersion=%F$V%
::echo %F$V%
::pause

::http://games-dl.gamehouse.com/gamehouse/activemark/aminstantservice/versions.json

goto amiMenu2


:listGames

if %serverStatus%==0 (
	cls
	echo AM Server Not Running!
	echo.
	echo.
	pause
	goto amiMenu2
)

::%baseReqListGames%

::%runShellWaitTerminate% "notepad.exe %temp%\ami-request.txt"
::set serverStatus=1

goto amiMenu2



:extGame

if %serverStatus%==0 (
	cls
	echo AM Server Not Running!
	echo.
	echo.
	pause
	goto amiMenu
)

if %cid%==00000000000000000000000000000000 (
cls
echo No Valid Content ID Has Been Set!
echo.
echo.
pause
goto amiMenu
)

cls
%white%
::if %cid%==00000000000000000000000000000000 echo No Valid Game Selected! Use "Get Game Info" From Main Menu.
::if not %cid%==00000000000000000000000000000000 echo Extended Game Info
echo Extended Game Info
echo.
echo.
%laqua%
echo Content ID: %cid%
echo.
%lgreen%
echo Name (AMI RFS Format): %gameNameDashes%
echo Name (Web Page Format): %gameNameNoDashes%
echo Name (First Letter For AMI RFS Link): %gameNameFirstLetter%
echo.
echo Title Normal: %jsonInstallationTitle%
echo Title HTML: %gameNameTitleHTML%
echo Title Clean Lite: %jsonInstallationTitleClean1%
echo Title Clean Full: %jsonInstallationTitleClean2%
echo.
%lyellow%
echo Session ID: %sessionID%
echo Device ID: %deviceID%
echo.
%lpurple%
echo Directory:
echo "%amInstantAppPath%\%appDirName%"
echo.
echo.
%white%

pause

goto amiMenu



:buildMenu

setlocal enabledelayedexpansion

cls

set count=0

for /f %%x in ('type %amiGameList%') do (
    set /a count=count+1
    set choice[!count!]=%%x
    for %%y in (!count!) do set "choice[%%y]=!choice[%%y]:%cd%\=!"
    echo  %%y] !choice[%%x]!
)

for /l %%x in (1,1,!count!) do (
     echo  %%x] !choice[%%x]!
	 pause
)

set /p select=?

echo You chose !choice[%select%]!

pause

endlocal

goto %returnTo%


:svcOptions

cls
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ AM Instant Server +-^~`+-.)     [...cRypTiCwaRe 2o16...]
%laqua%
echo Content ID: %cid%
echo Name: %gameNameDashes%
echo Title: %gameNameTitle%
echo App Directory Name: %appDirName%
echo Device ID: %deviceID%
echo Session ID: %sessionID%
echo.
echo.
%lyellow%
echo Select an option from below
echo.

if %amiServiceInstalledCheck%==0 (
	%lred%
)

if %amiServiceInstalledCheck%==1 (
	%lgreen%
)
echo 1) Check For AMI Service
%lyellow%
echo.
echo 2) Create AMI Service
echo 3) Delete AMI Service (Stops First To Avoid Restart Issues)
echo.
echo 4) Start AMI Service
echo 5) Stop AMI Service
echo.
echo 6) Open Services Window
echo.
echo.
echo B) Go Back
echo.

if %os%==XP choice /c:123456b /n
if %os%==VISTA choice /c 123456b /n
if errorlevel 7 goto amiMenu2
if errorlevel 6 goto svcOpen
if errorlevel 5 goto svcStop
if errorlevel 4 goto svcStart
if errorlevel 3 goto svcDelete
if errorlevel 2 goto svcCreate
if errorlevel 1 goto svcQuery

goto svcOptions


:svcOpen

%runShellWaitTerminate% services.msc

goto svcOptions


:svcQuery
%serviceQuery%
if %errorlevel% equ 1060 (
	set amiServiceInstalled=0
	set amiServiceInstalledCheck=0
	) else if %errorlevel% neq 1060 (
	set amiServiceInstalled=1
	set amiServiceInstalledCheck=1
	)

goto svcOptions


:svcQueryAlt
%serviceQuery%
if %errorlevel% equ 1060 (
	set amiServiceInstalled=0
	set amiServiceInstalledCheck=0
	) else if %errorlevel% equ 0 (
	set amiServiceInstalled=1
	set amiServiceInstalledCheck=1
	)

goto svcOptions


:svcCreate
%serviceCreate%
%serviceCreateAddDescription%
%serviceRegAdd%
goto svcOptions

:svcDelete
%serviceStop%
%serviceDelete%
%serviceRegRemove%
%serviceRegRemoveLicensing%
goto svcOptions

:svcStart
%serviceStart%
goto svcOptions

:svcStop
%serviceStop%
goto svcOptions


:makeZip

::%zip% "%amPath%"

goto %returnTo%



:forceExit
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

del /f /q "%temp%\GameHouse_GamePlayer.exe"

:: Force Remove AMI Service Upon Exit
%serviceQuery%
if %errorlevel% equ 0 (
	%serviceStop%
	%serviceDelete%
	%serviceRegRemove%
	%serviceRegRemoveLicensing%
	)

goto end



:end

exit

:: OLD AMI MENU

::cls
::echo Select an option from below
::echo.
::echo.
::echo 1) Execute Normally (Must Close EXE Manually)
::echo 2) Execute Normally Quiet (--quiet)
::echo.
::echo.
::echo 3) Console Mode (--console)
::echo.
::echo 4) Service Run (--service-run)
::echo.
::echo 5) Wait AM End (--wait-am-end)
::echo.
::echo 6) Upgrade (--upgrade)
::echo.
::echo 7) Upgrade Quiet (--upgrade --quiet)
::echo.
::echo 8) Bring To Top (--bring-to-top)
::echo.
::echo 9) Version (--version)
::echo.
::echo A) Help (--help)
::echo.
::echo.

::if %os%==XP choice /c:123456789 /n
::if %os%==VISTA choice /c 123456789 /n
::if errorlevel 9 goto version
::if errorlevel 8 goto btt
::if errorlevel 7 goto upgradeq
::if errorlevel 6 goto upgrade
::if errorlevel 5 goto wae
::if errorlevel 4 goto svcrun
::if errorlevel 3 goto console
::if errorlevel 2 goto quiet
::if errorlevel 1 goto norm
@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ AM Instant Server +-^~`+-.)     [...cRypTiCwaRe 2o16...]


:reset

%kill% aminstantservice.exe

set amiRequest="%temp%\ami-request.txt"
set amiRequestSessionID="%temp%\amiSessionID.txt"

set sessionID=0

set amiVersion=0.00.00

set serverStatus=0

:: Sets default returnTo variable for cases where you must use 2 gotos in sequence
set returnTo=amiMenu

set cid=00000000000000000000000000000000

set gameNameDashes=game-name-here
set gameNameTitle=Game Name Here
set gameNameFirstLetter=g

set appDirName=UNDEFINED

set jsonRfsUrl=0


set outFileTemp=-O "%temp%\ami-request.txt"


set amLog=%desktop%\amiSvc.log

set memberCookie=--header="Cookie: gamehouseuser=true"

set pageNewGames=http://www.gamehouse.com/new-games
set pageNewGames=http://www.gamehouse.com/new-games

set dumpPage=wget -d %memberCookie% -O %outFileTemp% %pageNewGames%

:: Builds app folder name by taking the first 16 chars from name and cid and combining them

:: gameNameDashes: jewel-quest-solitaire
:: cid: 3675cb0b1a06f37e8c45f0fd3eab3393

:: appDirName=jewel-quest-soli3675cb0b1a06f37e


:amiMenu

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



:: New Menu with working options only (20160515)


:: This must be rebuilt each time the game is changed
::set reqGet=0
::set reqGet=/v1/install.json?result=success^&installation_title=%gameNameTitle%^&content_id=%cid%^&rfs=http://games-dl.gamehouse.com/gamehouse/pc/%gameNameFirstLetter%/%gameNameDashes%/%gameNameDashes%.rfs HTTP/1.1
set reqGet1=--header="/v1/install.json?result=success
set reqGet2=^&installation_title=%gameNameTitle%
set reqGet3=^&content_id=%cid%
set reqGet4=^&rfs=http://games-dl.gamehouse.com/gamehouse/pc/%gameNameFirstLetter%/%gameNameDashes%/%gameNameDashes%.rfs HTTP/1.1"
set reqGet=%reqGet1%%reqGet2%%reqGet3%%reqGet4%

set reqGetListGames1=/v1/listGames.json?include_uninstalled=false
set reqGetListGames2=^&query_id=1463457306950
set reqGetListGames=%reqGetListGames1%%reqGetListGames2%

set reqHost=--header="Host: localhost:12072"
set reqUserAgent=--header="User-Agent: AmHttpClient 1.0"
set reqAccept=--header="Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
set reqAcceptLanguage=--header="Accept-Language: en-US,en;q=0.5"
set reqAcceptEncoding=--header="Accept-Encoding: gzip, deflate"
set reqReferer=--header="Referer: http://www.gamehouse.com/member/"
set reqOrigin=--header="Origin: http://www.gamehouse.com"
set reqConnection=--header="Connection: keep-alive"

:: Single DOUBLE QUOTE here on purpose
set baseReq=wget -d %reqHost% %reqUserAgent% %reqAccept% %reqAcceptLanguage% %reqAcceptEncoding% %reqReferer% %reqOrigin% %reqConnection% %outFileTemp% "
set baseReqExtractRFS=wget -d %reqGet% %reqHost% %reqUserAgent% %reqAccept% %reqAcceptLanguage% %reqAcceptEncoding% %reqReferer% %reqOrigin% %reqConnection% %outFileTemp% "
set baseReqListGames=wget -d %reqGetListGames% %reqHost% %reqUserAgent% %reqAccept% %reqAcceptLanguage% %reqAcceptEncoding% %reqReferer% %reqOrigin% %reqConnection% %outFileTemp% "http://localhost:12072%reqGetListGames%"

set launch1=http://localhost:12072/v1/play.json?content_id=
set launch2=^&auth_token=0000000000000000000000000000000000000000"

set download1=http://www.gamehouse.com/member/api/games/downloaddetails.json?amcontentid=

set getSessionID=http://www.gamehouse.com/member/api/player/getsessionid.json

:: http://games-dl.gamehouse.com/gamehouse/pc/h/hoyle-official-card-games-collection/hoyle-official-card-games-collection.rfs
set remoteRfsBase=http://games-dl.gamehouse.com/gamehouse/pc

set remoteRfsBase1=127.0.0.1:12072/v1/install.json?result=success^&installation_title=
set remoteRfsBase2=^&content_id=
set remoteRfsBase3=^&rfs=http://games-dl.gamehouse.com/gamehouse/pc


:: Successful Download Request
:: http://localhost:12072/v1/install.json?result=success&installation_title=Strike%20Solitaire&content_id=9f6a8eae6c2af6791074094b9bd8f181&rfs=http%3A%2F%2Fgames-dl.gamehouse.com%2Fgamehouse%2Fpc%2Fs%2Fstrike-solitaire%2Fstrike-solitaire.rfs

:: /v1/install.json?result=success&installation_title=Strike%20Solitaire&content_id=9f6a8eae6c2af6791074094b9bd8f181&rfs=http%3A%2F%2Fgames-dl.gamehouse.com%2Fgamehouse%2Fpc%2Fs%2Fstrike-solitaire%2Fstrike-solitaire.rfs HTTP/1.1
:: Host: localhost:12072
:: User-Agent: AmHttpClient 1.0
:: Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
:: Accept-Language: en-US,en;q=0.5
:: Accept-Encoding: gzip, deflate
:: Referer: http://www.gamehouse.com/member/
:: Origin: http://www.gamehouse.com
:: Connection: keep-alive


cls
%laqua%
echo Content ID: %cid%
echo Game Name: %gameNameDashes%
echo Game Title: %gameNameTitle%
echo App Directory Name: %appDirName%
echo Session ID: %sessionID%
echo.
echo.
%lyellow%
echo Select an option from below
echo.
%lgreen%
echo 1) Start AM Micro Server
%lred%
echo 2) Stop AM Micro Server
echo.
%lyellow%
echo 3) Get Game Info
echo 4) Download Game (Remote RFS Extract)
echo 5) Launch Game
echo.
echo 6) More Options
echo.
echo C) Enter New Game Credentials
echo.
echo X) Exit
echo.

if %os%==XP choice /c:123456cx /n
if %os%==VISTA choice /c 123456cx /n
if errorlevel 8 goto forceExit
if errorlevel 7 goto newCreds
if errorlevel 6 goto amiMenu2
if errorlevel 5 goto launch
if errorlevel 4 goto download
if errorlevel 3 goto info
if errorlevel 2 goto stop
if errorlevel 1 goto console

goto end


:amiMenu2

cls
%laqua%
echo Current CID: %cid%
echo Current Game Name: %gameNameDashes%
echo Current Game Title: %gameNameTitle%
echo Current App Directory Name: %appDirName%
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
echo 3) Rebuild GET Request
echo.
echo 4) List Installed Games
::echo.
::echo 5) 
::echo.
::echo 6) 
echo.
echo.
echo B) Go Back
echo.
echo X) Exit
echo.

if %os%==XP choice /c:123456bx /n
if %os%==VISTA choice /c 123456bx /n
if errorlevel 8 goto forceExit
if errorlevel 7 goto amiMenu
if errorlevel 6 goto amiMenu2
if errorlevel 5 goto amiMenu2
if errorlevel 4 goto listGames
if errorlevel 3 set returnTo=amiMenu2&&goto rebuildReq
if errorlevel 2 goto openApps
if errorlevel 1 goto chkRemote

goto end


:rebuildReq

cls
echo Rebuilding Custom GET Requests Using New Game Info....

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
set gameNameTitle=%gameNameTitle: =!space!%
echo %gameNameTitle%>"%temp%\tmp.tmp"
endlocal

set /p gameNameTitle=<"%temp%\tmp.tmp"


:: Set new AM Directory Name
set appDirName=%gameNameDashesHalf%%cidHalf%


:: Rebuild Headers
set reqGet1=--header="/v1/install.json?result=success
set reqGet2=^&installation_title=%gameNameTitle%
set reqGet3=^&content_id=%cid%
set reqGet4=^&rfs=http://games-dl.gamehouse.com/gamehouse/pc/%gameNameFirstLetter%/%gameNameDashes%/%gameNameDashes%.rfs HTTP/1.1"

set reqGet=%reqGet1%%reqGet2%%reqGet3%%reqGet4%

set baseReqExtractRFS=wget -d %reqGet% %reqHost% %reqUserAgent% %reqAccept% %reqAcceptLanguage% %reqAcceptEncoding% %reqReferer% %reqOrigin% %reqConnection% %outFileTemp% "

::echo.
::echo.
::echo.
::echo reqGet: %reqGet%
::echo.
::echo.
::echo.
::echo baseReq: %baseReq%
::echo.
::echo.
::echo.
::echo baseReqExtractRFS: %baseReqExtractRFS%
::pause


:: Logging
echo.>>%amLog%
echo ---------------------------------------------------------------->>%amLog%
echo Created By The RealArcade Wrapper Killer v%rawkver% [%date%]>>%amLog%
echo.>>%amLog%
echo %cid%>>%amLog%
echo %gameNameDashes%>>%amLog%
echo %gameNameTitle%>>%amLog%
echo %appDirName%>>%amLog%
echo ---------------------------------------------------------------->>%amLog%
echo.>>%amLog%


goto %returnTo%



:newCreds

cls
echo Current CID: %cid%
echo Current Game Name: %gameNameDashes%
echo Current Game Title: %gameNameTitle%
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


cls
echo Current CID: %cid%
echo Current Game Name: %gameNameDashes%
echo Current Game Title: %gameNameTitle%
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
echo Current Game Title: %gameNameTitle%
echo.
echo.
echo.
echo Enter New Game Title and press ENTER:
echo.
echo.
echo *** TO KEEP EXISTING VALUE, JUST PRESS ENTER ***
echo.
echo.

set /p gameNameTitle=


set returnTo=amiMenu

goto rebuildReq

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


:console

if %serverStatus%==1 (
	cls
	echo AM Server Already Running!
	echo.
	echo.
	pause
	goto amiMenu
)

%runTerminate% %amInstantServerConsole%
::%gohide% %amInstantServerConsole%
set serverStatus=1

goto amiMenu


:session

%baseReq%%getSessionID%

%runShellWaitTerminate% "notepad.exe %temp%\ami-request.txt"

goto amiMenu


:info

if %cid%==00000000000000000000000000000000 (
cls
echo No Valid Content ID Has Been Set!
echo.
echo.
echo Enter New CID and press ENTER:
echo.
echo.

set /p cid=
)

:: If no CID was still set, then return to menu
if %cid%==00000000000000000000000000000000 (
cls
echo No Valid Content ID Has Been Set!
echo.
echo.
pause
goto amiMenu
)


:: Get session ID
%baseReq%%getSessionID%
copy /y %amiRequest% %amiRequestSessionID%

set /p sessionID=<%amiRequestSessionID%


:: Request JSON Config File
:: Single DOUBLE QUOTE here on purpose
%runShellWaitTerminate% %baseReq%%download1%%cid%"
::set serverStatus=1

set amiRequestTemp1="%temp%\ami-json-parse1.txt"
set amiRequestTemp2="%temp%\ami-json-parse2.txt"
set amiRequestTemp3="%temp%\ami-json-parse3.txt"
set amiRequestTemp3a="%temp%\ami-json-parse3a.txt"
set amiRequestTemp3b="%temp%\ami-json-parse3b.txt"
set amiRequestTemp4="%temp%\ami-json-parse4.txt"
set amiRequestTempFinal1="%temp%\ami-json-parse-final1.txt"
set amiRequestTempFinal2="%temp%\ami-json-parse-final2.txt"
set amiRequestTempFinal3="%temp%\ami-json-parse-final3.txt"

:: Get "installation_title" Part 1
for /f "delims=: tokens=3" %%a in ('type %amiRequest%') do (
	echo %%a>%amiRequestTemp1%
)

:: Get "installation_title" Part 2
for /f "delims=, tokens=1" %%a in ('type %amiRequestTemp1%') do (
	set jsonInstallationTitle=%%a
)

:: Get "content_id" Part 1
for /f "delims=: tokens=4" %%a in ('type %amiRequest%') do (
	echo %%a>%amiRequestTemp2%
)

:: Get "content_id" Part 2
for /f "delims=, tokens=1" %%a in ('type %amiRequestTemp2%') do (
	set jsonContentId=%%a
)


:: Get "rfs" Part 1
for /f "delims=: tokens=6" %%a in ('type %amiRequest%') do (
	echo %%a>%amiRequestTemp3%
)

:: Get "rfs" Part 2
for /f "delims=, tokens=1" %%a in ('type %amiRequestTemp3%') do (
	echo %%a>%amiRequestTemp3a%
)

:: Get "rfs" Part 3 (set URL to RFS here)
for /f "delims=, tokens=*" %%a in ('type %amiRequestTemp3a%') do (
	echo %%a>%amiRequestTemp3b%
	set jsonRfsUrl=http:%%a
)

:: Get "rfs" Part 4 (set gameNameDashes here)
for /f "delims=/ tokens=5" %%a in ('type %amiRequestTemp3b%') do (
	set gameNameDashes=%%a
	set gameNameFirstLetterTemp=%gameNameDashes%
	set gameNameFirstLetter=%gameNameFirstLetterTemp:~0,1%
)


:: Get "tracking" Part 1
for /f "delims=: tokens=7" %%a in ('type %amiRequest%') do (
	echo %%a>%amiRequestTemp4%
)

:: Get "tracking" Part 2
for /f "delims=, tokens=1" %%a in ('type %amiRequestTemp4%') do (
	set jsonTracking=%%a
)


:: Cleanup Variables
setlocal enabledelayedexpansion

set jsonContentId=!jsonContentId:"=!
echo !jsonContentId!>%amiRequestTempFinal1%

set jsonInstallationTitle=!jsonInstallationTitle:"=!
echo !jsonInstallationTitle!>%amiRequestTempFinal2%

set jsonTracking=!jsonTracking:"=!
echo !jsonTracking!>%amiRequestTempFinal3%

endlocal


:: Set new variable without quotes
set /p jsonContentId=<%amiRequestTempFinal1%
set /p jsonInstallationTitle=<%amiRequestTempFinal2%
set /p jsonTracking=<%amiRequestTempFinal3%


:: Match to global variables
set cid=%jsonContentId%
set gameNameTitle=%jsonInstallationTitle%


::echo jsonContentId: %jsonContentId%
::echo gameNameDashes: %gameNameDashes%
::echo jsonInstallationTitle: %jsonInstallationTitle%
::echo jsonRfsUrl: %jsonRfsUrl%
::echo jsonTracking: %jsonTracking%
::pause

::%runShellWaitTerminate% "notepad.exe %temp%\ami-request.txt"

set returnTo=amiMenu

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

%runShellWaitTerminate% %baseReq%%launch1%%cid%%launch2%
::set serverStatus=1

goto amiMenu


:download

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

if %gameNameDashes%==game-name-here (
cls
echo No Valid Game Name Has Been Set!
echo.
echo.
pause
goto amiMenu
)

if "%gameNameTitle%"=="Game Name Here" (
cls
echo No Valid Game Title Has Been Set!
echo.
echo.
pause
goto amiMenu
)

:: Single DOUBLE QUOTE here on purpose
::%runShellWaitTerminate% %baseReq%%remoteRfsBase%/%gameNameFirstLetter%/%gameNameDashes%/%gameNameDashes%.rfs"
%runShellWaitTerminate% %baseReqExtractRFS%%remoteRfsBase1%%gameNameTitle%%remoteRfsBase2%%cid%%remoteRfsBase3%/%gameNameFirstLetter%/%gameNameDashes%/%gameNameDashes%.rfs"
::set serverStatus=1

goto amiMenu


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


:chkRemote

%runShellWaitTerminate% wget -O "%temp%\GameHouse_GamePlayer.exe" %amInstantRemotePlayer%
::filver32.exe "%temp%\GameHouse_GamePlayer.exe">"%temp%\amiVersion.txt"
::%runShellWaitTerminate% "notepad.exe "%temp%\amiVersion.txt"
filver32.exe "%temp%\GameHouse_GamePlayer.exe">"%temp%\amiVersion.cmd"
call "%temp%\amiVersion.cmd"
set amiVersion=%F$V%
::echo %F$V%
::pause

goto amiMenu2


:listGames

%baseReqListGames%

%runShellWaitTerminate% "notepad.exe %temp%\ami-request.txt"
::set serverStatus=1

goto amiMenu2


:forceExit

%kill% aminstantservice.exe
%kill% aminstantservice.exe

del /f /q "%temp%\tmp.tmp"

del /f /q %amiRequest%
del /f /q %amiRequestTemp1%
del /f /q %amiRequestTemp2%
del /f /q %amiRequestTemp3%
del /f /q %amiRequestTemp3a%
del /f /q %amiRequestTemp3b%
del /f /q %amiRequestTemp4%
del /f /q %amiRequestTempFinal1%
del /f /q %amiRequestTempFinal2%
del /f /q %amiRequestTempFinal3%

exit

goto end



:end
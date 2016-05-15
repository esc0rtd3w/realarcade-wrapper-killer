@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ AM Instant Server +-^~`+-.)     [...cRypTiCwaRe 2o16...]


:reset

%kill% aminstantservice.exe

set cid=0000000000000000000000000000000000000000


:amiMenu

::cls
::echo Select an option from below
::echo.
::echo.
::echo 1) Execute Normally (Must Close EXE Manually)
::echo.
::echo 2) Execute Normally Quiet (--quiet)
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

set baseReq=wget -S --user-agent="AmHttpGet 1.0" --header="Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" --header="Accept-Language: en-US,en;q=0.5" --header="Accept-Encoding: gzip, deflate" --header="Referer: http://www.gamehouse.com/member/" --header="Connection: keep-alive" -O "%temp%\ami-request.txt" "
set launch1=http://localhost:12072/v1/play.json?content_id=
set launch2=&auth_token=0000000000000000000000000000000000000000"

set download1=http://www.gamehouse.com/member/api/games/downloaddetails.json?amcontentid=

cls
echo Current CID: %cid%
echo.
echo Select an option from below
echo.
echo.
echo 1) Execute Normally (Must Close EXE Manually)
echo.
echo 2) Execute In Console Mode (--console)
echo.
echo 3) Get Game Info
echo.
echo 4) Trigger Game Download
echo.
echo 5) Launch Game
echo.
echo 6) Reset Game Timer
echo.
echo.
echo C) Enter Content ID To Use
echo.
echo B) Go Back To Previous Menu
echo.
echo X) Exit
echo.

if %os%==XP choice /c:123456cbx /n
if %os%==VISTA choice /c 123456cbx /n
if errorlevel 8 exit
if errorlevel 8 goto end
if errorlevel 7 goto cidNew
if errorlevel 6 goto timer
if errorlevel 5 goto launch
if errorlevel 4 goto download
if errorlevel 3 goto info
if errorlevel 2 goto console
if errorlevel 1 goto norm


:cidNew


cls
echo Enter New CID and press ENTER:
echo.
echo.

set /p cid=

goto amiMenu


:norm

%runShellTerminate% %amInstantServer%

::%kill% aminstantservice.exe

goto amiMenu


:console

%runShellTerminate% %amInstantServerConsole%

::%kill% aminstantservice.exe

goto amiMenu


:info

::%kill% aminstantservice.exe

goto amiMenu


:download

%runShellWaitTerminate% %baseReq%%download1%%cid%

::%kill% aminstantservice.exe

goto amiMenu


:launch

%runShellWaitTerminate% %baseReq%%launch1%%cid%%launch2%

::%kill% aminstantservice.exe

goto amiMenu


:timer

::%kill% aminstantservice.exe

goto amiMenu



:end
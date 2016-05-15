@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ AM Instant Server +-^~`+-.)     [...cRypTiCwaRe 2o16...]


:reset



:amiMenu

cls
echo Select an option from below
echo.
echo.
echo 1) Execute Normally (Must Close EXE Manually)
echo.
echo 2) Execute Normally Quiet (--quiet)
echo.
echo 3) Console Mode (--console)
echo.
echo 4) Service Run (--service-run)
echo.
echo 5) Wait AM End (--wait-am-end)
echo.
echo 6) Upgrade (--upgrade)
echo.
echo 7) Upgrade Quiet (--upgrade --quiet)
echo.
echo 8) Bring To Top (--bring-to-top)
echo.
echo 9) Version (--version)
::echo.
::echo A) Help (--help)
echo.
echo.

if %os%==XP choice /c:123456789 /n
if %os%==VISTA choice /c 123456789 /n
if errorlevel 9 goto version
if errorlevel 8 goto btt
if errorlevel 7 goto upgradeq
if errorlevel 6 goto upgrade
if errorlevel 5 goto wae
if errorlevel 4 goto svcrun
if errorlevel 3 goto console
if errorlevel 2 goto quiet
if errorlevel 1 goto norm



:norm

%runShellWaitTerminate% %amInstantServer%

goto amiMenu


:quiet

%runShellWaitTerminate% %amInstantServerQuiet%

goto amiMenu


:console

%runShellWaitTerminate% %amInstantServerConsole%

goto amiMenu


:svcrun

%runShellWaitTerminate% %amInstantServerServiceRun%

goto amiMenu


:wae

%runShellWaitTerminate% %amInstantServerWaitAmEnd%

goto amiMenu


:upgrade

%runShellWaitTerminate% %amInstantServerUpgrade%

goto amiMenu


:upgradeq

%runShellWaitTerminate% %amInstantServerUpgradeQuiet%

goto amiMenu


:btt

%runShellWaitTerminate% %amInstantServerBringToTop%

goto amiMenu


:version

%runShellWaitTerminate% %amInstantServerVersion%

goto amiMenu


:help

%runShellWaitTerminate% %amInstantServerHelp%

goto amiMenu



:end
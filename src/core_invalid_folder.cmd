@ echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ INVALID FOLDER +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_invalid_folder : loaded]
	pause>nul
)

color 0e

:reset

del "rawk.id"
del ".ini"
del "status.cmd"

call "core_clean_main.cmd"

title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ INVALID FOLDER +-^~`+-.)     [...cRypTiCwaRe 2o2o...]



cls

set launchwebdl=0

set invalidFolder=1

:: Dump current environment out to text
set>"%temp%\rawkEnvTemp.cmd"

%cocolor% 0c
echo Game Loaded: Not Available!
echo.
echo.
echo.
%cocolor% 0e
echo -----------------------------------------
echo YOU HAVE SELECTED THE "MY GAMES" FOLDER!
echo -----------------------------------------
echo.
echo PLEASE RESTART THE WRAPPER KILLER AND SELECT YOUR TARGET GAMES FOLDER!
echo.
echo.
echo IT IS LOCATED UNDER C:\MY GAMES\YOUR GAME NAME HERE
echo.
echo.
echo.
echo.
echo PRESS ENTER TO EXIT THIS WINDOW.....
echo.
echo.
echo [A] Advanced Options   [W] Web Downloader   [S] Stub Creator
echo.
echo [O] Run OGM Service    [M] Run AM Instant Service    [G] GH Web Scraper
echo.


::%inputGetDir%

::%waitfor% 8000

set /p launchwebdl=

if %launchwebdl%==G goto ghScraper
if %launchwebdl%==g goto ghScraper
if %launchwebdl%==M goto amiService
if %launchwebdl%==m goto amiService
if %launchwebdl%==w goto uradl
if %launchwebdl%==W goto uradl
if %launchwebdl%==a goto advOptions
if %launchwebdl%==A goto advOptions
if %launchwebdl%==s goto stubCreator
if %launchwebdl%==S goto stubCreator
if %launchwebdl%==o goto ogmService
if %launchwebdl%==O goto ogmService
if %launchwebdl%==0 goto cleanup

goto end

::goto cleanup

:cleanup

%kill% RNArcade.exe >nul
%kill% RGSinst.exe >nul

del "rawk.id"
del ".ini"
del "status.cmd"

cls
goto end


:uradl
cls
echo When finished, please run the Wrapper Killer again on the target game!
echo.
echo.
%webdlpath%

goto reset
::goto end


:advOptions

call "core_advanced_load_options.cmd"


goto end


:stubCreator
cls

::call "core_stub_creator.cmd"
%runShellTerminate% call "core_stub_creator.cmd"

goto reset
::goto end


:ogmService
cls

::call "core_ogm_service.cmd"
%runShellTerminate% call "core_ogm_service.cmd"

goto reset
::goto end


:amiService
cls

::call "core_am_instant_server.cmd"
%runShellTerminate% "core_am_instant_server.cmd"

goto reset
::goto end


:ghScraper
cls

::call "core_gh_web_scraper.cmd"
%runShellTerminate% "core_gh_web_scraper.cmd"

goto reset
::goto end



:end

:: Removing more leftover files (20160615)
del /s /f /q "ogmservice.exe"
del /s /f /q "stub-chunk1.bin"

call "core_rawk_cleanup_root.cmd"

::del /f /q "%temp%\rawkEnv.cmd"
::del /f /q "%temp%\rawkEnvTemp.cmd"

if %testmode%==1 (
	echo [core_invalid_folder : finished]
	pause>nul
)


exit
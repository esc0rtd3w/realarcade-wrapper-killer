@ echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ INVALID FOLDER +-^~`+-.)     [...cRypTiCwaRe 2o13...]

color 0e


del "rawk.id"
del ".ini"
del "status.bat"

call "core_clean_main.bat"

title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ INVALID FOLDER +-^~`+-.)     [...cRypTiCwaRe 2o13...]



cls

set launchwebdl=0

set invalidFolder=1

cocolor 0c
echo Game Loaded: Not Available!
echo.
echo.
echo.
cocolor 0e
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
echo [W] Launch Web Downloader   [A] Load Advanced Options
echo.
echo.


::%inputGetDir%

::%waitfor% 8000

set /p launchwebdl=

if %launchwebdl%==w goto uradl
if %launchwebdl%==W goto uradl
if %launchwebdl%==a goto advOptions
if %launchwebdl%==A goto advOptions
if %launchwebdl%==0 goto cleanup

goto end

::goto cleanup

:cleanup

%kill% RNArcade.exe >nul
%kill% RGSinst.exe >nul

del "rawk.id"
del ".ini"
del "status.bat"

cls
goto end


:uradl
cls
echo When finished, please run the Wrapper Killer again on the target game!
echo.
echo.
%webdlpath%

goto end


:advOptions

call "core_advanced_load_options.bat"


goto end



:end
exit
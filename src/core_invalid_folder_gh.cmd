@ echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ INVALID FOLDER +-^~`+-.)     [...cRypTiCwaRe 2o16...]

color 0e

call "core_clean_main.cmd"

title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ INVALID FOLDER +-^~`+-.)     [...cRypTiCwaRe 2o16...]


::-----------------------------------------------------------------------------------
:: Show a popup balloon
::-----------------------------------------------------------------------------------
::%popup% "You have chosen an INVALID folder" 10000



cls
set launchwebdl=0

set invalidFolder=1

echo Game Loaded: Not Available!
echo.
echo.
echo.
echo -----------------------------------------
echo YOU HAVE SELECTED A GAMEHOUSE FOLDER!
echo -----------------------------------------
echo.
echo PLEASE RESTART THE WRAPPER KILLER AND SELECT YOUR TARGET GAMES FOLDER!
echo.
echo.
echo IT IS LOCATED UNDER C:\GAMEHOUSE GAMES\YOUR GAME NAME HERE
echo.
echo.
echo.
echo.
echo PRESS ENTER TO EXIT THIS WINDOW.....
echo.
echo You may also press W and then ENTER to launch the Web Downloader
echo.
echo.

::%inputGetDir%

::%waitfor% 8000

set /p launchwebdl=

if %launchwebdl%==w goto uradl
if %launchwebdl%==W goto uradl
if %launchwebdl%==0 goto cleanup

goto end

::goto cleanup

:cleanup

%kill% RNArcade.exe >nul
%kill% RGSinst.exe >nul

del "rawk.id"
del ".ini"

cls
goto end


:uradl
cls
echo When finished, please run the Wrapper Killer again on the target game!
echo.
echo.
%webdlpath%

goto end

:end
exit
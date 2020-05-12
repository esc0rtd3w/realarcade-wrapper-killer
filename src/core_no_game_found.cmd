@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Unknown Unpacking Error +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_no_game_found : loaded]
	pause>nul
)

::-----------------------------------------------------------------------------------
::Attempting to kill RNArcade process
::-----------------------------------------------------------------------------------

cls
%kill% RNArcade.exe >nul

::-----------------------------------------------------------------------------------
:: Cleaning Up useless files
::-----------------------------------------------------------------------------------

call "core_clean_main.cmd"


::-----------------------------------------------------------------------------------
:: Show a popup balloon
::-----------------------------------------------------------------------------------
::%popup% "Unknown Unpacking Error" 10000


::-----------------------------------------------------------------------------------
:: No Game Found Error Text
::-----------------------------------------------------------------------------------

set launchwebdl=0

cls
color 0c
echo.
echo.
echo One of the following has happened and the game cannot be processed:
echo.
echo.
echo 1) The game has already been unwrapped.  
echo.
echo 2) The game has the wrong Wrapper Type (v2.1+ RGA NOT SUPPORTED).
echo.
echo 3) The game is NOT a RealArcade game.
echo.
echo 4) The game is a newer release and this tool does NOT yet support it.
echo.
echo.
echo PRESS ENTER TO EXIT THIS WINDOW.....
echo.
echo You may also press W and then ENTER to launch the Web Downloader
echo.
echo.
::echo The Wrapper Killer Will Close Itself In 10 Seconds...
::echo.
::echo.
if exist "launch.ini" del "launch.ini"
if exist "rawk.id" del "rawk.id"

::%waitfor% 10000

set /p launchwebdl=

if %launchwebdl%==w goto uradl
if %launchwebdl%==W goto uradl
if %launchwebdl%==0 goto cleanup

goto end

::goto cleanup


:cleanup

::-----------------------------------------------------------------------------------
::Attempting to kill RNArcade process
::-----------------------------------------------------------------------------------

cls
%kill% RNArcade.exe >nul
%kill% RGSinst.exe >nul

::-----------------------------------------------------------------------------------
:: Opening the current folder
::-----------------------------------------------------------------------------------

cls
explorer %cd%

goto end


:uradl
cls
echo When finished, please run the Wrapper Killer again on the target game!
echo.
echo.
%webdlpath%

goto end


:end

if %testmode%==1 (
	echo [core_no_game_found : finished]
	pause>nul
)

exit
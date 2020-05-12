@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Verifying Local Files +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

::-----------------------------------------------------------------------------------
:: This is used for checking rawk.exe for local installer
::-----------------------------------------------------------------------------------

::if exist %rawkLaunch% (

::echo Looking for local Wrapper Killer EXE file....
::echo.

::)

::if not exist %rawkLaunch% (

::echo Looking for local Wrapper Killer EXE file....
::echo.

::)

:: Paint It Black ;)
::color 00

::if not exist %rawkLaunch% copy /y %rawkInnoLaunchPath% %rawkLaunch%

cls

echo Verifying Local Files....
echo.
echo.

copy /y %rawkInnoLaunchPath% %rawkLaunch%

cls

echo Verifying Local Files....
echo.
echo.
copy /y %rawkInnoLaunchPath% "c:\temp\rawk.exe"

cls

echo Verifying Local Files....
echo.
echo.


:end

if %testmode%==1 (
	echo [core_check_local_rawk : finished]
	pause>nul
)

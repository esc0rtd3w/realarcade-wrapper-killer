@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Zylom File Patcher +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

color 02

-------------------------------------

:main
cls
echo ----------------------------------------------------------------------------
echo Preparing To Run Timer Hack To Enable Unlimited Play!
echo ----------------------------------------------------------------------------
echo.
echo.
echo Press (E) To Extract From a Zylom Install EXE....
echo.
echo.
echo WISE Installers are currently supported!
echo.
echo.
echo IF NO KEYS ARE PRESSED, THEN DEFAULT VALUES WILL BE USED!
echo.
echo.
echo.

pause

if %os%==XP choice /c:ne /t:n,5 /n
if not %os%==XP choice /c ne /d n /n /t 5
if errorlevel 2 goto extractGHInstall
if errorlevel 1 goto runTimerHack

::-----------------------------------------------------------------------------------
:: Extract from a GH installer
::-----------------------------------------------------------------------------------

:extractGHInstall

call "core_ghx_install.cmd"

goto autopatch


::-----------------------------------------------------------------------------------
:: Begin Timer Hack
::-----------------------------------------------------------------------------------

:runTimerHack

call "core_ghx_reset.cmd"


:end

call "core_clean_ini.cmd"

if %testmode%==1 (
	echo [core_patch_demoZY : finished]
	pause>nul
)




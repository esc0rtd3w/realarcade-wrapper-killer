@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Game Cheats +-^~`+-.)     [...cRypTiCwaRe 2o2o...]


color 0e

::-----------------------------------------------------------------------------------
:: Games are to be sorted alphabetically.
::-----------------------------------------------------------------------------------

cls
echo There are cheats available for this game.
echo.
echo Would you like to view more information? [Y/N]

if %os%==XP choice /c:yn /t:n,30 /n
if not %os%==XP choice /c yn /d n /n /t 30
if errorlevel 2 goto end
goto chtstart

::-----------------------------------------------------------------------------------
::Start Cheats
::-----------------------------------------------------------------------------------

:chtstart

:default
cls
echo ----------------------------
echo Cheat Information
echo ----------------------------
echo.
echo.
echo.
echo.
pause
goto end




:end

if %testmode%==1 (
	echo [core_cheats : finished]
	pause>nul
)

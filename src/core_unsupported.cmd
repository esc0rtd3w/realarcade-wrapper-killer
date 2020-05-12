@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Unsupported Game +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

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
:: Unsupported Game Found Error Text
::-----------------------------------------------------------------------------------

color 0c
cls
echo Game Loaded: %GameName%
echo.
echo Release Date: %rlsdate%
echo.
echo Install Size: %installsize%
echo.
echo GUID: %guid%
echo.
echo RGS Installer: %stubname%
echo.
echo.
echo DLC: %dlc%     Cheats: %cheats%     Mods: %mods%     Multi-Compatible: %multicmp%
echo.
echo.
echo Comments: %comments%
echo.
echo ----------------------------------------------
echo This game DOES NOT currently unpack properly!
echo ----------------------------------------------
echo.
%waitfor% 8000
if %debug%==1 call "core_debug.cmd"
goto end

:end

if %testmode%==1 (
	echo [core_unsupported : finished]
	pause>nul
)

exit
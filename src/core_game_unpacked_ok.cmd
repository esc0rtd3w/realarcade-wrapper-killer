@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Game Already Unwrapped +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

color 0a
set vertext=Not Verified
call "core_clean_main.cmd"

cls
echo Game Loaded: %GameName%
echo.
echo.
echo.
echo -------------------------------------
echo This game has already been unpacked!
echo -------------------------------------
echo.
echo.
echo.
echo You can launch your game by double-clicking "%unwrapped%.exe"
echo.
echo.
echo.
echo The games root folder will open in a few seconds....
echo.
echo.
%waitfor% 6000
%kill% RNArcade.exe >nul
cls
explorer %cd%
goto end

:end

if %testmode%==1 (
	echo [core_game_unpacked_ok : finished]
	pause>nul
)

exit
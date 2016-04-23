@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Getting Demo Type +-^~`+-.)     [...cRypTiCwaRe 2o13...]

echo -----------------------------------------------------------------------------

sfk find %wrapped%.exe RacNotRunning


if %errorlevel%==1 (
set type=1
goto showme
)


sfk find %wrapped%.exe fnGameBeginEnd

if %errorlevel%==1 (
set type=3
goto showme
)


filver32 %wrapped%.exe > getver.cmd
call getver.cmd

if "%f$v%"=="1.0.0.928" set type=1

if "%f$v%"=="1, 0, 0, 1" set type=3

del /s /q getver.cmd


:showme
cls
echo -----------------------------------------------------------------------------
if %type%==1 sfk find %wrapped%.exe RacNotRunning
if %type%==3 sfk find %wrapped%.exe fnGameBeginEnd
echo -----------------------------------------------------------------------------


echo.
echo.
echo Demo Type Detected: %type%
echo.
echo.
echo.
echo.

pause>nul

:end



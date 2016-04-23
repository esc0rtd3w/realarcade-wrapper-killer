@echo off
title RealArcade Wrapper Killer          (.-+'~^-+ GH Game Installer +-^~`+-.)     [...cRypTiCwaRe 2o13...]

color 0e


:start

set installEXE=0
set installName=0
set installNameTemp=0
set installNameTemp2=0

cls
echo Type path or drag the install EXE into this window and press ENTER:
echo.
echo.
echo.
echo ** TEMP WORKAROUND **
echo.
echo The installer and this script MUST be in the same directory
echo.
echo ** TEMP WORKAROUND **
echo.
echo.

set /p installEXE=


set installNameTemp=%installEXE:~0,-11%


for %%* in (%installNameTemp%) do set installNameTemp=%%~n*

set installEXE=%installNameTemp%Install.exe
set installNameTemp2=%installNameTemp%_tmp


wun %installEXE% %installNameTemp2%

set installName=%installNameTemp%

md "%cd%\%installName%"


xcopy /d /e /c /r /i /k /y "%cd%\%installNameTemp2%\MAINDIR" "%cd%\%installName%"

rd /s /q "%cd%\%installNameTemp2%"

goto start

:end


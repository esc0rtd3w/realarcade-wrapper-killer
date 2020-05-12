@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Delete Backups +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

::-----------------------------------------------------------------------------------
:: Deleting RAWK Generated Backups
::-----------------------------------------------------------------------------------

set delbak=0

:: Skipping comfirmation (added 20111121)
goto kill

cls
echo Really delete ALL backups??? [Y/N]
echo.
echo.
echo To verify please type DELETE in ALL CAPS and press ENTER!!!
echo.
echo.
echo.

set /p delbak=

if %delbak%==DELETE goto kill
if %delbak%==0 goto end
goto end

:kill
del *.rar
del *.bak


:end
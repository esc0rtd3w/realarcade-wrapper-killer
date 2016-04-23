@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Demo 5 unWrapper +-^~`+-.)     [...cRypTiCwaRe 2o13...]

color 03

::-----------------------------------------------------------------------------------
::Bypass Demo Windows Launch Hack
::-----------------------------------------------------------------------------------

echo [Main] > launch.ini
echo GameName= >> launch.ini

:skplnch
::-----------------------------------------------------------------------------------
::Setting Wrapped and unWrapped EXE
::-----------------------------------------------------------------------------------

if exist "derbydemo.exe" set wrapped=derbydemo& set unwrapped=ddfr
if exist "fluxle.exe" set wrapped=fluxle& set unwrapped=fluxle
if exist "geneforge.exe" set wrapped=geneforge& set unwrapped=geneforge
if exist "k2pc.exe" set wrapped=k2pc& set unwrapped=kcpc
if exist "goodsol01d.exe" set wrapped=goodsol01d& set unwrapped=goodsol01d

goto start

::-----------------------------------------------------------------------------------
::Special Situations Here
::-----------------------------------------------------------------------------------


::-----------------------------------------------------------------------------------
::END Special Situations
::-----------------------------------------------------------------------------------

:start
%waitfor% 2000

%show% "[...cRypTiCwaRe 2o13...]"
%waitfor% 1000
%show% "[...cRypTiCwaRe 2o13...]"

::-----------------------------------------------------------------------------------
::Splash
::-----------------------------------------------------------------------------------

cls
color 0e
echo This game is a REAL DEMO!
echo.
echo It DOES NOT contain the needed files to be a Full Version game.
echo.
echo Temp files will be cleaned up in a few seconds...
echo.

::-----------------------------------------------------------------------------------
::Removing ALL JUNK and TEMP files
::-----------------------------------------------------------------------------------

cls
call "core_clean_main.bat"

::-----------------------------------------------------------------------------------
:: Bypassing Special Situations unless specified
::-----------------------------------------------------------------------------------

cls
goto skpss

::-----------------------------------------------------------------------------------
::Special Situations Here
::-----------------------------------------------------------------------------------


::-----------------------------------------------------------------------------------
::END Special Situations
::-----------------------------------------------------------------------------------

:skpss
::-----------------------------------------------------------------------------------
:: Just waiting a few seconds
::-----------------------------------------------------------------------------------

cls
%waitfor% 2000

:sc
::-----------------------------------------------------------------------------------
::Bypass question to create shortcut
::-----------------------------------------------------------------------------------

cls
call "core_shortcut_demo5.bat"


:end
exit
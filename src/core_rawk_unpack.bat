@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ RAWK Inno Unpacker +-^~`+-.)     [...cRypTiCwaRe 2o13...]


::-----------------------------------------------------------------------------------------
:: Unpacking the RealArcade Wrapper Killer main exe to launch for RGS installs and others
::-----------------------------------------------------------------------------------------

cls
echo Unpacking RAWK Inno Setup for local use....
echo.
echo.

rd /s /q %rawkDump%

md %rawkDump%

cls
echo Unpacking RAWK Inno Setup for local use....
echo.
echo.

innounp.exe -x -y -b -q -d%rawkDump% %rawkLaunch%

cls
echo Unpacking RAWK Inno Setup for local use....
echo.
echo.


:end

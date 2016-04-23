@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ RGA File Checker +-^~`+-.)     [...cRypTiCwaRe 2o13...]


:: DISABLED ON 20131128 BECAUSE GH GAMES ARE NOW DIRECTLY SUPPORTED!


::-----------------------------------------------------------------------------------
:: Checking for RGA v2.1+ - web-installer based games
::-----------------------------------------------------------------------------------

if exist "gameinst.xml" call "core_rga_load.bat"
if exist "*_RADRM.dll" call "core_rga_load.bat"

if "%cd%" equ "%ghroot%\%GameName%" call "core_rga_load.bat"

:end
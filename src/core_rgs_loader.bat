@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Custom RGS Loader +-^~`+-.)     [...cRypTiCwaRe 2o16...]

::-----------------------------------------------------------------------------------
::This is the MAIN CUSTOM RGS LOADER silent installer
::-----------------------------------------------------------------------------------

"%ProgramFiles%\unRealArcade\temp\loader.exe"

::-----------------------------------------------------------------------------------
::This is the MAIN CUSTOM RGS LOADER MENU
::-----------------------------------------------------------------------------------

cls
echo Preparing To Launch Custom RGS Loader....
echo.
echo.
echo.
echo DO NOT click any buttons or press any keys until the install is finished!
%talk% "Please do not click any buttons or press any keys until the game is finished installing!" -2

cls
echo Launching Custom RGS Loader....
"%stubname%" >nul

%waitfor% 4000

nircmd dlg "RGSinst.exe" "" click yes

%kill% "RGSinst.exe" >nul


:end
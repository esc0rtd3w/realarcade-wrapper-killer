@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Custom RGS Loader +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

::-----------------------------------------------------------------------------------
::This is the MAIN CUSTOM RGS LOADER silent installer
::-----------------------------------------------------------------------------------

"C:\Program Files\unRealArcade\temp\loaderRGSv1.exe"

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

if %testmode%==1 (
	echo [core_rgs_loader : finished]
	pause>nul
)

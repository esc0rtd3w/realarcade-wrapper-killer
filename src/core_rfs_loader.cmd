@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Custom RFS Loader +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

::-----------------------------------------------------------------------------------
::This is the MAIN CUSTOM RFS LOADER silent installer
::-----------------------------------------------------------------------------------

"C:\Program Files\unRealArcade\temp\loaderRFS.exe"

::-----------------------------------------------------------------------------------
::This is the MAIN CUSTOM RGS LOADER MENU
::-----------------------------------------------------------------------------------

cls
echo Preparing To Launch Custom RFS Loader....
echo.
echo.
echo.

pause>nul


:end

if %testmode%==1 (
	echo [core_rfs_loader : finished]
	pause>nul
)

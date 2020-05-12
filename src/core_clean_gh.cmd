@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Gamehouse File Cleaner +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

::-----------------------------------------------------------------------------------
:: Checking For and Deleting Junk Files, if exist
::-----------------------------------------------------------------------------------
:cleanme


if exist "GameuxInstallHelper.dll" del "GameuxInstallHelper.dll" 
if exist "GDF.dll" del "GDF.dll"
if exist "GDFUninstall.exe" del "GDFUninstall.exe"



:end

if %testmode%==1 (
	echo [core_clean_gh : finished]
	pause>nul
)

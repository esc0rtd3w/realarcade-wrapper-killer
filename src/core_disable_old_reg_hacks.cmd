@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Disabling Old Reg Hacks +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_disable_old_reg_hacks : loaded]
	pause>nul
)

cls
echo Removing Old Registry Block Entries....
echo.
regedit /s "rawk_reset.reg">nul

::-----------------------------------------------------------------------------------
:: Re-adding default license keys
::-----------------------------------------------------------------------------------

cls
echo Applying Default License Keys....
echo.
regedit /s "rawk_licensekeys.reg">nul

::-----------------------------------------------------------------------------------
:: Re-adding player preferences
::-----------------------------------------------------------------------------------

cls
echo Applying RA Player Preferences....
echo.
regedit /s "rawk_prefs.reg">nul

:: FINALLY DISABLED 20160615
::-----------------------------------------------------------------------------------
:: Tagging a file to keep track of reg hack being applied << use "core_clean_reg_hacks" from
:: RUN box or command prompt to reset
::-----------------------------------------------------------------------------------

::echo ALL BLOCK-BASED reg hacks removed! - RAWK v4.7 BETA 2 > %systemroot%\system32\rawkreg.ok

:end

if %testmode%==1 (
	echo [core_disable_old_reg_hacks : finished]
	pause>nul
)

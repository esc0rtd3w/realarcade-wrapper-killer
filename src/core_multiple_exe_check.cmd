@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Multiple EXE Check +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_multiple_exe_check : loaded]
	pause>nul
)


if exist "primalprey.exe" goto ppfix


::-----------------------------------------------------------------------------------
:: Added on 20100929

:: Use for Demo 1 and Demo 1a ONLY!!!
::-----------------------------------------------------------------------------------

::-----------------------------------------------------------------------------------
:: Checking for _r1a.exe
::-----------------------------------------------------------------------------------

if not exist "*_r1a.exe" goto end

if exist "*_r1a.exe" ren "*_r1a.exe" "*_r1a.ur2"

if exist "delete.exe" ren "delete.exe" "delete.ur2"

ren "*.exe" "*.hold"

if exist "*.ur2" ren "*.ur2" "*.exe"

goto end

::-----------------------------------------------------------------------------------
:: Added on 20131103
:: Checking for other demo type multiple EXE's
::-----------------------------------------------------------------------------------

:ppfix
:: Primal Prey Fix
ren "regid.exe" "regid.hold"

goto end


:end

:: Full RGS Check Fix
if exist "regid.hold" (
	set check_rgsfull=1
	set demotype=f
)

if %testmode%==1 (
	echo [core_multiple_exe_check : finished]
	pause>nul
)

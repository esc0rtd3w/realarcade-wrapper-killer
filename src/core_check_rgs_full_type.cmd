@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Check RGS Full Game Protection +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_check_rgs_full_type : loaded]
	pause>nul
)


set check_rgsfull=1
set demotype=f
del /f /q "regid.exe"
del /f /q "regid.hold"


:end

if %testmode%==1 (
	echo [core_check_rgs_full_type : finished]
	pause>nul
)

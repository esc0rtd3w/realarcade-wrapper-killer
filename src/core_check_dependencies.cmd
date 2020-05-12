@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Check Dependencies +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_check_dependencies : loaded]
	pause>nul
)


color 0e


cls
::echo I Am "core_check_dependencies.cmd"
::echo.
::echo.
::pause




goto end




:end

if %testmode%==1 (
	echo [core_check_dependencies : finished]
	pause>nul
)

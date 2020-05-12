@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Check Termination Status +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_check_exit_status : loaded]
	pause>nul
)


color 0e



::set ghFlag=0
::set zyFlag=0

set forceExit=1

goto end




:end

if %testmode%==1 (
	echo [core_check_exit_status : finished]
	pause>nul
)

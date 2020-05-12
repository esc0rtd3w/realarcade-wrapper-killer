@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Clear RAWK Cache +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_clear_cache : loaded]
	pause>nul
)


cls

del "%rawkroot%\*.ini"
del "%rawkroot%\update\*.ini"

copy "%rawkroot%\temp\*.ini" "%rawkroot%\"

set restartcore=1

:end

if %testmode%==1 (
	echo [core_clear_cache : finished]
	pause>nul
)

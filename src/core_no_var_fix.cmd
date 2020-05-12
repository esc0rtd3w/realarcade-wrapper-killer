@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Checking For Empty Variables +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_no_var_fix : loaded]
	pause>nul
)

:stat0
cls
find "verified=0" status.cmd
if errorlevel 1 goto stat1
if errorlevel 0 goto setstat

:stat1
cls
find "verified=1" status.cmd
if errorlevel 1 goto stat2
if errorlevel 0 goto setstat

:stat2
cls
find "verified=2" status.cmd
if errorlevel 1 goto stat3
if errorlevel 0 goto setstat

:stat3
cls
find "verified=3" status.cmd
if errorlevel 1 goto stat4
if errorlevel 0 goto setstat

:stat4
cls
find "verified=4" status.cmd
if errorlevel 1 goto stat5
if errorlevel 0 goto setstat

:stat5
cls
find "verified=5" status.cmd
if errorlevel 1 goto stat6
if errorlevel 0 goto setstat

:stat6
cls
find "verified=6" status.cmd
if errorlevel 1 goto stat7
if errorlevel 0 goto setstat

:stat7
cls
find "verified=7" status.cmd
if errorlevel 1 goto stat8
if errorlevel 0 goto setstat

:stat8
cls
find "verified=8" status.cmd
if errorlevel 1 goto stat9
if errorlevel 0 goto setstat

:stat9
cls
find "verified=9" status.cmd
if errorlevel 1 goto noentry
if errorlevel 0 goto setstat

:noentry
cls
set verified=0
goto end


:setstat
::-----------------------------------------------------------------------------------
::Apply variables
::-----------------------------------------------------------------------------------

cls
call status.cmd


:end

if %testmode%==1 (
	echo [core_no_var_fix : finished]
	pause>nul
)

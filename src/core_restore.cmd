@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Restoring Original EXE +-^~`+-.)     [...cRypTiCwaRe 2o2o...]


cls
echo Restoring ORIGINAL wrapped EXE....
echo.
echo.
echo Press (C) To Cancel....
echo.
echo.

if %os%==XP choice /c:cr /t:r,3 /n
if not %os%==XP choice /c cr /d r /n /t 3
if errorlevel 2 goto restore
if errorlevel 1 goto end


:restore
cls
for %%* in (*.rar) do set wrapped2=%%~n*
::if not exist "%wrapped%.exe" rar e -y "%wrapped%.rar"
rar e -y "%wrapped2%.rar"


::-----------------------------------------------------------------------------------
:: If manual unpacking mode is forced by Wrapper Killer, it should skip "restartcore"
:: added 20110817
::-----------------------------------------------------------------------------------
if %manualdto%==0 goto end


::-----------------------------------------------------------------------------------
:: Setting the "restartcore" variable to "1" so after completion, the Wrapper Killer
:: will reload itself
::-----------------------------------------------------------------------------------
set restartcore=1

set restoredone=1

goto end



:end

if %testmode%==1 (
	echo [core_restore : finished]
	pause>nul
)

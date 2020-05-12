@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Backing Up Original EXE +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

cls
echo Creating Backup of ORIGINAL wrapped EXE....
echo.
echo.
echo Press (C) To Cancel....
echo.
echo.

if %os%==XP choice /c:cb /t:b,3 /n
if not %os%==XP choice /c cb /d b /n /t 3
if errorlevel 2 goto backup
if errorlevel 1 goto end


:backup
::-----------------------------------------------------------------------------------
::Start Timer
::-----------------------------------------------------------------------------------

xtimer /nologo >nul

::-----------------------------------------------------------------------------------
::Use the compression level m0-m5 to adjust the TIMERFIX variable
::-----------------------------------------------------------------------------------

cls
rar a -ep -ep1 -y -m0 "%wrapped%.rar" "%wrapped%.exe"

::-----------------------------------------------------------------------------------
::Stop Timer
::-----------------------------------------------------------------------------------

xtimer /nologo /s >nul

::-----------------------------------------------------------------------------------
::Set new adjusted TIMERFIX value (in milliseconds) (DISABLED ON 08-02-2011)
::-----------------------------------------------------------------------------------

::set /a timerfix=%errorlevel%+4500
::set /a timerfix2=%errorlevel%+4500

set restartcore=1
set baknow=1

goto end


:end
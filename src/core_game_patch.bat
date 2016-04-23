@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Full Game Patcher +-^~`+-.)     [...cRypTiCwaRe 2o13...]

goto end

color 0e

set splash=0

::-----------------------------------------------------------------------------------
:: Checking for games that have patches
::-----------------------------------------------------------------------------------

if exist "patches\%unwrapped%.ini" goto gopatch
if exist "cheats\%unwrapped%.ini" goto gocheat

goto end

::-----------------------------------------------------------------------------------
:: Set Per Game Variables Here
::-----------------------------------------------------------------------------------


:gopatch
echo @echo off > patch01.bat
echo. >> patch01.bat
if %patch%==1 (
inifile "patches\%unwrapped%.ini" [1] file > patch01.bat
inifile "patches\%unwrapped%.ini" [1] type > patch01.bat
inifile "patches\%unwrapped%.ini" [1] address > patch01.bat
inifile "patches\%unwrapped%.ini" [1] oldcmd > patch01.bat
inifile "patches\%unwrapped%.ini" [1] newcmd > patch01.bat
inifile "patches\%unwrapped%.ini" [1] oldbytes > patch01.bat
inifile "patches\%unwrapped%.ini" [1] newbytes > patch01.bat
inifile "patches\%unwrapped%.ini" [1] index > patch01.bat
inifile "patches\%unwrapped%.ini" [1] hex > patch01.bat
inifile "patches\%unwrapped%.ini" [1] comment > patch01.bat
)

if exist "cheats\%unwrapped%.ini" goto gocheat

goto end

:gocheat

echo @echo off > cheat01.bat
echo. >> cheat01.bat
if %cheats%==1 (
inifile "cheats\%unwrapped%.ini" [1] file > cheat01.bat
inifile "cheats\%unwrapped%.ini" [1] type > cheat01.bat
inifile "cheats\%unwrapped%.ini" [1] address > cheat01.bat
inifile "cheats\%unwrapped%.ini" [1] oldcmd > cheat01.bat
inifile "cheats\%unwrapped%.ini" [1] newcmd > cheat01.bat
inifile "cheats\%unwrapped%.ini" [1] oldbytes > cheat01.bat
inifile "cheats\%unwrapped%.ini" [1] newbytes > cheat01.bat
inifile "cheats\%unwrapped%.ini" [1] index > cheat01.bat
inifile "cheats\%unwrapped%.ini" [1] hex > cheat01.bat
inifile "cheats\%unwrapped%.ini" [1] comment > cheat01.bat
)

echo @echo off > cheat02.bat
echo. >> cheat02.bat
if %cheats%==1 (
inifile "cheats\%unwrapped%.ini" [2] file > cheat02.bat
inifile "cheats\%unwrapped%.ini" [2] type > cheat02.bat
inifile "cheats\%unwrapped%.ini" [2] address > cheat02.bat
inifile "cheats\%unwrapped%.ini" [2] oldcmd > cheat02.bat
inifile "cheats\%unwrapped%.ini" [2] newcmd > cheat02.bat
inifile "cheats\%unwrapped%.ini" [2] oldbytes > cheat02.bat
inifile "cheats\%unwrapped%.ini" [2] newbytes > cheat02.bat
inifile "cheats\%unwrapped%.ini" [2] index > cheat02.bat
inifile "cheats\%unwrapped%.ini" [2] hex > cheat02.bat
inifile "cheats\%unwrapped%.ini" [2] comment > cheat02.bat
)


::-----------------------------------------------------------------------------------
:: Show Patch Infos
::-----------------------------------------------------------------------------------

:p1_go
cls
echo The following patching info is displayed below:
echo.
echo.
echo File: %p1_file%
echo.
echo Type: %p1_type%
echo.
echo Address: %p1_address%
echo.
echo Old Command: %p1_oldcmd%
echo.
echo New Command: %p1_newcmd%
echo.
echo Old Bytes: %p1_oldbytes%
echo.
echo New Bytes: %p1_newbytes%
echo.
echo Patching Index: %p1_index%
echo.
echo Patching Bytes: %p1_hex%
echo.
echo Comment: %p1_comment%
echo.
echo. 
echo.
echo Press a key to patch file(s) and continue....
pause>nul

gpatch "%p1_file%" /nologo /i%p1_index% /h"%p1_hex%"


:p2_go
cls
echo The following patching info is displayed below:
echo.
echo.
echo File: %p2_file%
echo.
echo Type: %p2_type%
echo.
echo Address: %p2_address%
echo.
echo Old Command: %p2_oldcmd%
echo.
echo New Command: %p2_newcmd%
echo.
echo Old Bytes: %p2_oldbytes%
echo.
echo New Bytes: %p2_newbytes%
echo.
echo Patching Index: %p2_index%
echo.
echo Patching Bytes: %p2_hex%
echo.
echo Comment: %p2_comment%
echo.
echo. 
echo.
echo Press a key to patch file(s) and continue....
pause>nul

gpatch "%p2_file%" /nologo /i%p2_index% /h"%p2_hex%"


::-----------------------------------------------------------------------------------
:: Check For Splash Screens
::-----------------------------------------------------------------------------------

if not %splash%==0 del /f /q "%splash%"

goto end

:end
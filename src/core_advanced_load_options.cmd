@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Advanced Load Options +-^~`+-.)     [...cRypTiCwaRe 2o2o...]


::-----------------------------------------------------------------------------------
:: Advanced Load Options
::-----------------------------------------------------------------------------------


cls
cocolor 0e
echo -------------------------------------------------------
echo Press one of the keys to select a new option
echo.
cocolor 0c
echo * Not currently active
cocolor 0e
echo -------------------------------------------------------
echo.
cocolor 0e
echo Press (Z) to Configure the RealArcade Player Software
cocolor 0e
echo.
cocolor 0e
echo Press (D) to manually set Demo Type
cocolor 0e
echo.
cocolor 0c
echo Press (G) to manually set GUID for current game*
cocolor 0e
echo.
cocolor 0c
echo Press (I) to use options in Custom INI File*
cocolor 0e
echo.
cocolor 0c
echo Press (M) to set Custom Mods for current game*
cocolor 0e
echo.
cocolor 0c
echo Press (C) to set Custom Cheats for current game*
cocolor 0e
echo.
cocolor 0c
echo Press (P) to set Custom Patches for current game*
cocolor 0e
echo.
echo.
cocolor 0e
if %invalidFolder%==0 echo Press (X) to Exit this menu and continue unpacking
if %invalidFolder%==1 echo Press (X) to Exit this menu
echo.

if %os%==XP choice /c:zdgimcpx /n
if %os%==VISTA choice /c zdgimcpx /n
if errorlevel 8 goto end
if errorlevel 7 goto patches
if errorlevel 6 goto cheats
if errorlevel 5 goto mods
if errorlevel 4 goto custini
if errorlevel 3 goto newguid
if errorlevel 2 goto demotype
if errorlevel 1 goto configRNA


:demotype
set dtor=1
goto end

:setguid
set newguid=1
goto end

:custini
set custom_ini=1
goto end

:mods
set custom_mods=1
goto end

:cheats
set custom_cheats=1
goto end

:patches
set custom_patches=1
goto end

:configRNA
::set rauninstall=1
call "core_config_ra_player.cmd"
goto end




:end

if %invalidFolder%==1 exit

set advancedloadoptions=0

:: Change colors back to normal
color 0e
if exist *.rar color 0a
if not exist *.exe color 08


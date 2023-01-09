@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Gamehouse Main Landing Page +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_gamehouse_main : loaded]
	pause>nul
)


:: Also referenced in RAUnwrap.cmd
set gh_core_ver=1.0.0


color 0e


::-----------------------------------------------------------------------------------
:: Getting Database Core Version
::-----------------------------------------------------------------------------------

%inifile% "%rawkroot%\ghdb.ini" [core] ghdb_core > ghdbtemp.cmd
call ghdbtemp.cmd


echo Gamehouse Main Landing Page


if "%cd%" == "C:\GameHouse Games" call "core_invalid_folder_gh.cmd"
if "%cd%" == "C:\Program Files\GameHouse Games" call "core_invalid_folder_gh.cmd"
if "%cd%" == "C:\Program Files (x86)\GameHouse Games" call "core_invalid_folder_gh.cmd"


call "core_gamehouse_hotkey.cmd"
call "core_gamehouse_override.cmd"




:: Comment on release version
goto end


:end

if %testmode%==1 (
	echo [core_gamehouse_main : finished]
	pause>nul
)

@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Zylom Main Landing Page +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_zylom_main : loaded]
	pause>nul
)


:: Also referenced in RAUnwrap.cmd
set zy_core_ver=1.0.0


color 0e


::-----------------------------------------------------------------------------------
:: Getting Database Core Version
::-----------------------------------------------------------------------------------

%inifile% "%rawkroot%\zydb.ini" [core] zydb_core > zydbtemp.cmd
call zydbtemp.cmd


echo Zylom Main Landing Page


call "core_zylom_hotkey.cmd"
call "core_zylom_override.cmd"



goto end


:end

if %testmode%==1 (
	echo [core_zylom_main : finished]
	pause>nul
)

@echo off

title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Shortcut Maker +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_shortcut_demoGH : loaded]
	pause>nul
)

color 02


:scstart

goto end



:debugok
::-----------------------------------------------------------------------------------
:: Debug Output (USED FOR TESTING ONLY!)
::-----------------------------------------------------------------------------------

cls
call "core_debug.cmd"

goto end2


:end


::Cleaning temp INI files for patches and cheats
call "core_clean_ini.cmd"

::Added autolaunch select on 11-13-2010
::if %unpackfail%==0 call "core_autolaunch.cmd"
::if %unpackfail%==1 call "demoGH.cmd"

if %testmode%==1 (
	echo [core_shortcut_demoGH : finished]
	pause>nul
)

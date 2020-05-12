@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ INI File Cleaner +-^~`+-.)     [...cRypTiCwaRe 2o2o...]


::-----------------------------------------------------------------------------------
:: Removing temp INI files (handled by INNO but used a a secondary measure
::-----------------------------------------------------------------------------------

rmdir /s /q cheats
rmdir /s /q patches

:end

if %testmode%==1 (
	echo [core_clean_ini : finished]
	pause>nul
)

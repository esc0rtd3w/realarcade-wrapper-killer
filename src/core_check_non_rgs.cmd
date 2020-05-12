@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Checking Non-RGS Files +-^~`+-.)     [...cRypTiCwaRe 2o2o...]


if %ghFlag%==1 call "core_gamehouse_main.cmd"

if %zyFlag%==1 call "core_zylom_main.cmd"



:end

if %testmode%==1 (
	echo [core_check_non_rgs : finished]
	pause>nul
)

@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Setting Default Variables +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_set_def_ini : loaded]
	pause>nul
)

set verified=0
set demotype=0
set version=0
set md5w=0
set md5u=0
set patch1_name=None
set patch1_index=0
set patch1_hex=0
set patch2_name=None
set patch2_index=0
set patch2_hex=0
set patch3_name=None
set patch3_index=0
set patch3_hex=0
set patch4_name=None
set patch4_index=0
set patch4_hex=0
set patch5_name=None
set patch5_index=0
set patch5_hex=0
set patch6_name=None
set patch6_index=0
set patch6_hex=0
set patch_extension=0
set PFLindex=0
set PFLhex=0
set RNRindex=0
set RNRhex=0
set SWindex=0
set SWhex=0
set genre=Unavailable
set stubname=Unavailable
set rlsdate=Unavailable
set guid=Unavailable
set contentid=Unavailable
set trackingid=Unavailable
set cheats=No
set mods=No
set dlc=No
set multicmp=No
set savexp=Unavailable
set save7=Unavailable
set binmod=No
set altid=None
set magicslot=0
set ftinit=0
set ftinitpath=0
set installsize=Unavailable
set unwrapped=
set comments=None


::-----------------------------------------------------------------------------------
:: Settings OS Names
::-----------------------------------------------------------------------------------

set xp32=Windows XP (32-bit)
set vista32=Windows Vista/7 (32-bit)
set vista64=Windows Vista/7 (64-bit)

:end

if %testmode%==1 (
	echo [core_set_def_ini : finished]
	pause>nul
)

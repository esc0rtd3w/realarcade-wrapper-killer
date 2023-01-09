@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Reading INI File +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_get_stats : loaded]
	pause>nul
)

::-----------------------------------------------------------------------------------
:: Using INI file instead of verify.cmd file to organize stats
::-----------------------------------------------------------------------------------

:: Full RGS INI
if %check_rgsfull%==1 goto isfull

:: Standard Demo INI
echo @echo off > status.cmd
echo. >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] verified > status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] demotype >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] version >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] md5w >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] md5u >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] PFLindex >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] PFLhex >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] RNRindex >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] RNRhex >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] SWindex >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] SWhex >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] genre >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] stubname >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] rlsdate >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] guid >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] contentid >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] trackingid >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] cheats >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] mods >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] dlc >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] multicmp >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] savexp >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] save7 >> status.cmd
::%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] binmod >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] altid >> status.cmd
::%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] magicslot >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] ftinit >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] ftinitpath >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] installsize >> status.cmd
%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] unwrapped >> status.cmd
::%inifile% "%rawkroot%\rawkdb.ini" [%wrapped%] comments >> status.cmd

:: Set defaults for unused variables
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

goto end


:isfull
echo @echo off > status.cmd
echo. >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] verified > status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] demotype >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] version >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] md5w >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] md5u >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] patch1_name >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] patch1_index >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] patch1_hex >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] patch2_name >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] patch2_index >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] patch2_hex >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] patch3_name >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] patch3_index >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] patch3_hex >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] patch4_name >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] patch4_index >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] patch4_hex >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] patch5_name >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] patch5_index >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] patch5_hex >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] patch6_name >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] patch6_index >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] patch6_hex >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] patch_extension >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] genre >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] stubname >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] rlsdate >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] guid >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] contentid >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] trackingid >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] cheats >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] mods >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] dlc >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] multicmp >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] savexp >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] save7 >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] altid >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] ftinit >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] ftinitpath >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] installsize >> status.cmd
%inifile% "%rawkroot%\rgsfull.ini" [%wrapped%] unwrapped >> status.cmd

:: Set defaults for unused variables
set PFLindex=0
set PFLhex=0
set RNRindex=0
set RNRhex=0
set SWindex=0
set SWhex=0

goto end



:end

if %testmode%==1 (
	echo [core_get_stats : finished]
	pause>nul
)

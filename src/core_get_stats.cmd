@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Reading INI File +-^~`+-.)     [...cRypTiCwaRe 2o16...]

::-----------------------------------------------------------------------------------
:: Using INI file instead of verify.cmd file to organize stats
::-----------------------------------------------------------------------------------

echo @echo off > status.cmd
echo. >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] verified > status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] demotype >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] version >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] md5w >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] md5u >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] PFLindex >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] PFLhex >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] RNRindex >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] RNRhex >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] SWindex >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] SWhex >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] genre >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] stubname >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] rlsdate >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] guid >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] contentid >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] trackingid >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] cheats >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] mods >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] dlc >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] multicmp >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] savexp >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] save7 >> status.cmd
::inifile "%rawkroot%\rawkdb.ini" [%wrapped%] binmod >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] altid >> status.cmd
::inifile "%rawkroot%\rawkdb.ini" [%wrapped%] magicslot >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] ftinit >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] ftinitpath >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] installsize >> status.cmd
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] unwrapped >> status.cmd
::inifile "%rawkroot%\rawkdb.ini" [%wrapped%] comments >> status.cmd



:end
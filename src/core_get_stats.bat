@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Reading INI File +-^~`+-.)     [...cRypTiCwaRe 2o13...]

::-----------------------------------------------------------------------------------
:: Using INI file instead of verify.bat file to organize stats
::-----------------------------------------------------------------------------------

echo @echo off > status.bat
echo. >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] verified > status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] demotype >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] version >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] md5w >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] md5u >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] PFLindex >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] PFLhex >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] RNRindex >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] RNRhex >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] SWindex >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] SWhex >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] genre >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] stubname >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] rlsdate >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] guid >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] contentid >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] trackingid >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] cheats >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] mods >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] dlc >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] multicmp >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] savexp >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] save7 >> status.bat
::inifile "%rawkroot%\rawkdb.ini" [%wrapped%] binmod >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] altid >> status.bat
::inifile "%rawkroot%\rawkdb.ini" [%wrapped%] magicslot >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] ftinit >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] ftinitpath >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] installsize >> status.bat
inifile "%rawkroot%\rawkdb.ini" [%wrapped%] unwrapped >> status.bat
::inifile "%rawkroot%\rawkdb.ini" [%wrapped%] comments >> status.bat



:end
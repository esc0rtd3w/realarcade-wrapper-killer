@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Zylom Main Landing Page +-^~`+-.)     [...cRypTiCwaRe 2o16...]


:: Also referenced in RAUnwrap.bat
set zy_core_ver=1.0.0


color 0e


::-----------------------------------------------------------------------------------
:: Getting Database Core Version
::-----------------------------------------------------------------------------------

inifile "%rawkroot%\zydb.ini" [core] zydb_core > zydbtemp.bat
call zydbtemp.bat


echo Zylom Main Landing Page


call "core_zylom_hotkey.bat"
call "core_zylom_override.bat"



goto end




:end



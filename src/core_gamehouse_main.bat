@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Gamehouse Main Landing Page +-^~`+-.)     [...cRypTiCwaRe 2o16...]


:: Also referenced in RAUnwrap.bat
set gh_core_ver=1.0.0


color 0e


::-----------------------------------------------------------------------------------
:: Getting Database Core Version
::-----------------------------------------------------------------------------------

inifile "%rawkroot%\ghdb.ini" [core] ghdb_core > ghdbtemp.bat
call ghdbtemp.bat


echo Gamehouse Main Landing Page


if "%cd%" == "C:\GameHouse Games" call "core_invalid_folder_gh.bat"
if "%cd%" == "C:\Program Files\GameHouse Games" call "core_invalid_folder_gh.bat"
if "%cd%" == "C:\Program Files (x86)\GameHouse Games" call "core_invalid_folder_gh.bat"


call "core_gamehouse_hotkey.bat"
call "core_gamehouse_override.bat"




:: Comment on release version
goto end






:end

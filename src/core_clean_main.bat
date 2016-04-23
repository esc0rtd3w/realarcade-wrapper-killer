@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Junk Files Cleaner +-^~`+-.)     [...cRypTiCwaRe 2o16...]


::-----------------------------------------------------------------------------------
::Custom
::-----------------------------------------------------------------------------------

cls

::del /q /s "*.ura"

:: Added for new RGS Loader 2.0
if exist "generic.spc" del "generic.spc

:: PDF Only Fix
if exist "dlprinstapp_en_r1a.rar" del "dlprinstapp_en_r1a.rar"

::Google Chrome API
if exist "gcapi_dll.dll" del "gcapi_dll.dll"

if exist "StarDefender3_1.28_En_GameHouse_PC" rd /s /q "StarDefender3_1.28_En_GameHouse_PC"
if exist "__MACOSX" rd /s /q "__MACOSX"
if exist "launch.ini" del "launch.ini"
if exist "delete.exe" del "delete.exe"
if exist "status.bat" del "status.bat"
if exist "dbtemp.bat" del "dbtemp.bat"
if exist "unwrapcheck.bat" del "unwrapcheck.bat"
if exist "c_core_installed_ver.bat" del "c_core_installed_ver.bat"
if exist "d_core_installed_ver.bat" del "d_core_installed_ver.bat"
if exist "m_core_installed_ver.bat" del "m_core_installed_ver.bat"
if exist "p_core_installed_ver.bat" del "p_core_installed_ver.bat"
if exist "s_core_installed_ver.bat" del "s_core_installed_ver.bat"
if exist "rdb_core_installed_ver.bat" del "rdb_core_installed_ver.bat"
if exist "rna_core_installed_ver.bat" del "rna_core_installed_ver.bat"
if exist "c_core_available_ver.bat" del "c_core_available_ver.bat"
if exist "d_core_available_ver.bat" del "d_core_available_ver.bat"
if exist "m_core_available_ver.bat" del "m_core_available_ver.bat"
if exist "p_core_available_ver.bat" del "p_core_available_ver.bat"
if exist "s_core_available_ver.bat" del "s_core_available_ver.bat"
if exist "rdb_core_available_ver.bat" del "rdb_core_available_ver.bat"
if exist "rna_core_available_ver.bat" del "rna_core_available_ver.bat"
if exist "c_core_running_ver.bat" del "c_core_running_ver.bat"
if exist "d_core_running_ver.bat" del "d_core_running_ver.bat"
if exist "m_core_running_ver.bat" del "m_core_running_ver.bat"
if exist "p_core_running_ver.bat" del "p_core_running_ver.bat"
if exist "s_core_running_ver.bat" del "s_core_running_ver.bat"
if exist "rdb_core_running_ver.bat" del "rdb_core_running_ver.bat"
if exist "rna_core_running_ver.bat" del "rna_core_running_ver.bat"
if exist "tmp_servers.bat" del "tmp_servers.bat"

if exist "ghdb_core_installed_ver.bat" del "ghdb_core_installed_ver.bat"
if exist "zydb_core_installed_ver.bat" del "zydb_core_installed_ver.bat"
if exist "ghdb_core_available_ver.bat" del "ghdb_core_available_ver.bat"
if exist "zydb_core_available_ver.bat" del "zydb_core_available_ver.bat"
if exist "ghdb_core_running_ver.bat" del "ghdb_core_running_ver.bat"
if exist "zydb_core_running_ver.bat" del "zydb_core_running_ver.bat"

::-----------------------------------------------------------------------------------
::All Gen
::-----------------------------------------------------------------------------------

cls
del dlprinstapp_en.exe
cls
del launch.ini
cls
del status.js
cls
del wrapper.log

::-----------------------------------------------------------------------------------
::3rd Gen
::-----------------------------------------------------------------------------------

cls
del popinstallstub.exe

cls
del "install_flash_player_10_active_x.exe"

::-----------------------------------------------------------------------------------
::2nd Gen
::-----------------------------------------------------------------------------------

cls
del "googlestubinst.exe"
cls
del "wrapper.ini"
cls
del "log.txt"
cls
del "license.txt"
cls
del "readme.txt"
cls
del "setup.ini"
cls
del "theUninstallFile.txt"
cls
del "version.txt"
cls
del unins000.*

::-----------------------------------------------------------------------------------
::1st Gen
::-----------------------------------------------------------------------------------

cls
del "1031buyframe.htm"
cls
del "1031buymenu.htm"
cls
del "1031pregame.htm"
cls
del "1031racnotinstalled.htm"
cls
del "1031strings.js"
if exist "1036buyframe.htm" del "1036buyframe.htm"
if exist "1036buymenu.htm" del "1036buymenu.htm"
if exist "1036pregame.htm" del "1036pregame.htm"
if exist "1036racnotinstalled.htm" del "1036racnotinstalled.htm"
if exist "1036strings.js" del "1036strings.js"
if exist "1040buyframe.htm" del "1040buyframe.htm"
if exist "1040buymenu.htm" del "1040buymenu.htm"
if exist "1040pregame.htm" del "1040pregame.htm"
if exist "1040racnotinstalled.htm" del "1040racnotinstalled.htm"
if exist "1040strings.js" del "1040strings.js"
if exist "1041buyframe.htm" del "1041buyframe.htm"
if exist "1041buymenu.htm" del "1041buymenu.htm"
if exist "1041pregame.htm" del "1041pregame.htm"
if exist "1041racnotinstalled.htm" del "1041racnotinstalled.htm"
if exist "1041strings.js" del "1041strings.js"
if exist "1043buyframe.htm" del "1043buyframe.htm"
if exist "1043buymenu.htm" del "1043buymenu.htm"
if exist "1043pregame.htm" del "1043pregame.htm"
if exist "1043racnotinstalled.htm" del "1043racnotinstalled.htm"
if exist "1043strings.js" del "1043strings.js"
if exist "3082buyframe.htm" del "3082buyframe.htm"
if exist "3082buymenu.htm" del "3082buymenu.htm"
if exist "3082pregame.htm" del "3082pregame.htm"
if exist "3082racnotinstalled.htm" del "3082racnotinstalled.htm"
if exist "3082strings.js" del "3082strings.js"
if exist "button_center.gif" del "button_center.gif"
if exist "button_left.gif" del "button_left.gif"
if exist "button_right.gif" del "button_right.gif"
if exist "butt_back.gif" del "butt_back.gif"
if exist "butt_back_over.gif" del "butt_back_over.gif"
if exist "butt_left.gif" del "butt_left.gif"
if exist "butt_next.gif" del "butt_next.gif"
if exist "butt_next_over.gif" del "butt_next_over.gif"
if exist "butt_right.gif" del "butt_right.gif"
if exist "buyframe.htm" del "buyframe.htm"
if exist "buymenu.htm" del "buymenu.htm"
if exist "contentbox.gif" del "contentbox.gif"
if exist "contentbox_bottom.gif" del "contentbox_bottom.gif"
if exist "contentbox_top.gif" del "contentbox_top.gif"
if exist "empty.gif" del "empty.gif"
if exist "fill.gif" del "fill.gif"
if exist "horzline.gif" del "horzline.gif"
if exist "launch.ini" del "launch.ini"
if exist "mainimage_bottom.gif" del "mainimage_bottom.gif"
if exist "mainimage_left.gif" del "mainimage_left.gif"
if exist "mainimage_right.gif" del "mainimage_right.gif"
if exist "mainimage_top.gif" del "mainimage_top.gif"
if exist "meter_bottom.gif" del "meter_bottom.gif"
if exist "meter_left.gif" del "meter_left.gif"
if exist "meter_lowerleft.gif" del "meter_lowerleft.gif"
if exist "meter_lowerright.gif" del "meter_lowerright.gif"
if exist "meter_right.gif" del "meter_right.gif"
if exist "meter_top.gif" del "meter_top.gif"
if exist "meter_upperleft.gif" del "meter_upperleft.gif"
if exist "meter_upperright.gif" del "meter_upperright.gif" 
if exist "OSD230.OSD" del "OSD230.OSD"
if exist "pregame.htm" del "pregame.htm"
if exist "racnotinstalled.htm" del "racnotinstalled.htm"
if exist "spacer.gif" del "spacer.gif"
if exist "status.js" del "status.js"
if exist "strings.js" del "strings.js"
if exist "Wrapper.cab" del "Wrapper.cab"
if exist "wrapper.ini" del "wrapper.ini"
if exist "wrapper.log" del "wrapper.log"

::-----------------------------------------------------------------------------------
:: Other Misc
::-----------------------------------------------------------------------------------

cls
del "*.uratemp"

cls
del "*_r1a.exe"

cls
del *.ura >nul



:end

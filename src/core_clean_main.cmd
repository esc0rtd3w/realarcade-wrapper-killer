@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Junk Files Cleaner +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_clean_main : loaded]
	pause>nul
)


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
if exist "status.cmd" del "status.cmd"
if exist "dbtemp.cmd" del "dbtemp.cmd"
if exist "unwrapcheck.cmd" del "unwrapcheck.cmd"
if exist "c_core_installed_ver.cmd" del "c_core_installed_ver.cmd"
if exist "d_core_installed_ver.cmd" del "d_core_installed_ver.cmd"
if exist "m_core_installed_ver.cmd" del "m_core_installed_ver.cmd"
if exist "p_core_installed_ver.cmd" del "p_core_installed_ver.cmd"
if exist "s_core_installed_ver.cmd" del "s_core_installed_ver.cmd"
if exist "rdb_core_installed_ver.cmd" del "rdb_core_installed_ver.cmd"
if exist "rna_core_installed_ver.cmd" del "rna_core_installed_ver.cmd"
if exist "rgsfull_core_installed_ver.cmd" del "rgsfull_core_installed_ver.cmd"
if exist "c_core_available_ver.cmd" del "c_core_available_ver.cmd"
if exist "d_core_available_ver.cmd" del "d_core_available_ver.cmd"
if exist "m_core_available_ver.cmd" del "m_core_available_ver.cmd"
if exist "p_core_available_ver.cmd" del "p_core_available_ver.cmd"
if exist "s_core_available_ver.cmd" del "s_core_available_ver.cmd"
if exist "rdb_core_available_ver.cmd" del "rdb_core_available_ver.cmd"
if exist "rna_core_available_ver.cmd" del "rna_core_available_ver.cmd"
if exist "rgsfull_core_available_ver.cmd" del "rgsfull_core_available_ver.cmd"
if exist "c_core_running_ver.cmd" del "c_core_running_ver.cmd"
if exist "d_core_running_ver.cmd" del "d_core_running_ver.cmd"
if exist "m_core_running_ver.cmd" del "m_core_running_ver.cmd"
if exist "p_core_running_ver.cmd" del "p_core_running_ver.cmd"
if exist "s_core_running_ver.cmd" del "s_core_running_ver.cmd"
if exist "rdb_core_running_ver.cmd" del "rdb_core_running_ver.cmd"
if exist "rna_core_running_ver.cmd" del "rna_core_running_ver.cmd"
if exist "rgsfull_core_running_ver.cmd" del "rgsfull_core_running_ver.cmd"
if exist "tmp_servers.cmd" del "tmp_servers.cmd"

if exist "ghdb_core_installed_ver.cmd" del "ghdb_core_installed_ver.cmd"
if exist "zydb_core_installed_ver.cmd" del "zydb_core_installed_ver.cmd"
if exist "ghdb_core_available_ver.cmd" del "ghdb_core_available_ver.cmd"
if exist "zydb_core_available_ver.cmd" del "zydb_core_available_ver.cmd"
if exist "ghdb_core_running_ver.cmd" del "ghdb_core_running_ver.cmd"
if exist "zydb_core_running_ver.cmd" del "zydb_core_running_ver.cmd"

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

:: Remove stub folder if exists (20160429)
if exist "stub" rd /s /q "stub"

:: IDK where the hell these came from....lol (20160429)
::del /f /s /q "%windir%\unRealArcade.INI"
::del /f /s /q "%windir%\unRealArcade_original.INI"
::del /f /s /q "%windir%\unRealArcade2.INI"
::del /f /s /q "%windir%\unRealArcade3.INI"

:: Eyeblaster and EB Ad Serving Files (Added 20200517)
:: Found in Rainforest Adventure [Unlimited rainforestadventureep_free.rgs]
:: These cannot be removed and game still loads. Leave here for historical purposes
::if exist "%cd%\Eyeblaster" rd /s /q "%cd%\Eyeblaster"
::if exist "ebadservingt25.dll" del "ebadservingt25.dll"
::if exist "js32t.dll" del "js32t.dll"
::if exist "nspr4t.dll" del "nspr4t.dll"

:: Can remove these and game loads fine
if exist "buy.gif" del "buy.gif"
if exist "frame_blank.gif" del "frame_blank.gif"
if exist "frame_footer.gif" del "frame_footer.gif"
if exist "frame_footer_skip.gif" del "frame_footer_skip.gif"
if exist "frame_reminder.gif" del "frame_reminder.gif"
if exist "fromfullscreen.gif" del "fromfullscreen.gif"
if exist "skip.gif" del "skip.gif"
if exist "tofullscreen.gif" del "tofullscreen.gif"

cls


:end

if %testmode%==1 (
	echo [core_clean_main : finished]
	pause>nul
)

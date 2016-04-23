@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Pre-Clean Files +-^~`+-.)     [...cRypTiCwaRe 2o16...]


:: Sonic The Hedgehog Multi Fix
if exist "sonic.exe" call "core_sonic_multi_fix.bat"
if exist "sonic2.exe" call "core_sonic_multi_fix.bat"
if exist "sonic3.exe" call "core_sonic_multi_fix.bat"
if exist "sonic_spinball.exe" call "core_sonic_multi_fix.bat"



::-----------------------------------------------------------------------------------
:: Checking For and Deleting Old Files, if exist
::-----------------------------------------------------------------------------------
:cleanme

:: Added for new RGS Loader 2.0
if exist "generic.spc" del "generic.spc

if exist "order demonstar online.lnk" del "order demonstar online.lnk"

if exist "launch.ini" del "launch.ini"
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

if exist "ghdbtemp.bat" del "ghdbtemp.bat"
if exist "zydbtemp.bat" del "zydbtemp.bat"

if exist "ghdb_core_installed_ver.bat" del "ghdb_core_installed_ver.bat"
if exist "zydb_core_installed_ver.bat" del "zydb_core_installed_ver.bat"
if exist "ghdb_core_available_ver.bat" del "ghdb_core_available_ver.bat"
if exist "zydb_core_available_ver.bat" del "zydb_core_available_ver.bat"
if exist "ghdb_core_running_ver.bat" del "ghdb_core_running_ver.bat"
if exist "zydb_core_running_ver.bat" del "zydb_core_running_ver.bat"



:end

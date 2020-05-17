@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Pre-Clean Files +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_clean_pre : loaded]
	pause>nul
)


:: Sonic The Hedgehog Multi Fix
if exist "sonic.exe" call "core_sonic_multi_fix.cmd"
if exist "sonic2.exe" call "core_sonic_multi_fix.cmd"
if exist "sonic3.exe" call "core_sonic_multi_fix.cmd"
if exist "sonic_spinball.exe" call "core_sonic_multi_fix.cmd"



::-----------------------------------------------------------------------------------
:: Checking For and Deleting Old Files, if exist
::-----------------------------------------------------------------------------------
:cleanme

:: Added for new RGS Loader 2.0
if exist "generic.spc" del "generic.spc

if exist "order demonstar online.lnk" del "order demonstar online.lnk"

if exist "launch.ini" del "launch.ini"
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

if exist "ghdbtemp.cmd" del "ghdbtemp.cmd"
if exist "zydbtemp.cmd" del "zydbtemp.cmd"

if exist "ghdb_core_installed_ver.cmd" del "ghdb_core_installed_ver.cmd"
if exist "zydb_core_installed_ver.cmd" del "zydb_core_installed_ver.cmd"
if exist "ghdb_core_available_ver.cmd" del "ghdb_core_available_ver.cmd"
if exist "zydb_core_available_ver.cmd" del "zydb_core_available_ver.cmd"
if exist "ghdb_core_running_ver.cmd" del "ghdb_core_running_ver.cmd"
if exist "zydb_core_running_ver.cmd" del "zydb_core_running_ver.cmd"



:end

if %testmode%==1 (
	echo [core_clean_pre : finished]
	pause>nul
)

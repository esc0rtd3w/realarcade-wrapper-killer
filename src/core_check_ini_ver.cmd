@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ INI File Version Check +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_check_ini_ver : loaded]
	pause>nul
)

::-----------------------------------------------------------------------------------
:: Checking INI version numbers and copying from \temp folder to rawk root if
:: installed version is lower
::-----------------------------------------------------------------------------------

::-----------------------------------------------------------------------------------
:: rawkdb.ini
::-----------------------------------------------------------------------------------

if not exist "%rawkroot%\rawkdb.ini" (
xcopy /e /q /y "%rawkroot%\temp\rawkdb.ini" "%rawkroot%" 
)

cls
inifile "%rawkroot%\rawkdb.ini" [core] rdb_core > "rdb_core_installed_ver.cmd"
call "rdb_core_installed_ver.cmd"
set rdb_core_installed=%rdb_core%

cls
inifile "%rawkroot%\temp\rawkdb.ini" [core] rdb_core > "rdb_core_running_ver.cmd"
call "rdb_core_running_ver.cmd"
set rdb_core_running=%rdb_core%

if %rdb_core_installed% lss %rdb_core_running% (
xcopy /e /q /y "%rawkroot%\temp\rawkdb.ini" "%rawkroot%" 
)


::-----------------------------------------------------------------------------------
:: dlc.ini
::-----------------------------------------------------------------------------------

if not exist "%rawkroot%\dlc.ini" (
xcopy /e /q /y "%rawkroot%\temp\dlc.ini" "%rawkroot%" 
)

cls
inifile "%rawkroot%\dlc.ini" [core] d_core > "d_core_installed_ver.cmd"
call "d_core_installed_ver.cmd"
set d_core_installed=%d_core%

cls
inifile "%rawkroot%\temp\dlc.ini" [core] d_core > "d_core_running_ver.cmd"
call "d_core_running_ver.cmd"
set d_core_running=%d_core%

if %d_core_installed% lss %d_core_running% (
xcopy /e /q /y "%rawkroot%\temp\dlc.ini" "%rawkroot%" 
)


::-----------------------------------------------------------------------------------
:: patch.ini
::-----------------------------------------------------------------------------------

if not exist "%rawkroot%\patch.ini" (
xcopy /e /q /y "%rawkroot%\temp\patch.ini" "%rawkroot%" 
)

cls
inifile "%rawkroot%\patch.ini" [core] p_core > "p_core_installed_ver.cmd"
call "p_core_installed_ver.cmd"
set p_core_installed=%p_core%

cls
inifile "%rawkroot%\temp\patch.ini" [core] p_core > "p_core_running_ver.cmd"
call "p_core_running_ver.cmd"
set p_core_running=%p_core%

if %p_core_installed% lss %p_core_running% (
xcopy /e /q /y "%rawkroot%\temp\patch.ini" "%rawkroot%" 
)

::-----------------------------------------------------------------------------------
:: rgsfull.ini
::-----------------------------------------------------------------------------------

if not exist "%rawkroot%\rgsfull.ini" (
xcopy /e /q /y "%rawkroot%\temp\rgsfull.ini" "%rawkroot%" 
)

cls
inifile "%rawkroot%\rgsfull.ini" [core] rgsfull_core > "rgsfull_core_installed_ver.cmd"
call "rgsfull_core_installed_ver.cmd"
set rgsfull_core_installed=%rgsfull_core%

cls
inifile "%rawkroot%\temp\rgsfull.ini" [core] rgsfull_core > "rgsfull_core_running_ver.cmd"
call "rna_core_running_ver.cmd"
set rgsfull_core_running=%rgsfull_core%

if %rgsfull_core_installed% lss %rgsfull_core_running% (
xcopy /e /q /y "%rawkroot%\temp\rgsfull.ini" "%rawkroot%" 
)

::-----------------------------------------------------------------------------------
:: rnarcade.ini
::-----------------------------------------------------------------------------------

if not exist "%rawkroot%\rnarcade.ini" (
xcopy /e /q /y "%rawkroot%\temp\rnarcade.ini" "%rawkroot%" 
)

cls
inifile "%rawkroot%\rnarcade.ini" [core] rna_core > "rna_core_installed_ver.cmd"
call "rna_core_installed_ver.cmd"
set rna_core_installed=%rna_core%

cls
inifile "%rawkroot%\temp\rnarcade.ini" [core] rna_core > "rna_core_running_ver.cmd"
call "rna_core_running_ver.cmd"
set rna_core_running=%rna_core%

if %rna_core_installed% lss %rna_core_running% (
xcopy /e /q /y "%rawkroot%\temp\rnarcade.ini" "%rawkroot%" 
)

::-----------------------------------------------------------------------------------
:: servers.ini
::-----------------------------------------------------------------------------------

if not exist "%rawkroot%\servers.ini" (
xcopy /e /q /y "%rawkroot%\temp\servers.ini" "%rawkroot%" 
)

cls
inifile "%rawkroot%\servers.ini" [core] s_core > "s_core_installed_ver.cmd"
call "s_core_installed_ver.cmd"
set s_core_installed=%s_core%

cls
inifile "%rawkroot%\temp\servers.ini" [core] s_core > "s_core_running_ver.cmd"
call "s_core_running_ver.cmd"
set s_core_running=%s_core%

if %s_core_installed% lss %s_core_running% (
xcopy /e /q /y "%rawkroot%\temp\servers.ini" "%rawkroot%" 
)

::-----------------------------------------------------------------------------------
:: ghdb.ini
::-----------------------------------------------------------------------------------

if not exist "%rawkroot%\ghdb.ini" (
xcopy /e /q /y "%rawkroot%\temp\ghdb.ini" "%rawkroot%" 
)

cls
inifile "%rawkroot%\ghdb.ini" [core] ghdb_core > "ghdb_core_installed_ver.cmd"
call "ghdb_core_installed_ver.cmd"
set ghdb_core_installed=%ghdb_core%

cls
inifile "%rawkroot%\temp\ghdb.ini" [core] ghdb_core > "ghdb_core_running_ver.cmd"
call "ghdb_core_running_ver.cmd"
set ghdb_core_running=%ghdb_core%

if %ghdb_core_installed% lss %ghdb_core_running% (
xcopy /e /q /y "%rawkroot%\temp\ghdb.ini" "%rawkroot%" 
)

::-----------------------------------------------------------------------------------
:: zydb.ini
::-----------------------------------------------------------------------------------

if not exist "%rawkroot%\zydb.ini" (
xcopy /e /q /y "%rawkroot%\temp\zydb.ini" "%rawkroot%" 
)

cls
inifile "%rawkroot%\zydb.ini" [core] zydb_core > "zydb_core_installed_ver.cmd"
call "zydb_core_installed_ver.cmd"
set zydb_core_installed=%zydb_core%

cls
inifile "%rawkroot%\temp\zydb.ini" [core] zydb_core > "zydb_core_running_ver.cmd"
call "zydb_core_running_ver.cmd"
set zydb_core_running=%zydb_core%

if %zydb_core_installed% lss %zydb_core_running% (
xcopy /e /q /y "%rawkroot%\temp\zydb.ini" "%rawkroot%" 
)



:end

if %testmode%==1 (
	echo [core_check_ini_ver : finished]
	pause>nul
)

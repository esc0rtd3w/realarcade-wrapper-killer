@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Update Mode +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_update : loaded]
	pause>nul
)


cls
echo Online Updates are currently disabled!
echo.
echo.
%waitfor% 5000

goto end

::-----------------------------------------------------------------------------------
:: Checking for WGET
::-----------------------------------------------------------------------------------

cls
if not exist "%systemroot%\system32\wget.exe" "%rawkroot%\wget_apply.exe"

::-----------------------------------------------------------------------------------
:: Setting Server Sources
::-----------------------------------------------------------------------------------

cls
inifile "%rawkroot%\servers.ini" [server1] url > "tmp_servers.cmd"
::inifile "%rawkroot%\servers.ini" [server1] filepath >> "tmp_servers.cmd"
::inifile "%rawkroot%\servers.ini" [server2] url >> "tmp_servers.cmd"
::inifile "%rawkroot%\servers.ini" [server2] filepath >> "tmp_servers.cmd"
call "tmp_servers.cmd"
set server1=%url%

::-----------------------------------------------------------------------------------
:: Comment GOTO to enable updates
::-----------------------------------------------------------------------------------

::goto disabled

::-----------------------------------------------------------------------------------
:: Checking version numbers for INI's
::-----------------------------------------------------------------------------------

::-----------------------------------------------------------------------------------
:: Main Game Database (rawkdb.ini)
::-----------------------------------------------------------------------------------

cls
:rawkdb1
wget -p -P"%rawkroot%\update\" -N -k "%server1%/rawkdb.ini"

if not exist "%rawkroot%\update\rawkdb.ini" (
set rdb_core_available=0
goto rawkdb2
)

inifile "%rawkroot%\update\rawkdb.ini" [core] rdb_core > "rdb_core_available_ver.cmd"
call "rdb_core_available_ver.cmd"
set rdb_core_available=%rdb_core%

:rawkdb2
cls
inifile "%rawkroot%\rawkdb.ini" [core] rdb_core > "rdb_core_installed_ver.cmd"
call "rdb_core_installed_ver.cmd"
set rdb_core_installed=%rdb_core%

if %rdb_core_available%==0 goto rawkdb4

:rawkdb3
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Update Info rawkdb.ini +-^~`+-.)     [...cRypTiCwaRe 2o2o...]
cls
echo File: rawkdb.ini
echo.
echo.
echo Installed Version: %rdb_core_installed%
echo.
echo Available Version: %rdb_core_available%
echo.
echo.
if %rdb_core_installed% equ %rdb_core_available% echo You Have The Latest Version.
echo.
if %rdb_core_installed% lss %rdb_core_available% xcopy /e /q /y "%rawkroot%\update\rawkdb.ini" "%rawkroot%" 
if %rdb_core_installed% lss %rdb_core_available% echo You Have Been Updated To The Latest Version.
echo.
if %rdb_core_installed% gtr %rdb_core_available% echo You Have An Early BETA Release or Unreleased Version.
echo.
echo.
echo Press any key to check next file....
pause>nul
goto dlc1

:rawkdb4
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Update Info rawkdb.ini +-^~`+-.)     [...cRypTiCwaRe 2o2o...]
cls
echo File: rawkdb.ini
echo.
echo.
echo Installed Version: %rdb_core_installed%
echo.
echo Available Version: No Update File Found!
echo.
echo.
echo Press any key to check next file....
pause>nul


::-----------------------------------------------------------------------------------
:: Downloadable Content Database (dlc.ini)
::-----------------------------------------------------------------------------------

cls
:dlc1
wget -p -P"%rawkroot%\update" -N -k "%server1%/dlc.ini"

if not exist "%rawkroot%\update\dlc.ini" (
set d_core_available=0
goto dlc2
)

inifile "%rawkroot%\update\dlc.ini" [core] d_core > "d_core_available_ver.cmd"
call "d_core_available_ver.cmd"
set d_core_available=%d_core%

:dlc2
cls
inifile "%rawkroot%\dlc.ini" [core] d_core > "d_core_installed_ver.cmd"
call "d_core_installed_ver.cmd"
set d_core_installed=%d_core%

if %d_core_available%==0 goto dlc4

:dlc3
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Update Info dlc.ini +-^~`+-.)     [...cRypTiCwaRe 2o2o...]
cls
echo File: dlc.ini
echo.
echo.
echo Installed Version: %d_core_installed%
echo.
echo Available Version: %d_core_available%
echo.
echo.
if %d_core_installed% equ %d_core_available% echo You Have The Latest Version.
echo.
if %d_core_installed% lss %d_core_available% xcopy /e /q /y "%rawkroot%\update\dlc.ini" "%rawkroot%"
if %d_core_installed% lss %d_core_available% echo You Have Been Updated To The Latest Version.
echo.
if %d_core_installed% gtr %d_core_available% echo You Have An Early BETA Release or Unreleased Version.
echo.
echo.
echo Press any key to check next file....
pause>nul
goto patch1

:dlc4
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Update Info dlc.ini +-^~`+-.)     [...cRypTiCwaRe 2o2o...]
cls
echo File: dlc.ini
echo.
echo.
echo Installed Version: %d_core_installed%
echo.
echo Available Version: No Update File Found!
echo.
echo.
echo Press any key to check next file....
pause>nul


::-----------------------------------------------------------------------------------
:: Game Patching and Reverse Engineering Database (patch.ini)
::-----------------------------------------------------------------------------------

cls
:patch1
wget -p -P"%rawkroot%\update" -N -k "%server1%/patch.ini"

if not exist "%rawkroot%\update\patch.ini" (
set p_core_available=0
goto patch2
)

inifile "%rawkroot%\update\patch.ini" [core] p_core > "p_core_available_ver.cmd"
call "p_core_available_ver.cmd"
set p_core_available=%p_core%

:patch2
cls
inifile "%rawkroot%\patch.ini" [core] p_core > "p_core_installed_ver.cmd"
call "p_core_installed_ver.cmd"
set p_core_installed=%p_core%

if %p_core_available%==0 goto patch4

:patch3
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Update Info patch.ini +-^~`+-.)     [...cRypTiCwaRe 2o2o...]
cls
echo File: patch.ini
echo.
echo.
echo Installed Version: %p_core_installed%
echo.
echo Available Version: %p_core_available%
echo.
echo.
if %p_core_installed% equ %p_core_available% echo You Have The Latest Version.
echo.
if %p_core_installed% lss %p_core_available% xcopy /e /q /y "%rawkroot%\update\patch.ini" "%rawkroot%"
if %p_core_installed% lss %p_core_available% echo You Have Been Updated To The Latest Version.
echo.
if %p_core_installed% gtr %p_core_available% echo You Have An Early BETA Release or Unreleased Version.
echo.
echo.
echo Press any key to check next file....
pause>nul
goto rna1

:patch4
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Update Info patch.ini +-^~`+-.)     [...cRypTiCwaRe 2o2o...]
cls
echo File: patch.ini
echo.
echo.
echo Installed Version: %p_core_installed%
echo.
echo Available Version: No Update File Found!
echo.
echo.
echo Press any key to check next file....
pause>nul


::-----------------------------------------------------------------------------------
:: RealArcade v1.4 Player Custom Settings Database (rnarcade.ini)
::-----------------------------------------------------------------------------------

cls
:rna1
wget -p -P"%rawkroot%\update" -N -k "%server1%/rnarcade.ini"

if not exist "%rawkroot%\update\rnarcade.ini" (
set rna_core_available=0
goto rna2
)

inifile "%rawkroot%\update\rnarcade.ini" [core] rna_core > "rna_core_available_ver.cmd"
call "rna_core_available_ver.cmd"
set rna_core_available=%rna_core%

:rna2
cls
inifile "%rawkroot%\rnarcade.ini" [core] rna_core > "rna_core_installed_ver.cmd"
call "rna_core_installed_ver.cmd"
set rna_core_installed=%rna_core%

if %rna_core_available%==0 goto rna4

:rna3
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Update Info rnarcade.ini +-^~`+-.)     [...cRypTiCwaRe 2o2o...]
cls
echo File: rnarcade.ini
echo.
echo.
echo Installed Version: %rna_core_installed%
echo.
echo Available Version: %rna_core_available%
echo.
echo.
if %rna_core_installed% equ %rna_core_available% echo You Have The Latest Version.
echo.
if %rna_core_installed% lss %rna_core_available% xcopy /e /q /y "%rawkroot%\update\rnarcade.ini" "%rawkroot%"
if %rna_core_installed% lss %rna_core_available% echo You Have Been Updated To The Latest Version.
echo.
if %rna_core_installed% gtr %rna_core_available% echo You Have An Early BETA Release or Unreleased Version.
echo.
echo.
echo Press any key to check next file....
pause>nul
goto servers1

:rna4
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Update Info rnarcade.ini +-^~`+-.)     [...cRypTiCwaRe 2o2o...]
cls
echo File: rnarcade.ini
echo.
echo.
echo Installed Version: %rna_core_installed%
echo.
echo Available Version: No Update File Found!
echo.
echo.
echo Press any key to check next file....
pause>nul


::-----------------------------------------------------------------------------------
:: INI Update Server Database (servers.ini)
::-----------------------------------------------------------------------------------

cls
:servers1
wget -p -P"%rawkroot%\update" -N -k "%server1%/servers.ini"

if not exist "%rawkroot%\update\servers.ini" (
set s_core_available=0
goto servers2
)

inifile "%rawkroot%\update\servers.ini" [core] s_core > "s_core_available_ver.cmd"
call "s_core_available_ver.cmd"
set s_core_available=%s_core%

:servers2
cls
inifile "%rawkroot%\servers.ini" [core] s_core > "s_core_installed_ver.cmd"
call "s_core_installed_ver.cmd"
set s_core_installed=%s_core%

if %s_core_available%==0 goto servers4

:servers3
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Update Info servers.ini +-^~`+-.)     [...cRypTiCwaRe 2o2o...]
cls
echo File: servers.ini
echo.
echo.
echo Installed Version: %s_core_installed%
echo.
echo Available Version: %s_core_available%
echo.
echo.
if %s_core_installed% equ %s_core_available% echo You Have The Latest Version.
echo.
if %s_core_installed% lss %s_core_available% xcopy /e /q /y "%rawkroot%\update\servers.ini" "%rawkroot%"
if %s_core_installed% lss %s_core_available% echo You Have Been Updated To The Latest Version.
echo.
if %s_core_installed% gtr %s_core_available% echo You Have An Early BETA Release or Unreleased Version.
echo.
echo.
echo Press any key to continue the unwrapping process....
pause>nul
goto finished

:servers4
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Update Info servers.ini +-^~`+-.)     [...cRypTiCwaRe 2o2o...]
cls
echo File: servers.ini
echo.
echo.
echo Installed Version: %s_core_installed%
echo.
echo Available Version: No Update File Found!
echo.
echo.
echo Press any key to continue the unwrapping process....
pause>nul



::-----------------------------------------------------------------------------------
:: Stub Update Server Database (stub.ini)
::-----------------------------------------------------------------------------------

cls
:stub1
wget -p -P"%rawkroot%\update" -N -k "%server1%/stub.ini"

if not exist "%rawkroot%\update\stub.ini" (
set stub_core_available=0
goto stub2
)

inifile "%rawkroot%\update\stub.ini" [core] stub_core > "stub_core_available_ver.cmd"
call "stub_core_available_ver.cmd"
set stub_core_available=%stub_core%

:stub2
cls
inifile "%rawkroot%\stub.ini" [core] stub_core > "stub_core_installed_ver.cmd"
call "stub_core_installed_ver.cmd"
set stub_core_installed=%stub_core%

if %stub_core_available%==0 goto stub4

:stub3
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Update Info servers.ini +-^~`+-.)     [...cRypTiCwaRe 2o2o...]
cls
echo File: stub.ini
echo.
echo.
echo Installed Version: %stub_core_installed%
echo.
echo Available Version: %stub_core_available%
echo.
echo.
if %stub_core_installed% equ %stub_core_available% echo You Have The Latest Version.
echo.
if %stub_core_installed% lss %stub_core_available% xcopy /e /q /y "%rawkroot%\update\stub.ini" "%rawkroot%"
if %stub_core_installed% lss %stub_core_available% echo You Have Been Updated To The Latest Version.
echo.
if %stub_core_installed% gtr %stub_core_available% echo You Have An Early BETA Release or Unreleased Version.
echo.
echo.
echo Press any key to continue the unwrapping process....
pause>nul
goto finished

:stub4
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Update Info servers.ini +-^~`+-.)     [...cRypTiCwaRe 2o2o...]
cls
echo File: stub.ini
echo.
echo.
echo Installed Version: %stub_core_installed%
echo.
echo Available Version: No Update File Found!
echo.
echo.
echo Press any key to continue the unwrapping process....
pause>nul


:finished
goto end

::-----------------------------------------------------------------------------------
:: GOTO here to disable updates
::-----------------------------------------------------------------------------------

:disabled
cls
echo currently disabled!
echo.
echo Press any key to continue the unwrapping process....
pause>nul

:end

if %testmode%==1 (
	echo [core_update : finished]
	pause>nul
)

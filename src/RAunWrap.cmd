@echo off
title RealArcade Wrapper Killer [Getting Version Info...]    (.-+'~^-+ Demo unWrapper +-^~`+-.)     [...cRypTiCwaRe 2o16...]


::-----------------------------------------------------------------------------------
::RealArcade Wrapper Killer Release Version
::-----------------------------------------------------------------------------------

set rawkver=5.6



::-----------------------------------------------------------------------------------
:: This is the MAIN CUSTOM LOADER SECTION silent installer (added 20110106)
::-----------------------------------------------------------------------------------

:: Old v1.0 RGS Loader
::%rgsloader%
"C:\Program Files\unRealArcade\temp\loaderRGSv1.exe"
::regedit /s "C:\Program Files\unRealArcade\loaderRGSv1\setRGS.reg"

:: New v2.0 RGS Loader
::%rgsloader2%
"C:\Program Files\unRealArcade\temp\loaderRGSv2.exe"
regedit /s "C:\Program Files\unRealArcade\loaderRGSv2\setRGS.reg"

:: New RGA Loader
::%rgsloader3%
"C:\Program Files\unRealArcade\temp\loaderRGA.exe"
regedit /s "C:\Program Files\unRealArcade\loaderRGA\setRGA.reg"

:: New DMG Loader
::%rgsloader4%
"C:\Program Files\unRealArcade\temp\loaderDMG.exe"
regedit /s "C:\Program Files\unRealArcade\loaderDMG\setDMG.reg"

:: New RFS Loader
::%rgsloader5%
"C:\Program Files\unRealArcade\temp\loaderRFS.exe"
regedit /s "C:\Program Files\unRealArcade\loaderRFS\setRFS.reg"

::-----------------------------------------------------------------------------------
:: Using ORIGINAL RealArcade Uninstaller (added 20110221)
::--------------------------------------------------------
"C:\Program Files\unRealArcade\temp\rnuninst.exe"


:: RA uninstall set to "0" before restart0 
set rauninstalled=0

::-----------------------------------------------------------------------------------
:: Setting the "baknow" flag to 0 before the restart point so if a backup has been
:: made, it will have a value and set the TIMERFIX variable to the default setting
::-----------------------------------------------------------------------------------

set baknow=0

::-----------------------------------------------------------------------------------
:: Setting the "restoredone" flag to 0 before the restart point to prevent the license
:: screen from displaying twice it returning from a restored EXE file.
::-----------------------------------------------------------------------------------

set restoredone=0

::-----------------------------------------------------------------------------------
:: Setting the "rarexists" flag to 0 before the restart point so if a restore has to
:: be made, it will have a value and set the TIMERFIX variable to the default setting
::-----------------------------------------------------------------------------------

set rarexists=0

::-----------------------------------------------------------------------------------
:: Main Restart Point (This is where backup/restore returns to)
::-----------------------------------------------------------------------------------

:restart0

:: Check For Needed Dependencies (Added 20160526)
call "core_check_dependencies.cmd"

:: Make Temp Folder if One Does Not Exist
if not exist "c:\temp" md "c:\temp"

::-----------------------------------------------------------------------------------
:: Check for any NON-RGS games
::-----------------------------------------------------------------------------------

:: Check for a Gamehouse game first (added 20131107)
:: Check for a Zylom game next (added 20131108)

set forceExit=0

set gh_core_ver=1.0.1
set zy_core_ver=1.0.0

set ghFlag=0
set zyFlag=0

if exist "GameuxInstallHelper.dll" set ghFlag=1
if exist "GDF.dll" set ghFlag=1
if exist "GDFUninstall.exe" set ghFlag=1
if exist "gameinst.xml" set ghFlag=1
if exist "*_RADRM.dll" set ghFlag=1
::if "%cd%" == "%ghroot%\%GameName%" set ghFlag=1
if "%cd%" == "C:\GameHouse Games" set ghFlag=1
if "%cd%" == "C:\Program Files\GameHouse Games" set ghFlag=1
if "%cd%" == "C:\Program Files (x86)\GameHouse Games"  set ghFlag=1

if %ghFlag%==1 set forceExit=1
::if %ghFlag%==1 call "core_check_non_rgs.cmd"
::if %ghFlag%==1 call "core_check_exit_status.cmd"


if exist "iAmZylom.tmp" set zyFlag=1

if %zyFlag%==1 set forceExit=1
::if %zyFlag%==1 call "core_check_non_rgs.cmd"
::if %zyFlag%==1 call "core_check_exit_status.cmd"



::-----------------------------------------------------------------------------------
:: Check for a RealArcade software uninstall flag
::-----------------------------------------------------------------------------------

:: If Wrapper Killer initiated an RA uninstall, set flag back to "0"
if %rauninstalled%==1 set rauninstalled=0


::-----------------------------------------------------------------------------------
:: Set Main Text Color as Yellow
::-----------------------------------------------------------------------------------

color 0e

::-----------------------------------------------------------------------------------
:: If a backup file (RAR) is found, it will change the text color to Green
::-----------------------------------------------------------------------------------

if exist *.rar color 0a

::-----------------------------------------------------------------------------------
:: If a no EXE files are found, it will change the text color to Grey
::-----------------------------------------------------------------------------------

if not exist *.exe color 08

::-----------------------------------------------------------------------------------
:: Setting the "restartcore" flag to 0. This prevents a looping effect.
::-----------------------------------------------------------------------------------

set restartcore=0


::-----------------------------------------------------------------------------------
::RealArcade Wrapper Killer - Core Version (Stable)
::THIS VERSION NUMBER MUST BE INCREASED IF ANYTHING IS MODIFIED IN THIS FILE OR 
:: DESCENDENT CORE BATCH FILES!!!
::-----------------------------------------------------------------------------------

set rawkcore=3.0.8

::-----------------------------------------------------------------------------------
:: Loader Versions (used for debug output only)
::-----------------------------------------------------------------------------------

set rgs_loader_core=2.1.3
set rga_loader_core=1.0.2
set dmg_loader_core=1.0.1
set rfs_loader_core=1.0.2

::-----------------------------------------------------------------------------------
:: URA Downloader Version (used for debug output only)
::-----------------------------------------------------------------------------------

set uradl_core=0.3.0

::-----------------------------------------------------------------------------------
:: START Setting Global Path Variables
::-----------------------------------------------------------------------------------

call "core_set_global.cmd"



::-----------------------------------------------------------------------------------
:: Added 20120216
::
:: RNA Mod has been moved from being in a directory to being a RAR SFX archive.
::
:: Its variable is set globally and can be extracted if the RealArcade Player is
:: installed and the user wants to keep it.
::
:: Comment to disable.....obviously ;) 
::-----------------------------------------------------------------------------------

if exist "C:\Program Files\Real\RealArcade\RNArcade.exe" (
cls
%kill% "RNArcade.exe"
cls
"C:\Program Files\unRealArcade\temp\rnamod.exe"
cls
)

if exist "%ProgramFiles(x86)%\Real\RealArcade\RNArcade.exe" (
cls
%kill% "RNArcade.exe"
cls
"C:\Program Files\unRealArcade\temp\rnamod-x64.exe"
cls
)

::-----------------------------------------------------------------------------------
:: BEGIN Setting Other Version Numbers
::-----------------------------------------------------------------------------------

call "core_check_ini_ver.cmd"


::-----------------------------------------------------------------------------------
:: Checking for local copy of Wrapper Killer
::-----------------------------------------------------------------------------------

call "core_check_local_rawk.cmd"


::-----------------------------------------------------------------------------------
::Unpack RealArcade Wrapper Killer to use after RGS install and others
::-----------------------------------------------------------------------------------

call "core_rawk_unpack.cmd"


::-----------------------------------------------------------------------------------
::This forces the checking of current folder first (added 20110107)
::-----------------------------------------------------------------------------------

if "%cd%" == "C:\My Games" call "core_invalid_folder.cmd"


::-----------------------------------------------------------------------------------
:: Check if RealArcade Player is installed to default location (added 20110817)
::-----------------------------------------------------------------------------------

if not exist %raexec% set raexist=0
if exist %raexec% set raexist=1

::-----------------------------------------------------------------------------------
:: Developer Mode Control (0=Off) (1=On)
::-----------------------------------------------------------------------------------

set devmode=1


::-----------------------------------------------------------------------------------
:: Getting Database Core Version
::-----------------------------------------------------------------------------------

inifile "%rawkroot%\rawkdb.ini" [core] rdb_core > dbtemp.cmd
call dbtemp.cmd

::-----------------------------------------------------------------------------------
:: END Setting Other Version Numbers
::-----------------------------------------------------------------------------------


::-----------------------------------------------------------------------------------
:: Cleaning unused or already used temp batch files
::-----------------------------------------------------------------------------------

call "core_clean_pre.cmd"


:: Only triggered by a Gamehouse or Zylom game
if %forceExit%==1 goto end


::-----------------------------------------------------------------------------------
:: HOTKEY SWITCHES
::-----------------------------------------------------------------------------------

call "core_hotkey.cmd"


::-----------------------------------------------------------------------------------
:: FORCE OVERRIDE DEBUG and RESET OPTIONS (small time window)
::-----------------------------------------------------------------------------------

call "core_override.cmd"


::-----------------------------------------------------------------------------------
:: Check for RealArcade removal flag (added 20130611)
::-----------------------------------------------------------------------------------

if %rauninstall%==1 call "core_config_ra_player.cmd"
if %rauninstalled%==1 goto restart0


::-----------------------------------------------------------------------------------
:: Check for launch of Web Downloader (added 20130611)
::-----------------------------------------------------------------------------------

if %launchwebdl%==1 goto webdl
if %launchwebdl%==0 goto startnow

goto startnow


:webdl

cls
echo Once the URA Downloader is closed, the Wrapper Killer will restart....
echo.
echo.
%webdlpath%

::goto startnow
goto restart0



:startnow

::-----------------------------------------------------------------------------------
:: Check if ADVANCED Loading Options was selected or not
::-----------------------------------------------------------------------------------

if %advancedloadoptions%==1 call "core_advanced_load_options.cmd"
if %advancedloadoptions%==1 goto restart0

::-----------------------------------------------------------------------------------
:: Set flag to "0" to accomodate games that require special handling from crashing
::-----------------------------------------------------------------------------------

set handler=0

::-----------------------------------------------------------------------------------
:: REGBLOCK CHECK AND UPDATE
::-----------------------------------------------------------------------------------

call "core_reg_check.cmd"

::-----------------------------------------------------------------------------------
:: Checking Reset Flag
::-----------------------------------------------------------------------------------

if %reset%==1 call "core_reset.cmd"

::-----------------------------------------------------------------------------------
:: Checking Clear Cache Flag
::-----------------------------------------------------------------------------------

if %clearcache%==1 call "core_clear_cache.cmd"

::-----------------------------------------------------------------------------------
:: Check For Regblock Hack Remove Already Applied
::-----------------------------------------------------------------------------------

if exist %systemroot%\system32\rawkreg.ok goto skipreg

::-----------------------------------------------------------------------------------
:: DISABLING OLDER NON-WORKING OR PARTIALLY WORKING REG HACKS
::-----------------------------------------------------------------------------------

call "core_disable_old_reg_hacks.cmd"


:skipreg
::-----------------------------------------------------------------------------------
:: Checking Update Flag
::-----------------------------------------------------------------------------------

if %updatedb%==1 goto upddbnow

cls
goto skipupd

:upddbnow

::-----------------------------------------------------------------------------------
:: START UPDATES
::-----------------------------------------------------------------------------------
call "core_update.cmd"

:skipupd
::-----------------------------------------------------------------------------------
:: Re-adding default license keys (hidden)
::-----------------------------------------------------------------------------------

regedit /s "rawk_licensekeys.reg">nul

::-----------------------------------------------------------------------------------
:: Re-adding player preferences (hidden)
::-----------------------------------------------------------------------------------

regedit /s "rawk_prefs.reg">nul

::-----------------------------------------------------------------------------------
:: Bypass Demo Windows Launch Hack
::-----------------------------------------------------------------------------------

echo [Main] > launch.ini
echo GameName= >> launch.ini

::-----------------------------------------------------------------------------------
:: Setting Game name read from parent folder name
::-----------------------------------------------------------------------------------

for %%* in (.) do set GameName=%%~n*


::-----------------------------------------------------------------------------------
:: Checking for EXTRACT ONLY patched exe
::-----------------------------------------------------------------------------------
if exist "*_extract_only.exe" (
ren "*_extract_only.exe" "*_extract_only.exe.bak"
)


::-----------------------------------------------------------------------------------
:: Checking for RGA v2.1+ - web-installer based games
::-----------------------------------------------------------------------------------

:: DISABLED ON 20131128 BECAUSE GH GAMES ARE NOW DIRECTLY SUPPORTED!
::call "core_rga_check.cmd"


::-----------------------------------------------------------------------------------
:: Checking for games that have files that need renamed (periods, special
:: characters, etc)
::-----------------------------------------------------------------------------------

call "core_file_rename.cmd"


::-----------------------------------------------------------------------------------
:: This forces the checking of RGS Unlock License Files (added 20110107)
:: Moved to execute after the GameName variable has been set (added 20110525)
::-----------------------------------------------------------------------------------

call "core_rgs_unlock_license.cmd"


::-----------------------------------------------------------------------------------
:: DELETING ALL OTHER EXE's OTHER THAN WRAPPED GAME EXE.
::-----------------------------------------------------------------------------------

call "core_clean_exe.cmd"


::-----------------------------------------------------------------------------------
:: Automatically check for multiple EXE files
::-----------------------------------------------------------------------------------

call "core_multiple_exe_check.cmd"

::-----------------------------------------------------------------------------------
:: Setting Wrapped Game EXE name
::-----------------------------------------------------------------------------------

for %%* in (*.exe) do set wrapped=%%~n*


::-----------------------------------------------------------------------------------
:: If RGS Pre-Release Install flag is set to "1" it will skip the rest and load
:: the installer
::-----------------------------------------------------------------------------------

if %rgspre%==1 call "core_rgs_pre_release.cmd"

::-----------------------------------------------------------------------------------
:: Checking if the Wrapper Killer should restart (applies to CLEARCACHE)
::-----------------------------------------------------------------------------------

if %restartcore%==1 goto restart0

::-----------------------------------------------------------------------------------
::Checking for improper launch at "My Games" root
::-----------------------------------------------------------------------------------

if "%GameName%"=="My Games" call "core_invalid_folder.cmd"

::-----------------------------------------------------------------------------------
:: Creating Backup if no RAR file exists, but skipping backup if a RAR file exists
::-----------------------------------------------------------------------------------
if exist *.rar goto bakfound
if not exist *.exe call "core_no_game_found.cmd"

if %quw%==0 call "core_backup.cmd"

::-----------------------------------------------------------------------------------
:: Checking Restore Hotkey. Called here if a RAR file exists
::-----------------------------------------------------------------------------------

:bakfound
if not exist *.exe set rarexists=1
if %wrestore%==1 call "core_restore.cmd"

::-----------------------------------------------------------------------------------
:: Checking if the Wrapper Killer should restart (applies to BACKUP and RESTORE)
::-----------------------------------------------------------------------------------

if %restartcore%==1 goto restart0

:skipback
::-----------------------------------------------------------------------------------
::Setting default TIMERFIX variable, skipped if 1st backup (DISABLED ON 08-02-2011)
::-----------------------------------------------------------------------------------

::if not %baknow%==1 set timerfix=5000

::-----------------------------------------------------------------------------------
:: Setting Defaults To "0"
::-----------------------------------------------------------------------------------

call "core_set_def_ini.cmd"

::-----------------------------------------------------------------------------------
:: Skip INI file load and check (will cause ALL games to show Not Verified on th
:: status screen)
::-----------------------------------------------------------------------------------


if %iniskip%==0 goto rartest
if %iniskip%==1 goto statcheck

::-----------------------------------------------------------------------------------
:: Workaround for checking if game has been unpacked already.
:: uses rawkdb.ini (part 1)
::-----------------------------------------------------------------------------------

:rartest
cls
if %rarexists%==1 goto rewrap
goto iniread

:rewrap
if not exist *.exe call "core_restore.cmd"
if %restartcore%==1 goto restart0

for %%* in (*.rar) do set wrapped2=%%~n*

::-----------------------------------------------------------------------------------
:: Workaround for checking if game has been unpacked already.
:: uses rawkdb.ini (part 2)
::-----------------------------------------------------------------------------------

cls
inifile "%rawkroot%\rawkdb.ini" [%wrapped2%] unwrapped > unwrapcheck.cmd
call "unwrapcheck.cmd"
if exist "%unwrapped%.exe" call "core_game_unpacked_ok.cmd"

::-----------------------------------------------------------------------------------
:: Begin INI Read
::-----------------------------------------------------------------------------------

:iniread
call "core_get_stats.cmd"

::-----------------------------------------------------------------------------------
:: Workaround if there are no variables set.
:: It checks ALL entries from the status.cmd, then assigns "0" to entry if the entry
:: tag is empty.
:: IF THIS IS NOT DONE, IT WILL CRASH IF THE GAME DOES NOT HAVE A SECTION IN THE
:: INI FILE.
::-----------------------------------------------------------------------------------

call "core_no_var_fix.cmd"

::-----------------------------------------------------------------------------------
:: Checking for games that share an EXE name.
:: If the "altid" variable is set to "None" then the batch will NOT be called.
:: If it is set to ANYTHING ELSE then the batch WILL be called.
::-----------------------------------------------------------------------------------

if not %altid%==None call "core_dupe_check.cmd"


:statcheck
::-----------------------------------------------------------------------------------
:: Show Stats on Main Screen
::-----------------------------------------------------------------------------------

if %quw%==0 call "core_show_stats.cmd"

:: If QuickUnwrap is set to "1", then a backup is created and jumps to patching
if %quw%==1 rar a -ep -ep1 -y -m0 "%wrapped%.rar" "%wrapped%.exe"

::-----------------------------------------------------------------------------------
:: Removing Hidden Attributes (fixes 5 Spots and others with shortcut fixes)
::-----------------------------------------------------------------------------------

attrib -h *.*

::-----------------------------------------------------------------------------------
:: Tag
::-----------------------------------------------------------------------------------

echo This game has been unpacked with the RealArcade Wrapper Killer v%rawkver% > rawk.id


::-----------------------------------------------------------------------------------
:: Configure and Launch RA Player
::-----------------------------------------------------------------------------------

:: disabled on 11-04-2010 in leu of the new patching system that bypasses RAC Checks
::
:: re-added on 20110818
::
:: This file no longer launches the RA Player, but rather allows the un-installation
:: and re-installation of it. Extensive testing has determined that having the
:: RA Player installed causes problems for some games that can be avoided by simply
:: just removing it. As the patching system improves and the "rawkdb.ini" file gets
:: updated with more hex addresses, this may no longer be needed.....again

:: Re-DISABLED on 20110819 due to stability issues and games not unpacking properly
::
::call "core_config_ra_player.cmd"

::-----------------------------------------------------------------------------------
:: Uncomment the next line to test WITHOUT regblock hacks
::-----------------------------------------------------------------------------------

::goto gamechk

::-----------------------------------------------------------------------------------
:: START Checking For Games That Require Registry Patches To Launch Without
:: RA Player.
:: Launching RA Player before game is launched appears to unpack ok on most
:: *_r1a games
::-----------------------------------------------------------------------------------

:: REGBLOCKS DISABLED ON 08-02-2011
::call "core_reg_set.cmd"


:gamechk

:: Disabling until the RealArcade uninstaller is working properly (added 20110819)
::if %rip%==1 %waitfor% 20000

::-----------------------------------------------------------------------------------
:: Manual Demo Type Override distinction from a failed unpack (added 20110817)
::-----------------------------------------------------------------------------------
set manualdto=0

::-----------------------------------------------------------------------------------
:: Check for Demo Type Override Flag
::-----------------------------------------------------------------------------------

if %dtor%==1 call "core_demo_type_override.cmd"

::-----------------------------------------------------------------------------------
:: GAME TYPE CHECKING PROCESS!!!!
::-----------------------------------------------------------------------------------

:: MOVED TO TRIGGER BEFORE OVERRIDE MENU (20131128)
:: Only triggered by a Gamehouse or Zylom game
::if %forceExit%==1 goto end

goto demoCheckMain


::-----------------------------------------------------------------------------------
:: This will check the %demotype% variable inside the rawkdb.ini file and jump
:: accordingly if exist - Added v4.7b2
:: Demo Types 1, 3 and 4 have alternate types for variations of the same style of
:: protection and/or naming scheme
::-----------------------------------------------------------------------------------

:demoCheckMain

if %demotype%==0 goto oldstyle
if %demotype%==1 call demo1
if %demotype%==1a call demo1a
if %demotype%==2 call demo2
if %demotype%==3 call demo3
if %demotype%==3a call demo3a
if %demotype%==4 call demo4
if %demotype%==4a call demo4a
if %demotype%==5 call demo5
if %demotype%==6 call demo6
if %demotype%==m call demoM
if %demotype%==M call demoM
if %demotype%==g call demoGH
if %demotype%==G call demoGH

goto lasttwo


:oldstyle
call "core_demo_type_check.cmd"


:lasttwo
if exist "*_r1a.exe" call demo1
if exist "delete.exe" call demo1




:fixmain
::-----------------------------------------------------------------------------------
:: BEGIN Fixes and Workarounds
::-----------------------------------------------------------------------------------

:: Fixes a successfully unpacked game returning the "No Game Found" error screen
if not exist *.exe goto skipfix
goto end

::-----------------------------------------------------------------------------------
:: END Fixes and Workarounds
::-----------------------------------------------------------------------------------

:skipfix
::-----------------------------------------------------------------------------------
:: No game found error
::-----------------------------------------------------------------------------------

call "core_no_game_found.cmd"


:end

:: Writing new INI output (dev use only)
:: Comment Out next line for release version
:: Only writing if the game is an RGS variant (added 20131128)
if %forceExit%==0 call "core_ini_output.cmd"
if %forceExit%==0 exit

:: Only triggered by a Gamehouse or Zylom game
if %ghFlag%==1 call "core_gamehouse_main.cmd"
::if %ghFlag%==1 call "core_gamehouse_hotkey.cmd"
::if %ghFlag%==1 call "core_gamehouse_override.cmd"

if %zyFlag%==1 call "core_zylom_main.cmd"
::if %zyFlag%==1 call "core_zylom_hotkey.cmd"
::if %zyFlag%==1 call "core_zylom_override.cmd"


:: Needed for CLI launch Only
::call "core_rawk_cleanup_loader.cmd"
if %forceExit%==1 call "core_rawk_cleanup_root.cmd"

exit


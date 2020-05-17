@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Debug Output +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_debug : loaded]
	pause>nul
)


color 0e
::-----------------------------------------------------------------------------------
:: Debug Output (USED FOR TESTING ONLY!)
::-----------------------------------------------------------------------------------

:status1
::-----------------------------------------------------------------------------------
:: Check for proper unpacking
::-----------------------------------------------------------------------------------

cls
echo Did This Game Unpack Properly? [Y/N]
echo.
echo.
echo Please Type y or n and Press ENTER
echo.
echo.
echo.
set /p status1=
echo.
echo.

::-----------------------------------------------------------------------------------
::Change input to a more readable output
::-----------------------------------------------------------------------------------

if %status1%==y set status1=OK
if %status1%==Y set status1=OK
if %status1%==OK goto status2
if %status1%==n set status1=Failed
if %status1%==N set status1=Failed
goto status2


:status2
::-----------------------------------------------------------------------------------
:: Check for proper desktop shortcut
::-----------------------------------------------------------------------------------

cls
echo Does This Games Desktop Shortcut Work Properly? [Y/N]
echo.
echo.
echo Please Type y or n and Press ENTER
echo.
echo.
echo.
set /p status2=
echo.
echo.

::-----------------------------------------------------------------------------------
::Change input to a more readable output
::-----------------------------------------------------------------------------------

if %status2%==y set status2=OK
if %status2%==Y set status2=OK
if %status2%==OK goto jpgchk
if %status2%==n set status2=Failed
if %status2%==N set status2=Failed


:jpgchk
::-----------------------------------------------------------------------------------
:: Check for Demo1a gameart.jpg
::-----------------------------------------------------------------------------------

cls
if exist "gameart.jpg" set gameart=y
if not exist "gameart.jpg" set gameart=n

::-----------------------------------------------------------------------------------
::Change input to a more readable output
::-----------------------------------------------------------------------------------

if %gameart%==y set gameart=Yes
if %gameart%==Y set gameart=Yes
if %gameart%==Yes goto comments
if %gameart%==n set gameart=No
if %gameart%==N set gameart=No

::-----------------------------------------------------------------------------------
:: Comments here
::-----------------------------------------------------------------------------------

:comments

cls
echo Please Type Any Additional Comments and Press ENTER
set /p comments=
echo.
echo.
echo.


::------------------------------------------
::DEBUGGING START
::------------------------------------------
cls
echo -----------------------------------------------
echo Unpacking Status and Debug Output
echo.
echo Created By: RealArcade Wrapper Killer v%rawkver%
echo.
echo Created On: %date% / %time%
echo -----------------------------------------------
echo.
echo.
echo -----------------------------------------------
echo Core Files and Modules Information
echo -----------------------------------------------
echo.
echo Loaded Debug Module: %0
echo.
echo RAWK Release Version: %rawkver%
echo RAWK Core Version: %rawkcore%
echo RAWK Database Version: %rdb_core%
echo RA Player Mod Version: %rna_core%
echo RGS Loader Version: %rgs_loader_core%
echo RGA Loader Version: %rga_loader_core%
echo RFS Loader Version: %rfs_loader_core%
echo DMG Loader Version: %dmg_loader_core%
echo URA Downloader Version: %uradl_core%
echo.
echo Gamehouse Core Version: %gh_core_ver%
echo Zylom Core Version: %zy_core_ver%
echo.
echo.
echo.
echo -----------------------------------------------
echo Game Specific Information
echo -----------------------------------------------
echo.
echo Wrapped EXE: %wrapped%
echo Folder Name: %gamename%
echo verified: %verified%
echo demotype: %demotype%
echo version: %version%
echo md5w: %md5w%
echo md5u: %md5u%
echo PFLindex: %PFLindex%
echo PFLhex: %PFLhex%
echo RNRindex: %RNRindex%
echo RNRhex: %RNRhex%
echo SWindex: %SWindex%
echo SWhex: %SWhex%
echo patch1_name: %patch1_name%
echo patch1_index: %patch1_index%
echo patch1_hex: %patch1_hex%
echo patch2_name: %patch2_name%
echo patch2_index: %patch2_index%
echo patch2_hex: %patch2_hex%
echo patch3_name: %patch3_name%
echo patch3_index: %patch3_index%
echo patch3_hex: %patch3_hex%
echo patch4_name: %patch4_name%
echo patch4_index: %patch4_index%
echo patch4_hex: %patch4_hex%
echo patch5_name: %patch5_name%
echo patch5_index: %patch5_index%
echo patch5_hex: %patch5_hex%
echo patch6_name: %patch6_name%
echo patch6_index: %patch6_index%
echo patch6_hex: %patch6_hex%
echo patch_extension: %patch_extension%
echo genre: %genre%
echo stubname: %stubname%
echo rlsdate: %rlsdate%
echo guid: %guid%
echo contentid: %contentid%
echo trackingid: %trackingid%
echo cheats: %cheats%
echo mods: %mods%
echo dlc: %dlc%
echo multicmp: %multicmp%
echo savexp: %savexp%
echo save7: %save7%
echo binmod: %binmod%
echo altid: %altid%
echo magicslot: %magicslot%
echo ftinit: %ftinit%
echo ftinitpath: %ftinitpath%
echo installsize: %installsize%
echo unwrapped: %unwrapped%
echo comments: %comments%
echo.
echo.
echo.
echo -----------------------------------------------
echo Other Misc Information
echo -----------------------------------------------
echo.
echo iniskip: %iniskip%
echo rarexists: %rarexists%
echo.
echo.
echo Displaying Debug Output. Press any key to continue....
pause>nul
::------------------------------------------
::DEBUGGING FINISH
::------------------------------------------

::-----------------------------------------------------------------------------------
:: Debug output to text file
::-----------------------------------------------------------------------------------

:dbgout
cls
echo ----------------------------------------------- > "output_%GameName%.txt"
echo Unpacking Status and Debug Output >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo Created By: RealArcade Wrapper Killer v%rawkver% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo Created On: %date% / %time% >> "output_%GameName%.txt"
echo ----------------------------------------------- >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo ----------------------------------------------- >> "output_%GameName%.txt"
echo Core Files and Modules Information >> "output_%GameName%.txt"
echo ----------------------------------------------- >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo Loaded Debug Module: %0 >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo RAWK Release Version: %rawkver% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo RAWK Core Version: %rawkcore% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo RAWK Database Version: %rdb_core% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo RA Player Mod Version: %rna_core% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo RGS Loader Version: %rgs_loader_core% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo RGA Loader Version: %rga_loader_core% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo URA Downloader Version: %uradl_core% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo Gamehouse Core Version: %gh_core_ver% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo Zylom Core Version: %zy_core_ver% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo ----------------------------------------------- >> "output_%GameName%.txt"
echo Game Specific Information >> "output_%GameName%.txt"
echo ----------------------------------------------- >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo Demo Type: %demotype% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo Game Name: %GameName% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo Release Date: %rlsdate% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo Game Install Size: %installsize% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo Unpacking Status: %status1% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo Shortcut Status: %status2% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo Alternate ID: %altid% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo Wrapped EXE: %wrapped%.exe >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo Unwrapped EXE: %unwrapped%.exe >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo Downloadable Content (DLC): %dlc% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo GUID: %guid% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo Gameart JPEG: %gameart% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo RGS Installer: %stubname% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo Multi-Compatible: %multicmp% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo Cheats Available: %cheats% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo Mods Available: %mods% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
::echo Reg1 HKCR\Software\RealNetworks\Games: %regblock1% >> "output_%GameName%.txt"
::echo. >> "output_%GameName%.txt"
::echo Reg2 HKCU\Software\Classes\Software\RealNetworks\Games: %regblock2% >> "output_%GameName%.txt"
::echo. >> "output_%GameName%.txt"
::echo Reg3 HKCU\Software\RealNetworks\Games: %regblock3% >> "output_%GameName%.txt"
::echo. >> "output_%GameName%.txt"
::echo Reg4 HKCR\Software\Classes\Software\RealNetworks\Games: %regblock4% >> "output_%GameName%.txt"
::echo. >> "output_%GameName%.txt"
::echo Reg5 HKCU\Software\Classes: %regblock5% >> "output_%GameName%.txt"
::echo. >> "output_%GameName%.txt"
::echo Detachable: %detached% >> "output_%GameName%.txt"
::echo. >> "output_%GameName%.txt"
echo Game Save Path (XP): %savexp% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo Game Save Path (Vista/7): %save7% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo Binary Mod Required: %binmod% >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo ----------------------------------------------- >> "output_%GameName%.txt"
echo Other Misc Information >> "output_%GameName%.txt"
echo ----------------------------------------------- >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo OS Tested On: >> "output_%GameName%.txt"
ver >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo. >> "output_%GameName%.txt"
echo Comments: %comments% >> "output_%GameName%.txt"

::-----------------------------------------------------------------------------------
::Launch Text File
::-----------------------------------------------------------------------------------

start %systemroot%\notepad.exe "output_%GameName%.txt"

:end

if %testmode%==1 (
	echo [core_debug : finished]
	pause>nul
)

exit
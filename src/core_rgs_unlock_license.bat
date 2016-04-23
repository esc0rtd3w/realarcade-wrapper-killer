@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ RGS Unlock License Check +-^~`+-.)     [...cRypTiCwaRe 2o16...]

color 0e

if %devmode%==1 goto skpchk
if %restoredone%==1 goto skpchk


:licinfo
::-----------------------------------------------------------------------------------
:: RGS Unlock Files are NO LONGER SUPPORTED by GameHouse.
:: This new method of verifying license info will be iffy, at best....hahahaha
::-----------------------------------------------------------------------------------
cls
echo RGS Unlock Files are NO LONGER SUPPORTED by GameHouse!!
echo.
echo If you still have a license file from a previous purchase, it will be verified!
echo.
echo.
::echo The GameHouse website will open up after you press a key to continue.
echo.
echo Verify your purchase by using one of the following methods:
echo.
echo.
echo 1) Legacy RGS Unlock File
echo.
echo 2) Trymedia *.LCN File
echo.
echo 3) Registration Code
echo.
echo.
echo.
echo.
echo Press any key to continue license verification....
::echo Once you have the required information, close the web browser and continue!
echo.
echo.
::echo Press any key to launch the page in your web browser and continue....
echo.
pause>nul



:: Temporary workaround for discontinued RGS license unlock files
::call "core_rga_download.bat"


:chklicense
color 0e
::-----------------------------------------------------------------------------------
:: This will check for an unlock file for a loaded game.
::-----------------------------------------------------------------------------------

title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ RGS Unlock License Check +-^~`+-.)     [...cRypTiCwaRe 2o16...]

::for %%* in (.) do set RGSunlockGame=%%~n*

set RGSunlock=0
set unlockstatus=0
set rgsunlockfile=0

:: Start License Check

echo -------------------------
echo RGS Unlock License Check
echo -------------------------
echo.
echo.
echo Current Game Loaded: %GameName%
echo.
echo.
echo.
echo.
echo Please drag your RGS Unlock File into this window and press ENTER to verify.
echo.
echo You can also drag your License File or type your Registration Key in manually.
echo.
echo.
echo If the file cannot be located, you may skip the check. By skipping the check, 
echo you are verifying that you have purchased a valid license from RealNetworks.
echo.
echo.
echo To SKIP the check, type "AGREE" (nOt cAsE SeNsiTiVe) and hit ENTER.
echo.
echo.
echo.


set /p rgsunlockfile=


:: Checking for Skip Flag

if %rgsunlockfile%==AGREE goto skipcheck
if %rgsunlockfile%==agree goto skipcheck

if %rgsunlockfile%=="AGREE" goto skipcheck
if %rgsunlockfile%=="agree" goto skipcheck

if %rgsunlockfile%==aGrEe goto skipcheck
if %rgsunlockfile%=="aGrEe" goto skipcheck

if %rgsunlockfile%==AgReE goto skipcheck
if %rgsunlockfile%=="AgReE" goto skipcheck

if %rgsunlockfile%==AGrEE goto skipcheck
if %rgsunlockfile%=="AGrEE" goto skipcheck

if %rgsunlockfile%==agRee goto skipcheck
if %rgsunlockfile%=="agRee" goto skipcheck

if %rgsunlockfile%==AGree goto skipcheck
if %rgsunlockfile%=="AGree" goto skipcheck

if %rgsunlockfile%==aGrEE goto skipcheck
if %rgsunlockfile%=="aGrEE" goto skipcheck

if %rgsunlockfile%==agREE goto skipcheck
if %rgsunlockfile%=="agREE" goto skipcheck

if %rgsunlockfile%==aGrEE goto skipcheck
if %rgsunlockfile%=="aGrEE" goto skipcheck

if %rgsunlockfile%==Agree goto skipcheck
if %rgsunlockfile%==aGree goto skipcheck
if %rgsunlockfile%==agRee goto skipcheck
if %rgsunlockfile%==agrEe goto skipcheck
if %rgsunlockfile%==agreE goto skipcheck

if %rgsunlockfile%==AGree goto skipcheck
if %rgsunlockfile%==aGRee goto skipcheck
if %rgsunlockfile%==agREe goto skipcheck

if %rgsunlockfile%==AGRee goto skipcheck
if %rgsunlockfile%==aGREe goto skipcheck
if %rgsunlockfile%==agREE goto skipcheck

if %rgsunlockfile%==AgREE goto skipcheck
if %rgsunlockfile%==AGrEE goto skipcheck
if %rgsunlockfile%==AGReE goto skipcheck
if %rgsunlockfile%==AGREe goto skipcheck

if %rgsunlockfile%==AgREe goto skipcheck
if %rgsunlockfile%==AGreE goto skipcheck
if %rgsunlockfile%==AgReE goto skipcheck
if %rgsunlockfile%==aGREe goto skipcheck

if %rgsunlockfile%==agREe goto skipcheck
if %rgsunlockfile%==AgreE goto skipcheck
if %rgsunlockfile%==AgreE goto skipcheck
if %rgsunlockfile%==aGRee goto skipcheck

if %rgsunlockfile%==agRee goto skipcheck
if %rgsunlockfile%==agreE goto skipcheck
if %rgsunlockfile%==aGree goto skipcheck

if %rgsunlockfile%=="Agree" goto skipcheck
if %rgsunlockfile%=="aGree" goto skipcheck
if %rgsunlockfile%=="agRee" goto skipcheck
if %rgsunlockfile%=="agrEe" goto skipcheck
if %rgsunlockfile%=="agreE" goto skipcheck

if %rgsunlockfile%=="AGree" goto skipcheck
if %rgsunlockfile%=="aGRee" goto skipcheck
if %rgsunlockfile%=="agREe" goto skipcheck

if %rgsunlockfile%=="AGRee" goto skipcheck
if %rgsunlockfile%=="aGREe" goto skipcheck
if %rgsunlockfile%=="agREE" goto skipcheck

if %rgsunlockfile%=="AgREE" goto skipcheck
if %rgsunlockfile%=="AGrEE" goto skipcheck
if %rgsunlockfile%=="AGReE" goto skipcheck
if %rgsunlockfile%=="AGREe" goto skipcheck

if %rgsunlockfile%=="AgREe" goto skipcheck
if %rgsunlockfile%=="AGreE" goto skipcheck
if %rgsunlockfile%=="AgReE" goto skipcheck
if %rgsunlockfile%=="aGREe" goto skipcheck

if %rgsunlockfile%=="agREe" goto skipcheck
if %rgsunlockfile%=="AgreE" goto skipcheck
if %rgsunlockfile%=="AgreE" goto skipcheck
if %rgsunlockfile%=="aGRee" goto skipcheck

if %rgsunlockfile%=="agRee" goto skipcheck
if %rgsunlockfile%=="agreE" goto skipcheck
if %rgsunlockfile%=="aGree" goto skipcheck

if %rgsunlockfile%==0 goto chklicense
::if %rgsunlockfile%==%rgsunlockfile% goto verify


:: If no skip flag is found

:verify
cls
echo License File: [%rgsunlockfile%]
echo.
echo.
echo.
echo.
echo.
if %unlockstatus%==0 (
color 0c
echo Status: Invalid
)

if %unlockstatus%==1 (
color 0a
echo Status: Valid
)

echo.
echo.
%waitfor% 5000

goto chklicense
::exit


:skipcheck
set unlockstatus=1
color 0a
cls
echo License File: [User Verified Purchase Manually]
echo.
echo.
echo.
echo.
echo.
echo Status: Valid
echo.
echo.
echo.
echo.
echo You have selected to SKIP the license check.
echo.
echo.
echo If this was an error, you MUST close this window now!
echo.
echo.
%waitfor% 7500

goto end


:: Land here for dev mode
:skpchk


:end




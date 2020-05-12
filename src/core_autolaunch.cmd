@echo off

title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Auto-Launch Full Game +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_autolaunch : loaded]
	pause>nul
)


::-----------------------------------------------------------------------------------
:: Checking for additional game patches
::-----------------------------------------------------------------------------------

:: Added 01-07-2011
:: Closes the Wrapper Application window if it hangs during game extraction
taskkill /f /im "WerFault.exe"

attrib -h *.*

cls
call "core_game_patch.cmd"



:: Added 20110817
::
:: Checking if user wants to delete RAWK generated backups

:main
cls
echo Do you want to delete RAWK generated backups??? [Y/N]
echo.
echo.
echo.
if %os%==XP choice /c:yn /t:n,5 /n
if not %os%==XP choice /c yn /d n /n /t 5
if errorlevel 2 goto goauto
goto dokill


:dokill
call "core_delete_backups.cmd"


:goauto
::-----------------------------------------------------------------------------------
:: A simple AutoLaunch after complete batch script
::-----------------------------------------------------------------------------------

cls
echo Would You Like To Launch The Full Version Game Now? [Y/N]
echo.
echo.
echo.

if %os%==XP choice /c:ny /t:n,5 /n
if not %os%==XP choice /c ny /d n /n /t 5
if errorlevel 2 goto loadon
if errorlevel 1 goto loadoff


:loadon
%goshow% "%unwrapped%.exe"
goto end

:loadoff
goto end


:end
cls
%kill% RNArcade.exe >nul
%kill% RGSinst.exe >nul
%kill% delete.exe >nul

cls
del /q /f "delete.exe"
del /q /f "%wrapped%.exe"
del /q /f "wrapper.log"
del /q /f "status.js"


call "core_clean_main.cmd"
ren "%wrapped%_extract_only.exe.bak" "%wrapped%_extract_only.exe"

:: Added 01-07-2011
:: Closes the Wrapper Application window if it hangs during game extraction
%kill% "WerFault.exe"

attrib -h *.*



:end

::-----------------------------------------------------------------------------------
::Removing ALL JUNK and TEMP files
::-----------------------------------------------------------------------------------

cls
call "core_clean_main.cmd"

if %testmode%==1 (
	echo [core_autolaunch : finished]
	pause>nul
)

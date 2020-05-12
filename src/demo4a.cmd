@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Demo 4a unWrapper +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [demo4a : loaded]
	pause>nul
)

::-----------------------------------------------------------------------------------
::Demo Type 4a has a different text on the 2nd demo window.
::OLD = RealOne Arcade Game Demo
::NEW = Registration
::-----------------------------------------------------------------------------------

::temp fix added 11-04-2010
::call "core_config_ra_player.cmd"

color 0b

set demotype=4a

::-----------------------------------------------------------------------------------
::Setting Wrapped and unWrapped EXE
::-----------------------------------------------------------------------------------

if exist "abysma_win.exe" set wrapped=abysma_win& set unwrapped=abs

goto start

::-----------------------------------------------------------------------------------
::Special Situations Here
::-----------------------------------------------------------------------------------


::-----------------------------------------------------------------------------------
::END Special Situations
::-----------------------------------------------------------------------------------

:start

call "core_patch_demo4a.cmd"
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Demo 4a unWrapper +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
echo Patching EXE Extract Command: Success!
echo.
echo Patching 1st Demo Window: Success!
echo.
echo Patching 2nd Demo Window: Success!
echo.
echo.

%gohide% "%wrapped%.exe"


::-----------------------------------------------------------------------------------
::Removing hidden attributes
::-----------------------------------------------------------------------------------

if %quw%==0 %waitfor% 5000
attrib -h "*.*"

::-----------------------------------------------------------------------------------
::Removing ALL JUNK and TEMP files
::-----------------------------------------------------------------------------------

cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
echo Patching EXE Extract Command: Success!
echo.
echo Patching 1st Demo Window: Success!
echo.
echo Patching 2nd Demo Window: Success!
echo.
echo Cleaning Up Junk Files: Please Wait....
echo.
echo.

call "core_clean_main.cmd"

::-----------------------------------------------------------------------------------
::Closing RA Software
::-----------------------------------------------------------------------------------

cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
echo Patching EXE Extract Command: Success!
echo.
echo Patching 1st Demo Window: Success!
echo.
echo Patching 2nd Demo Window: Success!
echo.
echo Cleaning Up Junk Files: Success!
echo.
echo Terminating Wrapped EXE: Please Wait....
echo.
echo.

%kill% "RNArcade.exe" >nul
%kill% "%wrapped%.exe" >nul

::-----------------------------------------------------------------------------------
::Bypass question to create shortcut
::-----------------------------------------------------------------------------------

cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
echo Patching EXE Extract Command: Success!
echo.
echo Patching 1st Demo Window: Success!
echo.
echo Patching 2nd Demo Window: Success!
echo.
echo Cleaning Up Junk Files: Success!
echo.
echo Terminating Wrapped EXE: Success!
echo.
echo.


:sc
::-----------------------------------------------------------------------------------
::Bypass question to create shortcut
::-----------------------------------------------------------------------------------

cls
call "core_shortcut_demo3.cmd"


:end

if %testmode%==1 (
	echo [demo4a : finished]
	pause>nul
)

::exit
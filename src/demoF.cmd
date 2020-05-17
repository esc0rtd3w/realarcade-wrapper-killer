@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ RGS Full unWrapper +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [demoF : loaded]
	pause>nul
)


color 0b

set demotype=f


::-----------------------------------------------------------------------------------
::Setting Wrapped and unWrapped EXE
::-----------------------------------------------------------------------------------

::if exist ".exe" set wrapped=& set unwrapped=

if exist "bookworm.exe" set wrapped=bookworm& set unwrapped=bookdlx
if exist "collapse.exe" set wrapped=collapse& set unwrapped=cst
if exist "gutterball3d.exe" set wrapped=gutterball3d& set unwrapped=gut

:: Super Collapse II
if exist "relapse.exe" set wrapped=relapse& set unwrapped=scii

goto start

::-----------------------------------------------------------------------------------
::Special Situations Here
::-----------------------------------------------------------------------------------


::-----------------------------------------------------------------------------------
::END Special Situations
::-----------------------------------------------------------------------------------

:start

call "core_patch_full.cmd"
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ RGS Full unWrapper +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

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
call "core_shortcut_full.cmd"


:end

if %testmode%==1 (
	echo [demoF : finished]
	pause>nul
)

::exit
@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Demo 3a unWrapper +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

::-----------------------------------------------------------------------------------
::Demo Type 3a has a different text on the 2nd demo window.
::OLD = RealOne Arcade Game Demo
::NEW = RealArcade Game Demo
::-----------------------------------------------------------------------------------

color 0b

set demotype=3a

::temp fix added 11-04-2010
::call "core_config_ra_player.cmd"

::TEMP FIX TO SKIP UNWRAPPED VARIABLES
::goto start

::-----------------------------------------------------------------------------------
:: Checking for type 3a EXE files
::-----------------------------------------------------------------------------------

if exist "aironix.exe" set wrapped=aironix& set unwrapped=air
if exist "carnivale.exe" set wrapped=carnivale& set unwrapped=fate
if exist "medieval.exe" set wrapped=medieval& set unwrapped=med
if exist "pk\pk0002.cct" set wrapped=ptjigsaw& set unwrapped=pin
if exist "pk\pk0003.cct" set wrapped=ptjigsaw& set unwrapped=aoa
if exist "pk\pk0006.cct" set wrapped=ptjigsaw& set unwrapped=ech
if exist "monkey.exe" set wrapped=monkey& set unwrapped=smi
if exist "diamondmine.exe" set wrapped=diamondmine& set unwrapped=dmn

goto start

::-----------------------------------------------------------------------------------
::Special Situations Here
::-----------------------------------------------------------------------------------



::-----------------------------------------------------------------------------------
::END Special Situations
::-----------------------------------------------------------------------------------

:start

call "core_patch_demo3a.cmd"
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Demo 3a unWrapper +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

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
::exit
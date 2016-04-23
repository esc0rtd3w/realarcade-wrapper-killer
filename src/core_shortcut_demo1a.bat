@echo off

title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Shortcut Maker +-^~`+-.)     [...cRypTiCwaRe 2o16...]

::-----------------------------------------------------------------------------------
::Checking for a 0.exe or a screwed up unwrapped variable
::-----------------------------------------------------------------------------------

set unpackfail=0

if exist *.exe goto gourexe

%hide% %wdomain%

color 0c
cls
echo There was a problem setting the UNWRAPPED variable.
echo.
echo.
echo This is usually caused by the game using unknown offsets to unpack.
echo.
echo.
echo We are sorry, but this game must be launched and unpacked manually!
echo.
echo.
echo.

set unpackfail=1

%talk% "The game has failed to unpack properly. Now switching to manual unpacking mode. Please wait." -2

goto end2

:gourexe

cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
if %PFLindex%==0 echo Patching preparingForLaunch command: Skipped
if %PFLindex% gtr 0 echo Patching preparingForLaunch command: Success!
echo.
if %RNRindex%==0 echo Patching RacNotRunning command: Skipped
if %RNRindex% gtr 0 echo Patching RacNotRunning command: Success!
echo.
if %SWindex%==0 echo Patching startWrapper command: Skipped
if %SWindex% gtr 0 echo Patching startWrapper command: Success!
echo.
echo Preparing For Demo Window Interception: Success!
echo.
echo Searching HTML For Play Demo Now Button: Success!
echo.
echo Preparing To Launch Game For Extraction: Success!
echo.
echo Extracting Full Version EXE: Success!
echo.
echo Cleaning Up All Junk Files: Success!
echo.
echo Creating Desktop Shortcut: Please Wait....
echo.
echo.
echo.

::-----------------------------------------------------------------------------------
::Setting Unwrapped Game EXE name (must delete all other EXEs prior)
::-----------------------------------------------------------------------------------

:: Force the deletion of "delete.exe" for making proper shortcuts. Added 11-13-2010
%waitfor% 3000

:: Fixed 01-30-2011
%kill% RNArcade.exe >nul
%kill% RGSinst.exe >nul
%kill% delete.exe >nul

del /q /f "delete.exe"
del /q /f "%wrapped%.exe"
del /q /f "wrapper.log"
del /q /f "status.js"

cls

:: Added 01-07-2011
:: Closes the Wrapper Application window if it hangs during game extraction
%kill% "WerFault.exe"

attrib -h *.*

for %%* in (*.exe) do set unwrapped=%%~n*

::-----------------------------------------------------------------------------------
::Check For Fixes
::-----------------------------------------------------------------------------------


:scstart
:: Added 01-07-2011
:: Closes the Wrapper Application window if it hangs during game extraction
taskkill /f /im "WerFault.exe"

attrib -h *.*

:: Added 20110818
:: Fix for games that need manual unpacking not getting redirected to "DemoM"
if not exist *.exe set unpackfail=1

::-----------------------------------------------------------------------------------
:: Generic RESTORE HELD FILENAMES FIX - Added 20100928
::-----------------------------------------------------------------------------------

cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
if %PFLindex%==0 echo Patching preparingForLaunch command: Skipped
if %PFLindex% gtr 0 echo Patching preparingForLaunch command: Success!
echo.
if %RNRindex%==0 echo Patching RacNotRunning command: Skipped
if %RNRindex% gtr 0 echo Patching RacNotRunning command: Success!
echo.
if %SWindex%==0 echo Patching startWrapper command: Skipped
if %SWindex% gtr 0 echo Patching startWrapper command: Success!
echo.
echo Preparing For Demo Window Interception: Success!
echo.
echo Searching HTML For Play Demo Now Button: Success!
echo.
echo Preparing To Launch Game For Extraction: Success!
echo.
echo Extracting Full Version EXE: Success!
echo.
echo Cleaning Up All Junk Files: Success!
echo.
echo Creating Desktop Shortcut: Please Wait....
echo.
echo.
echo.

if exist "*.hold" ren "*.hold" "*.exe"

::-----------------------------------------------------------------------------------
:: Force CMD Window to be on top
::-----------------------------------------------------------------------------------

%show% "[...cRypTiCwaRe 2o16...]"

::-----------------------------------------------------------------------------------
:: Create shortcuts based on variables
::-----------------------------------------------------------------------------------

cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
if %PFLindex%==0 echo Patching preparingForLaunch command: Skipped
if %PFLindex% gtr 0 echo Patching preparingForLaunch command: Success!
echo.
if %RNRindex%==0 echo Patching RacNotRunning command: Skipped
if %RNRindex% gtr 0 echo Patching RacNotRunning command: Success!
echo.
if %SWindex%==0 echo Patching startWrapper command: Skipped
if %SWindex% gtr 0 echo Patching startWrapper command: Success!
echo.
echo Preparing For Demo Window Interception: Success!
echo.
echo Searching HTML For Play Demo Now Button: Success!
echo.
echo Preparing To Launch Game For Extraction: Success!
echo.
echo Extracting Full Version EXE: Success!
echo.
echo Cleaning Up All Junk Files: Success!
echo.
echo Creating Desktop Shortcut: Please Wait....
echo.
echo.
echo.

nircmd shortcut "%cd%\%unwrapped%.exe" "~$folder.desktop$" "%GameName%"
nircmd shortcut "%cd%\%unwrapped%.exe" "%rashort%" "%GameName%"

:end


::-----------------------------------------------------------------------------------
:: Generic RESTORE HELD FILENAMES FIX - Added 20100928
::-----------------------------------------------------------------------------------

cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
if %PFLindex%==0 echo Patching preparingForLaunch command: Skipped
if %PFLindex% gtr 0 echo Patching preparingForLaunch command: Success!
echo.
if %RNRindex%==0 echo Patching RacNotRunning command: Skipped
if %RNRindex% gtr 0 echo Patching RacNotRunning command: Success!
echo.
if %SWindex%==0 echo Patching startWrapper command: Skipped
if %SWindex% gtr 0 echo Patching startWrapper command: Success!
echo.
echo Preparing For Demo Window Interception: Success!
echo.
echo Searching HTML For Play Demo Now Button: Success!
echo.
echo Preparing To Launch Game For Extraction: Success!
echo.
echo Extracting Full Version EXE: Success!
echo.
echo Cleaning Up All Junk Files: Success!
echo.
echo Creating Desktop Shortcut: Success!
echo.
echo.
echo.

if exist "*.hold" ren "*.hold" "*.exe"

::-----------------------------------------------------------------------------------
:: Check for additional flags set
::-----------------------------------------------------------------------------------

if %cheats%==Yes call "core_cheats.bat"
if %mods%==Yes call "core_mods.bat"
if %dlc%==Yes call "core_dlc.bat"
if %multicmp%==Yes call "core_multicmp.bat"

::-----------------------------------------------------------------------------------
::Attempting to kill unwrapped EXE game process
::-----------------------------------------------------------------------------------

cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
if %PFLindex%==0 echo Patching preparingForLaunch command: Skipped
if %PFLindex% gtr 0 echo Patching preparingForLaunch command: Success!
echo.
if %RNRindex%==0 echo Patching RacNotRunning command: Skipped
if %RNRindex% gtr 0 echo Patching RacNotRunning command: Success!
echo.
if %SWindex%==0 echo Patching startWrapper command: Skipped
if %SWindex% gtr 0 echo Patching startWrapper command: Success!
echo.
echo Preparing For Demo Window Interception: Success!
echo.
echo Searching HTML For Play Demo Now Button: Success!
echo.
echo Preparing To Launch Game For Extraction: Success!
echo.
echo Extracting Full Version EXE: Success!
echo.
echo Cleaning Up All Junk Files: Success!
echo.
echo Creating Desktop Shortcut: Success!
echo.
echo Terminating Wrapped EXE: Please Wait....
echo.
echo.
echo.

%kill% "%unwrapped%.exe" >nul

::-----------------------------------------------------------------------------------
::Attempting to kill RNArcade process
::-----------------------------------------------------------------------------------

cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
if %PFLindex%==0 echo Patching preparingForLaunch command: Skipped
if %PFLindex% gtr 0 echo Patching preparingForLaunch command: Success!
echo.
if %RNRindex%==0 echo Patching RacNotRunning command: Skipped
if %RNRindex% gtr 0 echo Patching RacNotRunning command: Success!
echo.
if %SWindex%==0 echo Patching startWrapper command: Skipped
if %SWindex% gtr 0 echo Patching startWrapper command: Success!
echo.
echo Preparing For Demo Window Interception: Success!
echo.
echo Searching HTML For Play Demo Now Button: Success!
echo.
echo Preparing To Launch Game For Extraction: Success!
echo.
echo Extracting Full Version EXE: Success!
echo.
echo Cleaning Up All Junk Files: Success!
echo.
echo Creating Desktop Shortcut: Success!
echo.
echo Terminating Wrapped EXE: Please Wait....
echo.
echo.
echo.

%kill% RNArcade.exe >nul

::-----------------------------------------------------------------------------------
::Renaming Original Wrapped EXE's back, if applicable
::-----------------------------------------------------------------------------------

::if renexe==1 set wrapped=%origexe%

::-----------------------------------------------------------------------------------
::Checking Debug Status Flag
::-----------------------------------------------------------------------------------

cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
if %PFLindex%==0 echo Patching preparingForLaunch command: Skipped
if %PFLindex% gtr 0 echo Patching preparingForLaunch command: Success!
echo.
if %RNRindex%==0 echo Patching RacNotRunning command: Skipped
if %RNRindex% gtr 0 echo Patching RacNotRunning command: Success!
echo.
if %SWindex%==0 echo Patching startWrapper command: Skipped
if %SWindex% gtr 0 echo Patching startWrapper command: Success!
echo.
echo Preparing For Demo Window Interception: Success!
echo.
echo Searching HTML For Play Demo Now Button: Success!
echo.
echo Preparing To Launch Game For Extraction: Success!
echo.
echo Extracting Full Version EXE: Success!
echo.
echo Cleaning Up All Junk Files: Success!
echo.
echo Creating Desktop Shortcut: Success!
echo.
echo Terminating Wrapped EXE: Success!
echo.
echo.
echo.

if %quw%==0 %waitfor% 3000

if %debug%==1 goto debugok

goto end2

:debugok
::-----------------------------------------------------------------------------------
:: Debug Output (USED FOR TESTING ONLY!)
::-----------------------------------------------------------------------------------

cls
call "core_debug.bat"

goto end2


:end2

::Cleaning temp INI files for patches and cheats
call "core_clean_ini.bat"

::Added autolaunch select on 11-13-2010
if %unpackfail%==0 call "core_autolaunch.bat"
if %unpackfail%==1 call "demoM.bat"


:end3





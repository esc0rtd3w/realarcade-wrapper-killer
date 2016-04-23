@echo off

title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Shortcut Maker +-^~`+-.)     [...cRypTiCwaRe 2o13...]

::-----------------------------------------------------------------------------------
::Setting Unwrapped Game EXE name (must delete all other EXEs prior)
::-----------------------------------------------------------------------------------

cls
if %PFLindex%==0 echo Patching preparingForLaunch command: Skipped
if %PFLindex% gtr 0 echo Patching preparingForLaunch command: Success!
echo.
if %RNRindex%==0 echo Patching RacNotRunning command: Skipped
if %RNRindex% gtr 0 echo Patching RacNotRunning command: Success!
echo.
if %SWindex%==0 echo Patching startWrapper command: Skipped
if %SWindex% gtr 0 echo Patching startWrapper command: Success!
echo.
echo Extracting Full Version EXE: Success!
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
:: Force CMD Window to be on top
::-----------------------------------------------------------------------------------

%show% "[...cRypTiCwaRe 2o13...]"

::-----------------------------------------------------------------------------------
:: Create shortcuts based on variables
::-----------------------------------------------------------------------------------

cls
if %PFLindex%==0 echo Patching preparingForLaunch command: Skipped
if %PFLindex% gtr 0 echo Patching preparingForLaunch command: Success!
echo.
if %RNRindex%==0 echo Patching RacNotRunning command: Skipped
if %RNRindex% gtr 0 echo Patching RacNotRunning command: Success!
echo.
if %SWindex%==0 echo Patching startWrapper command: Skipped
if %SWindex% gtr 0 echo Patching startWrapper command: Success!
echo.
echo Extracting Full Version EXE: Success!
echo.
echo Creating Desktop Shortcut: Please Wait....
echo.
echo.
echo.

nircmd shortcut "%cd%\%unwrapped%.exe" "~$folder.desktop$" "%GameName%"
nircmd shortcut "%cd%\%unwrapped%.exe" "%rashort%" "%GameName%"

:end
:: Added 01-07-2011
:: Closes the Wrapper Application window if it hangs during game extraction
taskkill /f /im "WerFault.exe"

attrib -h *.*


::-----------------------------------------------------------------------------------
:: Generic RESTORE HELD FILENAMES FIX - Added 20100928
::-----------------------------------------------------------------------------------

cls
if %PFLindex%==0 echo Patching preparingForLaunch command: Skipped
if %PFLindex% gtr 0 echo Patching preparingForLaunch command: Success!
echo.
if %RNRindex%==0 echo Patching RacNotRunning command: Skipped
if %RNRindex% gtr 0 echo Patching RacNotRunning command: Success!
echo.
if %SWindex%==0 echo Patching startWrapper command: Skipped
if %SWindex% gtr 0 echo Patching startWrapper command: Success!
echo.
echo Extracting Full Version EXE: Success!
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
if %PFLindex%==0 echo Patching preparingForLaunch command: Skipped
if %PFLindex% gtr 0 echo Patching preparingForLaunch command: Success!
echo.
if %RNRindex%==0 echo Patching RacNotRunning command: Skipped
if %RNRindex% gtr 0 echo Patching RacNotRunning command: Success!
echo.
if %SWindex%==0 echo Patching startWrapper command: Skipped
if %SWindex% gtr 0 echo Patching startWrapper command: Success!
echo.
echo Extracting Full Version EXE: Success!
echo.
echo Creating Desktop Shortcut: Success!
echo.
echo Launching Full Version Game: Please Wait....
echo.
echo.
echo.

%kill% "%unwrapped%.exe" >nul

::-----------------------------------------------------------------------------------
::Attempting to kill RNArcade process
::-----------------------------------------------------------------------------------

cls
if %PFLindex%==0 echo Patching preparingForLaunch command: Skipped
if %PFLindex% gtr 0 echo Patching preparingForLaunch command: Success!
echo.
if %RNRindex%==0 echo Patching RacNotRunning command: Skipped
if %RNRindex% gtr 0 echo Patching RacNotRunning command: Success!
echo.
if %SWindex%==0 echo Patching startWrapper command: Skipped
if %SWindex% gtr 0 echo Patching startWrapper command: Success!
echo.
echo Extracting Full Version EXE: Success!
echo.
echo Creating Desktop Shortcut: Success!
echo.
echo Launching Full Version Game: Please Wait....
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
if %PFLindex%==0 echo Patching preparingForLaunch command: Skipped
if %PFLindex% gtr 0 echo Patching preparingForLaunch command: Success!
echo.
if %RNRindex%==0 echo Patching RacNotRunning command: Skipped
if %RNRindex% gtr 0 echo Patching RacNotRunning command: Success!
echo.
if %SWindex%==0 echo Patching startWrapper command: Skipped
if %SWindex% gtr 0 echo Patching startWrapper command: Success!
echo.
echo Extracting Full Version EXE: Success!
echo.
echo Creating Desktop Shortcut: Success!
echo.
echo Launching Full Version Game: Please Wait....
echo.
echo.
echo.

if %debug%==1 goto debugok

goto end2

:debugok
::-----------------------------------------------------------------------------------
:: Debug Output (USED FOR TESTING ONLY!)
::-----------------------------------------------------------------------------------

cls
call "core_debug.bat"

:end2

::Cleaning temp INI files for patches and cheats
call "core_clean_ini.bat"

::Added autolaunch select on 11-13-2010
call "core_autolaunch.bat"
::if set %unpackfail%==0 call "core_autolaunch.bat"
::if set %unpackfail%==1 goto end3







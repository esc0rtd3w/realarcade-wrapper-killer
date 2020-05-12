@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Demo 1 unWrapper +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [demo1 : loaded]
	pause>nul
)

::-----------------------------------------------------------------------------------
::Demo 1 Games DO NOT have Demo Windows and DO NOT have a gameart.jpg file
::-----------------------------------------------------------------------------------

color 0a

::-----------------------------------------------------------------------------------
::Check for games that require special handling
::-----------------------------------------------------------------------------------


:: Samantha Swift and the Fountains of Fate Strategy Guide PDF Fix
if exist "samantha swift 4 - se strategy guide.pdf" (
set pdffix=1
goto sc
)


:: Dropheads Icon Fix
if exist "dropheads_r1a.exe" (
set shortd1=true
set wrapped=dropheads_r1a
set unwrapped=dropheads
copy /y fix2.tmp dropheads.ico
goto start
)

:: Puzzler World Installer Fix
::if exist "puzzlerworld2_r1a.exe" set handler=1

goto start


:start

::-----------------------------------------------------------------------------------
::Renaming wrapped exe
::-----------------------------------------------------------------------------------

ren *_r1a.exe delete.exe

::-----------------------------------------------------------------------------------
::Starting game
::-----------------------------------------------------------------------------------

::-----------------------------------------------------------------------------------
::core_r1a_patcher added 20101023
::-----------------------------------------------------------------------------------

cls
call "core_patch_demo1.cmd"

::-----------------------------------------------------------------------------------
::Launch patched EXE file to extract Full Game and exit
::-----------------------------------------------------------------------------------

:: "Wrapper Application" crash shows on screen to user
::start /min "" "delete.exe"
%gohide% "delete.exe"
::delete.exe

::cls
::echo Please Wait While The Game Is Being Extracted....
::echo.
::%waitfor% 15000

:: Closes the Wrapper Application window if it hangs during game extraction
::%kill% "WerFault.exe"
::%kill% "delete.exe"

::-----------------------------------------------------------------------------------
::Check for Demo 1a - added 20100917
::-----------------------------------------------------------------------------------

::not needed after startWrapper was patched - 20101107
::if exist "gameart.jpg" call demo1a
::if not exist "gameart.jpg" goto skip1a
::goto end


:::skip1a


::-----------------------------------------------------------------------------------
::Removing hidden attributes
::-----------------------------------------------------------------------------------

cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
echo Patching preparingForLaunch command: Success!
echo.
echo Patching RacNotRunning command: Success!
echo.
echo Patching startWrapper command: Success!
echo.
echo Extracting Full Version EXE: Please Wait....
echo.
echo.
echo.

attrib -h "*.*"
::if %quw%==0 %waitfor% 4000


::-----------------------------------------------------------------------------------
::Removing ALL JUNK and TEMP files
::-----------------------------------------------------------------------------------

cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
echo Patching preparingForLaunch command: Success!
echo.
echo Patching RacNotRunning command: Success!
echo.
echo Patching startWrapper command: Success!
echo.
echo Extracting Full Version EXE: Success!
echo.
echo Cleaning Up All Junk Files: Please Wait....
echo.
echo.
echo.

call "core_clean_main.cmd"

::-----------------------------------------------------------------------------------
::Bypass question to create shortcut
::-----------------------------------------------------------------------------------

cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
echo Patching preparingForLaunch command: Success!
echo.
echo Patching RacNotRunning command: Success!
echo.
echo Patching startWrapper command: Success!
echo.
echo Extracting Full Version EXE: Success!
echo.
echo Cleaning Up All Junk Files: Success!
echo.
echo Creating Desktop Shortcut: Please Wait....
echo.
echo.
echo.


:sc
::-----------------------------------------------------------------------------------
::Bypass question to create shortcut
::-----------------------------------------------------------------------------------

cls
call "core_shortcut_demo1.cmd"


:end

if %testmode%==1 (
	echo [demo1 : finished]
	pause>nul
)

::exit
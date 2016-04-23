@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Demo 1a unWrapper +-^~`+-.)     [...cRypTiCwaRe 2o16...]

:: Demo 1a is OBSOLETE as of 20101109
goto end

::-----------------------------------------------------------------------------------
::Demo 1a Games have Demo Windows and a gameart.jpg file
::-----------------------------------------------------------------------------------

color 0a

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
echo Preparing For Demo Window Interception: Please Wait....
echo.
echo.
echo.

attrib -h "*.*"


:skipstart
::-----------------------------------------------------------------------------------
::HTML Demo Window Interception - added 20100917
::-----------------------------------------------------------------------------------

%waitfor% 2000
%show% "RealArcade Wrapper Killer v%rawkver%"

cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
echo Patching preparingForLaunch command: Success!
echo.
echo Patching RacNotRunning command: Success!
echo.
echo Preparing For Demo Window Interception: Success!
echo.
echo Searching HTML For Play Demo Now Button: Please Wait....
echo.
echo.
echo.

%waitfor% 8000
%show% "%GameName%"
%waitfor% 1000
%show% "%GameName%"

cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
echo Patching preparingForLaunch command: Success!
echo.
echo Patching RacNotRunning command: Success!
echo.
echo Preparing For Demo Window Interception: Success!
echo.
echo Searching HTML For Play Demo Now Button: Success!
echo.
echo Preparing To Launch Game For Extraction: Please Wait....
echo.
echo.
echo.

%waitfor% 1000
nircmd sendkey 0x09 press
%waitfor% 1000
nircmd sendkey 0x09 press
%waitfor% 1000
nircmd sendkey enter press


%show% "Demo 1a unWrapper"

cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
echo Patching preparingForLaunch command: Success!
echo.
echo Patching RacNotRunning command: Success!
echo.
echo Preparing For Demo Window Interception: Success!
echo.
echo Searching HTML For Play Demo Now Button: Success!
echo.
echo Preparing To Launch Game For Extraction: Success!
echo.
echo Extracting Full Version EXE: Please Wait....
echo.
echo.
echo.
%waitfor% 5000



::-----------------------------------------------------------------------------------
::Removing hidden attributes
::-----------------------------------------------------------------------------------

cls
attrib -h "*.*"

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
echo Preparing For Demo Window Interception: Success!
echo.
echo Searching HTML For Play Demo Now Button: Success!
echo.
echo Preparing To Launch Game For Extraction: Success!
echo.
echo Extracting Full Version EXE: Success!
echo.
echo Cleaning Up All Junk Files: Please Wait....
echo.
echo.
echo.

call "core_clean_main.bat"

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


:sc
::-----------------------------------------------------------------------------------
::Bypass question to create shortcut
::-----------------------------------------------------------------------------------

cls
call "core_shortcut_demo1a.bat"


:end
::exit
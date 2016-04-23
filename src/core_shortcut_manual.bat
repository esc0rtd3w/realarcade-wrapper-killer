@echo off

title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Shortcut Maker +-^~`+-.)     [...cRypTiCwaRe 2o16...]


::-----------------------------------------------------------------------------------
::Setting Unwrapped Game EXE name (must delete all other EXEs prior)
::-----------------------------------------------------------------------------------

for %%* in (*.exe) do set unwrapped=%%~n*


%show% "[...cRypTiCwaRe 2o16...]"
cls
nircmd shortcut "%cd%\%unwrapped%.exe" "~$folder.desktop$" "%GameName%"
nircmd shortcut "%cd%\%unwrapped%.exe" "%rashort%" "%GameName%"

:end

if %cheats%==Yes call "core_cheats.bat"
if %mods%==Yes call "core_mods.bat"
if %dlc%==Yes call "core_dlc.bat"
if %multicmp%==Yes call "core_multicmp.bat"

::-----------------------------------------------------------------------------------
::Attempting to kill unwrapped EXE game process
::-----------------------------------------------------------------------------------

cls
%kill% "%unwrapped%.exe" >nul

::-----------------------------------------------------------------------------------
::Attempting to kill RNArcade process
::-----------------------------------------------------------------------------------

cls
%kill% RNArcade.exe >nul

::-----------------------------------------------------------------------------------
::Renaming Original Wrapped EXE's back, if applicable
::-----------------------------------------------------------------------------------

::if renexe==1 set wrapped=%origexe%

::-----------------------------------------------------------------------------------
::Checking Debug Status Flag
::-----------------------------------------------------------------------------------

cls
if %debug%==1 goto debugok

goto end2

:debugok
::-----------------------------------------------------------------------------------
:: Debug Output (USED FOR TESTING ONLY!)
::-----------------------------------------------------------------------------------

cls
call "core_debug.bat"

:end2

:: Force rename of BAK files back to EXE
:: added 20131102 - NEEDS MORE TESTING!
::ren "*_extract_only.exe.bak" "*_extract_only.exe"


cls
echo The Wrapper Killer has forced a game to be unpacked manually.
echo.
echo.
echo If the game did not unpack properly, then it is NOT compatible at this time.
echo.
echo.
echo.
echo Preparing To Exit....
echo.
echo.
echo.

%talk% "Your game should now be unpacked, and in its FULL VERSION state! There should also be a shortcut on your desktop. If either of these are not true, then this game may not yet be compatible!" -2


::-----------------------------------------------------------------------------------
::Removing ALL JUNK and TEMP files
::-----------------------------------------------------------------------------------

cls

:: Needed for CLI launch Only
::call "core_rawk_cleanup_loader.bat"
call "core_rawk_cleanup_root.bat"

call "core_clean_main.bat"


:end3


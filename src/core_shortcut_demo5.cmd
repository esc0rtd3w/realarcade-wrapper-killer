@echo off

title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Shortcut Maker +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

::-----------------------------------------------------------------------------------
::Setting Unwrapped Game EXE name (must delete all other EXEs prior)
::-----------------------------------------------------------------------------------

for %%* in (*.exe) do set unwrapped=%%~n*

%show% "[...cRypTiCwaRe 2o2o...]"
cls
nircmd shortcut "%cd%\%unwrapped%.exe" "~$folder.desktop$" "%GameName%"
nircmd shortcut "%cd%\%unwrapped%.exe" "%rashort%" "%GameName%"

:end


if %cheats%==Yes call "core_cheats.cmd"
if %mods%==Yes call "core_mods.cmd"
if %dlc%==Yes call "core_dlc.cmd"
if %multicmp%==Yes call "core_multicmp.cmd"

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
call "core_debug.cmd"

:end2

::Cleaning temp INI files for patches and cheats
call "core_clean_ini.cmd"

::Added autolaunch select on 11-13-2010
call "core_autolaunch.cmd"
::if set %unpackfail%==0 call "core_autolaunch.cmd"
::if set %unpackfail%==1 goto end3






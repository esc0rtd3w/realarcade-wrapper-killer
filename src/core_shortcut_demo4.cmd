@echo off

title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Shortcut Maker +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_shortcut_demo4 : loaded]
	pause>nul
)

::-----------------------------------------------------------------------------------
::Setting Unwrapped Game EXE name (must delete all other EXEs prior)
::-----------------------------------------------------------------------------------

for %%* in (*.exe) do set unwrapped=%%~n*

::-----------------------------------------------------------------------------------
::Renaming back any HOLD files back to EXE
::-----------------------------------------------------------------------------------

if exist "primalprey.exe" goto ppfix

goto start


:ppfix
:: Primal Prey Fix
ren "regid.hold" "regid.exe"

goto end


:start

%show% "[...cRypTiCwaRe 2o2o...]"
cls
nircmd shortcut "%cd%\%unwrapped%.exe" "~$folder.desktop$" "%GameName%"
nircmd shortcut "%cd%\%unwrapped%.exe" "%rashort%" "%GameName%"

:end

:: Added 01-07-2011
:: Closes the Wrapper Application window if it hangs during game extraction
taskkill /f /im "WerFault.exe"

attrib -h *.*


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

del "%wrapped%.exe"

::Cleaning temp INI files for patches and cheats
call "core_clean_ini.cmd"

::Added autolaunch select on 11-13-2010
call "core_autolaunch.cmd"
::if set %unpackfail%==0 call "core_autolaunch.cmd"
::if set %unpackfail%==1 goto end3

if %testmode%==1 (
	echo [core_shortcut_demo4 : finished]
	pause>nul
)

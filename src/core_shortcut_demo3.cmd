@echo off

title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Shortcut Maker +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

::-----------------------------------------------------------------------------------
::Check For Fixes
::-----------------------------------------------------------------------------------

if exist "%cd%\spo.exe" goto 5sSC
if exist "%cd%\Arcade.exe" goto atarifix
if exist "%cd%\chz.exe" goto chzfix
goto sc

:5sSC
::-----------------------------------------------------------------------------------
::5 Spots Icon Fix
::-----------------------------------------------------------------------------------

nircmd shortcut "%cd%\%unwrapped%.exe" "~$folder.desktop$" "%GameName%" "" "%cd%\spo.ico"
nircmd shortcut "%cd%\%unwrapped%.exe" "%rashort%" "%GameName%" "" "%cd%\spo.ico"
cls
goto end

:atarifix
::-----------------------------------------------------------------------------------
::Atari Arcade Extra Icons
::-----------------------------------------------------------------------------------

cls
echo This game has multiple games in one.
echo.
echo 1) Asteroids
echo.
echo 2) Centipede
echo.
echo 3) Missile Command
echo.
echo 4) Pong
echo.
echo 5) Super Breakout
echo.
echo 6) Temptest
echo.
echo.
echo Would you like to make separate shorcuts for these as well?
echo.
::%talk% "This game has multiple games in one. Would you like to make separate shorcuts for these as well?" -2

if %os%==XP goto xpS3
if not %os%==XP goto vistaS3
:xpS3
choice /c:yn /t:n,10 /n
if errorlevel 2 goto sc
goto end

:vistaS3
choice /c yn /d n /n /t 10
if errorlevel 2 goto sc
goto end

nircmd shortcut "%cd%\asteroids.exe" "~$folder.desktop$" "Asteroids"
nircmd shortcut "%cd%\centipede.exe" "~$folder.desktop$" "Centipede"
nircmd shortcut "%cd%\missile command.exe" "~$folder.desktop$" "Missile Command"
nircmd shortcut "%cd%\pong.exe" "~$folder.desktop$" "Pong"
nircmd shortcut "%cd%\super breakout.exe" "~$folder.desktop$" "%Super Breakout"
nircmd shortcut "%cd%\tempest.exe" "~$folder.desktop$" "Temptest"

nircmd shortcut "%cd%\asteroids.exe" "%rashort%" "Asteroids"
nircmd shortcut "%cd%\centipede.exe" "%rashort%" "Centipede"
nircmd shortcut "%cd%\missile command.exe" "%rashort%" "Missile Command"
nircmd shortcut "%cd%\pong.exe" "%rashort%" "Pong"
nircmd shortcut "%cd%\super breakout.exe" "%rashort%" "%Super Breakout"
nircmd shortcut "%cd%\tempest.exe" "%rashort%" "Temptest"
cls

goto end

:chzfix
::-----------------------------------------------------------------------------------
::Chainz Shortcut Fix
::-----------------------------------------------------------------------------------

nircmd shortcut "%cd%\chz.exe" "~$folder.desktop$" "Chainz"
nircmd shortcut "%cd%\chz.exe" "%rashort%" "Chainz"
cls
goto end

:sc
::-----------------------------------------------------------------------------------
:: Force CMD Window to be on top
::-----------------------------------------------------------------------------------

%show% "[...cRypTiCwaRe 2o2o...]"

::-----------------------------------------------------------------------------------
:: Create shortcuts based on variables
::-----------------------------------------------------------------------------------

nircmd shortcut "%cd%\%unwrapped%.exe" "~$folder.desktop$" "%GameName%"
nircmd shortcut "%cd%\%unwrapped%.exe" "%rashort%" "%GameName%"

:end

:: Added 01-07-2011
:: Closes the Wrapper Application window if it hangs during game extraction
taskkill /f /im "WerFault.exe"

attrib -h *.*


::-----------------------------------------------------------------------------------
:: Check for additional flags set
::-----------------------------------------------------------------------------------

if %cheats%==Yes call "core_cheats.cmd"
if %mods%==Yes call "core_mods.cmd"
if %dlc%==Yes call "core_dlc.cmd"
if %multicmp%==Yes call "core_multicmp.cmd"

::-----------------------------------------------------------------------------------
::Attempting to kill unwrapped EXE game process
::-----------------------------------------------------------------------------------

::%kill% "%unwrapped%.exe" >nul

::-----------------------------------------------------------------------------------
::Attempting to kill RNArcade process
::-----------------------------------------------------------------------------------

::%kill% RNArcade.exe >nul

::-----------------------------------------------------------------------------------
::Renaming Original Wrapped EXE's back, if applicable
::-----------------------------------------------------------------------------------

::if renexe==1 set wrapped=%origexe%

::-----------------------------------------------------------------------------------
::Checking Debug Status Flag
::-----------------------------------------------------------------------------------

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






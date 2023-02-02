@echo off

title RealArcade Wrapper Killer    (.-+'~^-+ RGS Multi Installer +-^~`+-.)     [...cRypTiCwaRe 2o22...]

color 1f

set PATH=%PATH%;"C:\unRealArcade\sys\;"C:\unRealArcade\sys\unix"

set show=nircmd win activate ititle

set gamesroot=C:\My Games
set downloadroot=C:\My Download Files

if not exist "%downloadroot%" md "%downloadroot%"

if exist "%temp%\ura_multi_install.tmp" del /f /q "%temp%\ura_multi_install.tmp"
::pause

cls
echo Put all your RGS game installers in the folder that just opened!
echo.
echo.
echo When finished moving all files, press any key to install ALL of them.
echo.
echo.


echo placeholder > "%temp%\ura_multi_install.tmp"
::attrib +h "%temp%\ura_multi_install.tmp"

explorer "%downloadroot%"

%wait% 2

%show% "RGS Multi Installer"

pause>nul


for %%a in ("%downloadroot%\*.rgs") do %%a

		
:: Open My Games folder after extraction is complete (added 20131026)
explorer %gamesroot%



:end
del /f /q "%temp%\ura_multi_install.tmp"
exit


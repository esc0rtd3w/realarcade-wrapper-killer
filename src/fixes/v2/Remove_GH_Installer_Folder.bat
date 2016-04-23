@echo off

title GameHouse Installer Folder Cleanup          [ esc0rtd3w 2012 ]

color 0e

cls
echo Terminating any running instances of GH installer....
echo.

:: Killing any running instances of GH installer
taskkill /f /im "bstrapinstall.exe"
taskkill /f /im "gameinstaller.exe"
taskkill /f /im "gamewrapper.exe"


cls
echo Removing RealArcade folders from Program Files Directories....
echo.

:: Checking for and Removing x86 version
if exist "C:\Program Files\RealArcade" rd /s /q "C:\Program Files\RealArcade"

:: Checking for and Removing x64 version
if exist "C:\Program Files (x86)\RealArcade" rd /s /q "C:\Program Files (x86)\RealArcade"




:end

exit
@echo off

title GameHouse rguninst File Builder v0.1 BETA                               esc0rtd3w

color 0e

cls
::echo Current Settings
::echo.
::echo.
echo Enter Game Name:
echo.
set /p gamename=


cls
echo Current Settings
echo.
echo.
echo Game Name: %gamename%
echo.
echo Enter Stub Name:
echo.
set /p stubname=


cls
echo Current Settings
echo.
echo.
echo Game Name: %gamename%
echo.
echo Stub Name: %stubname%
echo.
echo Enter Content ID:
echo.
set /p contentid=


cls
echo Current Settings
echo.
echo.
echo Game Name: %gamename%
echo.
echo Stub Name: %stubname%
echo.
echo Content ID: %contentid%
echo.
echo File Name: am-%stubname%.rguninst
echo.
echo.
echo Press a key to build new file....
pause>nul


:: Creating Uninstall Information To Registry
echo REG,HKEY_LOCAL_MACHINE,Software\Microsoft\Windows\CurrentVersion\Uninstall\am-%stubname%,DisplayIcon > am-%stubname%.rguninst
echo REG,HKEY_LOCAL_MACHINE,Software\Microsoft\Windows\CurrentVersion\Uninstall\am-%stubname%,UninstallString >> am-%stubname%.rguninst
echo REG,HKEY_LOCAL_MACHINE,Software\Microsoft\Windows\CurrentVersion\Uninstall\am-%stubname%,DisplayName >> am-%stubname%.rguninst

:: Creating Uninstall Reference To GameHouse rguninst File
echo UNINSTSCR,C:\Program Files\RealArcade\Installer\uninstall\am-%stubname%.rguninst >> am-%stubname%.rguninst

:: Creating Start Menu Shortcut
echo SHORTCUT,C:\ProgramData\Microsoft\Windows\Start Menu\Programs\GameHouse\%gamename%.lnk >> am-%stubname%.rguninst

:: Creating Trymedia ActiveMark License Information To Registry
echo REG,HKEY_LOCAL_MACHINE,SOFTWARE\Trymedia Systems\ActiveMARK Software\%contentid%,gameid >> am-%stubname%.rguninst
echo REG,HKEY_LOCAL_MACHINE,SOFTWARE\Trymedia Systems\ActiveMARK Software\,%contentid% >> am-%stubname%.rguninst
echo REG,HKEY_LOCAL_MACHINE,SOFTWARE\Trymedia Systems\ActiveMARK Software\%contentid%,path >> am-%stubname%.rguninst
echo REG,HKEY_LOCAL_MACHINE,SOFTWARE\Trymedia Systems\ActiveMARK Software\,%contentid% >> am-%stubname%.rguninst
echo REG,HKEY_LOCAL_MACHINE,SOFTWARE\Trymedia Systems\ActiveMARK Software\%contentid%,installation_time >> am-%stubname%.rguninst
echo REG,HKEY_LOCAL_MACHINE,SOFTWARE\Trymedia Systems\ActiveMARK Software\,%contentid% >> am-%stubname%.rguninst
echo REG,HKEY_LOCAL_MACHINE,SOFTWARE\Trymedia Systems\ActiveMARK Software\%contentid%,timestamp >> am-%stubname%.rguninst
echo REG,HKEY_LOCAL_MACHINE,SOFTWARE\Trymedia Systems\ActiveMARK Software\,%contentid% >> am-%stubname%.rguninst
echo REG,HKEY_LOCAL_MACHINE,SOFTWARE\Trymedia Systems\ActiveMARK Software\%contentid%,price >> am-%stubname%.rguninst
echo REG,HKEY_LOCAL_MACHINE,SOFTWARE\Trymedia Systems\ActiveMARK Software\,%contentid% >> am-%stubname%.rguninst
echo REG,HKEY_LOCAL_MACHINE,SOFTWARE\Trymedia Systems\ActiveMARK Software\%contentid%,currency >> am-%stubname%.rguninst
echo REG,HKEY_LOCAL_MACHINE,SOFTWARE\Trymedia Systems\ActiveMARK Software\,%contentid% >> am-%stubname%.rguninst
echo REG,HKEY_LOCAL_MACHINE,SOFTWARE\Trymedia Systems\ActiveMARK Software\%contentid%,tracking >> am-%stubname%.rguninst
echo REG,HKEY_LOCAL_MACHINE,SOFTWARE\Trymedia Systems\ActiveMARK Software\,%contentid% >> am-%stubname%.rguninst
echo REG,HKEY_LOCAL_MACHINE,SOFTWARE\Trymedia Systems\ActiveMARK Software\%contentid%,affiliate >> am-%stubname%.rguninst
echo REG,HKEY_LOCAL_MACHINE,SOFTWARE\Trymedia Systems\ActiveMARK Software\,%contentid% >> am-%stubname%.rguninst

:: Creating Removal References to "rguninst"" and "rga" Files (They never exist anyways)
echo RM,C:\GameHouse Games\%gamename% >> am-%stubname%.rguninst
echo RM,C:\GameHouse Games\%gamename%\am-%stubname%.rga >> am-%stubname%.rguninst

:: Creating Removal References to Temp Installer Files
echo RM,C:\Program Files\RealArcade\Installer\commonResources\GameHouse\gamehouse_ >> am-%stubname%.rguninst
echo RM,C:\Program Files\RealArcade\Installer\commonResources\GameHouse\gamehouse_\custom.rga >> am-%stubname%.rguninst
::echo RM,%temp%\GameHouse\checkinst.rar >> am-%stubname%.rguninst

:: Creating Unknown Function That Exists in Most to All Other rguninst Files
echo DECGAME,GameHouse >> am-%stubname%.rguninst


:end


@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Special Situation Handling +-^~`+-.)     [...cRypTiCwaRe 2o16...]

::-----------------------------------------------------------------------------------
:: Special situation handling
::-----------------------------------------------------------------------------------

::if exist "%cd%\PuzzlerWorld2.exe" goto pw2

::goto end



:: Puzzler World 2
:: This game installer weighs in at a hefty 140MB when downloaded.
:: The actual install size is around 34MB. Why?
:pw2
cls

set InstallPath=C:\Program Files\Game House\Puzzler World 2
set Uninstall=unins000.exe

set file1=d3dx9_42.dll
set file2=packpc.t3p
set file3=Puzzler World 2.exe
set installfile=PuzzlerWorld2.exe

set NewPath=C:\My Games\Puzzler World 2

if exist "%InstallPath%\%Uninstall%" goto skpinst

:main
color 0c
cls
echo Installation Status: [NOT INSTALLED]
echo.
echo This game requires special handling....
echo.
echo Please be patient and DO NOT TOUCH THE COMPUTER!!
echo.
echo.

%talk% "This game requires special handling. Please be patient and DO NOT TOUCH THE COMPUTER!" -2

goto inst

:failed
color 0a
cls
echo Installation Status: [FAILED TO INSTALL]
echo.
echo This game requires special handling....
echo.
echo Please be patient and DO NOT TOUCH THE COMPUTER!!
echo.
echo.

%talk% "The installer FAILED TO INSTALL. Please be patient and DO NOT TOUCH THE COMPUTER!" -2


:inst
:: Installing the original install files
start "" /d "%cd%" "%installfile%"

::%show% "Setup - Puzzler World 2"
%waitfor% 4000

::%show% "Setup - Puzzler World 2"
nircmd sendkey enter press
%waitfor% 2000

::%show% "Setup - Puzzler World 2"
nircmd sendkey enter press
%waitfor% 2000

::%show% "Setup - Puzzler World 2"
nircmd sendkey enter press
%waitfor% 2000

::%show% "Setup - Puzzler World 2"
nircmd sendkey enter press
%waitfor% 9000

::%show% "Setup - Puzzler World 2"
nircmd sendkey enter press
%waitfor% 2000

goto startcopy

:skpinst
color 0a
cls
echo Installation Status: [INSTALLED]
echo.
echo This game requires special handling....
echo.
echo Please be patient and DO NOT TOUCH THE COMPUTER!!
echo.
echo.

goto startcopy


:failed2
color 0a
cls
echo Installation Status: [FAILED TO COPY GAME FILES]
echo.
echo This game requires special handling....
echo.
echo Please be patient and DO NOT TOUCH THE COMPUTER!!
echo.
echo.

%talk% "The installer FAILED TO COPY GAME FILES. Please be patient and DO NOT TOUCH THE COMPUTER!" -2

goto startcopy


:startcopy
copy "%InstallPath%\%file1%" "%NewPath%\%file1%"
copy "%InstallPath%\%file2%" "%NewPath%\%file2%"
copy "%InstallPath%\%file3%" "%NewPath%\%file3%"

if exist "%NewPath%\%file3%" goto instok

goto failed2

:instok
%talk% "The installer has been successfully executed and the game files have been transfered!. The original game installer will now be removed. DO NOT TOUCH THE COMPUTER!" -2


:uninst
:: Uninstalling the original install files
start "" /d "%cd%" "%InstallPath%\%Uninstall%"

%waitfor% 2000

::%show% "Setup - Puzzler World 2"
nircmd sendkey enter press
%waitfor% 2000

::%show% "Setup - Puzzler World 2"
nircmd sendkey 0x25 press
%waitfor% 2000

::%show% "Setup - Puzzler World 2"
nircmd sendkey enter press
%waitfor% 8000

::%show% "Setup - Puzzler World 2"
nircmd sendkey enter press
%waitfor% 2000

if exist "%InstallPath%\%Uninstall%" goto failed

:uninstok
%talk% "The original installer has been removed!. Now finishing installation." -2


cd "%NewPath%"

set unwrapped=%file3%

goto end





:end
:: Change color back to green
color 0a

:: Reset "handle" flag
::set handle=0


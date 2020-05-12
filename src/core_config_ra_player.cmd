@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Configuring RA Player +-^~`+-.)     [...cRypTiCwaRe 2o2o...]


:: Added 20110819
::
:: Now using this file to do maintenance on the RealArcade player


:: Temporarily bypassing check of RNArcade.exe (added 20130611)

::if exist %raexec% goto killra
if exist "C:\Program Files\Real\RealArcade\RNArcade.exe" goto killra

::if not exist %raexec% echo The RealArcade software is NOT installed!
goto norna


:killra
cls
if exist "C:\Program Files\Real\RealArcade\RNArcade.exe" echo The Wrapper Killer has detected an installation of the RealArcade software!

if not exist "C:\Program Files\Real\RealArcade\RNArcade.exe" echo.

echo.
echo Press (U) to UNINSTALL the RealArcade software
echo Press (R) to RESTORE the RealArcade software
echo Press (A) to APPLY RNAMOD to the RealArcade software
echo.
echo.
echo It is recommended to remove it unless you have the following needs:
echo.
echo - Ability to update it and download new games.
echo.
echo - You enjoy the interface of the RealArcade player.
echo.
echo - You take advantage of the shortcuts the Wrapper Killer makes in the GUI.
echo.
echo - Other unforseen reasons.
echo.
echo.
echo This option will no longer be available in 10 seconds....
echo.
echo.

if %os%==XP choice /c:nura /t:n,10 /n
if not %os%==XP choice /c nura /d n /n /t 10
if errorlevel 4 goto modRNA
if errorlevel 3 goto restoreRNA
if errorlevel 2 goto removeRNA
if errorlevel 1 goto end
goto end


:removeRNA
:: Setting "rip" (Removal In Progress) flag to "1"
cls
echo Setting Removal In Progress Flag to 1....
echo.
echo.
echo This will cause a 20 second delay in order to remove the RealArcade player
echo.
echo.
echo.
echo.
echo Press (C) to cancel, or click OK on uninstaller and wait to finish....
echo.
echo.
echo.

if %os%==XP choice /c:cn /t:n,6 /n
if not %os%==XP choice /c cn /d n /n /t 6
if errorlevel 2 goto doitnow
::if errorlevel 1 goto end
goto end


:doitnow
cls
echo Click OK on the uninstaller window and wait to finish....
echo.
echo.


set rip=1

::%rauninst%
::"C:\Program Files\Real\RealArcade\Update\rnuninst.exe" "RealNetworks|RealArcade|1.2"
"C:\Program Files\unRealArcade\rnuninst\dokill.lnk"


:: Auto click through below

::%waitfor% 2000
::nircmd sendkey enter press

::%waitfor% 2000
::nircmd sendkey enter press

::%waitfor% 10000
::nircmd sendkey enter press


goto end


:restoreRNA

"C:\Program Files\unRealArcade\temp\rnarestore.exe"

goto end



:modRNA

"C:\Program Files\unRealArcade\temp\rnamod.exe"

goto end


:: OBSOLETE AS OF 20110819
::
:: EVERYTHING BELOW IS OBSOLETE 
::
:: LEFT HERE SIMPLY TO REMEMBER THE PAST :)

::-----------------------------------------------------------------------------------
:: Close ALL instances of RealArcade software
::-----------------------------------------------------------------------------------

cls
echo %msgcfg%
%kill% "RNArcade.exe" >nul

cls
echo %msgcfg%
%waitfor% 5000

::-----------------------------------------------------------------------------------
::Launching RA Player
::-----------------------------------------------------------------------------------

::start /d "%raroot%" RNArcade.exe
cls
echo %msgcfg%
%gohide% %raexec%

::-----------------------------------------------------------------------------------
::Hiding RA Player
::-----------------------------------------------------------------------------------

cls
echo %msgcfg%
%waitfor% 1000
%hide% %wdomain%

::-----------------------------------------------------------------------------------
:: Hiding IE Ad that sometimes shows
::-----------------------------------------------------------------------------------

cls
echo %msgcfg%
%waitfor% 1000
%hide% %wdoad%

::-----------------------------------------------------------------------------------
:: Hiding JavaScript errors that sometimes show
::-----------------------------------------------------------------------------------

cls
echo %msgcfg%
%waitfor% 1000
%hide% %wdojs%

::-----------------------------------------------------------------------------------
::Hiding RA Player
::-----------------------------------------------------------------------------------

cls
echo %msgcfg%
%waitfor% 1000
%hide% %wdomain%

::-----------------------------------------------------------------------------------
:: Hiding IE Ad that sometimes shows
::-----------------------------------------------------------------------------------

cls
echo %msgcfg%
%waitfor% 1000
%hide% %wdoad%

::-----------------------------------------------------------------------------------
:: Hiding JavaScript errors that sometimes show
::-----------------------------------------------------------------------------------

cls
echo %msgcfg%
%waitfor% 1000
%hide% %wdojs%


::-----------------------------------------------------------------------------------
:: Removing the Uninstall flag to not get stuck in a loop (added 2013611)
::-----------------------------------------------------------------------------------
set rauninstall=0


:: Super clean
unlocker "C:\Program Files\Real\RealArcade\*" /s /d
%kill% unlocker.exe
rd /s /q "C:\Program Files\Real\RealArcade"

goto end


:norna

set rauninstall=0

cls
echo RealArcade software was not found!
echo.
echo.

%waitfor% 4000

goto end



:end

set rip=0

:: Setting rauninstalled flag to "1" so the menu restarts after uninstall is finished
:: added 20131103
set rauninstalled=0


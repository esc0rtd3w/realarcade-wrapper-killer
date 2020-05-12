@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ RGS Pre-Release and Unlisted Installer +-^~`+-.)     [...cRypTiCwaRe 2o2o...]


::-----------------------------------------------------------------------------------
:: Set Paths
::-----------------------------------------------------------------------------------

set header=GAMEFIND.DBF.1
set data=GAMEFIND.DBF.2
set footer=GAMEFIND.DBF.3

set gforig=GAMEFIND.DBF
set gfback=GAMEFIND.DBF.RAR

set stubname=0
set guid=0


:getname
cls
echo Drag and Drop the RGS install file into this window and press enter!
echo.
echo.
::%talk% "Please Drag and Drop the R G S install file into this window and press enter!" -2
set /p stubname=

if %stubname%==0 goto norgs

::-----------------------------------------------------------------------------------
:: Load RGS File in Hex Editor
::-----------------------------------------------------------------------------------
:getguid
cls
echo A hex editor has been supplied and the RGS file will be opened!
echo.
echo The GUID number MUST be added to the RA game database to install.
echo.
echo.
echo.
echo To find the GUID, highlight and copy the following ASCII text from:
echo.
echo Offset 353=0x161 to Offset 388=0x184 (Should Be 36 bytes long)
echo.
echo It is located in the first page of the hex editor, right before game name.
echo.
echo.
echo.
echo Sample GUID: 2047AF80-1E6A-11B2-85D7-00D0B7142009
echo.
echo.
echo.
echo.
echo Once Finished, you MUST close the hex editor to continue!
echo.
echo.

::%talk% "Please refer back to this window if you are unsure of what numbers to search for! Once Finished, you MUST close the hex editor to continue!" -2

fshed %stubname% /max

%waitfor% 1000
%show% "RGS Pre-Release Installer"

::-----------------------------------------------------------------------------------
:: Read clipboard and write output to temp file
::-----------------------------------------------------------------------------------

nircmd clipboard writefile "cliptemp.txt"

::-----------------------------------------------------------------------------------
:: Read temp file and write output to variable
::-----------------------------------------------------------------------------------

set clipread=findstr "." "cliptemp.txt"


cls
echo You MUST enter the GUID number manually to install this pre-release game.
echo.
echo.
echo You should have copied the GUID number from the hex editor in the last step.
echo.
echo.
echo.
echo Current Clipboard Data:
echo.
%clipread%
echo.
echo.
echo.
echo.
echo.
echo Enter the GUID or Right-Click to paste from clipboard and press enter....
echo.
echo.
::%talk% "Please Enter the G U I D number from above, or paste from the clipboard and press enter" -2
set /p guid=

if %guid%==0 goto noguid


echo %guid% > "%dbroot%\%data%"

::-----------------------------------------------------------------------------------
:: Check for backed up DBF
::-----------------------------------------------------------------------------------

:chkback
cls
if exist "%dbroot%\%gfback%" goto domerge

::-----------------------------------------------------------------------------------
:: Creating backup
::-----------------------------------------------------------------------------------

:doback
cls
rar a -ep -ep1 -y "%dbroot%\%gfback%" "%dbroot%\%gforig%"


:domerge
cls
copy /b /y "%dbroot%\%header%"+"%dbroot%\%data%"+"%dbroot%\%footer%" "%dbroot%\%gforig%"


:dolaunch

goto phase1


:phase1
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ RGS Pre-Release and Unlisted Installer +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

:: TEMP BYPASS CUSTOM LOADER
::goto bypassc

if %os%==XP goto raxp
if %os%==VISTA goto ravista

::-----------------------------------------------------------------------------------
::Loading Menu For Windows XP
::-----------------------------------------------------------------------------------

:raxp
cls
echo Preparing To Launch RA Player....
::echo.
::echo.
::echo Press the (C) key to use a custom RGS Loader
echo.
echo.
echo.
choice /c:nc /t:n,5 /n
if errorlevel 2 goto cloader
if errorlevel 1 goto bypassc

::-----------------------------------------------------------------------------------
::Loading Menu For Windows Vista/7
::-----------------------------------------------------------------------------------

:ravista
cls
echo Preparing To Launch RA Player....
::echo.
::echo.
::echo Press the (C) key to use a custom RGS Loader
echo.
echo.
echo.
choice /c nc /d n /n /t 5
if errorlevel 2 goto cloader
if errorlevel 1 goto bypassc

:cloader
::-----------------------------------------------------------------------------------
:: Calling custom Database Patching File To Insert The GUID
::-----------------------------------------------------------------------------------

call "core_patch_ra_db.cmd"

::-----------------------------------------------------------------------------------
:: Bypassing default RA Player and loading a custom loader
::-----------------------------------------------------------------------------------

call "core_rgs_loader.cmd"

goto end

::-----------------------------------------------------------------------------------
:: Launching the default RA Player and bypassing the custom loader
::-----------------------------------------------------------------------------------

:bypassc
cls
echo Preparing To Launch Default RA Player....
echo.
echo.
echo.
echo DO NOT click any buttons or press any keys until the install is finished!
%talk% "Please do not click any buttons or press any keys until the game is finished installing!" -2

cls
echo Launching Default RA Player....
::start /d "%raroot%" RNArcade.exe
%gohide% %raexec%
%waitfor% 3000


:skipd

::-----------------------------------------------------------------------------------
:: Hiding IE Ad that sometimes shows
::-----------------------------------------------------------------------------------

%waitfor% 1000
%hide% %wdoad%

::-----------------------------------------------------------------------------------
:: Hiding RA Player Main Window
::-----------------------------------------------------------------------------------

%waitfor% 1000
%hide% %wdomain%

::-----------------------------------------------------------------------------------
:: Hiding JavaScript errors that sometimes show
::-----------------------------------------------------------------------------------

%waitfor% 1000
%hide% %wdojs%

::-----------------------------------------------------------------------------------
:: Hiding IE Ad that sometimes shows
::-----------------------------------------------------------------------------------

%waitfor% 1000
%hide% %wdoad%

::-----------------------------------------------------------------------------------
:: Open RGS Install File
::-----------------------------------------------------------------------------------

cls
echo Launching RGS Installer (Phase 1)....
nircmd shexec "open" %stubname%

::-----------------------------------------------------------------------------------
:: Hiding RA Player Main Window
::-----------------------------------------------------------------------------------

%waitfor% 1000
%hide% %wdomain%

::-----------------------------------------------------------------------------------
:: Hiding IE Ad that sometimes shows
::-----------------------------------------------------------------------------------

%waitfor% 1000
%hide% %wdoad%

::-----------------------------------------------------------------------------------
:: Hiding JavaScript errors that sometimes show
::-----------------------------------------------------------------------------------

%waitfor% 1000
%hide% %wdojs%

::-----------------------------------------------------------------------------------
:: Clicking YES on Install Box
::-----------------------------------------------------------------------------------

cls
echo Launching RGS Installer (Phase 1)....
%waitfor% 4000
nircmd dlg "RNArcade.exe" "" click yes

::-----------------------------------------------------------------------------------
:: Clicking NO on Update Box
::-----------------------------------------------------------------------------------

cls
echo Launching RGS Installer (Phase 1)....
%waitfor% 3000
nircmd dlg "RNArcade.exe" "" click no

goto phase2


:phase2
::-----------------------------------------------------------------------------------
:: Kill RA Player Window
::-----------------------------------------------------------------------------------

cls
echo Launching RGS Installer....
%kill% RNArcade.exe >nul

::-----------------------------------------------------------------------------------
:: Launching RA Player
::-----------------------------------------------------------------------------------

cls
echo Launching RGS Installer (Phase 2)....
::start /d "%raroot%" RNArcade.exe
%gohide% %raexec%

::-----------------------------------------------------------------------------------
:: Hiding IE Ad that sometimes shows
::-----------------------------------------------------------------------------------

%waitfor% 1000
%hide% %wdoad%

::-----------------------------------------------------------------------------------
:: Hiding RA Player Main Window
::-----------------------------------------------------------------------------------

%waitfor% 1000
%hide% %wdomain%

%waitfor% 4000

::-----------------------------------------------------------------------------------
:: Open RGS Install File
::-----------------------------------------------------------------------------------

cls
echo Launching RGS Installer (Phase 2)....
nircmd shexec "open" %stubname%
%waitfor% 3000

::-----------------------------------------------------------------------------------
:: Hiding IE Ad that sometimes shows
::-----------------------------------------------------------------------------------

%waitfor% 1000
%hide% %wdoad%

::-----------------------------------------------------------------------------------
:: Hiding RA Player Main Window
::-----------------------------------------------------------------------------------

%waitfor% 1000
%hide% %wdomain%

::-----------------------------------------------------------------------------------
:: Hiding JavaScript errors that sometimes show
::-----------------------------------------------------------------------------------

%waitfor% 1000
%hide% %wdojs%

::-----------------------------------------------------------------------------------
:: Clicking YES on the install dialog
::-----------------------------------------------------------------------------------

nircmd dlg "RNArcade.exe" "" click yes


::rar e -y "%dbroot%\%gfback%" "%dbroot%"
::del "%dbroot%\%gfback%"

goto phase3


:phase3
cls
echo Installing Game (Phase 3)....
::%talk% "Your game should now be installing! Once finished, you can restart the wrapper killer to unpack this game demo to its full version" -2

goto phase4


:phase4
::-----------------------------------------------------------------------------------
:: Find a way to click the last 2 boxes by knowing when game is finished installing.
:: Waiting for install
::-----------------------------------------------------------------------------------

cls
echo Waiting For Installation To Finish....
echo.
echo Attempting To Close Final Message Boxes (Phase 4)....

goto click5


:click5
nircmd win activate class %wdomain%
%waitfor% 1000
nircmd win activate class %wdomain%
nircmd win activate class %wdomain%

%waitfor% 1000
nircmd sendkey enter press
%waitfor% 1000
nircmd sendkey enter press
%waitfor% 1000
nircmd sendkey enter press
%waitfor% 1000
nircmd sendkey enter press
%waitfor% 1000
nircmd sendkey enter press

goto installq


:installq
%show% "RGS Pre-Release"
%waitfor% 1000
%show% "RGS Pre-Release"
%show% "RGS Pre-Release"

cls
echo Is the game finished installing? [Y/N]

if %os%==XP choice /c:yn /t:n,5 /n
if %os%==VISTA choice /c yn /d n /n /t 5
if errorlevel 2 goto click5
if errorlevel 1 goto end

goto end

:norgs
cls
echo No RGS file was entered!
echo.
echo.
echo The Wrapper Killer will exit now!
echo.
echo.
::%talk% "There was no R G S file entered. The wrapper killer will exit now." -2
goto end


:noguid
cls
echo No GUID number was entered!
echo.
echo.
echo The Wrapper Killer will exit now!
echo.
echo.
::%talk% "There was no G U I D number entered. The wrapper killer will exit now." -2
goto end


:end
%kill% RNArcade.exe >nul
exit



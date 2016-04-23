@echo off

title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Manual Mode +-^~`+-.)     [...cRypTiCwaRe 2o13...]


color 0D

::-----------------------------------------------------------------------------------
:: Checking for "unpackfail" flag status
::
:: This is flagged as "1" if the wrapped exe has been deleted or is missing
::-----------------------------------------------------------------------------------

if %unpackfail%==1 (

call "core_restore.bat"
call "core_rnarcade_spoofer.bat"

)


::-----------------------------------------------------------------------------------
:: Checking for "spoofed" flag
::-----------------------------------------------------------------------------------

if %spoofed%==1 (

cls
echo Spoofing RealArcade Player....
echo.
%kill% %raexec%
%kill% "%wrapped%.exe"
%kill% "delete.exe"
%waitfor% 1000
%remove% "%wrapped%.exe"
%remove% "%wrapped%.ura"
%remove% "delete.exe"
%remove% "delete.ura"

cls
echo Spoofing RealArcade Player....
echo.

goto skipmsg

)



::-----------------------------------------------------------------------------------
:: Bypass Demo Windows Launch Hack
::-----------------------------------------------------------------------------------

echo [Main] > launch.ini
echo GameName= >> launch.ini

:skplnch

::-----------------------------------------------------------------------------------
:: Opening the current folder
:: AMPFIX is a temporary solution to an annoying DOS problem - 20110801
::-----------------------------------------------------------------------------------

if %ampfix%==0 %systemroot%\explorer.exe %cd%

if %ampfix%==1 %systemroot%\explorer.exe "%gameroot%\Garters & Ghouls(TM)"
if %ampfix%==2 %systemroot%\explorer.exe "%gameroot%\Saints & Sinners Bingo"


::-----------------------------------------------------------------------------------
:: Checking if the manual mode came from core_demo_type_override or from a failed 
:: unpack.

:: If the manual mode came from a user selected answer, then they are redirected to
:: the original msgbox1

:: If manual mode came from a failed install, the Wrapper Killer will assume the
:: WRAPPED exe filename is correct.
::-----------------------------------------------------------------------------------

if %manualdto%==1 goto msgbox1


::-----------------------------------------------------------------------------------
:: Force closing RA Player before executing the next commands
:: This prevents the "another instance is already running" message
::-----------------------------------------------------------------------------------

%talk% "DO NOT touch the computer or the unpacking process will fail!" -2

cls
echo Looking for RealArcade Software....
%kill% %raexec2%

cls
echo Looking for RealArcade Software....
%waitfor% 3000

cls
echo Looking for RealArcade Software....
%kill% %raexec2%


::-----------------------------------------------------------------------------------
:: Added 20110817
:: Automatically execute the WRAPPED exe file two times in case the RA Player is
:: installed.

:: This will force the game to launch without user intervention.

:: If RA Player is marked as NOT found, it will only launch the exe file one time
::-----------------------------------------------------------------------------------

cls
echo Looking for RealArcade Software....
if %raexist%==0 goto rano
::if %raexist%==1 goto rayes

:: If yes, launch twice
:rayes

cls
echo Launching Game....
%goshow% "%wrapped%.exe"

cls
echo Launching Game....
%waitfor% 3000

cls
echo Launching Game....
%goshow% "%wrapped%.exe"

goto msgbox2


:: If no, launch once
:rano

cls
echo Launching Game....
%goshow% "%wrapped%.exe"


:: Skipping this messagebox in favor of auto launching the WRAPPED exe
goto msgbox2



:msgbox1
::-----------------------------------------------------------------------------------
:: Show msgbox on top
::-----------------------------------------------------------------------------------

%show% "Information"
%waitfor% 1000
%show% "Information"
%waitfor% 1000
%show% "Information"

::-----------------------------------------------------------------------------------
:: Displaying menu to help choose the proper EXE to launch
::-----------------------------------------------------------------------------------

cls
echo Select your game EXE file to start the unwrapping process....
echo.
echo.
echo Sample EXE Names: sf4_r1a.exe
echo                   diner dash 5 - boom_r1a.exe
echo                   Robotnik.exe
echo                   abysma_win.exe
echo.
echo.

%talk% "Please select and launch your games EXE file. It probably has a nice icon! If the Real Arcade window is displayed, you must launch the EXE file one more time to start the game. The unwrapping process will continue in 10 seconds." -2


:msgbox2

:: Bypassing msgbox for now - added 20110818
if %manualdto%==1 goto msgbox2a
goto skipmsg


:msgbox2a
::-----------------------------------------------------------------------------------
:: Show msgbox on top
::-----------------------------------------------------------------------------------

%show% "Information"
%waitfor% 1000
%show% "Information"
%waitfor% 1000
%show% "Information"

::-----------------------------------------------------------------------------------
:: Checking for type 3 and 3a demo windows
::-----------------------------------------------------------------------------------

cls
echo Waiting for any instances of Demo Windows to be closed....
echo.
echo.
echo If there are any demo windows open press the Play Now button to continue.
echo.
echo.
%talk% "If there are any demo windows open, press the Play Now buttons on them to continue, or the unwrapping process WILL fail! If your game is already running, then just wait until your game is finished unpacking! DO NOT CLOSE THE GAME! or the unwrapping process will fail!" -2


:skipmsg
::-----------------------------------------------------------------------------------
:: Added 20120216
:: Setting "spoofed" flag back to zero so that the spoofer can be activated again
:: If this causes problems, it will be removed
::-----------------------------------------------------------------------------------

set spoofed=0


::-----------------------------------------------------------------------------------
::Removing hidden attributes
::-----------------------------------------------------------------------------------

cls
attrib -h "*.*"

::-----------------------------------------------------------------------------------
::Backing up exe files to ura files
::-----------------------------------------------------------------------------------

cls
echo Extracting Full Version EXE File. Please Wait....
xcopy *.exe *.ura /q /r /y >nul

::-----------------------------------------------------------------------------------
:: Just waiting a few seconds
::-----------------------------------------------------------------------------------

cls
%waitfor% 2000

::-----------------------------------------------------------------------------------
::Removing hidden attributes
::-----------------------------------------------------------------------------------

cls
attrib -h "*.*"

::-----------------------------------------------------------------------------------
:: Checking for TIMERFIX. Default is 5 seconds (DISABLED ON 08-02-2011)
::-----------------------------------------------------------------------------------

::cls
::echo Adjusting current TIMERFIX value to %timerfix% milliseconds....
::echo.
::%waitfor% %timerfix%

::-----------------------------------------------------------------------------------
::Attempting to kill wrapped game process
::-----------------------------------------------------------------------------------

cls
%kill% "%wrapped%.exe"

::-----------------------------------------------------------------------------------
::Deleting wrapped game EXE
::-----------------------------------------------------------------------------------

cls
del "%wrapped%.exe"

::-----------------------------------------------------------------------------------
::Restoring full version exe from backed up ura file
::-----------------------------------------------------------------------------------

cls
echo Configuring Full Version EXE File. Please Wait....
xcopy *.ura *.exe /q /r /y >nul

::-----------------------------------------------------------------------------------
:: Checking for TIMERFIX. Default is 5 seconds (DISABLED ON 08-02-2011)
:: TEXT CHANGED TO NOT CONFUSE!!!
::-----------------------------------------------------------------------------------

::cls
::echo Configuring Full Version EXE File. Please Wait....
::echo.
::%waitfor% %timerfix%


:sc
::-----------------------------------------------------------------------------------
::Bypass question to create shortcut
::-----------------------------------------------------------------------------------

cls
call "core_shortcut_manual.bat"


:end
exit
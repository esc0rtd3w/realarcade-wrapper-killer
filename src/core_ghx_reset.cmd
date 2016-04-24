@echo off
title RealArcade Wrapper Killer          (.-+'~^-+ GH Timer Reset +-^~`+-.)     [...cRypTiCwaRe 2o16...]

color 0e

:initVariables

:: Setting default EXE for testing
set wrappedEXE=0
set profileID=0
set targetWindowStatus=1
set iniDataString=None

set file1="%ALLUSERSPROFILE%\92-75-56-55-p5-r9\profile.ini"
set file2="%ALLUSERSPROFILE%\n7-89-o9-3r-4t-r9\profile.ini"
::set file1="C:\Users\All Users\92-75-56-55-p5-r9\profile.ini"
::set file2="C:\Users\All Users\n7-89-o9-3r-4t-r9\profile.ini"

set resetAttempts=0

goto initTarget


:initTarget

cls
echo Type path or drag the EXE into this window and press ENTER to start:
echo.
echo.

set /p wrappedEXE=

goto initProfileID


:initProfileID

cls
echo Retrieving current Profile ID....
echo.
echo.

::set /p profileID=

goto initDelete


:initDelete

:: Initial Delete (forces 60 minutes back on the clock)
unlocker %file2% /s /d
%kill% unlocker.exe
::del /s /q %file2%

goto initTimeStart


:initTimeStart

:: Display start time

set timeStubLaunch=%time%

cls
echo Stub Launch Time: %time%
echo.
echo.

goto initLaunchStub


:initLaunchStub

start "" ""%wrappedEXE%""

::wait 5

goto initPrepareTimerHack


:initPrepareTimerHack

cls
echo As soon as you see the GO message, click the PLAY NOW button!
echo.
echo.
echo.
echo As soon as you hear the BEEP, click the PLAY NOW button!
echo.
echo.
echo Preparing GH Timer Hack....
echo.
echo.

wait 4

goto initGoLaunch



:initGoLaunch

:: MOVED FROM MAIN LOOP TO BEFORE LOOP TO ALWAYS REWRITE THE 60 MINUTE VALUE BACK TO INI
attrib -s -r -h %file2%
unlocker %file2% /s
%kill% unlocker.exe
type %file2% | findstr "netapi" > "%temp%\ghxProfileID.tmp"
(set /p profileID=)<"%temp%\ghxProfileID.tmp"

del /s /q "%temp%\ghxProfileID.tmp"


cls
echo GO!
echo.
echo.
echo PRESS THE PLAY NOW BUTTON!
echo.
echo.

nircmd beep 500 500

goto loopMain



:loopMain

:: MOVED TO initGoLaunch
:: TO COUNT DOWN TIMER AND SAVE VALUES, USE THE MAIN LOOP FOR DEV PURPOSES
:: Get initial values after launch to find profileID
::attrib -s -r -h %file2%
::unlocker %file2% /s
::type %file2% | findstr "netapi" > "%temp%\ghxProfileID.tmp"
::(set /p profileID=)<"%temp%\ghxProfileID.tmp"


::set profileID=%profileID:netapi.dll-=%

::set profileID=%profileID:~0,-8%


::for %%x in (%profileID%) do echo %%~nx

::echo Profile ID: %profileID%
::pause

::del /s /q "%temp%\ghxProfileID.tmp"

goto loopDeleteProfile



:loopDeleteProfile

set timeDeleteOldProfile=%time%

cls

attrib -s -r -h %file2%

unlocker %file2% /s /d
%kill% unlocker.exe

::del /s /q %file2%

cls
echo --------------------------
echo GH Timer Hack is ACTIVE!
echo --------------------------
echo.
echo Target EXE: %wrappedEXE%
echo.
echo Profile ID: %profileID%
echo.
echo Target Running: %targetWindowStatus%
echo.
echo Number of Reset Attempts: %resetAttempts%
echo.
echo.
echo Stub Launch Time: %timeStubLaunch%
echo.
echo Last File Removal Time: %timeDeleteOldProfile%
echo.
echo Last Reset Values Time: %timeResetProfileValues%
echo.
echo.
echo.
echo Current Data from INI: %iniDataString%
echo.
echo.

if %errorlevel%==1 goto loopDeleteProfile
if %errorlevel%==0 goto loopResetValues

goto loopResetValues


:loopResetValues

set timeResetProfileValues=%time%

cls

echo [netsock] > %file2%
echo %profileID% >> %file2%
::echo netapi.dll-%profileID%=8848169 >> %file2%

cls
echo --------------------------
echo GH Timer Hack is ACTIVE!
echo --------------------------
echo.
echo Target EXE: %wrappedEXE%
echo.
echo Profile ID: %profileID%
echo.
echo Target Running: %targetWindowStatus%
echo.
echo Number of Reset Attempts: %resetAttempts%
echo.
echo.
echo Stub Launch Time: %timeStubLaunch%
echo.
echo Last File Removal Time: %timeDeleteOldProfile%
echo.
echo Last Reset Values Time: %timeResetProfileValues%
echo.
echo.
echo.
echo Current Data from INI: %iniDataString%
echo.
echo.

goto loopGetValues


:loopGetValues

cls

attrib -s -r -h %file2%

:: Get current values from profile.ini
type %file2% | findstr "netapi" > "%temp%\ghxDataString.tmp"

(set /p iniDataString=)<"%temp%\ghxDataString.tmp"

::echo Current Data: %iniDataString%
::pause

del /s /q "%temp%\ghxDataString.tmp"


cls
echo --------------------------
echo GH Timer Hack is ACTIVE!
echo --------------------------
echo.
echo Target EXE: %wrappedEXE%
echo.
echo Profile ID: %profileID%
echo.
echo Target Running: %targetWindowStatus%
echo.
echo Number of Reset Attempts: %resetAttempts%
echo.
echo.
echo Stub Launch Time: %timeStubLaunch%
echo.
echo Last File Removal Time: %timeDeleteOldProfile%
echo.
echo Last Reset Values Time: %timeResetProfileValues%
echo.
echo.
echo.
echo Current Data from INI: %iniDataString%
echo.
echo.

goto loopHackActive


:loopHackActive

set /a resetAttempts+=1

if %targetWindowStatus%==1 set targetWindowStatus=Yes
if %targetWindowStatus%==0 set targetWindowStatus=No

cls
echo --------------------------
echo GH Timer Hack is ACTIVE!
echo --------------------------
echo.
echo Target EXE: %wrappedEXE%
echo.
echo Profile ID: %profileID%
echo.
echo Target Running: %targetWindowStatus%
echo.
echo Number of Reset Attempts: %resetAttempts%
echo.
echo.
echo Stub Launch Time: %timeStubLaunch%
echo.
echo Last File Removal Time: %timeDeleteOldProfile%
echo.
echo Last Reset Values Time: %timeResetProfileValues%
echo.
echo.
echo.
echo Current Data from INI: %iniDataString%
echo.
echo.

wait 60


goto loopMain



:end


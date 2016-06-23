@echo off
title AMI Game Loader Demo Time Lock

:reset

color 0e

set lockStatus=1

set amiTimePlayed=0

set amiStartDateText=%date%
set amiStartTime=%time:~0,2%:%time:~3,2%:%time:~6,2%
set amiStartTimeHours=%time:~0,2%
set amiStartTimeMinutes=%time:~3,2%
set amiStartTimeSeconds=%time:~6,2%

set amiStartDateText="%temp%\ami-startDate.txt"
set amiStartTimeText="%temp%\ami-startTime.txt"

set /p amiLockDate=<%amiStartDateText%
set /p amiLockTime=<%amiStartTimeText%

set /p gameExec=<"%temp%\ami-gameExec.txt"


:lock
color 0a

cls
echo Locking Windows Time Until Game Has Been Terminated....
echo.
echo.

time %amiLockTime%

%wait% 59

wmic process list full | find "%gameExec%" | findstr /v "CommandLine" | findstr /v "Description" | findstr /v "Name"

if errorlevel 0 set lockStatus=1
if errorlevel 1 set lockStatus=0

if %lockStatus%==1 goto lock
if %lockStatus%==0 goto unlock


:unlock
color 0e

cls
echo Restoring Time Back To Normal....
echo.
echo.



time %amiStartTime%+=%amiTimePlayed%

goto end


:end

del /f /q %amiStartDateText%
del /f /q %amiStartTimeText%



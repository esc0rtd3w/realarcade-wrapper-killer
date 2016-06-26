@echo off
title AMI Game Loader Demo Time Lock

:reset

del /f /q "%temp%\ami-startTime.txt"
del /f /q "%temp%\ami-startTime.txt"
del /f /q "%temp%\ami-gameExecCheck.txt"

color 0e

set lockStatus=1

set amiTimePlayed=0

set amiStartDate=%date%
set amiStartTime=%time:~0,2%:%time:~3,2%:%time:~6,2%
set amiStartTimeHours=%time:~0,2%
set amiStartTimeMinutes=%time:~3,2%
set amiStartTimeSeconds=%time:~6,2%

set amiStartDateText="%temp%\ami-startDate.txt"
set amiStartTimeText="%temp%\ami-startTime.txt"

set gameExecText="%temp%\ami-gameExec.txt"
set gameExecTextCheck="%temp%\ami-gameExecCheck.txt"

set amiLockDate=%amiStartDate%
set amiLockTime=%amiStartTime%

set amiLockTimeHours=%amiStartTimeHours%
set amiLockTimeMinutes=%amiStartTimeMinutes%
set amiLockTimeSeconds=%amiStartTimeSeconds%

set amiLockTimeHoursRestore=%amiStartTimeHours%
set amiLockTimeMinutesRestore=%amiStartTimeMinutes%
set amiLockTimeSecondsRestore=%amiStartTimeSeconds%

set amiLockMinutesRunning=0
set amiLockSecondsRunningLoop=0

set waitTime=1

set newTime=0

:lock
%lyellow%

cls
echo Locking Windows Time Until Game Has Been Terminated....
echo.
echo.

:: Set Fake Time
time %amiLockTime%

:: Add Time To Restore Time

:: Adjust SECONDS to match wait time
if %newTime% neq 0 (

	set /a amiLockTimeSecondsRestore+=%waitTime%
	set /a amiLockSecondsRunningLoop+=1
)

:: Adjust MINUTES to match seconds
if %amiLockTimeSecondsRestore% gtr 59 (

	set /a amiLockTimeSecondsRestore=00
	set /a amiLockTimeMinutesRestore+=1
	set /a amiLockMinutesRunning+=1

)

:: Adjust HOURS to match minutes
if %amiLockTimeMinutesRestore% gtr 59 (

	set amiLockTimeMinutesRestore=00
	set /a amiLockTimeHoursRestore+=1

)


echo.
echo.
%lgreen%
echo Game Has Been Running For %amiLockMinutesRunning%:%amiLockSecondsRunningLoop%
echo.
echo.

::%lgreen%
::echo Fake Time: %amiLockTimeHours%:%amiLockTimeMinutes%
::echo.
::echo.

::%laqua%
::echo Current Time: %amiLockTimeHoursRestore%:%amiLockTimeMinutesRestore%
::echo.
::echo.

%wait% %waitTime%

:: Adjust newTime variable after first run
if %newTime% equ 0 (

	set /a newTime+=1
)

set /p gameExec=<%gameExecText%

::setlocal enableextensions
for /f %%x in ('tasklist /nh /fi "IMAGENAME eq %gameExec%"') do if %%x==%gameExec% goto lock
goto unlock
::endlocal

::wmic process list full | find "%gameExec%" | findstr /v "CommandLine" | findstr /v "Description" | findstr /v "Name">%gameExecText%
::wmic process list full | find "%gameExec%" | findstr /v "CommandLine" | findstr /v "Description" | findstr /v "Name">%gameExecTextCheck%

::set /p lockStatus=<%gameExecTextCheck%

::for /f "delims=\ tokens=1" %%a in ('type %gameExecCheck%') do (
::	echo %%a>%gameExecTextCheck%
::)
::echo %gameExecCheck%
::pause

::if %gameExecCheck%==CommandLine=findstr  "%gameExec%" set lockStatus=0

::echo %lockStatus%
::pause

::if %lockStatus%==1 goto lock
::if %lockStatus%==0 goto unlock


:unlock
color 0e

::cls
echo.
echo.
echo Restoring Time Back To Normal....
echo.
echo.

:: Fix for time delay
::set /a amiLockTimeMinutesRestore+=1

time %amiLockTimeHoursRestore%:%amiLockTimeMinutesRestore%:%amiLockTimeSecondsRestore%

::pause

goto end


:end

del /f /q %amiStartDateText%
del /f /q %amiStartTimeText%
del /f /q %gameExecText%


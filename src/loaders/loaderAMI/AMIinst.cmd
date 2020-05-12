@echo off

title RealArcade Wrapper Killer    (.-+'~^-+ AMI Loader v1.0.0 +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

color 1f

set PATH=C:\Program Files\unRealArcade\rawk\dump\{sys};C:\Program Files\unRealArcade\tools\unix-utils;%PATH%

set forceExit=0

::-----------------------------------------------------------------------------------
:: Set Windows OS Version
::-----------------------------------------------------------------------------------
:: Only checking XP. Anything else will be considered VISTA compatible
ver | find "5.1"
if %errorlevel%==0 set os=XP&&goto osCheckDone
ver | find "6.0"
if %errorlevel%==0 set os=VISTA&&goto osCheckDone
ver | find "6.1"
if %errorlevel%==0 set os=WIN7&&goto osCheckDone
ver | find "6.2"
if %errorlevel%==0 set os=WIN8&&goto osCheckDone
ver | find "6.3"
if %errorlevel%==0 set os=WIN81&&goto osCheckDone
ver | find "6.4"
if %errorlevel%==0 set os=WIN10&&goto osCheckDone
ver | find "10."
if %errorlevel%==0 set os=WIN10&&goto osCheckDone
ver | find "10.0"
if %errorlevel%==0 set os=WIN10&&goto osCheckDone
ver | find "10.1"
if %errorlevel%==0 set os=WIN10&&goto osCheckDone
ver | find "10.2"
if %errorlevel%==0 set os=WIN10&&goto osCheckDone
ver | find "10.3"
if %errorlevel%==0 set os=WIN10&&goto osCheckDone
ver | find "10.4"
if %errorlevel%==0 set os=WIN10&&goto osCheckDone
ver | find "10.5"
if %errorlevel%==0 set os=WIN10&&goto osCheckDone
ver | find "10.6"
if %errorlevel%==0 set os=WIN10&&goto osCheckDone
ver | find "10.7"
if %errorlevel%==0 set os=WIN10&&goto osCheckDone
ver | find "10.8"
if %errorlevel%==0 set os=WIN10&&goto osCheckDone
ver | find "10.9"
if %errorlevel%==0 set os=WIN10&&goto osCheckDone
:osCheckDone

::-----------------------------------------------------------------------------------
::Games Installation and Download
::-----------------------------------------------------------------------------------

set gamesroot=C:\Gamehouse Games
set downloadroot=C:\My Download Files

set root=%ProgramFiles%\unRealArcade\loaderAMI

set unpacked=0


:: This method works, but causes a path with NO SPACES to have a space as the suffix
:: Everything seems to copy ok still.
set stubname="%1 %2 %3 %4 %5 %6 %7 %8"

set rawkPath=C:\Program Files\unRealArcade
set rawkExe=rawk.exe
set rawkLaunch="C:\Program Files\unRealArcade\rawk.exe"

set rawkCLIPath=C:\Program Files\unRealArcade\rawk\dump\{app}
set rawkCLIExe=RAUnwrap.bat
set rawkCLILaunch="C:\Program Files\unRealArcade\rawk\dump\{app}\*"

set multiRFS=0


:start
::-----------------------------------------------------------------------------------
:: Check or a multi RFS installation (added 20131026)
::-----------------------------------------------------------------------------------

if exist "%temp%\ura_multi_install.tmp" set multiRFS=1

::echo %multiRFS%
::pause


::-----------------------------------------------------------------------------------
:: Delete old "_tmp" folder
::-----------------------------------------------------------------------------------

rd /s /q "%root%\_tmp"

:: DELETE OTHER OLD RFS FILES IN LOADER2 DIRECTORY
:: added 20131102
del /q /s "%root%\_tmp.rfs"
del /q /s "%root%\_unpack.rfs"

goto noGo


:noGo

cls
echo Not Yet Implemented!
echo.
echo.
pause

goto end


:skiptmp
::-----------------------------------------------------------------------------------
:: Copy the file being clicked and executed to "_tmp.rfs"
::-----------------------------------------------------------------------------------

cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo.
echo Copying RFS File From Source To Temp....
echo.
copy /y %stubname% "%root%\_tmp.rfs"



:chkcerr
::-----------------------------------------------------------------------------------
:: Check for copying errors
::-----------------------------------------------------------------------------------

cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo.
echo Extracting RFS File To Temp....
echo.

if exist "%root%\_tmp.rfs" (

goto noRFS

cls
echo RFS Files Are Currently Not Supported For Extraction!
echo.
echo.
echo.
echo.
echo Press ENTER To Exit....
echo.
echo.

pause>nul

set forceExit=1

goto launch

)


if not exist "%root%\_tmp.rfs" (

color 4f

cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo.
echo RFS Game Installer Failed To Copy!
echo.
echo.
echo Force Retry? [Recommended] [Y/N]
echo.

if %os%==XP choice /c:yn /n
if not %os%==XP choice /c yn /n
if errorlevel 2 goto end

goto skiptmp

)

goto end



:launch

cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo.
echo Extracting RFS File To Temp....
echo.
echo.

rd /s /q  "%root%\_tmp"
md "%root%\_tmp"

"%root%\rar.exe" x "%root%\_tmp.rfs" "%root%\_tmp"

cocolor 1f

goto chkxerr

:: Skipping Some Checks
::goto getini


:chkxerr
::-----------------------------------------------------------------------------------
:: Check for extraction errors
::-----------------------------------------------------------------------------------

if not exist "%root%\_tmp\*.exe" (

color 4f

cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo.
echo Corrupted Extraction Folder Detected!
echo.
echo.
echo Force Retry? [Recommended] [Y/N]
echo.

if %os%==XP choice /c:yn /n
if not %os%==XP choice /c yn /n
if errorlevel 2 exit


regedit /s "%ProgramFiles%\unRealArcade\loaderRFS\setRFS.reg"

exit

)

goto chkextr



:chkextr
::-----------------------------------------------------------------------------------
:: Check _tmp folder again for successful extraction
::-----------------------------------------------------------------------------------

if exist "%root%\_tmp" (

set unpacked=1

goto getini

)

goto end

if not exist "%root%\_tmp" (

color 4f

cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo.
echo No previous extraction found!
echo.
echo.
echo Force Retry? [Recommended] [Y/N]
echo.

if %os%==XP choice /c:yn /n
if not %os%==XP choice /c yn /n
if errorlevel 2 goto end

goto deltmp

)

goto end




:getini

cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo.
echo Extracting Game Name From version.txt....
echo.

wait 2

:: Getting Game Name from launch.ini

set /p GameName=<"%root%\_tmp\version.txt"

::if exist "%root%\_tmp\ds.exe" set GameName=DemonStar



if %unpacked%==1 (

color 2f

cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo.
echo Extracted Game Name: "%GameName%"
echo.
echo.
echo.
echo It is located at: "C:\Gamehouse Games\%GameName%"
echo.
echo.
echo.
echo.
if %multiRFS%==0 echo Once finished, the Wrapper Killer will launch to unpack this game.
if %multiRFS%==0 echo.
if %multiRFS%==0 echo.
echo.
wait 5



xcopy /y /c /i /q /h /r /e  "%root%\_tmp" "%gamesroot%\%GameName%"

	if %errorlevel%==0 (

		rd /s /q "%root%\_tmp"
		
		:: Launch Wrapper Killer if successful extraction (added 20131019)
		if %multiRFS%==0 (
		
		cls
		echo No Multi RFS Detected. Continuing....
		echo.
		
        goto optMenu

		)

	)

)


if %unpacked%==0 (

exit

)


:noRFS

:: Remove Temp RFS File
del /s /q /f  "%root%\_tmp.rfs"

cls
echo *** RFS FILES ARE NOT CURRENTLY SUPPORTED ***
echo.
echo.
echo.
echo *** RFS FILES ARE NOT CURRENTLY SUPPORTED ***
echo.
echo.
echo.
echo *** RFS FILES ARE NOT CURRENTLY SUPPORTED ***
echo.
echo.
echo.
echo.
echo Press (X) to exit
echo.
echo.

if %os%==XP choice /c:x /t:x,5 /n
if not %os%==XP choice /c x /d x /n /t 5
if errorlevel 1 goto end


:runCLI
::echo runCLI
::pause
copy %rawkCLILaunch% "%gamesroot%\%GameName%"
start "" /d "%gamesroot%\%GameName%" "%rawkCLIExe%"

goto end


:runGUI
::echo runGUI
::pause

::copy %rawkCLILaunch% "%gamesroot%\%GameName%"
start "" /d "%rawkPath%" "%rawkExe%"

goto end


:end

exit



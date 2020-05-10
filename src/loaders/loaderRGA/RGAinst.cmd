@echo off

title RealArcade Wrapper Killer    (.-+'~^-+ RGA Loader v1.0.2 +-^~`+-.)     [...cRypTiCwaRe 2o16...]

color 1f

set PATH=C:\Program Files\unRealArcade\rawk\dump\{sys};C:\Program Files\unRealArcade\tools\unix-utils;%PATH%


::-----------------------------------------------------------------------------------
:: Set Windows OS Version
::-----------------------------------------------------------------------------------
set os=XP
ver | find "5.1"
if errorlevel 1 set os=VISTA

:: Only checking XP. Anything else will be considered VISTA compatible
::ver | find "Version 6.1" >nul
::if errorlevel 0 set os=VISTA
::if errorlevel 1 set os=XP

::-----------------------------------------------------------------------------------
::Games Installation and Download
::-----------------------------------------------------------------------------------

set gamesroot=C:\Gamehouse Games
set downloadroot=C:\My Download Files

set root=%ProgramFiles%\unRealArcade\loaders\loaderRGA

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

set multiRGA=0


:start
::-----------------------------------------------------------------------------------
:: Check or a multi RGA installation (added 20131026)
::-----------------------------------------------------------------------------------

if exist "%temp%\ura_multi_install.tmp" set multiRGA=1

::echo %multiRGA%
::pause


::-----------------------------------------------------------------------------------
:: Delete old "_tmp" folder
::-----------------------------------------------------------------------------------

rd /s /q "%root%\_tmp"

:: DELETE OTHER OLD RGA FILES IN LOADER2 DIRECTORY
:: added 20131102
del /q /s "%root%\_tmp.rga"
del /q /s "%root%\_unpack.rga"

goto skiptmp


:skiptmp
::-----------------------------------------------------------------------------------
:: Copy the file being clicked and executed to "_tmp.rga"
::-----------------------------------------------------------------------------------

cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo.
echo Copying RGA File From Source To Temp....
echo.
copy /y %stubname% "%root%\_tmp.rga"



:chkcerr
::-----------------------------------------------------------------------------------
:: Check for copying errors
::-----------------------------------------------------------------------------------

cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo.
echo Extracting RGA File To Temp....
echo.

if exist "%root%\_tmp.rga" (

goto launch

)


if not exist "%root%\_tmp.rga" (

color 4f

cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo.
echo RGA Game Installer Failed To Copy!
echo.
echo.
echo Force Retry? [Recommended] [Y/N]
echo.

if %os%==XP choice /c:yn /n
if %os%==VISTA choice /c yn /n
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
echo Extracting RGA File To Temp....
echo.
echo.

rd /s /q  "%root%\_tmp"
md "%root%\_tmp"

"%root%\rar.exe" x "%root%\_tmp.rga" "%root%\_tmp"

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
if %os%==VISTA choice /c yn /n
if errorlevel 2 exit


regedit /s "%ProgramFiles%\unRealArcade\loader3\setRGA.reg"

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
if %os%==VISTA choice /c yn /n
if errorlevel 2 goto end

goto deltmp

)

goto end




:end


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
if %multiRGA%==0 echo Once finished, the Wrapper Killer will launch to unpack this game.
if %multiRGA%==0 echo.
if %multiRGA%==0 echo.
echo.
wait 5



xcopy /y /c /i /q /h /r /e  "%root%\_tmp" "%gamesroot%\%GameName%"

	if %errorlevel%==0 (

		rd /s /q "%root%\_tmp"
		
		:: Launch Wrapper Killer if successful extraction (added 20131019)
		if %multiRGA%==0 (
		
		cls
		echo No Multi RGA Detected. Continuing....
		echo.
		
        goto optMenu

		)

	)

)


if %unpacked%==0 (

exit

)


:optMenu

:: Remove Temp RGA File
del /s /q /f  "%root%\_tmp.rga"

cls
echo Ready to ATTEMPT Manipulation to this game!
echo.
echo.
echo Please keep in mind that RGA support is currently VERY LIMITED!
echo.
echo.
echo.
echo The default is to run the CLI version silently.
echo.
echo If you would like to change this, please see below.
echo.
echo.
echo.
echo Press (G) to run GUI unpacking setup or (X) to exit
echo.
echo This option will disappear in 5 seconds and load default settings....
echo.
echo.

if %os%==XP choice /c:dgx /t:d,5 /n
if %os%==VISTA choice /c dgx /d d /n /t 5
if errorlevel 3 goto end
if errorlevel 2 goto runGUI
if errorlevel 1 goto runCLI


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



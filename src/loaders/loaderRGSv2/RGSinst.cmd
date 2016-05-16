@echo off

title RealArcade Wrapper Killer    (.-+'~^-+ RGS Loader v2.1.2 +-^~`+-.)     [...cRypTiCwaRe 2o16...]

color 1f


::-----------------------------------------------------------------------------------
:: Set Windows OS Version
::-----------------------------------------------------------------------------------

ver | find "Version 5.1" >nul
if errorlevel 0 set os=XP
if errorlevel 1 set os=VISTA


ver | find "Version 6.1" >nul
if errorlevel 0 set os=VISTA
if errorlevel 1 set os=XP


:: KILL RNARCADE BEFORE PROCEEDING!
:: added 20131102
taskkill /f /t /im "RNArcade.exe"


::-----------------------------------------------------------------------------------
::Games Installation and Download
::-----------------------------------------------------------------------------------

set gamesroot=C:\My Games
set downloadroot=C:\My Download Files

set root=%ProgramFiles%\unRealArcade\loaderRGSv2

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

set multirgs=0


:start
::-----------------------------------------------------------------------------------
:: Check or a multi RGS installation (added 20131026)
::-----------------------------------------------------------------------------------

if exist "%temp%\ura_multi_install.tmp" set multirgs=1

::echo %multirgs%
::pause


::-----------------------------------------------------------------------------------
:: Delete old "_tmp" folder
::-----------------------------------------------------------------------------------

rd /s /q "%root%\_tmp"

:: DELETE OTHER OLD RGS FILES IN LOADER2 DIRECTORY
:: added 20131102
del /q /s "%root%\_tmp.rgs"
del /q /s "%root%\_unpack.rgs"

goto skiptmp


:skiptmp
::-----------------------------------------------------------------------------------
:: Copy the file being clicked and executed to "_tmp.rgs"
::-----------------------------------------------------------------------------------

cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo.
echo Copying RGS File From Source To Temp....
echo.
copy /y %stubname% "%root%\_tmp.rgs"



:chkcerr
::-----------------------------------------------------------------------------------
:: Check for copying errors
::-----------------------------------------------------------------------------------

cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo.
echo Extracting RGS File To Temp....
echo.

if exist "%root%\_tmp.rgs" (

goto launch

)


if not exist "%root%\_tmp.rgs" (

color 4f

cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo.
echo RGS Game Installer Failed To Copy!
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
::-----------------------------------------------------------------------------------
:: Launch the main EXE file. 
::
:: Original EXE searched for "catalog.xtr" and "html.xtr" files and extracted on load
:: 
:: This has been patched to search for "_tmp.rgs" or "_unpack.rgs" files
::-----------------------------------------------------------------------------------

cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo.
echo Extracting RGS File To Temp....
echo.
echo.
echo.
echo.
cocolor 1e
echo If a blank empty dialog box pops up, you can hit OK to close it.
echo.
echo This is a known problem for certain games in specific scenarios.
echo.
echo This can also happen if the downloaded RGS file is corrupted.
echo.
echo.
echo You can force using the v1.x RGS Loader if extraction fails.
echo.
echo.
echo NOTE: If the file is corrupted, neither one of the loaders will work!
echo.

"%root%\RGSInst.exe"

cocolor 1f

goto chkxerr


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
echo Force v1.x Loader? [Recommended] [Y/N]
echo.

if %os%==XP choice /c:yn /n
if %os%==VISTA choice /c yn /n
if errorlevel 2 exit


cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo.
echo After the game is finished installing, do the following:
echo.
echo.
echo 1. Click OK on ALL dialog boxes
echo.
echo 2. Right-Click on the RGS Loader icon in the taskbar and click CLOSE
echo.
echo.



regedit /s "%ProgramFiles%\unRealArcade\loaderRGSv2\setRGS.reg"

wait 5

%stubname%

cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo.
echo If the game did not complete sucessfully, then please try re-downloading
echo the original game installer "RGS File" from the internet.
echo.

wait 5

regedit /s "%ProgramFiles%\unRealArcade\loaderRGSv2\setRGS.reg"



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
echo Extracting Game Name From launch.ini....
echo.

wait 2

:: Getting Game Name from launch.ini
inifile "%root%\_tmp\launch.ini" [Main] GameName

for /f "delims=" %%a in ('inifile.exe "%root%\_tmp\launch.ini" [Main] GameName') do %%a

if exist "%root%\_tmp\ds.exe" set GameName=DemonStar
if exist "%root%\_tmp\windm.exe" set GameName=Diamond Mine
if exist "%root%\_tmp\p3.exe" set GameName=Passage 3
if exist "%root%\_tmp\p3tool.exe" set GameName=Passage 3
if exist "%root%\_tmp\id-ossmallball.exe" set GameName=SmallBall Baseball



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
echo It is located at: "C:\My Games\%GameName%"
echo.
echo.
echo.
echo.
if %multirgs%==0 echo Once finished, the Wrapper Killer will launch to unpack this game.
if %multirgs%==0 echo.
if %multirgs%==0 echo.
echo.
wait 5



xcopy /y /c /i /q /h /r /e  "%root%\_tmp" "%gamesroot%\%GameName%"

	if %errorlevel%==0 (

		rd /s /q "%root%\_tmp"
		
		:: Launch Wrapper Killer if successful extraction (added 20131019)
		if %multirgs%==0 (
		
		cls
		echo No Multi RGS Detected. Continuing....
		echo.
		
        goto optMenu

		)

	)

)


if %unpacked%==0 (

exit

)


:optMenu

cls
echo Ready to unpack the Demo Protection on this game!
echo.
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



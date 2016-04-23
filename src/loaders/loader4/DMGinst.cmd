@echo off

title RealArcade Wrapper Killer    (.-+'~^-+ DMG Loader v1.0.1 +-^~`+-.)     [...cRypTiCwaRe 2o16...]

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

::-----------------------------------------------------------------------------------
::Games Installation and Download
::-----------------------------------------------------------------------------------

set gamesroot=C:\Gamehouse Games
set downloadroot=C:\My Download Files

set root=%ProgramFiles%\unRealArcade\loader4

set unpacked=0

set nameFound=0


:: This method works, but causes a path with NO SPACES to have a space as the suffix
:: Everything seems to copy ok still.
set stubname="%1 %2 %3 %4 %5 %6 %7 %8"

set rawkPath=C:\Program Files\unRealArcade
set rawkExe=rawk.exe
set rawkLaunch="C:\Program Files\unRealArcade\rawk.exe"

set rawkCLIPath=C:\Program Files\unRealArcade\rawk\dump\{app}
set rawkCLIExe=RAUnwrap.bat
set rawkCLILaunch="C:\Program Files\unRealArcade\rawk\dump\{app}\*"

set multiDMG=0


:start
::-----------------------------------------------------------------------------------
:: Check or a multi DMG installation (added 20131026)
::-----------------------------------------------------------------------------------

if exist "%temp%\ura_multi_install.tmp" set multiDMG=1

::echo %multiDMG%
::pause


::-----------------------------------------------------------------------------------
:: Delete old "_tmp" folder
::-----------------------------------------------------------------------------------

rd /s /q "%root%\_tmp"

:: DELETE OTHER OLD DMG FILES IN LOADER2 DIRECTORY
:: added 20131102
del /q /s "%root%\_tmp.dmg"
del /q /s "%root%\_unpack.dmg"

goto skiptmp


:skiptmp
::-----------------------------------------------------------------------------------
:: Copy the file being clicked and executed to "_tmp.dmg"
::-----------------------------------------------------------------------------------

cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo.
echo Copying DMG File From Source To Temp....
echo.
copy /y %stubname% "%root%\_tmp.dmg"



:chkcerr
::-----------------------------------------------------------------------------------
:: Check for copying errors
::-----------------------------------------------------------------------------------

cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo.
echo Extracting DMG File To Temp....
echo.

if exist "%root%\_tmp.dmg" (

goto launch

)


if not exist "%root%\_tmp.dmg" (

color 4f

cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo.
echo DMG Game Installer Failed To Copy!
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
echo Extracting DMG File To Temp....
echo.
echo.

rd /s /q  "%root%\_tmp"
md "%root%\_tmp"

"%root%\7z.exe" x "%root%\_tmp.dmg" -o"%root%\_tmp\"

cocolor 1f

goto chkxerr

:: Skipping Some Checks
::goto getini


:chkxerr
::-----------------------------------------------------------------------------------
:: Check for extraction errors
::-----------------------------------------------------------------------------------
cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo.
echo Extracting HFS File To Temp....
echo.
echo.

if not exist "%root%\_tmp\2.hfs" (

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


regedit /s "%ProgramFiles%\unRealArcade\loader4\setDMG.reg"

exit

)

:: Perform 2nd Extraction (2.hfs)
"%root%\7z.exe" x "%root%\_tmp\2.hfs" -o"%root%\_tmp\"

:: Cleanup Leftover Files
del /f /s /q "%root%\_tmp\0.ddm"
del /f /s /q "%root%\_tmp\1.Apple_partition_map"
del /f /s /q "%root%\_tmp\2.hfs"

goto chkextr



:chkextr
::-----------------------------------------------------------------------------------
:: Check _tmp folder again for successful extraction of "2.hfs"
::-----------------------------------------------------------------------------------

dir /b "%root%\_tmp\">%temp%\checkDmgStatus.txt
set /p nameFound=<%temp%\checkDmgStatus.txt

::echo %nameFound%
::pause

if exist "%root%\_tmp\%nameFound%\.DS_Store" (

set unpacked=1

goto getini

)

goto end

if not exist "%root%\_tmp\%nameFound%\.DS_Store" (

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
echo Extracting Game Name....
echo.

wait 2


if %unpacked%==1 (

color 2f

cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo.
echo Extracted Game Name: "%nameFound%"
echo.
echo.
echo.
echo It is located at: "C:\Gamehouse Games\%nameFound%"
echo.
echo.
echo.
echo.
echo.
wait 5



::xcopy /y /c /i /q /h /r /e  "%root%\_tmp" "%gamesroot%\%nameFound%"
xcopy /y /c /i /q /h /r /e  "%root%\_tmp" "%gamesroot%"

	if %errorlevel%==0 (

		rd /s /q "%root%\_tmp"
		
		:: Launch Wrapper Killer if successful extraction (added 20131019)
		if %multiDMG%==0 (
		
		cls
		echo No Multi DMG Detected. Continuing....
		echo.
		
        goto optMenu

		)

	)

)


if %unpacked%==0 (

exit

)


:optMenu

:: Remove Temp DMG File
del /s /q /f  "%root%\_tmp.dmg"

cls
echo Extracted Mac OSX Game!
echo.
echo.
echo Please keep in mind that DMG support is currently VERY LIMITED!
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo Press (X) to Exit
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
::copy %rawkCLILaunch% "%gamesroot%\%nameFound%"
::start "" /d "%gamesroot%\%nameFound%" "%rawkCLIExe%"

goto end


:runGUI
::echo runGUI
::pause

::copy %rawkCLILaunch% "%gamesroot%\%nameFound%"
::start "" /d "%rawkPath%" "%rawkExe%"

goto end


:end

:: Clean Junk Mac Files
del /f /s /q "%gamesroot%\%nameFound%\.DS_Store"
del /f /s /q "%gamesroot%\%nameFound%\.VolumeIcon.icns"

:: Clean Junk Mac Directories
rd /s /q "%gamesroot%\%nameFound%\.background"
rd /s /q "%gamesroot%\%nameFound%\.HFS+ Private Directory Data_"
rd /s /q "%gamesroot%\%nameFound%\.Trashes"
rd /s /q "%gamesroot%\%nameFound%\[]"

del /f /s /q "%temp%\checkDmgStatus.txt"

explorer.exe "%gamesroot%"

exit



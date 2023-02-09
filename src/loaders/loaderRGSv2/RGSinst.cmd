@echo off

title RealArcade Wrapper Killer    (.-+'~^-+ RGS Loader v2.1.4 +-^~`+-.)     [...cRypTiCwaRe 2o22...]

color 1f

set debug=0

:: Check Architecture
set bits=32
if not exist "C:\Program Files (x86)" set bits=32
if exist "C:\Program Files (x86)" set bits=64
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" set bits=64

:: Registry Commands
set reg=reg
set regForce=reg /f
set regForceAdd=reg add /f
set regAdd=reg add
set regForceDelete=reg delete /f
set regDelete=reg delete
set regQuery=reg query /f


::-----------------------------------------------------------------------------------
::System Paths
::-----------------------------------------------------------------------------------

:: Common OS Paths
set pf=%systemdrive%\Program Files
set cf=%systemdrive%\Program Files\Common Files
set pf64=%systemdrive%\Program Files (x86)
set cf64=%systemdrive%\Program Files (x86)\Common Files
set pd=%ProgramData%
set pdxp=%UserProfile%\Application Data\
set adl=%LocalAppData%
set adll=%SystemDrive%%HomePath%\AppData\LocalLow
set adr=%AppData%
set au=%SystemDrive%\All Users
set auxp=%systemdrive%\Documents and Settings\All Users
set cu=%UserProfile%
set cuxp=%userprofile%\Application Data
set win=%windir%
set sys32=%windir%\system32
set sysprofile=%windir%\system32\config\systemprofile
set userdir=%userprofile%
set cookies=%AppData%\Microsoft\Windows\Cookies

:: Temp Paths
set temp1=%tempGlobal%
set temp2=%systemdrive%\Temp
set temp3=%windir%\Temp
set temp4=%windir%\system32\config\systemprofile\AppData\Local\Temp
set tempInit=%tempGlobal%
set tempDirectory=%tempInit%
set tempSys=%windir%\TEMP

:: Desktop Paths
set deskau=%public%\Desktop
set deskcu=%SystemDrive%%HomePath%\Desktop

:: Start Menu Paths
set startau=%systemdrive%\Users\All Users\Microsoft\Windows\Start Menu\Programs
set startcu=%AppData%\Microsoft\Windows\Start Menu\Programs

:: Documents Paths
set docsau=%Public%\Documents
set docscu=%UserProfile%\Documents

:: Misc paths used in backup routine (may be unreferenced)
set user=%UserProfile%
set appdata2=%user%\AppData

:: Default Common User Paths
set contacts=%UserProfile%\Contacts
set desktop=%UserProfile%\Desktop
set mydownloads=%UserProfile%\Downloads
set favorites=%UserProfile%\Favorites
set links=%UserProfile%\Links
set mydocuments=%UserProfile%\My Documents
set mymusic=%UserProfile%\My Music
set mypictures=%UserProfile%\My Pictures
set myvideos=%UserProfile%\My Videos
set savedgames=%UserProfile%\Saved Games
set searches=%UserProfile%\Searches

:: Alternate Default Common User Paths
set documents=%UserProfile%\Documents
set downloads=%UserProfile%\Downloads
set pictures=%UserProfile%\Pictures
set music=%UserProfile%\Music
set videos=%UserProfile%\Videos

:: System User Paths
set sysUserRoot=%windir%\system32\config\systemprofile
set sysUserAppData=%windir%\system32\config\systemprofile\AppData
set sysUserAppDataLocal=%windir%\system32\config\systemprofile\AppData\Local
set sysUserAppDataLocalLow=%windir%\system32\config\systemprofile\AppData\LocalLow
set sysUserAppDataRoaming=%windir%\system32\config\systemprofile\AppData\Roaming
set sysUserDesktop=%windir%\system32\config\systemprofile\Desktop
set sysUserDocuments=%windir%\system32\config\systemprofile\Documents
set sysUserDownloads=%windir%\system32\config\systemprofile\Downloads
set sysUserFavorites=%windir%\system32\config\systemprofile\Favorites
set sysUserMusic=%windir%\system32\config\systemprofile\Music
set sysUserPictures=%windir%\system32\config\systemprofile\Pictures
set sysUserVideos=%windir%\system32\config\systemprofile\Videos

:: unRealArcade Paths
set uraRoot=C:\unRealArcade
set uraToolsRoot=%uraRoot%\tools
set uraServicesRoot=%uraRoot%\services
set uraStubRoot=%uraRoot%\stubs
set uraTempRoot=%uraRoot%\temp
set rawkRoot=%uraRoot%\rawk
set uraSysRoot=%uraRoot%\sys
set uraSysRootUnix=%uraRoot%\sys\unix

:: URA System Paths
set choicexp="%uraSysRoot%\choicexp.exe"
set color="%uraSysRoot%\color.exe"
set cocolor="%uraSysRoot%\cocolor.exe"
set ctext="%uraSysRoot%\ctext.exe"
set filver32="%uraSysRoot%\filver32.exe"
set wait="%uraSysRoot%\wait.exe"
set gpatch="%uraSysRoot%\gpatch.exe"
set bspatch="%uraSysRoot%\bspatch.exe"
set fsum="%uraSysRoot%\fsum.exe"
set inifile="%uraSysRoot%\inifile.exe"
set nircmd="%uraSysRoot%\nircmd.exe"
set rar="%uraSysRoot%\rar.exe"
set xtimer="%uraSysRoot%\xtimer.exe"
set subfile="%uraSysRoot%\subfile.exe"
set inject="%uraSysRoot%\inject.exe"
set nop="%uraSysRoot%\nop.exe"
set now="%uraSysRoot%\now.exe"
set dummy="%uraSysRoot%\dummy.exe"
set setlevel="%uraSysRoot%\setlevel.exe"
set gcfextr="%uraSysRoot%\gcfextr.exe"
set sfk="%uraSysRoot%\sfk.exe"
set qgrep="%uraSysRoot%\qgrep.exe"
::set tail="%uraSysRoot%\tail.exe"
set taskkillxp="%uraSysRoot%\taskkillxp.exe"
set tasklistxp="%uraSysRoot%\tasklistxp.exe"
set Unlocker="%uraSysRoot%\Unlocker.exe"
set wun="%uraSysRoot%\wun.exe"
set innounp="%uraSysRoot%\innounp.exe"
set wget="%uraSysRoot%\wget.exe"
::set luac="%uraSysRoot%\lua\luac.exe"
::set luadec="%uraSysRoot%\lua\luadec.exe"
set uniq="%uraSysRoot%\uniq.exe"
set hidecon="%uraSysRoot%\hidecon.exe"
set hideexec="%uraSysRoot%\hideexec.exe"
set quiet="%uraSysRoot%\quiet.exe"
set sevenZ="%uraSysRoot%\sevenZ.exe"
set initool="%uraSysRoot%\initool.exe"

:: URA Unix Utilities
set agrep="%uraSysRootUnix%\agrep.exe"
set bunzip2="%uraSysRootUnix%\bunzip2.exe"
set bzip2="%uraSysRootUnix%\bzip2.exe"
set bzip2recover="%uraSysRootUnix%\bzip2recover.exe"
set cat="%uraSysRootUnix%\cat.exe"
set cmp="%uraSysRootUnix%\cmp.exe"
set dd="%uraSysRootUnix%\dd.exe"
set diff="%uraSysRootUnix%\diff.exe"
set diff3="%uraSysRootUnix%\diff3.exe"
set du="%uraSysRootUnix%\du.exe"
set egrep="%uraSysRootUnix%\egrep.exe"
set env="%uraSysRootUnix%\env.exe"
set fgrep="%uraSysRootUnix%\fgrep.exe"
set gawk="%uraSysRootUnix%\gawk.exe"
set grep="%uraSysRootUnix%\grep.exe"
set gunzip="%uraSysRootUnix%\gunzip.exe"
set gzip="%uraSysRootUnix%\gzip.exe"
set head="%uraSysRootUnix%\head.exe"
set ls="%uraSysRootUnix%\ls.exe"
set printenv="%uraSysRootUnix%\printenv.exe"
set mkdir="%uraSysRootUnix%\mkdir.exe"
set sdiff="%uraSysRootUnix%\sdiff.exe"
set sed="%uraSysRootUnix%\sed.exe"
set tail="%uraSysRootUnix%\tail.exe"
::set unrar="%uraSysRootUnix%\unrar.exe"
set uudecode="%uraSysRootUnix%\uudecode.exe"
set uuencode="%uraSysRootUnix%\uuencode.exe"
set zcat="%uraSysRootUnix%\zcat.exe"
::set zip="%uraSysRootUnix%\zip.exe"

:: Set System Paths
set PATH=%PATH%;"%uraSysRoot%;"%uraSysRootUnix%"


::-----------------------------------------------------------------------------------
:: Color Control Crap
::-----------------------------------------------------------------------------------

set black=%cocolor% 00
set blue=%cocolor% 01
set green=%cocolor% 02
set aqua=%cocolor% 03
set red=%cocolor% 04
set purple=%cocolor% 05
set yellow=%cocolor% 06
set white=%cocolor% 07
set gray=%cocolor% 08
set lblue=%cocolor% 09
set lgreen=%cocolor% 0A
set laqua=%cocolor% 0B
set lred=%cocolor% 0C
set lpurple=%cocolor% 0D
set lyellow=%cocolor% 0E
set lwhite=%cocolor% 0F


:: External CMD Options
set runShellNoTerminateAndWait=cmd /k
set runShellNoTerminate=start cmd /k
set runShellWaitNoTerminate=start /wait cmd /k
set runShellTerminateAndWait=cmd /c
set runShellTerminate=start cmd /c
set runShellWaitTerminate=start /wait cmd /c

set runTerminate=start ""
set runWaitTerminate=start "" /wait


::-----------------------------------------------------------------------------------
::Set Windows OS Version
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
:: KILL RNARCADE BEFORE PROCEEDING!
:: added 20131102
if %os%==XP %taskkillxp% /f /t /im "RNArcade.exe"
if %os%==XP %taskkillxp% /f /t /im "RGSinst.exe"
if not %os%==XP taskkill /f /t /im "RNArcade.exe"
if not %os%==XP taskkill /f /t /im "RGSinst.exe"
::-----------------------------------------------------------------------------------


::-----------------------------------------------------------------------------------
::Games Installation and Download
::-----------------------------------------------------------------------------------

set gamesroot=C:\My Games
set downloadroot=C:\My Download Files

set root=%uraRoot%\loaders\loaderRGSv2

:: Some games do not have an EXE in its root. This flag is for that.
set altPath=0

set unpacked=0

:: This method works, but causes a path with NO SPACES to have a space as the suffix
:: Everything seems to copy ok still.
set stubnameRaw="%1 %2 %3 %4 %5 %6 %7 %8"
set stubname=%stubnameRaw: =%


if %debug%==1 (
	echo Check Stub Name Variables
	echo.
	echo stubnameRaw: %stubnameRaw%
	echo stubname: %stubname%
	echo.
	pause
)

set rawkPath=%uraRoot%
set rawkExe=rawk.exe
set rawkLaunch="%uraRoot%\rawk.exe"

set rawkCLIPath=%uraRoot%\rawk\dump\{app}
set rawkCLIExe=RAUnwrap.cmd
set rawkCLILaunch="%uraRoot%\rawk\dump\{app}\*"

set log="%root%\loaderRGSv2.log"

set multirgs=0

:: This flag is for the extracted game name
set GameNameFail=0

:: Check Debug File
if exist "%root%\debug.on" set debug=1


:start
echo [INFO] loaderRGSv2 start>>%log%
echo [INFO] DEBUG MODE %debug%>>%log%
::time>>%log%
::-----------------------------------------------------------------------------------
:: Check for a multi RGS installation (added 20131026)
::-----------------------------------------------------------------------------------

if exist "%temp%\ura_multi_install.tmp" set multirgs=1

::echo %multirgs%
::pause
 
if %debug%==1 (
	echo Dump RAWK Environment Variables
	echo.
	set
	echo.
	pause
	echo.
)

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
echo Source: %stubname%
echo.
echo Copying RGS File From Source To Temp....
echo.
echo [INFO] Copying RGS file from source to temp START>>%log%
echo [INFO] RGS Filename: [%stubname%]>>%log%

copy /y %stubname% "%root%\_tmp.rgs"
echo [INFO] Copying RGS file from source to temp COMPLETE>>%log%




:chkcerr
::-----------------------------------------------------------------------------------
:: Check for copying errors
::-----------------------------------------------------------------------------------

cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo Source: %stubname%
echo.
echo Extracting RGS File To Temp....
echo.

if exist "%root%\_tmp.rgs" (
	echo [INFO] RGS Game Installer Copied Successfully>>%log%
	goto launch

)


if not exist "%root%\_tmp.rgs" (
	echo [ERROR] RGS Game Installer Failed To Copy>>%log%

	color 4f

	cls
	echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
	echo.
	echo.
	echo Source: %stubname%
	echo.
	echo RGS Game Installer Failed To Copy!
	echo.
	echo.
	echo Force Retry? [Recommended] [Y/N]
	echo.

	if %os%==XP choicexp /c:yn /n
	if %os%==VISTA choice /c yn /n
	if errorlevel 2 goto end
	
	pause

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
echo Source: %stubname%
echo.
echo Extracting RGS File To Temp....
echo.
echo.
echo.
echo.
%cocolor% 1e
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

echo [INFO] Launching Game Installer START>>%log%
"%root%\RGSInst.exe"
echo [INFO] Closing Game Installer COMPLETE>>%log%

%cocolor% 1f

goto chkxerr


:chkxerr
::-----------------------------------------------------------------------------------
:: Check for extraction errors
::-----------------------------------------------------------------------------------

if not exist "%root%\_tmp\*.exe" (
	echo [ERROR] Game EXE Not Exist>>%log%
	
	echo [INFO] Checking alternate paths>>%log%
	
	if exist "%root%\_tmp\Gamefiles\hoyleboard.exe" echo [INFO] Alternate Path: Gamefiles\hoyleboard.exe>>%log%
	if exist "%root%\_tmp\Gamefiles\hoyleboard.exe" set altPath=1&&goto chkextr
	
	if exist "%root%\_tmp\Gamefiles\hoylecard.exe" echo [INFO] Alternate Path: Gamefiles\hoylecard.exe>>%log%
	if exist "%root%\_tmp\Gamefiles\hoylecard.exe" set altPath=1&&goto chkextr
	
	if exist "%root%\_tmp\Engine\lithtech.exe" echo [INFO] Alternate Path: Engine\lithtech.exe>>%log%
	if exist "%root%\_tmp\Engine\lithtech.exe" set altPath=1&&goto chkextr
	

	color 4f
	echo [INFO] Fallback to v1 loader START>>%log%

	cls
	echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
	echo.
	echo.
	echo Source: "%root%\_tmp"
	echo.
	echo Corrupted Extraction Folder Detected!
	echo.
	echo.
	echo Force v1.x Loader? [Recommended] [Y/N]
	echo.

	if %os%==XP choicexp /c:yn /n
	if %os%==VISTA choice /c yn /n
	if errorlevel 2 goto end


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


	echo [INFO] v1 loader set registry>>%log%
	regedit /s "%root%\setRGS.reg"

	%wait% 5

	echo [INFO] v1 loader launch exe>>%log%
	%stubname%

	cls
	echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
	echo.
	echo.
	echo.
	echo If the game did not complete sucessfully, then please try re-downloading
	echo the original game installer "RGS File" from the internet.
	echo.

	%wait% 5

	echo [INFO] v1 loader set registry>>%log%
	regedit /s "%root%\setRGS.reg"

	echo [INFO] Fallback to v1 loader COMPLETE>>%log%

	end

)

goto chkextr



:chkextr
::-----------------------------------------------------------------------------------
:: Check _tmp folder again for successful extraction
::-----------------------------------------------------------------------------------

::echo altPath: %altPath%
::pause
	
if exist "%root%\_tmp" (
	echo [INFO] Game Extraction Folder Detected>>%log%

	set unpacked=1
	goto getini

)


if not exist "%root%\_tmp" (
	echo [ERROR] Game Extraction Folder Not Detected>>%log%

	color 4f

	cls
	echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
	echo.
	echo.
	echo Source: "%root%\_tmp"
	echo.
	echo No previous extraction found!
	echo.
	echo.
	echo Force Retry? [Recommended] [Y/N]
	echo.

	if %os%==XP choicexp /c:yn /n
	if %os%==VISTA choice /c yn /n
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
echo Extracting Game Name From launch.ini....
echo.

%wait% 2

echo [INFO] Extracting Game Name From launch.ini START>>%log%

:: Getting Game Name from launch.ini
::%inifile% "%root%\_tmp\launch.ini" [Main] GameName
%initool% g "%root%\_tmp\launch.ini" Main GameName --value-only>"%temp%\ura_gamename.tmp"

::for /f "delims=" %%a in (^"%initool% g "%root%\_tmp\launch.ini" Main GameName --value-only) do %%a
set /p GameName=<%temp%\ura_gamename.tmp"

if %debug%==1 (
	echo Dump GameName From INI
	echo.
	echo GameName: %GameName%
	echo.
	pause
	echo.
)

echo [INFO] Extracting Game Name From launch.ini COMPLETE>>%log%

echo [INFO] Setting GameName for games that have issues getting correct value START>>%log%

if exist "%root%\_tmp\gia_crimeandpunishment_r1a.exe" set GameName=Crime and Punishment - Who Framed Raskolnikov
if exist "%root%\_tmp\ds.exe" set GameName=DemonStar
if exist "%root%\_tmp\windm.exe" set GameName=Diamond Mine
if exist "%root%\_tmp\escapefromlostisland_r1a.exe" set GameName=Escape From Lost Island
if exist "%root%\_tmp\fortunetiles_r1a.exe" set GameName=Fortune Tiles Gold
if exist "%root%\_tmp\Gamefiles\hoyleboard.exe" set GameName=Hoyle Board Games
if exist "%root%\_tmp\Gamefiles\hoylecard.exe" set GameName=Hoyle Card Games
if exist "%root%\_tmp\jetsetter_r1a.exe" set GameName=Jet Setter
if exist "%root%\_tmp\earth day_r1a.exe" set GameName=National Geographic Earth Day Pack
if exist "%root%\_tmp\p3.exe" set GameName=Passage 3
if exist "%root%\_tmp\p3tool.exe" set GameName=Passage 3
if exist "%root%\_tmp\id-ossmallball.exe" set GameName=SmallBall Baseball
if exist "%root%\_tmp\Engine\lithtech.exe" set GameName=Tex Atomic's Big Bot Battles
if exist "%root%\_tmp\wobblybobbly_r1a.exe" set GameName=Wobbly Bobbly

echo [INFO] Setting GameName for games that have issues getting correct value COMPLETE>>%log%

echo [INFO] Extracted Game Name: "%GameName%">>%log%
 
if %debug%==1 (
	echo Dump GameName From INI
	echo.
	echo GameName: %GameName%
	echo.
	pause
	echo.
)

if "%GameName%"=="" set GameNameFail=1&&goto errName

echo [INFO] RGS Unpack START>>%log%
:: Launch Wrapper Killer if successful extraction (added 20131019)
if %unpacked%==1 (
	echo [INFO] RGS Unpack SUCCESS>>%log%

	color 2f

	cls
	echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
	echo.
	echo.
	echo Copying files to default games location...
	echo.
	echo.
	echo.
	echo.
	echo Extracted Game Name: "%GameName%"
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
	
	%wait% 5

	xcopy /y /c /i /q /h /r /e  "%root%\_tmp" "%gamesroot%\%GameName%"
	
	if %errorlevel%==0 (
	
		rd /s /q "%root%\_tmp"
		
		if %multirgs%==0 (

			cls
			echo No Multi RGS Detected. Continuing....
			echo.
			
			goto optMenu

		)
	)
)

if %unpacked%==0 (
	echo [ERROR] RGS Unpack FAILED>>%log%
	color 4f
	cls
	echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
	echo.
	echo.
	echo The unpacking FAILED!
	echo.
	echo.
	echo Source: "%root%\_tmp"
	echo.
	echo No "_tmp" folder detected.
	echo.
	pause
	goto end

)
goto end

:errName
if %GameNameFail%==1 (
	echo [ERROR] Extracted Game Name Is BLANK>>%log%
	color 4f
	cls
	echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
	echo.
	echo.
	echo The game name extraction FAILED!
	echo.
	echo.
	echo Source: "C:\My Games\[GameName]"
	echo.
	echo Extracted Game Name Is BLANK.
	echo.
	pause
	goto end

)

:optMenu
echo [INFO] Launch Wrapper Killer START>>%log%
echo [INFO] Ready to unpack the Demo Protection on this game>>%log%

cls
echo DO NOT CLOSE THIS WINDOW!! IT WILL CLOSE WHEN FINISHED!!
echo.
echo.
echo Ready to unpack the Demo Protection on this game!
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

if %os%==XP choicexp /c:dgx /t:d,5 /n
if %os%==VISTA choice /c dgx /d d /n /t 5

::echo %errorlevel%
::pause

if errorlevel 3 goto end
if errorlevel 2 goto runGUI
if errorlevel 1 goto runCLI


:runCLI
echo [INFO] Run CLI Wrapper Killer START>>%log%
::echo runCLI
::pause

:: Setting this causes the RAUnwrap to also run the core_clean_cli script at its end
set cliActive=1

copy %rawkCLILaunch% "%gamesroot%\%GameName%"
start "" /d "%gamesroot%\%GameName%" "%rawkCLIPath%\%rawkCLIExe%"

echo [INFO] CLI Params - %rawkCLILaunch% "%gamesroot%\%GameName%">>%log%
echo [INFO] Run CLI Wrapper Killer END>>%log%

goto end


:runGUI
echo [INFO] Run GUI Wrapper Killer START>>%log%
::echo runGUI
::pause

::copy %rawkCLILaunch% "%gamesroot%\%GameName%"
start "" /d "%rawkPath%" "%rawkExe%"

echo [INFO] Run GUI Wrapper Killer END>>%log%
echo [INFO] Launch Wrapper Killer END>>%log%

goto end


:end
echo [INFO] loaderRGSv2 end>>%log%
::time>>%log%
echo.>>%log%
echo.>>%log%

exit



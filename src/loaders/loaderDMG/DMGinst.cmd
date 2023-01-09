@echo off

title RealArcade Wrapper Killer    (.-+'~^-+ DMG Loader v1.0.1 +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

color 1f

set PATH=%PATH%;"C:\unRealArcade\sys\;"C:\unRealArcade\sys\unix"

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
set uraToolsRoot=C:\unRealArcade\tools
set uraServicesRoot=C:\unRealArcade\services
set uraStubRoot=C:\unRealArcade\stubs
set uraTempRoot=C:\unRealArcade\temp
set rawkRoot=C:\unRealArcade\rawk
set uraSysRoot=C:\unRealArcade\sys
set uraSysRootUnix=C:\unRealArcade\sys\unix

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


::-----------------------------------------------------------------------------------
:: Color Control Crap
::-----------------------------------------------------------------------------------

set black=cocolor 00
set blue=cocolor 01
set green=cocolor 02
set aqua=cocolor 03
set red=cocolor 04
set purple=cocolor 05
set yellow=cocolor 06
set white=cocolor 07
set gray=cocolor 08
set lblue=cocolor 09
set lgreen=cocolor 0A
set laqua=cocolor 0B
set lred=cocolor 0C
set lpurple=cocolor 0D
set lyellow=cocolor 0E
set lwhite=cocolor 0F


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
::Games Installation and Download
::-----------------------------------------------------------------------------------

set gamesroot=C:\Gamehouse Mac Games\
set downloadroot=C:\My Download Files

set root=%uraRoot%\loaders\loaderDMG

set unpacked=0

set nameFound=0


:: This method works, but causes a path with NO SPACES to have a space as the suffix
:: Everything seems to copy ok still.
set stubnameRaw="%1 %2 %3 %4 %5 %6 %7 %8"
set stubname=%stubnameRaw: =%

::echo stubname: %stubname%
::pause

set rawkPath=%uraRoot%
set rawkExe=rawk.exe
set rawkLaunch="%uraRoot%\rawk.exe"

set rawkCLIPath=%uraRoot%\rawk\dump\{app}
set rawkCLIExe=RAUnwrap.cmd
set rawkCLILaunch="%uraRoot%\rawk\dump\{app}\*"

set log="%root%\loaderRGSv2.log"

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

if not exist "%root%\_tmp\0.hfs" (

	if not exist "%root%\_tmp\2.hfs" (

		if not exist "%root%\_tmp\4.hfs" (
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


			regedit /s "%ProgramFiles%\unRealArcade\loaderDMG\setDMG.reg"

			exit
		)
	)
)

:: Perform 2nd Extraction (0.hfs) (Legacy Images)
if exist "%root%\_tmp\2.hfs" (
"%root%\7z.exe" x "%root%\_tmp\2.hfs" -o"%root%\_tmp\"
)

:: Perform 2nd Extraction (2.hfs) (Newer amac Images)
if exist "%root%\_tmp\2.hfs" (
"%root%\7z.exe" x "%root%\_tmp\2.hfs" -o"%root%\_tmp\"
)

:: Perform 2nd Extraction (4.hfs) (Older Images)
if exist "%root%\_tmp\4.hfs" (
"%root%\7z.exe" x "%root%\_tmp\4.hfs" -o"%root%\_tmp\"
)

wait 3

:: Cleanup Leftover Files
del /f /s /q "%root%\_tmp\0.hfs"

del /f /s /q "%root%\_tmp\0.ddm"
del /f /s /q "%root%\_tmp\1.Apple_partition_map"
del /f /s /q "%root%\_tmp\2.hfs"

del /f /s /q "%gamesroot%\%nameFound%\0.MBR"
del /f /s /q "%gamesroot%\%nameFound%\1.Primary GPT Header"
del /f /s /q "%gamesroot%\%nameFound%\2.Primary GPT Table"
del /f /s /q "%gamesroot%\%nameFound%\3.free"
del /f /s /q "%gamesroot%\%nameFound%\4.hfs"
del /f /s /q "%gamesroot%\%nameFound%\5.Backup GPT Table"
del /f /s /q "%gamesroot%\%nameFound%\6.Backup GPT Header"

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
if not %os%==XP choice /c yn /n
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
echo It is located at: "%gamesroot%%nameFound%"
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
echo Press (X) to Exit
echo.
echo.

if %os%==XP choice /c:dgx /t:d,5 /n
if not %os%==XP choice /c dgx /d d /n /t 5
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
del /f /s /q "%gamesroot%\%nameFound%\Applications"
del /f /s /q "%gamesroot%\%nameFound%\.DS_Store"
del /f /s /q "%gamesroot%\%nameFound%\.journal"
del /f /s /q "%gamesroot%\%nameFound%\.journal_info_block"
del /f /s /q "%gamesroot%\%nameFound%\.VolumeIcon.icns"

del /f /s /q "%gamesroot%\%nameFound%\version.txt"

:: Clean Junk Mac Directories
rd /s /q "%gamesroot%\%nameFound%\.background"
rd /s /q "%gamesroot%\%nameFound%\.fseventsd"
rd /s /q "%gamesroot%\%nameFound%\.HFS+ Private Directory Data_"
rd /s /q "%gamesroot%\%nameFound%\.Trashes"
rd /s /q "%gamesroot%\%nameFound%\[]"


del /f /s /q "%temp%\checkDmgStatus.txt"

explorer.exe "%gamesroot%"

exit



@echo off

title RealArcade Wrapper Killer    (.-+'~^-+ RFS Loader v1.0.2 +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

color 1f

set PATH=%PATH%;"C:\unRealArcade\sys\;"C:\unRealArcade\sys\unix"

set forceExit=0

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

set gamesroot=C:\Gamehouse Games
set downloadroot=C:\My Download Files

set root=%uraRoot%\loaders\loaderRFS

set unpacked=0


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

goto skiptmp


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

%wait% 2

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
%wait% 5



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



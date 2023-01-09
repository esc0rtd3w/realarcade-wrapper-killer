@echo off

title RealArcade Wrapper Killer    (.-+'~^-+ RGS Loader v2.1.2 +-^~`+-.)     [...cRypTiCwaRe 2o12...]

color 4f

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


set root=%uraRoot%\loaders\loaderRGSv1


%nircmd% exec hide "RGSinst.exe" /m application/vnd.rn-rn_secured_installer %1

%nircmd% wait 1000

%nircmd% dlg "RGSinst.exe" "unRealArcade RGS Loader" click yes 

::pause>nul

%nircmd% wait 5000


:reloop
%nircmd% win close title "unRealArcade RGS Loader"

cls
echo %errorlevel%

if %errorlevel% gtr 0 goto notdone
if %errorlevel% == 0 goto done
goto chkdone


:notdone
cls
echo Installation detected as INSTALLING
pause>nul
%nircmd% win close title "unRealArcade RGS Loader"
goto reloop


:done
cls
echo Installation detected as FINISHED
pause>nul


:killall
taskkill /f /t /im RGSinst.exe
if %errorlevel%==0 goto killall2
goto killall


:killall2
%nircmd% win close title "unRealArcade RGS Loader"
if %errorlevel%==0 goto end
goto killall2

:end
exit


@echo off
title (.-+'~^-+ AMI Game Loader +-^~`+-.)     [...cRypTiCwaRe 2o16...]


:reset
color 0e

cls
echo Setting Up Modified Environment....
echo.
echo.
title (.-+'~^-+ AMI Game Loader +-^~`+-.)     [...cRypTiCwaRe 2o16...]

mode con lines=26

set amiVersion=8.45.43
set amiVersionMajor=8
set amiVersionMinor=45
set amiVersionRevision=43

set amiPublisher=GameHouse


set root=%~dp0
set rootClean=%ProgramData%\activeMARK

:: Game Core Paths
set gamePath=%root%game
set gamePathData=%gamePath%\data
set gamePathDynamicData=%gamePath%\dynamicdata
set gamePathInstant=%gamePath%\instant
set gamePathInstantApps=%gamePath%\instant\apps
set gamePathLicenses=%gamePath%\licenses
set gamePathStats=%gamePath%\stats
set gamePathStreaming=%gamePath%\streaming

:: Loader Core Paths
set loaderPath=%root%loader
set loaderPathBin=%loaderPath%\bin
set loaderPathRegistry=%loaderPath%\registry
set loaderPathScripts=%loaderPath%\scripts

:: Binaries
set wait=%loaderPathBin%\wait.exe
set wget="%loaderPathBin%\wget.exe"
set zip="%loaderPathBin%\sevenZ.exe" a -y -r
set readIni="%loaderPathBin%\inifile.exe"


rd /s /q "%rootClean%\data"
rd /s /q "%rootClean%\dynamicdata"
rd /s /q "%rootClean%\instant"
rd /s /q "%rootClean%\licenses"
rd /s /q "%rootClean%\stats"
rd /s /q "%rootClean%\streaming"


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


set uraRoot=C:\Program Files\unRealArcade
set uraToolsRoot=C:\Program Files\unRealArcade\tools
set uraServicesRoot=C:\Program Files\unRealArcade\services
set uraStubRoot=C:\Program Files\unRealArcade\stubs
set uraTempRoot=C:\Program Files\unRealArcade\temp
set rawkRoot=C:\Program Files\unRealArcade\rawk

:: Unix Utilities
set unix=C:\Program Files\unRealArcade\tools\unix-utils

set agrep="%unix%\agrep.exe"
set bunzip2="%unix%\bunzip2.exe"
set bzip2="%unix%\bzip2.exe"
set bzip2recover="%unix%\bzip2recover.exe"
set cat="%unix%\cat.exe"
set cmp="%unix%\cmp.exe"
set dd="%unix%\dd.exe"
set diff="%unix%\diff.exe"
set diff3="%unix%\diff3.exe"
set du="%unix%\du.exe"
set egrep="%unix%\egrep.exe"
set env="%unix%\env.exe"
set fgrep="%unix%\fgrep.exe"
set gawk="%unix%\gawk.exe"
set grep="%unix%\grep.exe"
set gunzip="%unix%\gunzip.exe"
set gzip="%unix%\gzip.exe"
set head="%unix%\head.exe"
set ls="%unix%\ls.exe"
set printenv="%unix%\printenv.exe"
set mkdir="%unix%\mkdir.exe"
set sdiff="%unix%\sdiff.exe"
set sed="%unix%\sed.exe"
set tail="%unix%\tail.exe"
::set unrar="%unix%\unrar.exe"
set uudecode="%unix%\uudecode.exe"
set uuencode="%unix%\uuencode.exe"
set zcat="%unix%\zcat.exe"
::set zip="%unix%\zip.exe"



::-----------------------------------------------------------------------------------
::Set Windows OS Version
::-----------------------------------------------------------------------------------

:: Check common OS versions
ver | find "5.1"
if %errorlevel%==0 set os=xp
ver | find "6.0"
if %errorlevel%==0 set os=vista
ver | find "6.1"
if %errorlevel%==0 set os=win7
ver | find "6.2"
if %errorlevel%==0 set os=win8
ver | find "6.3"
if %errorlevel%==0 set os=win81
ver | find "6.4"
if %errorlevel%==0 set os=win10

:: This is the new versioning for Windows 10 (Started sometime in 2015/2016)
ver | find "10."
if %errorlevel%==0 set os=win10
ver | find "10.0"
if %errorlevel%==0 set os=win10
ver | find "10.1"
if %errorlevel%==0 set os=win10
ver | find "10.2"
if %errorlevel%==0 set os=win10
ver | find "10.3"
if %errorlevel%==0 set os=win10
ver | find "10.4"
if %errorlevel%==0 set os=win10
ver | find "10.5"
if %errorlevel%==0 set os=win10
ver | find "10.6"
if %errorlevel%==0 set os=win10
ver | find "10.7"
if %errorlevel%==0 set os=win10
ver | find "10.8"
if %errorlevel%==0 set os=win10
ver | find "10.9"
if %errorlevel%==0 set os=win10

ver | find "Version 5.1" >nul
if errorlevel 0 set os=XP
if errorlevel 1 set os=VISTA


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


:: AMI Paths Local
set amPath=%pd%\activeMARK
set amInstantPath=%pd%\activeMARK\instant
set amInstantAppPath=%pd%\activeMARK\instant\apps

:: AMI Game List Local
set amiGameList="C:\Program Files\unRealArcade\gamelist\am-instant.txt"

:: AMI Log Local
set amInstantLog="%amInstantPath%\aminstant.log"

:: Remote GameHouse Player
set amInstantRemotePlayer=http://games-dl.gamehouse.com/gamehouse/activemark/aminstantservice/GameHouse_GamePlayer.exe


set findProcess=call "%loaderPathScripts%\find_process.cmd"


set amiRequest="%temp%\ami-request.txt"

set amiRequestInstallationTitle="%temp%\amiRequestInstallationTitle.txt"
set amiRequestInstallationTitleClean1="%temp%\amiRequestInstallationTitleClean1.txt"
set amiRequestInstallationTitleClean2="%temp%\amiRequestInstallationTitleClean2.txt"
set amiRequestContentId="%temp%\amiRequestContentId.txt"
set amiRequestRFS="%temp%\amiRequestRFS.txt"
set amiRequestTracking="%temp%\amiRequestTracking.txt"
set amiRequestDeviceId="%temp%\amiRequestDeviceID.txt"
set amiRequestSessionID="%temp%\amiRequestSessionID.txt"

set gameNameNoDashesSet="%temp%\gameNameNoDashesSet.txt"
set gameNameUnderscoresSet="%temp%\gameNameUnderscores.txt"

set sessionID=0000-00-00-00-00-00-000-0000000000000
set deviceID=0000000000000000000000000000000000000000

set serverStatus=0
set unavailable=0


:: Sets default returnTo variable for cases where you must use 2 gotos in sequence
set returnTo=loader

set cid=00000000000000000000000000000000

set appDirName=UNDEFINED

set jsonRfsUrl=0


set outFileTemp=-O "%temp%\ami-request.txt"
set outFileRFS=-O "%desktop%\am-rfs-downloads\%gameNameDashes%.rfs"


set amLog=%desktop%\amiSvc.log

set memberCookie=--header="Cookie: gamehouseuser=true"

set pageNewGames=http://www.gamehouse.com/new-games

set dumpPage=%wget% -d %memberCookie% -O %outFileTemp% %pageNewGames%


:: Set localhost port
::set port=27021
set port=12072


set reqDeviceID=http://localhost:%port%/v1/init.json?query_id=0000000000000
set reqDeviceIDHeader=/v1/init.json?query_id=0000000000000


:: This must be rebuilt each time the game is changed
set reqGet1=--header="/v1/install.json?result=success
set reqGet2=^&installation_title=%gameNameTitleHTML%
set reqGet3=^&content_id=%cid%
set reqGet4=^&rfs=http://games-dl.gamehouse.com/gamehouse/pc/%gameNameFirstLetter%/%gameNameDashes%/%gameNameDashes%.rfs HTTP/1.1"
set reqGet=%reqGet1%%reqGet2%%reqGet3%%reqGet4%


set reqHost=--header="Host: localhost:%port%"
::set reqUserAgent=--header="User-Agent: AmHttpClient v1.0"
set reqUserAgent=--header="User-Agent: AmHttpGet 1.0"
set reqAccept=--header="Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
set reqAcceptLanguage=--header="Accept-Language: en-US,en;q=0.5"
set reqAcceptEncoding=--header="Accept-Encoding: gzip, deflate"
set reqReferer=--header="Referer: http://www.gamehouse.com/member/"
set reqOrigin=--header="Origin: http://www.gamehouse.com"
set reqConnection=--header="Connection: keep-alive"

:: Single DOUBLE QUOTE here on purpose
set baseReq=%wget% -d %reqHost% %reqUserAgent% %reqAccept% %reqAcceptLanguage% %reqAcceptEncoding% %reqReferer% %reqOrigin% %reqConnection% %outFileTemp% "
set baseReqExtractRFS=%wget% -d %reqGet% %reqHost% %reqUserAgent% %reqAccept% %reqAcceptLanguage% %reqAcceptEncoding% %reqReferer% %reqOrigin% %reqConnection% %outFileTemp% "
set baseReqDownloadRFS=%wget% %outFileRFS% "%jsonRfsUrl%

:: Device ID Request
set reqGetDeviceId=%wget% -d %reqDeviceIDHeader% %reqHost% %reqUserAgent% %reqAccept% %reqAcceptLanguage% %reqAcceptEncoding% %reqReferer% %reqOrigin% %reqConnection% %outFileTemp% "

set launch1=http://localhost:%port%/v1/play.json?content_id=
set launch2=^&auth_token=0000000000000000000000000000000000000000"

set download1=http://www.gamehouse.com/member/api/games/downloaddetails.json?amcontentid=

set getSessionID=http://www.gamehouse.com/member/api/player/getsessionid.json

set remoteRfsBase=http://games-dl.gamehouse.com/gamehouse/pc

set remoteRfsBase1=127.0.0.1:%port%/v1/install.json?result=success^&installation_title=
set remoteRfsBase2=^&content_id=
set remoteRfsBase3=^&rfs=http://games-dl.gamehouse.com/gamehouse/pc


:: AMI Service Stuff
set serviceBin=aminstantservice.exe
set serviceArgs=--service-run
set serviceName=AMInstantService
set serviceDisplayName=activeMARK Instant Service
set serviceDescription=Enhances gaming experience from the web browsers
set serviceStartupType=demand
set errorType=ignore

set servicePathLocal=%SystemDrive%\Program Files\unRealArcade\services\ami
set servicePathEmbedded=%loaderPathBin%
set servicePathRemote=0

set serviceCreate="%SystemRoot%\system32\sc.exe" create %serviceName% binPath= "\"%servicePathEmbedded%\%serviceBin%\" %serviceArgs%" displayname= "%serviceDisplayName%" start= %serviceStartupType%
set serviceCreateAddDescription="%SystemRoot%\system32\sc.exe" description %serviceName% "%serviceDescription%"

set serviceDelete="%SystemRoot%\system32\sc.exe" delete "%serviceName%"

set serviceStart=net start "%serviceName%"
set serviceStop=net stop "%serviceName%"

set serviceRegAdd=regedit /s "%loaderPathRegistry%\ami-launch-fix-%bits%.reg"
set serviceRegAddMinimal=regedit /s "%loaderPathRegistry%\ami-launch-fix-minimal-%bits%.reg"
set serviceRegAddFixKeys=regedit /s "%loaderPathRegistry%\ami-launch-fix-keys-only-%bits%.reg"
set serviceRegRemove=regedit /s "%loaderPathRegistry%\ami-launch-fix-remove.reg"
set serviceRegRemoveLicensing=regedit /s "%loaderPathRegistry%\ami-remove-licensing.reg"

set serviceQuery="%SystemRoot%\system32\sc.exe" queryex "%serviceName%"


:: Do some weird shit to get registry files to output properly!! (20160618)
set servicePathRegFormatted=0
set servicePathRegFormattedTemp=0
set servicePathRegFormattedTempFile="%temp%\servicePathRegFormattedTempFile.txt"

setlocal enabledelayedexpansion

	set servicePathRegFormatted=!servicePathEmbedded:\=\\!
	echo !servicePathRegFormatted!>%servicePathRegFormattedTempFile%

endlocal

set /p servicePathRegFormattedTemp=<%servicePathRegFormattedTempFile%

set servicePathRegFormatted=%servicePathRegFormattedTemp%\\
set serviceBinPathRegFormatted=%servicePathRegFormattedTemp%\\%serviceBin%
set serviceUninstPathRegFormatted=%servicePathRegFormattedTemp%\\uninst.exe

set regHeaderDefault=Windows Registry Editor Version 5.00

:: Reg Entry #1
::set serviceRegUninstMainKey=[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games]
::set serviceRegUninstDisplayIcon="DisplayIcon"="C:\\Program Files\\unRealArcade\\services\\ami\\aminstantservice.exe"
::set serviceRegUninstDisplayVersion="DisplayVersion"="8.45.43"
::set serviceRegUninstDisplayName="DisplayName"="activeMARK Instant Service"
::set serviceRegUninstInstallDir="InstallDir"="C:\\Program Files\\unRealArcade\\services\\ami\\"
::set serviceRegUninstInstallLocation="InstallLocation"="C:\\Program Files\\unRealArcade\\services\\ami\\"
::set serviceRegUninstServicePath="ServicePath"="C:\\Program Files\\unRealArcade\\services\\ami\\aminstantservice.exe"
::set serviceRegUninstUninstallString="UninstallString"="C:\\Program Files\\unRealArcade\\services\\ami\\uninst.exe"
::set serviceRegUninstPublisher="Publisher"="GameHouse"
::set serviceRegUninstVersionMajor="VersionMajor"="8"
::set serviceRegUninstVersionMinor="VersionMinor"="45"


:: Write Registry Text Files
set regFileServiceUninstall="%temp%\ami-svc-reg-uninst-tmp.reg"

set serviceRegUninstMainKey=[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games]
set serviceRegUninstDisplayIcon="DisplayIcon"="%serviceBinPathRegFormatted%"
set serviceRegUninstDisplayVersion="DisplayVersion"="%amiVersion%"
set serviceRegUninstDisplayName="DisplayName"="%serviceDisplayName%"
set serviceRegUninstInstallDir="InstallDir"="%servicePathRegFormatted%"
set serviceRegUninstInstallLocation="InstallLocation"="%servicePathRegFormatted%"
set serviceRegUninstServicePath="ServicePath"="%serviceBinPathRegFormatted%"
set serviceRegUninstUninstallString="UninstallString"="%serviceUninstPathRegFormatted%"
set serviceRegUninstPublisher="Publisher"="%amiPublisher%"
set serviceRegUninstVersionMajor="VersionMajor"="%amiVersionMajor%"
set serviceRegUninstVersionMinor="VersionMinor"="%amiVersionMinor%"

if exist %regFileServiceUninstall% del /f /q %regFileServiceUninstall%
echo %regHeaderDefault%>>%regFileServiceUninstall%
echo.>>%regFileServiceUninstall%
echo %serviceRegUninstMainKey%>>%regFileServiceUninstall%
echo %serviceRegUninstDisplayIcon%>>%regFileServiceUninstall%
echo %serviceRegUninstDisplayVersion%>>%regFileServiceUninstall%
echo %serviceRegUninstDisplayName%>>%regFileServiceUninstall%
echo %serviceRegUninstInstallDir%>>%regFileServiceUninstall%
echo %serviceRegUninstInstallLocation%>>%regFileServiceUninstall%
echo %serviceRegUninstServicePath%>>%regFileServiceUninstall%
echo %serviceRegUninstUninstallString%>>%regFileServiceUninstall%
echo %serviceRegUninstPublisher%>>%regFileServiceUninstall%
echo %serviceRegUninstVersionMajor%>>%regFileServiceUninstall%
echo %serviceRegUninstVersionMinor%>>%regFileServiceUninstall%


:: Write Registry Directly (Issues 20160618)
::set serviceRegUninstMainKeyFix164=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /f
::set serviceRegUninstMainKeyFix264=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games"
::set serviceRegUninstMainKeyFix364=%regDelete% "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /v "" /f
::set serviceRegUninstDisplayIcon64=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /v DisplayIcon /t REG_SZ /d "%servicePathEmbedded%\%serviceBin%" /f
::set serviceRegUninstDisplayVersion64=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /v DisplayName /t REG_SZ /d "activeMARK Instant Service" /f
::set serviceRegUninstDisplayName64=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /v DisplayVersion /t REG_SZ /d "8.45.43" /f
::set serviceRegUninstInstallDir64=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /v InstallDir /t REG_SZ /d "%servicePathEmbedded%" /f
::set serviceRegUninstInstallLocation64=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /v InstallLocation /t REG_SZ /d "%servicePathEmbedded%" /f
::set serviceRegUninstPublisher64=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /v Publisher /t REG_SZ /d "GameHouse" /f
::set serviceRegUninstServicePath64=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /v ServicePath /t REG_SZ /d "%servicePathEmbedded%\%serviceBin% --service-run" /f
::set serviceRegUninstUninstallString64=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /v UninstallString /t REG_SZ /d "%servicePathEmbedded%\uninst.exe" /f
::set serviceRegUninstVersionMajor64=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /v VersionMajor /t REG_SZ /d "8" /f
::set serviceRegUninstVersionMinor64=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /v VersionMinor /t REG_SZ /d "45" /f

::set serviceRegUninstMainKeyFix132=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /f
::set serviceRegUninstMainKeyFix232=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games"
::set serviceRegUninstMainKeyFix332=%regDelete% "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /v "" /f
::set serviceRegUninstDisplayIcon32=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /v DisplayIcon /t REG_SZ /d "%servicePathEmbedded%\%serviceBin%" /f
::set serviceRegUninstDisplayVersion32=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /v DisplayName /t REG_SZ /d "activeMARK Instant Service" /f
::set serviceRegUninstDisplayName32=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /v DisplayVersion /t REG_SZ /d "8.45.43" /f
::set serviceRegUninstInstallDir32=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /v InstallDir /t REG_SZ /d "%servicePathEmbedded%" /f
::set serviceRegUninstInstallLocation32=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /v InstallLocation /t REG_SZ /d "%servicePathEmbedded%" /f
::set serviceRegUninstPublisher32=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /v Publisher /t REG_SZ /d "GameHouse" /f
::set serviceRegUninstServicePath32=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /v ServicePath /t REG_SZ /d "%servicePathEmbedded%\%serviceBin% --service-run" /f
::set serviceRegUninstUninstallString32=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /v UninstallString /t REG_SZ /d "%servicePathEmbedded%\uninst.exe" /f
::set serviceRegUninstVersionMajor32=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /v VersionMajor /t REG_SZ /d "8" /f
::set serviceRegUninstVersionMinor32=%regAdd% "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\GameHouse Games" /v VersionMinor /t REG_SZ /d "45" /f

:: Reg Entry #2
::set serviceRegSvcMainKey=[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\AMInstantService]
::set serviceRegSvcType="Type"=dword:00000010
::set serviceRegSvcStart="Start"=dword:00000003
::set serviceRegSvcErrorControl="ErrorControl"=dword:00000001
::set serviceRegSvcDisplayName="DisplayName"="activeMARK Instant Service"
::set serviceRegSvcImagePath="ImagePath"="\"C:\\Program Files\\unRealArcade\\services\\ami\\aminstantservice.exe\" --service-run"


:: Write Registry Text Files
set regFileServiceMain="%temp%\ami-svc-reg-main-tmp.reg"

set serviceRegSvcMainKey=[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\%serviceName%]
set serviceRegSvcType="Type"=dword:00000010
set serviceRegSvcStart="Start"=dword:00000003
set serviceRegSvcErrorControl="ErrorControl"=dword:00000001
set serviceRegSvcDisplayName="DisplayName"="%serviceDisplayName%"
set serviceRegSvcImagePath="ImagePath"="%serviceBinPathRegFormatted% %serviceArgs%"

if exist %regFileServiceMain% del /f /q %regFileServiceMain%
echo %regHeaderDefault%>>%regFileServiceMain%
echo.>>%regFileServiceMain%
echo %serviceRegSvcMainKey%>>%regFileServiceMain%
echo %serviceRegSvcType%>>%regFileServiceMain%
echo %serviceRegSvcStart%>>%regFileServiceMain%
echo %serviceRegSvcErrorControl%>>%regFileServiceMain%
echo %serviceRegSvcDisplayName%>>%regFileServiceMain%
echo %serviceRegSvcImagePath%>>%regFileServiceMain%

:: Write Registry Directly (Issues 20160618)
::set serviceRegSvcMainKey=%regAdd% "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\AMInstantService" /f
::set serviceRegSvcDisplayName=%regAdd% "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\AMInstantService" /v DisplayName /t REG_SZ /d "activeMARK Instant Service" /f
::set serviceRegSvcErrorControl=%regAdd% "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\AMInstantService" /v ErrorControl /t REG_DWORD /d 1 /f
::set serviceRegSvcImagePath=%regAdd% "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\AMInstantService" /v ImagePath /t REG_SZ /d "\"%servicePathEmbedded%\%serviceBin%\" --service-run" /f
::set serviceRegSvcImagePath=%regAdd% "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\AMInstantService" /v ImagePath /t REG_SZ /d "%servicePathEmbedded%\%serviceBin% --service-run" /f
::set serviceRegSvcStart=%regAdd% "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\AMInstantService" /v Start /t REG_DWORD /d 3 /f
::set serviceRegSvcType=%regAdd% "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\AMInstantService" /v Type /t REG_DWORD /d 16 /f

::set serviceRegCleanUnwanted=%regDelete% "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\AMInstantService" /v ObjectName /f



:: Force Remove AMI Service Upon Exit
%serviceQuery%
if %errorlevel% equ 0 (
	cls
	echo Killing Services To Properly Continue....
	echo.
	echo.
	%wait% 1
	%serviceStop%
	%serviceDelete%
	%serviceRegRemove%
	%serviceRegRemoveLicensing%
	)

%kill% aminstantservice.exe

set amiServiceInstalled=0
set amiServiceInstalledCheck=2


set remoteDownloadFinished=0
set gamesJsonFile="%amPath%\instant\games.json"
set remoteDownloadPartialCheck=type "%amPath%\instant\games.json" | findstr "gamepartiallypreloaded"
set remoteDownloadInstalledCheck=type "%amPath%\instant\games.json" | findstr "gameinstalled"



set gameExec=0

set nothing=0

:: These are for save data for each game
set rootSaveData=%root%save\
set pathDataGameSaves=%pd%\
set pathDataGameSettings=%pd%\
set checkForGameSave=call "%loaderPathScripts%\save_check.cmd"

set gameSavePath=0
set gameSavePathType=0

goto loader




:loader

%lyellow%
cls
echo Removing All activeMARK Control Traces....
echo.
echo.
title (.-+'~^-+ AMI Game Loader +-^~`+-.)     [...cRypTiCwaRe 2o16...]

%wait% 1

:: Copy Source Files To Local For Launch
xcopy /y /e /i /r "%gamePathData%" "%amPath%\data"
xcopy /y /e /i /r "%gamePathDynamicData%" "%amPath%\dynamicdata"
xcopy /y /e /i /r "%gamePathInstantApps%" "%amPath%\instant\apps"
xcopy /y /e /i /r "%gamePathLicenses%" "%amPath%\licenses"
xcopy /y /e /i /r "%gamePathStats%" "%amPath%\stats"
xcopy /y /e /i /r "%gamePathStreaming%" "%amPath%\streaming"

rd /s /q "%pd%\com.gamehouse.aminstaller"

%wait% 1

%lyellow%
cls
echo Loading Game Settings From INI....
echo.
echo.

:: Merge games.json With Local
echo.>>%amInstantPath%\games.json
type %gamePathInstant%\games.json>>"%amInstantPath%\games.json"

:: Get settings from INI
set tmpIniRead="%temp%\tmpIniRead.cmd"

%readIni% "%loaderPath%\settings.ini" [main] content_id > %tmpIniRead%
call %tmpIniRead%
set cid=%content_id%

%readIni% "%loaderPath%\settings.ini" [main] game_name_dashes > %tmpIniRead%
call %tmpIniRead%
set gameNameDashes=%game_name_dashes%

%readIni% "%loaderPath%\settings.ini" [main] game_name > %tmpIniRead%
call %tmpIniRead%
set gameNameTitle=%game_name%

%readIni% "%loaderPath%\settings.ini" [main] exe_launch > %tmpIniRead%
call %tmpIniRead%
set gameExec=%exe_launch%

%readIni% "%loaderPath%\settings.ini" [main] save_external > %tmpIniRead%
call %tmpIniRead%
set gameSavePathType=%save_external%

%readIni% "%loaderPath%\settings.ini" [main] save_path > %tmpIniRead%
call %tmpIniRead%
set gameSavePath=%save_path%



%checkForGameSave%


%lyellow%
cls
echo Preparing %gameNameTitle%....
echo.
echo.

%wait% 1

::echo To Enter Recovery Press R
::echo.
::echo.
::if %os%==XP choice /c:nr /n /t:5 /d:n
::if %os%==VISTA choice /c nr /n /t 5 /d n
::if errorlevel 2 goto recovery
::if errorlevel 1 set nothing=0

::%wait% 2

:: Get session ID

%lyellow%
cls
echo Sending Magic Bytes To Local Server....
echo.
echo.
%baseReq%%getSessionID%
copy /y %amiRequest% %amiRequestSessionID%

set /p sessionID=<%amiRequestSessionID%


:: Request JSON Config File
:: Single DOUBLE QUOTE here on purpose
%baseReq%%download1%%cid%"


%lyellow%
cls
echo Sending Magic Bytes To Local Server....
echo.
echo.

%wait% 1

:: Get "installation_title" Part 1
for /f "delims=: tokens=3" %%a in ('type %amiRequest%') do (
	echo %%a>%amiRequestInstallationTitle%
)

:: Get "installation_title" Part 2
for /f "delims=, tokens=1" %%a in ('type %amiRequestInstallationTitle%') do (
	set jsonInstallationTitle=%%a
)


:: Get "content_id" Part 1
for /f "delims=: tokens=4" %%a in ('type %amiRequest%') do (
	echo %%a>%amiRequestContentId%
)

:: Get "content_id" Part 2
for /f "delims=, tokens=1" %%a in ('type %amiRequestContentId%') do (
	echo %%a>%amiRequestContentId%
	set jsonContentId=%%a
)


:: Get "rfs" Part 1
for /f "delims=: tokens=6" %%a in ('type %amiRequest%') do (
	echo %%a>%amiRequestRFS%
)

:: Get "rfs" Part 2
for /f "delims=, tokens=1" %%a in ('type %amiRequestRFS%') do (
	echo %%a>%amiRequestRFS%
)

:: Get "rfs" Part 3 (set URL to RFS here)
for /f "delims=, tokens=*" %%a in ('type %amiRequestRFS%') do (
	echo %%a>%amiRequestRFS%
	set jsonRfsUrl=http:%%a
)

:: Get "rfs" Part 4 (set gameNameDashes here)
for /f "delims=/ tokens=5" %%a in ('type %amiRequestRFS%') do (
	set gameNameDashes=%%a
	set gameNameFirstLetterTemp=%gameNameDashes%
	set gameNameFirstLetter=%gameNameFirstLetterTemp:~0,1%
)


:: Get "tracking" Part 1
for /f "delims=: tokens=7" %%a in ('type %amiRequest%') do (
	echo %%a>%amiRequestTracking%
)

:: Get "tracking" Part 2
for /f "delims=, tokens=1" %%a in ('type %amiRequestTracking%') do (
	set jsonTracking=%%a
)


:: Request JSON Init File

:: Get Device ID (from init.json)
%reqGetDeviceId%%reqDeviceID%"


%lyellow%
cls
echo Sending Magic Bytes To Local Server....
echo.
echo.

%wait% 1

:: Get "device_id" Part 1 (only write 4th line with device_id. kinda clunky!!)
setlocal enabledelayedexpansion
for /f "tokens=*" %%a in ('type %amiRequest%') do (
    set /a amiRequest=!amiRequest! + 1
    set var!amiRequest!=%%a
	if !amiRequest!==4 echo %%a>%amiRequestDeviceID%
)
endlocal

:: Get "device_id" Part 2
for /f "delims=: tokens=2" %%a in ('type %amiRequestDeviceId%') do (
	set jsonDeviceID=%%a
)



:: Cleanup Variables
title (.-+'~^-+ AMI Game Loader +-^~`+-.)     [...cRypTiCwaRe 2o16...]
%lyellow%
cls
echo Finalizing Game Variables....
echo.
echo.

%wait% 1

setlocal enabledelayedexpansion

	set jsonInstallationTitle=!jsonInstallationTitle:"=!
	echo !jsonInstallationTitle!>%amiRequestInstallationTitle%

	set jsonInstallationTitleClean1=!jsonInstallationTitle:'=!
	echo !jsonInstallationTitleClean1!>%amiRequestInstallationTitleClean1%

	set jsonInstallationTitleClean2=!jsonInstallationTitleClean1: -=!
	echo !jsonInstallationTitleClean2!>%amiRequestInstallationTitleClean2%

	set jsonRfsUrl=!jsonRfsUrl:"=!
	echo !jsonRfsUrl!>%jsonRfsUrl%

	set jsonTracking=!jsonTracking:"=!
	echo !jsonTracking!>%amiRequestTracking%

	set jsonDeviceID=!jsonDeviceID:"=!
	set jsonDeviceID=!jsonDeviceID: =!
	set jsonDeviceID=!jsonDeviceID:,=!
	echo !jsonDeviceID!>%amiRequestDeviceID%

	set gameNameNoDashes=!gameNameDashes:-=!
	echo !gameNameNoDashes!>%gameNameNoDashesSet%

	set gameNameUnderscores=!gameNameDashes:-=_!
	echo !gameNameUnderscores!>%gameNameUnderscoresSet%

endlocal


:: Set new variable without quotes
cls
set /p jsonContentId=<%amiRequestContentId%
set /p jsonInstallationTitle=<%amiRequestInstallationTitle%
set /p jsonInstallationTitleClean1=<%amiRequestInstallationTitleClean1%
set /p jsonInstallationTitleClean2=<%amiRequestInstallationTitleClean2%
set /p jsonRfsUrl=<%jsonRfsUrl%
set /p jsonTracking=<%amiRequestTracking%
set /p jsonDeviceID=<%amiRequestDeviceID%

set /p gameNameNoDashes=<%gameNameNoDashesSet%
set /p gameNameUnderscoresSet=<%gameNameUnderscoresSet%

:: Store Game Name Title Original Format
set gameNameTitle=%jsonInstallationTitle%


:: Match to global variables
set cid=%jsonContentId%
set gameNameTitleHTML=%jsonInstallationTitle%
set gameNameTitleClean1=%jsonInstallationTitleClean1%
set gameNameTitleClean2=%jsonInstallationTitleClean2%
set deviceID=%jsonDeviceID%

:: Get first 16 chars for app directory name
set cidHalfTemp=%cid%
set cidHalf=%cidHalfTemp:~0,16%


:: Set first letter of game name for valid download link
set gameNameFirstLetterTemp=%gameNameDashes%
set gameNameFirstLetter=%gameNameFirstLetterTemp:~0,1%


:: Get first 16 chars for app directory name
set gameNameDashesHalfTemp=%gameNameDashes%
set gameNameDashesHalf=%gameNameDashesHalfTemp:~0,16%



:: Convert "SPACES" to "%20" before passing as string
setlocal enabledelayedexpansion
set space=%%20
set gameNameTitleHTML=%gameNameTitleHTML: =!space!%
echo %gameNameTitleHTML%>"%temp%\tmp.tmp"
endlocal

set /p gameNameTitleHTML=<"%temp%\tmp.tmp"


:: Directories with a single quote in them will make a directory like this: "game-s-directory" instead of "game's-directory"
:: Set new AM Directory Name
set appDirName=%gameNameDashesHalf%%cidHalf%


:: Rebuild Headers
title (.-+'~^-+ AMI Game Loader +-^~`+-.)     [...cRypTiCwaRe 2o16...]
%lyellow%
cls
echo Preparing To Launch %gameNameTitle%....
echo.
echo.

set reqGet1=--header="/v1/install.json?result=success
set reqGet2=^&installation_title=%gameNameTitleHTML%
set reqGet3=^&content_id=%cid%
set reqGet4=^&rfs=http://games-dl.gamehouse.com/gamehouse/pc/%gameNameFirstLetter%/%gameNameDashes%/%gameNameDashes%.rfs HTTP/1.1"

set reqGet=%reqGet1%%reqGet2%%reqGet3%%reqGet4%

set reqGetDeviceId=%wget% -d %reqDeviceIDHeader% %reqHost% %reqUserAgent% %reqAccept% %reqAcceptLanguage% %reqAcceptEncoding% %reqReferer% %reqOrigin% %reqConnection% %outFileTemp% "

set baseReqExtractRFS=%wget% -d %reqGet% %reqHost% %reqUserAgent% %reqAccept% %reqAcceptLanguage% %reqAcceptEncoding% %reqReferer% %reqOrigin% %reqConnection% %outFileTemp% "

if not exist "%desktop%\am-rfs-downloads" md "%desktop%\am-rfs-downloads"
set outFileRFS=-O "%desktop%\am-rfs-downloads\%gameNameDashes%.rfs"
set baseReqDownloadRFS=%wget% %outFileRFS% "%jsonRfsUrl%

%wait% 2


:: Launch
title (.-+'~^-+ AMI Game Loader +-^~`+-.)     [...cRypTiCwaRe 2o16...]
%lgreen%
cls
echo Preparing To Launch %gameNameTitle%....
echo.
echo.

%serviceCreate%
%serviceCreateAddDescription%

%wait% 2

regedit /s %regFileServiceUninstall%
regedit /s %regFileServiceMain%

%wait% 3

%serviceStart%

title (.-+'~^-+ AMI Game Loader +-^~`+-.)     [...cRypTiCwaRe 2o16...]
%lgreen%
cls
echo Preparing To Launch %gameNameTitle%....
echo.
echo.

%wait% 1

::%runShellWaitTerminate% %baseReq%%launch1%%cid%%launch2%
%baseReq%%launch1%%cid%%launch2%


title (.-+'~^-+ AMI Game Loader +-^~`+-.)     [...cRypTiCwaRe 2o16...]
%lgreen%
cls
echo Launching %gameNameTitle%....
echo.
echo.

:: Kill Server As Soon As Game Launches To Stop Time Tracking (20160615)
%serviceStop%
%serviceDelete%
%serviceRegRemove%
%serviceRegRemoveLicensing%

set amiServiceInstalled=0
set serverStatus=0


title (.-+'~^-+ AMI Game Loader +-^~`+-.)     [...cRypTiCwaRe 2o16...]
%lgreen%
cls
echo Launching %gameNameTitle%....
echo.
echo.

cls
echo Cleaning Up Files....
echo.
%kill% aminstantservice.exe
%kill% aminstantservice.exe
%kill% aminstantservice.exe

title (.-+'~^-+ AMI Game Loader +-^~`+-.)     [...cRypTiCwaRe 2o16...]
%lgreen%
cls
echo Launching %gameNameTitle%....
echo.
echo.

del /f /q "%temp%\tmp.tmp"

del /f /q %amiRequest%
del /f /q %amiRequestInstallationTitle%
del /f /q %amiRequestInstallationTitleClean1%
del /f /q %amiRequestInstallationTitleClean2%
del /f /q %amiRequestContentId%
del /f /q %amiRequestRFS%
del /f /q %amiRequestTracking%
del /f /q %amiRequestDeviceId%

del /f /q %gameNameNoDashesSet%
del /f /q %gameNameUnderscoresSet%

del /f /q %amiRequestSessionID%
del /f /q "%temp%\ami-json-parse.txt"
del /f /q "%temp%\amiVersion.cmd"

del /f /q %regFileServiceUninstall%
del /f /q %regFileServiceMain%

del /f /q %servicePathRegFormattedTempFile%


title (.-+'~^-+ AMI Game Loader +-^~`+-.)     [...cRypTiCwaRe 2o16...]
%lgreen%
cls
echo Launching %gameNameTitle%....
echo.
echo.

:: Force Remove AMI Service Upon Exit
%serviceQuery%
if %errorlevel% equ 0 (
	%serviceStop%
	%serviceDelete%
	%serviceRegRemove%
	%serviceRegRemoveLicensing%
	
	%lgreen%
	cls
	echo Launching %gameNameTitle%....
	echo.
	echo.
	%wait% 1
	)

title (.-+'~^-+ AMI Game Loader +-^~`+-.)     [...cRypTiCwaRe 2o16...]
%laqua%
cls
echo %gameNameTitle% Is Running....
echo.
echo.
echo Press any key to kill %gameExec%....
echo.
echo.
pause>nul

taskkill /f /im "%gameExec%"
taskkill /f /im "%serviceBin%"

goto end


:recovery
set returnTo=extractOK

%wait% 2

%serviceCreate%
%serviceCreateAddDescription%

%wait% 2

regedit /s %regFileServiceUninstall%
regedit /s %regFileServiceMain%

%wait% 3

%serviceStart%

%wait% 1

::%runShellWaitTerminate% %baseReq%%launch1%%cid%%launch2%
%baseReq%%launch1%%cid%%launch2%

%wait% 5

%laqua%
cls
echo Extracting %gameNameDashes%.rfs From GameHouse Servers....
echo.
echo.
%baseReqExtractRFS%%remoteRfsBase1%%gameNameTitleHTML%%remoteRfsBase2%%cid%%remoteRfsBase3%/%gameNameFirstLetter%/%gameNameDashes%/%gameNameDashes%.rfs"

goto inProgress


:inProgress

title (.-+'~^-+ AMI Game Loader +-^~`+-.)     [...cRypTiCwaRe 2o16...]
%lgreen%
cls
echo Extracting \\GH_SERVER\\%gameNameDashes%.rfs....
echo.
echo.

%wait% 10

if not exist %gamesJsonFile% (
	cls
	echo Downloading Is Starting....
	echo.
	echo.
	set remoteDownloadFinished=2
	goto inProgress
)

%remoteDownloadFinished%
if %errorlevel% equ 0 (
	cls
	%lgreen%
	echo Download Finished
	echo.
	echo.
	pause
	set remoteDownloadFinished=1
	goto %returnTo%
)

%remoteDownloadPartialCheck%
if %errorlevel% equ 0 (
	cls
	echo Downloading In Progress....
	echo.
	echo.
	set remoteDownloadFinished=2
	goto inProgress
)

%wait% 1

%remoteDownloadFinished%
if %errorlevel% equ 0 (
	cls
	%lgreen%
	echo Download Finished
	echo.
	echo.
	pause
	set remoteDownloadFinished=1
	goto %returnTo%
)

%wait% 1

%remoteDownloadPartialCheck%
if %errorlevel% equ 0 (
	cls
	echo Downloading In Progress....
	echo.
	echo.
	set remoteDownloadFinished=2
	goto inProgress
)

%wait% 1

goto inProgress


:extractOK
%lgreen%
cls
echo %gameNameDashes%.rfs Has Been Successfully Extracted!
echo.
echo.
echo Press any key once the download has finished
echo.
echo.
echo.
pause>nul

%serviceStop%
%serviceDelete%
%serviceRegRemove%
%serviceRegRemoveLicensing%

goto reset


:end

%wait% 5

rd /s /q "%rootClean%\data"
rd /s /q "%rootClean%\dynamicdata"
rd /s /q "%rootClean%\instant"
rd /s /q "%rootClean%\licenses"
rd /s /q "%rootClean%\stats"
rd /s /q "%rootClean%\streaming"

rd /s /q "%pd%\com.gamehouse.aminstaller"


exit
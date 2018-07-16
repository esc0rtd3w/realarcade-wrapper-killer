:: usetools command shell script ::
:: sysinstall ::
::
@echo off
mode con cols=80 lines=35
chcp 866
cd /d "%~dp0"
set status=%os% %processor_architecture% ~ %logonserver%@%username%
color 17 &cls &title [%~nx0]:%status%
echo.
echo     ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo     ³  USETOOLS project ù http://usetools.net ù providing better defaults ³
echo     ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo     ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
echo     ÛÛ    ÛÛ ÛÛßßßßÛÛ ÛßßßßßßÛ ßßßÛÛßßß ÛßßßßßßÛ ÛßßßßßßÛ ÛÛ       ÛÛßßßßÛÛ 
echo     ÛÛ    ÛÛ ÛÛ       Û           ÛÛ    Û      Û Û      Û ÛÛ       ÛÛ       
echo     ÛÛ    ÛÛ  ßßßßßßÛ Ûßßßßß      ÛÛ    Û      Û Û      Û ÛÛ        ßßßßßßÛ  
echo     ÛÛ    ÛÛ ÛÛ     Û Û      Û    ÛÛ    Û      Û Û      Û ÛÛ    ÛÛ ÛÛ     Û 
echo      ßßßßßßß ßßßßßßßß ßßßßßßßß    ßß    ßßßßßßßß ßßßßßßßß ßßßßßßßß ßßßßßßßß  
echo     ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
echo     ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo     ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo     ³         SYSINSTALL is integrated, preconfigured and automated       ³
echo     ³          universal software and settings installation system        ³
echo     ³         with advantaged local and networking features provided      ³
echo     ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo. 
ver>%systemroot%\system32\winnt.ver
for /f "tokens=*" %%a in (%systemroot%\system32\winnt.ver) do set "ntv=%%a"
if not exist %systemroot%\system32\winnt.ver goto error_user
echo %ntv%|find.exe "95" &if not errorlevel 1 goto error_system
echo %ntv%|find.exe "98" &if not errorlevel 1 goto error_system
echo %ntv%|find.exe "Me" &if not errorlevel 1 goto error_system
echo %ntv%|find.exe "4.0" &if not errorlevel 1 goto error_system
echo %ntv%|find.exe "5.0" &if not errorlevel 1 goto error_system
echo %ntv%|find.exe "5.2" &if not errorlevel 1 goto error_system
echo %ntv%|find.exe "6." &if not errorlevel 1 goto error_system
echo %ntv%|find.exe "5.1" >nul
set status=%processor_architecture% %ntv%
title [%~nx0]: %status%
echo.
echo  ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo   ³  SYSINSTALL  ³ ³  ³ ³ %status%
echo   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo  ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
set sysinstall=%systemdrive%\sysinstall
set sysconfig=%sysinstall%\sysconfig.ini
set install=%systemdrive%\install
set setupbin=%sysinstall%\setupbin
set s32=%systemroot%\system32
set etc=%systemroot%\system32\drivers\etc
set log=%systemroot%\system32\log
set rnd=%random%
set syslog=%systemroot%\system32\log\sysinstall%rnd%.log
set temp=%systemroot%\temp
set tmp=%systemroot%\temp
set userver=http://usetools.net
set path=%path%;%sysinstall%;%setupbin%;%etc%;%log%
for /f %%x in (%sysinstall%\_version.txt) do set sv=%%x
if not exist nul echo nul>%s32%\nul
if not exist "%systemroot%\temp" mkdir "%systemroot%\temp" >nul
if not exist %log% mkdir %log% >nul
if not exist %install% mkdir %install% >nul
echo :: %~dp0\%~nx0 %* ~ %computername%@%username% ~ %time% %date% ::>%syslog%
if not exist "%syslog%" (
	set status=%sv% SYSTEM32 WRITE ACCESS ERROR!
	set errinfo=procedure cannot go on cause it impossible to write %syslog%
	goto error
	)
echo %ntv%>>%syslog%
::
if "%1"=="--mode1" set sysmode=1
if "%1"=="--mode2" set sysmode=2
if "%1"=="--mode3" set sysmode=3
if "%1"=="" set sysmode=2
if "%1"=="--makehome" goto makehome
if "%1"=="--stage1" goto stage1
if "%1"=="--stage2" goto stage2
if "%1"=="--stage3" goto stage3
if "%1"=="--stage4" goto stage4
if "%1"=="--goto" set sysmode=0 &goto %2
if "%1"=="--error" (
	set status=MANUALLY GENERATED ERROR
	set errinfo=no additional information for this time... mailto mail@usetools.net
	goto error
	)
if exist %sysinstall%\sysinstall.run (
	echo.
	echo  ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
	echo   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	echo   ³  SYSINSTALL  ³ ³ ! ³ ³ ALLREADY RUNNING OR WAS INTERRUPTED
	echo   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	echo  ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
	echo.
	pause
	rundll32.exe advpack.dll,DelNodeRunDLL32 %sysinstall%\sysinstall.run
	)
::
%sysinstall%\7za.exe x -r -y -o%systemroot% %sysinstall%\xcorpack.7z >>%syslog%
echo %username%@%computername% ~ %~dp0%~nx0 %* ---%date% %time%--->%sysinstall%\sysinstall.run
::
:getready0
if not exist %systemdrive%\sysinstall goto makehome
if /i "%~dp0"=="%sysinstall%\" goto getready1 
if /i "%~dp0" NEQ "%sysinstall%\" goto makehome
goto getready1
::
:makehome
set status=building new homebase directory
title [%~nx0]: %status%
echo.
echo  ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo   ³  SYSINSTALL  ³ ³  ³ ³ %status%
echo   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo  ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
if not exist %sysinstall% mkdir %sysinstall%
echo.
::getdown
if not exist %sysinstall%\sysinstall.lst %sysinstall%\wget.exe -nv --tries=3 -c %userver%/sysinstall/sysinstall.lst
for /f "usebackq tokens=*" %%a in ("%sysinstall%\sysinstall.lst") do if not exist "%sysinstall%\%%a" %sysinstall%\wget.exe -v -c %userver%/sysinstall/%%a
::
xcopy "%cd%" %sysinstall%\ /e /c /i /f /h /r /y /z
if "%1"=="--makehome" exit
color 71
set status=restarting procedure
title [%~nx0]: %status%
echo.
echo  ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo   ³  SYSINSTALL  ³ ³  ³ ³ %status%
echo   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo  ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo. &cd /d %sysinstall%
start /high %sysinstall%\sysinstall.cmd
exit
::
:getready1
cd /d %sysinstall%
set status=%sv% system testing and getting ready
title [%~nx0]: %status%
echo.
echo  ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo   ³  SYSINSTALL  ³ ³  ³ ³ %status%
echo   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo  ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
set status=collecting enviroment information
title [%~nx0]: %status% &echo. &ecco #nCSYSINSTALL #Cn %status% #xf9#xf9#xf9
echo.
echo %username%@%computername%
isadmin.exe &if not errorlevel 1 goto error_user
::
::getdown
if not exist %sysinstall%\sysinstall.lst %sysinstall%\wget.exe -nv --tries=3 -c %userver%/sysinstall/sysinstall.lst
for /f "usebackq tokens=*" %%a in ("%sysinstall%\sysinstall.lst") do if not exist "%sysinstall%\%%a" %sysinstall%\wget.exe -v -c %userver%/sysinstall/%%a
::
echo. &echo %cd% >%log%\syscheck.log
md5sum.exe -c %sysinstall%\sysinstall.md5>>%log%\syscheck.log
cd /d %sysinstall%\setupbin 
echo %cd%>>%log%\syscheck.log
md5sum.exe -c %sysinstall%\setupbin\setupbin.md5>>%log%\syscheck.log
type %log%\syscheck.log
type %log%\syscheck.log>>%syslog%
cd /d %sysinstall% &color 1f
::
set status=prepairing configuration settings
title [%~nx0]: %status% &echo. &ecco #nCSYSINSTALL #Cn %status% #xf9#xf9#xf9
timer.exe -start
nircmd.exe regsetval sz "hklm\software\microsoft\windows nt\currentversion\winlogon" "shell" "%sysinstall%\sysinstall.cmd -mode%sysmode%"
nircmd.exe regsetval sz "hkcu\software\microsoft\windows nt\currentversion\winlogon" "shell" "%sysinstall%\sysinstall.cmd -mode%sysmode%"
nircmd.exe regsetval dword "hklm\software\microsoft\windows nt\currentversion\winlogon" "autorestartshell" "0x00000000"
nircmd.exe regsetval dword "hkcu\software\microsoft\windows nt\currentversion\winlogon" "autorestartshell" "0x00000000"
nircmd.exe regsetval dword "hklm\software\microsoft\windows nt\currentversion\winlogon" "sfcquota" "0x00000000"
nircmd.exe regsetval dword "hklm\software\microsoft\windows nt\currentversion\winlogon" "sfcscan" "0x00000000"
nircmd.exe regsetval dword "hklm\software\microsoft\windows\currentversion\systemfileprotection" "showpopups" "0x00000000"
if "%sysmode%"=="1" goto getready2
goto getready3
::
:getready2
set status=inspecting system hardware configuration
title [%~nx0]: %status% &echo. &ecco #nCSYSINSTALL #Cn %status% #xf9#xf9#xf9
call compreport.cmd %log%
nircmd.exe setdisplay 1024 768 32 -updatereg
for %%d in (d e f g h i j k l m n o p q r s t u v w x y z) do if exist %%d:\win51 set cdrom=%%d:
for %%d in (c d e f g h i j k l m n o p q r s t) do if exist %%d:\boot.ini set bootini=%%d:\boot.ini
if exist %cdrom% cmdx.exe /dsklck:%cdrom% /verbosen
::
:getready3
cs -p1 -q
cs -p1 -maf -q
set status=%sv% running in mode %sysmode%
title [%~nx0]: %status%
echo.
echo  ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo   ³  SYSINSTALL  ³ ³  ³ ³ %status%
echo   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo  ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo. &cd /d %sysinstall%
start run!.exe
start /high prkiller.exe
for /f "usebackq tokens=*" %%a in ("%etc%\sysprep.lst") do process.exe -k "%%~a" >>%syslog%
goto stage1
::
:stage1
cd /d %sysinstall%
color 1b &cls
set systage=stage1
set status=%systage% mode%sysmode% writing main system data
title [%~nx0]: %status%
echo %status%>>%syslog%
start cmdx.exe /osdrtf 25 "{\rtf1\ansi\deff0{\fonttbl{\f0\fprq2 ProFontWindows;}}{\colortbl ;\red22\green255\blue50;}{\uc1\pard\qc\cf1\b\f0\fs72 sysinstall: %systage% \cf0\b0\par}
echo.
echo  ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo   ³  SYSINSTALL  ³ ³  ³ ³ %status%
echo   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo  ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo. &color 09 
cmdw /fs
set status=installing system32 addon-pack
title [%~nx0]: %status% &echo. &ecco #nCSYSINSTALL #Cn %status% #xf9#xf9#xf9
::
%sysinstall%\7za.exe x -r -y -o%s32% %sysinstall%\system32.7z
for /f %%x in (%s32%\system32.ver) do set sv32=%%x
nircmd.exe regsetval sz "hklm\software\usetools\system32" "version" "%sv32%"
cmdw /wm
cmdw @ /res
cls &color 1b
set status=installing regtweaks addon-pack
title [%~nx0]: %status% &echo. &ecco #nCSYSINSTALL #Cn %status% #xf9#xf9#xf9
%sysinstall%\7za.exe x -r -y -o%s32% %sysinstall%\regtwks.7z>>%syslog%
inifile.exe %systemroot%\system32\drivers\etc\setpath.ini [sysinstall] >%systemroot%\system32\drivers\etc\~setpath.cmd
call %etc%\~setpath.cmd
set path=%path%;%sysinstall%;%setupbin%;%etc%;%log%
::for /f %%x in (%etc%\version.txt) do set sv=%%x
set status=%sv% running in mode %sysmode%
title [%~nx0]: %status% &echo. &ecco #nCSYSINSTALL #Cn %status% #xf9#xf9#xf9
nircmd.exe regsetval sz "hklm\software\usetools\sysinstall" "version" "%sv%"
nircmd.exe regsetval sz "hklm\software\usetools\sysinstall" "sysmode" "%sysmode%"
nircmd.exe regsetval sz "hklm\software\usetools\sysinstall" "syspath" "%sysinstall%"
nircmd.exe regsetval sz "hklm\system\currentcontrolset\control\session manager\environment" "sv" "%sv%"
nircmd.exe regsetval sz "hklm\system\currentcontrolset\control\session manager\environment" "sysinstall" "%sysinstall%"
::
if not exist %drv% mkdir %drv%
if not exist %public% mkdir %public%
if not exist %backup% mkdir %backup%
::
nircmd.exe regsetval sz "hklm\system\currentcontrolset\control\session manager\environment" "temp" "%systemroot%\temp"
nircmd.exe regsetval sz "hklm\system\currentcontrolset\control\session manager\environment" "tmp" "%systemroot%\temp"
nircmd.exe regsetval sz "hklm\system\currentcontrolset\control\session manager\environment" "install" "%install%"
nircmd.exe regsetval sz "hklm\system\currentcontrolset\control\session manager\environment" "etc" "%etc%"
nircmd.exe regsetval sz "hklm\system\currentcontrolset\control\session manager\environment" "log" "%log%"
nircmd.exe regsetval sz "hklm\system\currentcontrolset\control\session manager\environment" "s32" "%s32%"
nircmd.exe regsetval sz "hklm\system\currentcontrolset\control\session manager\environment" "data" "%data%"
nircmd.exe regsetval sz "hklm\system\currentcontrolset\control\session manager\environment" "guilinks" "%guilinks%"
nircmd.exe regsetval sz "hklm\system\currentcontrolset\control\session manager\environment" "public" "%public%"
nircmd.exe regsetval sz "hklm\system\currentcontrolset\control\session manager\environment" "backup" "%backup%"
nircmd.exe regsetval sz "hklm\system\currentcontrolset\control\session manager\environment" "drv" "%drv%"
nircmd.exe regsetval sz "hklm\system\currentcontrolset\control\session manager\environment" "drivers" "%drv%"
::
nircmd.exe regsetval sz "hklm\system\currentcontrolset\control\session manager\environment" "bb" "%bb%"
nircmd.exe regsetval sz "hklm\system\currentcontrolset\control\session manager\environment" "cygwinbase" "%cygwinbase%"
nircmd.exe regsetval sz "hklm\system\currentcontrolset\control\session manager\environment" "gimp2_directory" "%gimp2_directory%"
nircmd.exe regsetval sz "hklm\system\currentcontrolset\control\session manager\environment" "vbox_user_home" "%vbox_user_home%"
nircmd.exe regsetval sz "hklm\system\currentcontrolset\control\session manager\environment" "gtk_basepath" "%gtk_basepath%"
::
nircmd.exe regsetval sz "hklm\software\gtk\2.0" "" "%gtk_basepath%"
nircmd.exe regsetval sz "hklm\software\gtk\2.0" "path" "%gtk_basepath%"
nircmd.exe regsetval sz "hklm\software\gtk\2.0" "dllpath" "%gtk_basepath%\bin"
nircmd.exe regsetval sz "hklm\software\pidgin" "" "%s32%\pidgin"
::
pathset.exe -n %sysinstall%
pathset.exe -n %etc%
pathset.exe -n %systemroot%\system32\gtk
pathset.exe -n %systemroot%\system32\gtk\bin
pathset.exe -n %systemroot%\system32\gtk\lib
pathset.exe -n %bb%
::
regedit /s %systemroot%\system32\drivers\etc\regtweaks.reg
if "%sysmode%"=="1" call shelldirs.cmd --write
if "%sysmode%" neq "1" call shelldirs.cmd
if "%sysmode%" neq "1" regedit /s %etc%\regtwkfix.reg
::
echo :: %~dp0\%~nx0 %* ~ %computername%@%username% ~ %time% %date% ::>%etc%\~sysconfig.cmd
inifile.exe %sysconfig% [system]>>%etc%\~sysconfig.cmd
inifile.exe %sysconfig% [guishell]>>%etc%\~sysconfig.cmd
inifile.exe %sysconfig% [services]>>%etc%\~sysconfig.cmd
inifile.exe %sysconfig% [startup]>>%etc%\~sysconfig.cmd
call %etc%\~sysconfig.cmd
if "%autologon%" neq "1" nircmd.exe regsetval sz "hklm\software\microsoft\windows nt\currentversion\winlogon" "autoadminlogon" "1"
nircmd.exe regsetval dword "hklm\software\microsoft\windows nt\currentversion\winlogon" "logontype" "%logontype%"
nircmd.exe regsetval dword "hklm\system\currentcontrolset\control\session manager\memory management" "disablepagingexecutive" "%disablepagingexecutive%"
nircmd.exe regsetval dword "hklm\system\currentcontrolset\control\session manager\memory management" "largesystemcache" "%largesystemcache%"
nircmd.exe regsetval dword "hklm\system\currentcontrolset\control\session manager\memory management" "clearpagefileatshutdown" "%swapclear%"
nircmd.exe regsetval dword "hklm\system\currentcontrolset\control\crashcontrol" "autoreboot" "%bsodautoreboot%"
if "%hydra%" neq "0" regedit /s %etc%\hydra.reg
::
regsvr32.exe /s 7-zip.dll
::
start /wait /high /min makehome.cmd %~nx0
::
nircmd.exe paramsfile "%etc%\aliasreg.lst" "," "" execmd swreg.exe add "hkey_local_machine\software\microsoft\windows\currentversion\app paths\~$fparam.1$" /v "" /t reg_sz /d "~$fparam.2$" /f
nircmd.exe paramsfile "%etc%\aliaslnk.lst" "," "" shortcut "~$fparam.2$" "~$folder.system$" "~$fparam.1$" "~$fparam.3$" "~$fparam.4$" "~$fparam.5$" "~$fparam.6$"
::
swreg.exe add "hkey_local_machine\software\microsoft\active setup\installed components\sysinstall" /v "stubpath" /t reg_expand_sz /d "makehome.cmd" /f
swreg.exe add "hkey_local_machine\software\microsoft\active setup\installed components\sysinstall" /v "version" /t reg_sz /d "%random%,%random%,%random%" /f
::
set status=%sv% %systage% mode%sysmode% completed
echo %status%>>%syslog%
echo.
echo  ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo   ³  SYSINSTALL  ³ ³ û ³ ³ %status%
echo   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo  ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo. &sleep.exe 1000
if "%sysmode%"=="3" goto stage4
if "%1"=="--stage1" pause
::
:stage2
color 1b &cls
set systage=stage2
set status=%systage% mode%sysmode% software packages setup
title [%~nx0]: %status%
echo %status%>>%syslog%
start cmdx.exe /osdrtf 25 "{\rtf1\ansi\deff0{\fonttbl{\f0\fprq2 ProFontWindows;}}{\colortbl ;\red22\green255\blue50;}{\uc1\pard\qc\cf1\b\f0\fs72 sysinstall: %systage% \cf0\b0\par}
echo.
echo  ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo   ³  SYSINSTALL  ³ ³  ³ ³ %status%
echo   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo  ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
set status=installing local packages
title [%~nx0]: %status% &echo. &ecco #nCSYSINSTALL #Cn %status% #xf9#xf9#xf9
inifile.exe %sysconfig% [setupbin]>>%etc%\~sysconfig.cmd
call %etc%\~sysconfig.cmd
cd /d %sysinstall%\setupbin
if "%setup_fastpack%"=="1" (
	if not exist %setupbin%\_fastpack.exe wget.exe --tries=3 -c %userver%/sysinstall/setupbin/_fastpack.exe
	type descript.ion|find.exe "_fastpack.exe"
	if exist %systemdrive%\_fastpack rundll32.exe advpack.dll,DelNodeRunDLL32 %systemdrive%\_fastpack
	start /high /wait _fastpack.exe -nr -y
	)
if "%setup_unreal%"=="1" (
	if not exist %setupbin%\unreal.exe wget.exe --tries=3 -c %userver%/sysinstall/setupbin/unreal.exe
	type descript.ion|find.exe "unreal.exe"
	start /high /wait unreal.exe --usetools
	swreg.exe add "hkey_local_machine\software\microsoft\windows\currentversion\app paths\unreal.exe" /v "" /t reg_sz /d "%systemdrive%\unreal\uncom.exe" /f
	)
if "%setup_firefox%"=="1" (
	if not exist %setupbin%\ufirefox.exe wget.exe --tries=3 -c %userver%/sysinstall/setupbin/ufirefox.exe
	type descript.ion|find.exe "ufirefox.exe"
	start /high /wait ufirefox.exe --sysinstall
	)
if "%setup_flashpack%"=="1" (
	if not exist %setupbin%\flashpack.exe wget.exe --tries=3 -c %userver%/sysinstall/setupbin/flashpack.exe	
	type descript.ion|find.exe "flashpack.exe"
	start /high /wait flashpack.exe
	)
if "%setup_openoffice%"=="1" (	
	if not exist %setupbin%\openoffice.exe wget.exe --tries=3 -c %userver%/sysinstall/setupbin/openoffice.exe
	type descript.ion|find.exe "openoffice.exe"
	start /high /wait openoffice.exe --sysinstall
	)
if "%setup_pdfprinter%"=="1" (
	if not exist %setupbin%\dopdf.exe wget.exe --tries=3 -c http://www.dopdf.com/download/setup/dopdf.exe
	type descript.ion|find.exe "dopdf.exe"
	start dopdf.exe /verysilent /norestart /nocancel /suppressmsgboxes /dir="%programfiles%\dopdf" /group="dopdf" /noicons /languages="en-ru" /defaultlang="ru"
	)
if "%setup_dotnet%"=="1" (
	if not exist %setupbin%\dotnet2.exe wget.exe --tries=3 -c %userver%/sysinstall/setupbin/dotnet2.exe
	type descript.ion|find.exe "dotnet2.exe"
	start /high /wait dotnet2.exe
	)
if "%setup_cdbxp%"=="1" (	
	if not exist %setupbin%\cdbxp.exe wget.exe --tries=3 -c %userver%/sysinstall/setupbin/cdbxp.exe
	type descript.ion|find.exe "cdbxp.exe"
	cdbxp.exe /silent /norestart
	nircmd.exe service stop NMSAccessU
	nircmd.exe service disabled NMSAccessU
	)
::
ping google.com -n 1 -l 32 |find "ttl=" &if not errorlevel 1 goto stage2f
::
:stage2i
set setupweb=%sysinstall%\setupweb
if not exist %setupweb% mkdir %setupweb%
cd /d %setupweb%
call %etc%\~sysconfig.cmd
set status=installing internet updates
title [%~nx0]: %status% &echo. &ecco #nGSYSINSTALL #Cn %status% #xf9#xf9#xf9
if "%setup_adflash%"=="1" (
	type %sysinstall%\descript.ion|find.exe "adflash.exe"
	if not exist %setupweb%\install_flash_player_10.exe wget.exe -v --tries=3 -c "http://fpdownload.macromedia.com/get/flashplayer/current/licensing/win/install_flash_player_10.exe"
	if exist %setupweb%\adflash.exe rundll32.exe advpack.dll,DelNodeRunDLL32 %setupweb%\adflash.exe
	ren %setupweb%\install_flash_player_10.exe adflash.exe
	adflash.exe /install
	type %sysinstall%\descript.ion|find.exe "adflashx.exe"
	if not exist %setupweb%\install_flash_player_10_active_x.exe wget.exe -v --tries=3 -c "http://fpdownload.macromedia.com/get/flashplayer/current/licensing/win/install_flash_player_10_active_x.exe"
	if exist %setupweb%\adflashx.exe rundll32.exe advpack.dll,DelNodeRunDLL32 %setupweb%\adflashx.exe
	ren %setupweb%\install_flash_player_10_active_x.exe adflashx.exe
	adflashx.exe /install
	)
if "%setup_sunjava%"=="1" (
	type %sysinstall%\descript.ion|find.exe "jresetup.exe"
	if not exist %setupweb%\jresetup.exe wget.exe -v --tries=3 -c "http://javadl.sun.com/webapps/download/AutoDL?BundleId=40916"
	ren "jre*" jresetup.exe
	jresetup.exe /s /v /qn mozilla=1 iexplorer=1 netscape6=0 addlocal=jrecore systray=0 webstarticon=0 javaupdate=0 autoupdatecheck=0 reboot=supress eula=1 installdir="%programfiles%\java" /l %systemroot%\system32\logfiles\jre.log
	nircmd killprocess jusched.exe
	nircmd killprocess jqs.exe
	"%programfiles%\java\bin\jqs.exe" -unregister
	regedit /s %etc%\setupweb\sunjava.reg
	nircmd.exe regsetval sz "hklm\software\microsoft\windows\currentversion\runonce" "jresetup" "regedit /s %etc%\setupweb\sunjava.reg"
	)
::
:stage2f
cd /d %sysinstall%
set status=%sv% %systage% mode%sysmode% completed
echo %status%>>%syslog%
echo.
echo  ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo   ³  SYSINSTALL  ³ ³ û ³ ³ %status%
echo   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo  ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo. &sleep.exe 1000
if "%1"=="--stage2" pause
::
:stage3
color 1b &cls
set systage=stage3
set status=%systage% mode%sysmode% gui shell enhancement
title [%~nx0]: %status%
echo %status%>>%syslog%
start cmdx.exe /osdrtf 25 "{\rtf1\ansi\deff0{\fonttbl{\f0\fprq2 ProFontWindows;}}{\colortbl ;\red22\green255\blue50;}{\uc1\pard\qc\cf1\b\f0\fs72 sysinstall: %systage% \cf0\b0\par}
echo.
echo  ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo   ³  SYSINSTALL  ³ ³  ³ ³ %status%
echo   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo  ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
set status=installing gui shell enhancement packages
title [%~nx0]: %status% &echo. &ecco #nMSYSINSTALL #Cn %status% #xf9#xf9#xf9
call %etc%\~sysconfig.cmd
if "%sysmode%"=="1" goto resource
if "%tango%"=="1" (
	if not exist %sysinstall%\setupbin\tangopatch.exe goto resource
	type descript.ion|find.exe "tangopatch.exe"
	cd /d %sysinstall%\setupbin
	start /wait /high tangopatch.exe /S /NORESTART /theme=%tango_style%
	copy /y "%systemroot%\tango patcher 2600\backup\syssetup.dll" %s32% >>%syslog%
	copy /y %s32%\renotepad.exe %systemroot%\notepad.exe >>%syslog%
	copy /y %s32%\renotepad.exe %s32%\notepad.exe >>%syslog%
	echo. &cd /d %sysinstall%
	)
::
:resource
type descript.ion|find.exe "resource.exe"
start /wait /high resource.exe
::
:resettings
set status=applying gui shell enhancement settings
title [%~nx0]: %status% &echo. &ecco #WMSYSINSTALL #Cn %status% #xf9#xf9#xf9
nircmd.exe regsetval sz "hklm\system\currentcontrolset\control\session manager\environment" "visualstyle" "%visualstyle%"
nircmd.exe regsetval sz "hklm\system\currentcontrolset\control\session manager\environment" "wallpaper" "%wallpaper%"
nircmd.exe regsetval expand_sz "hkcu\software\microsoft\windows\currentversion\themes" "installtheme" "%theme%"
nircmd.exe regsetval expand_sz "hkcu\software\microsoft\windows\currentversion\themes" "custominstalltheme" "%theme%"
nircmd.exe regsetval expand_sz "hkcu\software\microsoft\windows\currentversion\themes" "installvisualstyle" "%visualstyle%"
nircmd.exe regsetval expand_sz "hkcu\software\microsoft\windows\currentversion\themes\lasttheme" "installtheme" "%theme%"
nircmd.exe regsetval expand_sz "hkcu\software\microsoft\windows\currentversion\themes\lasttheme" "custominstalltheme" "%theme%"
nircmd.exe regsetval expand_sz "hkcu\software\microsoft\windows\currentversion\themes\lasttheme" "installvisualstyle" "%visualstyle%"
nircmd.exe regsetval expand_sz "hkcu\software\microsoft\windows\currentversion\themes\defaultvisualstyleon" "installvisualstyle" "%visualstyle%"
nircmd.exe regsetval expand_sz "hkcu\software\microsoft\windows\currentversion\thememanager" "dllname" "%visualstyle%"
nircmd.exe regsetval sz "hkcu\control panel\desktop" "wallpaper" "%wallpaper%"
nircmd.exe regsetval expand_sz "hkcu\software\microsoft\windows\currentversion\themes\lasttheme" "wallpaper" "%wallpaper%"
nircmd.exe regsetval sz "hkcu\control panel\desktop" "screensaveactive" "%screensaveactive%"
nircmd.exe regsetval sz "hkcu\control panel\desktop" "screensavetimeout" "%screensavetimeout%"
nircmd.exe inisetval "%systemroot%\dimsaver.ini" "settings" "saver" "%screensaver%"
set status=%sv% %systage% mode%sysmode% completed
echo %status%>>%syslog%
echo.
echo  ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo   ³  SYSINSTALL  ³ ³ û ³ ³ %status%
echo   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo  ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo. &sleep.exe 1000
if "%1"=="--stage3" pause
::
:stage4
color 1b &cls
set systage=stage4
set status=%systage% mode%sysmode% final installation actions
title [%~nx0]: %status%
echo %status%>>%syslog%
start cmdx.exe /osdrtf 25 "{\rtf1\ansi\deff0{\fonttbl{\f0\fprq2 ProFontWindows;}}{\colortbl ;\red22\green255\blue50;}{\uc1\pard\qc\cf1\b\f0\fs72 sysinstall: %systage% \cf0\b0\par}
echo.
echo  ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo   ³  SYSINSTALL  ³ ³  ³ ³ %status%
echo   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo  ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
::
set status=system libraries registration
title [%~nx0]: %status% &echo. &ecco #nCSYSINSTALL #Cn %status% #xf9#xf9#xf9
echo %status%>>%syslog%
start /wait /high /min regdll.cmd
::
set status=system services registration
title [%~nx0]: %status% &echo. &ecco #nCSYSINSTALL #Cn %status% #xf9#xf9#xf9
echo %status%>>%syslog%
start /wait /high /min regsrv.cmd
::
set status=fast system clean-up and fix-up
title [%~nx0]: %status% &echo. &ecco #nCSYSINSTALL #Cn %status% #xf9#xf9#xf9
echo %status%>>%syslog%
7za.exe x -r -y -o%s32% %sysinstall%\guilinks.7z >>%syslog%
if "%sysmode%"=="1" start /wait /high /min guiclean.cmd system
if "%sysmode%" neq "1" start /wait /high /min guiclean.cmd allusers
::
set status=gui shell links creation
title [%~nx0]: %status% &echo. &ecco #nCSYSINSTALL #Cn %status% #xf9#xf9#xf9
echo %status%>>%syslog%
start /wait /high /min guilinks.cmd
::
swreg.exe add "hkey_current_user\software\microsoft\windows nt\currentversion\winlogon" /v "shell" /t reg_sz /d "%s32%\exinit.cmd %sysmode%" /f
swreg.exe add "hkey_local_machine\software\microsoft\windows nt\currentversion\winlogon" /v "shell" /t reg_sz /d "%s32%\exinit.cmd %sysmode%" /f
if "%sysmode%"=="1" goto bootinit
if "%1"=="--stage4" pause
goto fixpagefile
::
:bootinit
set status=making initial boot configuration
title [%~nx0]: %status% &echo. &ecco #nCSYSINSTALL #Cn %status% #xf9#xf9#xf9
echo %status%>>%syslog%
if exist %bootini% (
	attrib -a -r -s -h %bootini%
	gsar.exe -o -s":x22Microsoft Windows XP Professional RU:x22 /noexecute=optin /fastdetect" -r":x22NORMAL %ntv%:x22 /fastdetect" %bootini%
	bootcfg /copy /d "X86 WINNT5.1 safe/restore mode" /id 1
	attrib -a -r -s -h %bootini%
	gsar.exe -o -s":x22X86 WINNT5.1 safe/restore mode:x22" -r":x22SAFEMODE %ntv%:x22 /bootlogo /bootlog /noguiboot /safeboot::network(alternateshell)" %bootini%
)
if exist %cdrom%\i386\winnt32.exe (
	start /wait /high %cdrom%\i386\winnt32.exe /cmdcons /unattend /dudisable
	attrib -a -r -s -h %bootini%
	gsar.exe -o -s":x22Microsoft Windows XP Recovery Console:x22" -r":x22RECOVERY %ntv%:x22" %bootini%
	)
bootcfg /timeout 3
label %systemdrive% system
if exist %cdrom% (
	cmdx.exe /verbosen /dskunl:%cdrom%
	remount.exe %cdrom% z:
	set cdrom=z:
	setenv.exe -m cdrom %cdrom%
	nircmd.exe cdrom open %cdrom%
	)
if "%sysmode%" neq "1" goto fixpagefile
::
:makepublic
set status=public shared folder creation
title [%~nx0]: %status% &echo. &ecco #nCSYSINSTALL #Cn %status% #xf9#xf9#xf9
echo %status%>>%syslog%
chcp 1251>>%syslog%
set p_user=ghost
::p_user=Ãîñòü
nircmd.exe service lanmanserver start
nircmd.exe service lanmanworkstation start
net user %p_user% /active:yes
ntrights.exe +r SeNetworkLogonRight -u %p_user%
ntrights.exe -r SeDenyNetworkLogonRight -u %p_user%
subinacl.exe /file %public%\ /grant=Âñå=C
net share public=%public% /cache:no
copy %log%\compreport_%computername%.txt %public%\ >>%syslog%
chcp 866>>%syslog%
::
:fixpagefile
set status=fixed pagefile setup
title [%~nx0]: %status% &echo. &ecco #nCSYSINSTALL #Cn %status% #xf9#xf9#xf9
echo %status%>>%syslog%
wmic pagefileset where name="%systemdrive%\\pagefile.sys" set InitialSize="%swapsize%",MaximumSize="%swapsize%"
del /f /q "%sysinstall%\sysinstall.run" >>%syslog%
::
set status=%sv% %sysmode% COMPLETED AND READY TO EXIT
title [%~nx0]: %status% &echo. &ecco #nGSYSINSTALL #Gn %status%
start cmdx.exe /osdrtf 20 "{\rtf1\ansi\deff0{\fonttbl{\f0\fprq2 ProFontWindows;}}{\colortbl ;\red22\green255\blue50;}{\uc1\pard\qc\cf1\b\f0\fs72 sysinstall: completed \cf0\b0\par}
echo.
echo  ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo   ³  SYSINSTALL  ³ ³ û ³ ³ %status%
echo   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo  ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo. 
banner.exe sysinstall
banner.exe completed!
timer.exe -stop
export uptime=`uptime`
copy /y %syslog% %log%\sysinstall_%date%.log>nul
color 1a
if "%sysmode%"=="3" start exinit.cmd &exit
shutdown.exe -r -t 5 -f -c "%uptime%"
exit
::
:error_os
set status=OPERATING SYSTEM VERSION ERROR!
set errinfo=cannot go on cause %ntv% is not supported or support is not implemented yet. mailto mail@usetools.net
goto error
::
:error_system
set status=SYSTEM ACCESS ERROR!
set errinfo=cannot go on cause it impossible to write %syslog%
goto error
::
:error_user
set status=USER ACCESS ERROR!
set errinfo=cannot go on cause %username% admin rights check failed
goto error
::
:error
echo.
echo  ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo   ³  SYSINSTALL  ³ ³ ! ³ ³ ALLREADY RUNNING OR WAS INTERRUPTED
echo   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo  ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo. &color 04
echo %errinfo%
if exist %systemroot%\system32\notepad2.exe start notepad2.exe %~nx0
if not exist %systemroot%\system32\notepad2.exe start notepad.exe %~nx0
pause
exit
::
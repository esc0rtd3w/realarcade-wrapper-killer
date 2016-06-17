@echo off

title RealArcade Wrapper Killer    (.-+'~^-+ RGS Loader v2.1.2 +-^~`+-.)     [...cRypTiCwaRe 2o12...]

color 4f

set root=%ProgramFiles%\unRealArcade\loaders\loaderRGSv1


nircmd exec hide "RGSinst.exe" /m application/vnd.rn-rn_secured_installer %1

nircmd wait 1000

nircmd dlg "RGSinst.exe" "unRealArcade RGS Loader" click yes 

::pause>nul

nircmd wait 5000


:reloop
nircmd win close title "unRealArcade RGS Loader"

cls
echo %errorlevel%

if %errorlevel% gtr 0 goto notdone
if %errorlevel% == 0 goto done
goto chkdone


:notdone
cls
echo Installation detected as INSTALLING
pause>nul
nircmd win close title "unRealArcade RGS Loader"
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
nircmd win close title "unRealArcade RGS Loader"
if %errorlevel%==0 goto end
goto killall2

:end
exit


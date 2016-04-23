@echo off

title unRealArcade Activemark Trymedia Macrovision Reg Looper       [cRypTiC 2016]


set ver=1.0


color 0e


:start
action=99

cls
echo Choose an action and press ENTER:
echo.
echo.
echo 1) Run All Loops
echo.
echo 2) Registry Loop
echo.
echo 3) Directory Loop
echo.
echo.


set /p action=

if %action% gtr 3 goto start
if %action%==1 goto all
if %action%==2 goto regloop
if %action%==3 goto dirloop

goto start


:all

reg delete "HKCU\Software\Macrovision\data" /f

if exist "%ProgramData%\Trymedia" rd /s /q "%ProgramData%\Trymedia"

goto all
goto start


:regloop

reg delete "HKCU\Software\Macrovision\data" /f

goto regloop
goto start


:dirloop

if exist "%ProgramData%\Trymedia" rd /s /q "%ProgramData%\Trymedia"

goto dirloop
goto start



:end





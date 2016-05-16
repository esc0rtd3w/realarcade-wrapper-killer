@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Downloadable Content +-^~`+-.)     [...cRypTiCwaRe 2o16...]


color 0e
::-----------------------------------------------------------------------------------
:: Games are to be sorted alphabetically.
::-----------------------------------------------------------------------------------

cls
echo This game has Downloadable Content.
echo.
echo Would you like to view more information? [Y/N]

if %os%==XP goto xpdlc
if %os%==VISTA goto vistadlc
:xpdlc
choice /c:yn /t:n,30 /n
if errorlevel 2 goto end
goto dlcstart

:vistadlc
choice /c yn /d n /n /t 30
if errorlevel 2 goto end
goto dlcstart

::-----------------------------------------------------------------------------------
::Start Downloadable Content
::-----------------------------------------------------------------------------------

:dlcstart

goto %unwrapped%
goto end

:5s2
cls
echo --------------------------------
echo Downloadable Content Information
echo --------------------------------
echo.
echo This game has a picture pack which can be downloaded.
echo.
echo.
echo Simply launch the game and click "More Pics" and click the top button.
echo.
echo It will be stored in the "\data\" folder as a file called "more_pics.dat"
echo.
echo.
pause
goto end


:end

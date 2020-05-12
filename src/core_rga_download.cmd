@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ RGA File Downloader +-^~`+-.)     [...cRypTiCwaRe 2o2o...]


color 0e

set ie="C:\Program Files\Internet Explorer\iexplore.exe"
set firefox="C:\Program Files\Mozilla Firefox\firefox.exe"
set chrome="%adl%\Google\Chrome\Application\chrome.exe"
set ghsearch=http://www.gamehouse.com/search-results?q=


:: Temporary workaround for RGA licenses
goto ghserver


if exist "rgastub.bin" goto start

if not exist "rgastub.bin" echo RGA Stub EXE Not Found! Aborting....

%waitfor% 5000

goto end


:start

::echo RGA Stub EXE Found! Continuing....

::%waitfor% 1500



set rga1=GameHouse-Installer

set rga2=_gamehouse_.exe


set trial=_am-

set unlim=_amg-



cls
echo Enter Game Filename:
echo.
echo.

set /p rgname=




cls
echo Set Unlimited Switch? [Y/N]
echo.
echo.
echo To try and force the unlimited switch press Y.
echo.
echo.
echo THE PROPER FILENAME WILL BE SET, BUT WILL FAIL IF FILE IS UNAVAILABLE!
echo.
echo.



choice /c yn /n

if errorlevel 2 goto dotrial
if errorlevel 1 goto dounlim



:dotrial
copy "rgastub.bin" "%rga1%%trial%%rgname%%rga2%"

goto end


:dounlim
copy "rgastub.bin" "%rga1%%unlim%%rgname%%rga2%"

goto end



:ghserver


:: Check for Firefox 1st, Chrome 2nd, and Launch Internet Explorer as a last result as 3rd
if not exist %firefox% goto chkchrome
goto ffsrch

:chkchrome
if not exist %chrome% goto iesrch


:ffsrch
cls
echo Launching GameHouse Website To Verify/Purchase License with Mozilla Firefox....
echo.
echo.
start /wait %firefox% "%ghsearch%%GameName%"
goto end


:chrmsrch
cls
echo Launching GameHouse Website To Verify/Purchase License with Google Chrome....
echo.
echo.
start /wait %chrome% "%ghsearch%%GameName%"
goto end


:iesrch
cls
echo Launching GameHouse Website To Verify/Purchase License with Internet Explorer....
echo.
echo.
start /wait %ie% "%ghsearch%%GameName%"
goto end



:end

if %testmode%==1 (
	echo [core_rga_download : finished]
	pause>nul
)

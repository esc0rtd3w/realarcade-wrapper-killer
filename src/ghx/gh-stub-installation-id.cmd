@echo off

title GameHouse Stub Installation ID Extractor                   cRypTiC / esc0rtd3w 2016

:: Part of the GameHouse Package Tool (Javascript)

:: Parent Project: RealArcade Wrapper Killer
:: esc0rtd3w / cRypTiC


:: This script will retrieve the installation ID from an Acid 1.20.128.0 GameHouse Stub
:: The Installation ID can be extracted from any stub at hex offset 0x949CE - 0x949DD (16 Bytes)

:: Requirements: sfk.exe (included with RealArcade Wrapper Killer)

:: TODO: Get Game Names from Auto stub download and create a list of all Installation IDs to Text file

:reset

set iid=0
set inputStub=%1
set outputText="%temp%\ura-install-id-temp.txt"

set readID="%~dp0bin\sfk.exe" hexdump -quiet -pure -offlen 0x949CE 16

set gameName=0

set stubRoot=0

set dragged=0
set multiMode=1

:: Set default Navigation Return Label
set return=outText

:: If launched directly, the input will be empty here
if not defined inputStub set inputStub=0

::If a stub was dragged onto script
if %inputStub% neq 0 set dragged=1
if %inputStub% neq 0 goto readIID

cls
::echo Drag A Stub or Folder of Stubs Into This Window and Press ENTER:
echo Drag A Stub Into This Window and Press ENTER:
echo.
echo.
echo For Multi Mode Press M and ENTER
echo.
echo.

set /p inputStub=

if %inputStub%==0 goto reset

if %inputStub%==m goto readMulti
if %inputStub%==M goto readMulti


:readIID

%readID% "%inputStub%">%outputText%

for /f "tokens=1*delims=:" %%a in ('findstr /n "^" %outputText%') do if %%a equ 2 echo %%b>%outputText%

set /p iid=<%outputText%

for %%a in ("%inputStub%") do (
    set gameName=%%~nxa
)

setlocal enableextensions enabledelayedexpansion
set gameName=!gameName:~10,-4!
echo %gameName%>"%temp%\gameName.txt"
endlocal

set /p gameName=<"%temp%\gameName.txt"

goto %return%


:outText
set return=outText

echo %gameName%>%~dp0%gameName%-%iid%.txt

if %dragged%==0 goto reset

goto end


:readMulti
set return=readMulti
set multiMode=1

for %%a in (%~dp0test\*.exe) do (
%readID% "%%a">%outputText%
set inputStub=%%a
)
pause
for /f "tokens=1*delims=:" %%b in ('findstr /n "^" %outputText%') do if %%b equ 2 echo %%c>%outputText%

set /p iid=<%outputText%

echo Installation ID: %iid%
pause


for %%a in ("%inputStub%") do (
    set gameName=%%~nxa
)

setlocal enableextensions enabledelayedexpansion
set gameName=!gameName:~10,-4!
echo %gameName%>"%temp%\gameName.txt"
endlocal

set /p gameName=<"%temp%\gameName.txt"
echo Game Name: %gameName%
pause
echo %gameName%-%iid%>>%~dp0stubIDList.txt


goto %return%


:end

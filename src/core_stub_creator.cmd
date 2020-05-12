@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ RFS/RGA Stub Builder +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_stub_creator : loaded]
	pause>nul
)

set chunk1=stub-chunk1.bin
set chunk2=stub-chunk2-installation-id.bin
set chunk3=stub-chunk3-offering.bin
set chunk4=stub-chunk4-filler.bin
set chunk5=stub-chunk5-language-country.bin
set chunk6=stub-chunk6.bin

set stubPath=stub

set stubEXE=Installer_gamename.exe


:getName
cls
echo Enter Game Name and press ENTER:
echo.
echo.
echo Example: bejeweled2
echo.
echo.

set /p name=

if "%name%"=="" goto getName
set stubEXE=Installer_%name%.exe
goto getIID


:getIID

:: 20160429
:: CHUNK2 NEEDS REPLACED WITH INSTALLATION ID (USING GPATCH OR OTHER)

cls
echo Enter Installation ID and press ENTER:
echo.
echo.
echo Example: 4B4B444CDB574C078AFE13716A5CD96D
echo.
echo.

set /p iid=

if "%iid%"=="" goto getIID

copy /b /y "%stubPath%\%chunk1%"+"%stubPath%\%chunk2%"+"%stubPath%\%chunk3%"+"%stubPath%\%chunk4%"+"%stubPath%\%chunk5%"+"%stubPath%\%chunk6%" "%stubEXE%"




:end

if %testmode%==1 (
	echo [core_stub_creator : finished]
	pause>nul
)

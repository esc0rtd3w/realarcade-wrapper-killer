@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ RGS Game Patcher +-^~`+-.)     [...cRypTiCwaRe 2o2o...]



cls
echo Enter the filename and press ENTER:
echo.

set /p wrapped=



cls
echo Enter The Starting Index for extractGame (in decimal) (Default = 103977): 
echo.
echo.
set /p GEindex=

cls
echo Enter The Starting Index for extractGame (in decimal): %GEindex%
echo.
echo.
echo Enter The New Value for extractGame (in hex) (Default = e9f2f7feff90):
echo.
echo.
set /p GEhex=

cls
echo Enter The Starting Index for extractGame (in decimal): %GEindex%
echo.
echo.
echo Enter The New Value for extractGame (in hex): %GEhex%
echo.
echo.
echo Enter The Starting Index for RacNotRunning (in decimal) (Default = 33227):
echo.
echo.
set /p RNRindex=

cls
echo Enter The Starting Index for extractGame (in decimal): %GEindex%
echo.
echo.
echo Enter The New Value for extractGame (in hex): %GEhex%
echo.
echo.
echo Enter The Starting Index for RacNotRunning (in decimal): %RNRindex%
echo.
echo.
echo Enter The New Value for RacNotRunning (in hex) (Default = e96001000090):
echo.
echo.
set /p RNRhex=

cls
echo Enter The Starting Index for extractGame (in decimal): %GEindex%
echo.
echo.
echo Enter The New Value for extractGame (in hex): %GEhex%
echo.
echo.
echo Enter The Starting Index for RacNotRunning (in decimal): %RNRindex%
echo.
echo.
echo Enter The New Value for RacNotRunning (in hex): %RNRhex%
echo.
echo.
echo Enter The Starting Index for startWrapper (in decimal) (Default = 34020):
echo.
echo.
set /p SWindex=

cls
echo Enter The Starting Index for extractGame (in decimal): %GEindex%
echo.
echo.
echo Enter The New Value for extractGame (in hex): %GEhex%
echo.
echo.
echo Enter The Starting Index for RacNotRunning (in decimal): %RNRindex%
echo.
echo.
echo Enter The New Value for RacNotRunning (in hex): %RNRhex%
echo.
echo.
echo Enter The Starting Index for startWrapper (in decimal): %SWindex%
echo.
echo.
echo Enter The New Value for startWrapper (in hex) (Default = e99500000090):
echo.
echo.
set /p SWhex=

cls
echo Enter The Starting Index for extractGame (in decimal): %GEindex%
echo.
echo.
echo Enter The New Value for extractGame (in hex): %GEhex%
echo.
echo.
echo Enter The Starting Index for RacNotRunning (in decimal): %RNRindex%
echo.
echo.
echo Enter The New Value for RacNotRunning (in hex): %RNRhex%
echo.
echo.
echo Enter The Starting Index for startWrapper (in decimal): %SWindex%
echo.
echo.
echo Enter The New Value for startWrapper (in hex): %SWhex%
echo.
echo.
echo Setting Up New Patching Variables. Please Wait....
echo.
echo.


cls
echo Enter patch type (lower case) "ge", "rnr", or "sw" and press ENTER:
echo.

set /p type=


goto %type%

goto end


:ge
cls
echo Type: GE
echo.
echo Index: %GEindex%
echo.
echo Hex: %GEhex%
echo.
gpatch "%wrapped%.exe" /nologo /i%GEindex% /h"%GEhex%"
pause>nul
goto end

:rnr
cls
echo Type: RNR
echo.
echo Index: %RNRindex%
echo.
echo Hex: %RNRhex%
echo.
gpatch "%wrapped%.exe" /nologo /i%RNRindex% /h"%RNRhex%"
pause>nul
goto end

:sw
cls
echo Type: SW
echo.
echo Index: %SWindex%
echo.
echo Hex: %SWhex%
echo.
gpatch "%wrapped%.exe" /nologo /i%SWindex% /h"%SWhex%"
pause>nul
goto end


:end

if %testmode%==1 (
	echo [core_rgs_game_patcher : finished]
	pause>nul
)

exit


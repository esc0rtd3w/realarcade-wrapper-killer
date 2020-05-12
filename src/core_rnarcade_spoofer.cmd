@echo off

title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ RNArcade Spoofer +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_rnarcade_spoofer : loaded]
	pause>nul
)


cls
echo Spoofing RealArcade Player....
echo.
%kill% "RNArcade.exe"


cls
echo Spoofing RealArcade Player....
echo.
start "" /d "C:\Program Files\unRealArcade\temp" "rnaspoof.exe"


cls
echo Spoofing RealArcade Player....
echo.
%waitfor% 5000


cls
echo Spoofing RealArcade Player....
echo.
start "" "%wrapped%.exe"



:: Setting this flag to trigger skipping normal manual mode
set spoofed=1



:end

if %testmode%==1 (
	echo [core_rnarcade_spoofer : finished]
	pause>nul
)

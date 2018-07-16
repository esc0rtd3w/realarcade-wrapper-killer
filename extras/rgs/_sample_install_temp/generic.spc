COPY %SPEC%\*.* %ENCSDK%

BRUN %SPEC%\DLPRInstApp_EN.exe --servleturl http://realarcadebundles.real.com/DLPRInfo3 --gameid youdalegendpack

CMPPREF DisplayName "Youda Legend Pack"
CMPPREF Product1 "RealArcadeGames:1.0"
COPY %SPEC%\setup.ini %ENCSDK%\setup.ini
COPY %SPEC%\gamefind.xml %ENCSDK%\gamefind.xml
REG HKCR "SOFTWARE\RealNetworks\Games\youdalegendpack"
REG HKCR "SOFTWARE\RealNetworks\Games\youdalegendpack\1"
REG HKCR "SOFTWARE\RealNetworks\Games\youdalegendpack\1" "Executable" "YLPack_r1a.exe"
REG HKCR "SOFTWARE\RealNetworks\Games\youdalegendpack\1" "InstallPath" "%ENCSDK%"
REG HKCR "SOFTWARE\RealNetworks\Games\youdalegendpack\1" "GameName" "Youda Legend Pack"
STARTMENU Real\Games "Youda Legend Pack" "%INSTALL%\RNArcade.exe" "/launch FFFFFFFF-1E5B-11B2-B307-00D0B7142009"
DEL %ENCSDK%\generic.spc

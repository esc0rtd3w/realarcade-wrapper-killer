COPY %SPEC%\regid.exe %INSTALL%\Catalog\Ads\ 
BRUN %INSTALL%\Catalog\Ads\regid.exe "-f magicball2.txt"
DEL %INSTALL%\Catalog\Ads\regid.exe
DEL %INSTALL%\Catalog\Ads\magicball2.txt


CMPPREF DisplayName "Magic Ball 2"
CMPPREF Product1 "RealArcadeGames:1.0"
COPY %SPEC%\setup.ini %ENCSDK%\setup.ini
COPY %SPEC%\gamefind.xml %ENCSDK%\gamefind.xml
REG HKCR "SOFTWARE\RealNetworks\Games\magicball2"
REG HKCR "SOFTWARE\RealNetworks\Games\magicball2\1"
REG HKCR "SOFTWARE\RealNetworks\Games\magicball2\1" "LicenseKey" "f4d4b51-6ddde4eb"

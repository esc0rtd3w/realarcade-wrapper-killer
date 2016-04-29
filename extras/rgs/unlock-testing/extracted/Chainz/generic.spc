COPY %SPEC%\regid.exe %INSTALL%\Catalog\Ads\ 
BRUN %INSTALL%\Catalog\Ads\regid.exe "-f chainz.txt"
DEL %INSTALL%\Catalog\Ads\regid.exe
DEL %INSTALL%\Catalog\Ads\chainz.txt


CMPPREF DisplayName "Chainz"
CMPPREF Product1 "RealArcadeGames:1.0"
COPY %SPEC%\setup.ini %ENCSDK%\setup.ini
COPY %SPEC%\gamefind.xml %ENCSDK%\gamefind.xml
REG HKCR "SOFTWARE\RealNetworks\Games\chainz"
REG HKCR "SOFTWARE\RealNetworks\Games\chainz\1"
REG HKCR "SOFTWARE\RealNetworks\Games\chainz\1" "LicenseKey" "f4d4b51-6ddde4eb"

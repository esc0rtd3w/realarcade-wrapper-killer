COPY %SPEC%\regid.exe %INSTALL%\Catalog\Ads\ 
BRUN %INSTALL%\Catalog\Ads\regid.exe "-f pizzafrenzy.txt"
DEL %INSTALL%\Catalog\Ads\regid.exe
DEL %INSTALL%\Catalog\Ads\pizzafrenzy.txt


CMPPREF DisplayName "Pizza Frenzy"
CMPPREF Product1 "RealArcadeGames:1.0"
COPY %SPEC%\setup.ini %ENCSDK%\setup.ini
COPY %SPEC%\gamefind.xml %ENCSDK%\gamefind.xml
REG HKCR "SOFTWARE\RealNetworks\Games\pizzafrenzy"
REG HKCR "SOFTWARE\RealNetworks\Games\pizzafrenzy\1"
REG HKCR "SOFTWARE\RealNetworks\Games\pizzafrenzy\1" "LicenseKey" "f4d4b51-6ddde4eb"

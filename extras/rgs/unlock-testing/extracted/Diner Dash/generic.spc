COPY %SPEC%\regid.exe %INSTALL%\Catalog\Ads\ 
BRUN %INSTALL%\Catalog\Ads\regid.exe "-f dinerdash.txt"
DEL %INSTALL%\Catalog\Ads\regid.exe
DEL %INSTALL%\Catalog\Ads\dinerdash.txt


CMPPREF DisplayName "Diner Dash"
CMPPREF Product1 "RealArcadeGames:1.0"
COPY %SPEC%\setup.ini %ENCSDK%\setup.ini
COPY %SPEC%\gamefind.xml %ENCSDK%\gamefind.xml
REG HKCR "SOFTWARE\RealNetworks\Games\dinerdash"
REG HKCR "SOFTWARE\RealNetworks\Games\dinerdash\1"
REG HKCR "SOFTWARE\RealNetworks\Games\dinerdash\1" "LicenseKey" "f4d4b51-6ddde4eb"

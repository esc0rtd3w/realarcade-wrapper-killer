COPY %SPEC%\regid.exe %INSTALL%\Catalog\Ads\ 
BRUN %INSTALL%\Catalog\Ads\regid.exe "-f backspinbilliards.txt"
DEL %INSTALL%\Catalog\Ads\regid.exe
DEL %INSTALL%\Catalog\Ads\backspinbilliards.txt


CMPPREF DisplayName "Backspin Billiards"
CMPPREF Product1 "RealArcadeGames:1.0"
COPY %SPEC%\setup.ini %ENCSDK%\setup.ini
COPY %SPEC%\gamefind.xml %ENCSDK%\gamefind.xml
REG HKCR "SOFTWARE\RealNetworks\Games\backspinbilliards"
REG HKCR "SOFTWARE\RealNetworks\Games\backspinbilliards\1"
REG HKCR "SOFTWARE\RealNetworks\Games\backspinbilliards\1" "LicenseKey" "f4d4b51-6ddde4eb"

@echo off

set runDirectory=%uraServicesRoot%\ogm

set appBin=ogmservice.exe
set appArgs=--service-run

set serviceName=ogmservice
set serviceDisplayName=Online Games Manager
set serviceDescription=Enhance user experience on the web for playing local games

net stop %serviceName%
sc delete "%serviceName%"

sc create "%serviceName%" binpath= "%runDirectory%\%appBin% %appArgs%" start= demand DisplayName= "%serviceDisplayName%" error= ignore

sc start "%serviceName%" binpath= "%runDirectory%\%appBin% %appArgs%"

cls
echo Running Online Games Manager Service (ogmservice)....
echo.
echo.
echo.
echo Press any key to terminate and remove this service!
echo.
echo If closed forcefully, the service will remain installed.
echo.
echo.
pause>nul

net stop %serviceName%
sc delete "%serviceName%"

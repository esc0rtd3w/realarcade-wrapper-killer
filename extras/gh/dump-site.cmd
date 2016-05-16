@echo off


set site=http://origin.gamehouse.com/gameconsole/

wget -e robots=off --wait 0.25 %site% -r -t 0 --retry-connrefused


echo.
echo.
echo Done!
echo.
pause>nul
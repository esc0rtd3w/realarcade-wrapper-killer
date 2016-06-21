@echo off

title GameHouse activeMARK Instant Image Grabber                              esc0rtd3w 2016

set root=%~dp0

cls
echo Enter Game Name With Dashes and press ENTER:
echo.
echo.

set /p gameNameDashes=

:: Get background
wget "http://cdn.ghstatic.com/images/gh/prod/games/%gameNameDashes%/images/%gameNameDashes%_large.jpg" -O "%root%background.jpg"

:: Get preview
wget "http://cdn.ghstatic.com/images/gh/prod/games/%gameNameDashes%/images/%gameNameDashes%_small.jpg" -O "%root%preview.jpg"


:end


@echo off
title A One-By-One Way To Browse The Entire RA Catalog

set raexec=C:\Program Files\Real\RealArcade\RNArcade.exe

color 0e

echo Enter A Starting Catalog Number (1 is default)
echo.
set /p nextgame=


::set nextgame=1


:start
if not errorlevel 1 goto :next
exit %errorlevel%


:next
cls
echo Current Launch ID: %nextgame%
set /A nextgame+=1
"%raexec%" /launch %nextgame%
pause
goto start
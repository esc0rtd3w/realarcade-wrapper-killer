@echo off

:reset

title ActiveMark Instant Server Log Viewer                                            esc0rtd3w 2016

cls
echo Log not being accessed by AMI Server....
echo.
tail -f "%AppData%\activeMARK\instant\aminstant.log"

goto reset

:end
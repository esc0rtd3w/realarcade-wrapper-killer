@echo off

:reset

title ActiveMark Instant Server Log Viewer                                            esc0rtd3w 2016

tail -f "%ProgramData%\activeMARK\instant\aminstant.log"

goto reset

:end
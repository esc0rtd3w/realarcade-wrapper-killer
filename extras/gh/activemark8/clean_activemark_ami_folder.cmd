@echo off

:reset

title GH AMI Cleaning Utility Thing v0.0.1                                           esc0rtd3w 2016

set root=%ProgramData%\activeMARK

rd /s /q "%root%\data"
rd /s /q "%root%\dynamicdata"
rd /s /q "%root%\instant"
rd /s /q "%root%\stats"
rd /s /q "%root%\streaming"





:end
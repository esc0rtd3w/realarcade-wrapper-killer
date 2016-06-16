@echo off

:reset

title GH AMI Game Prepping Utility Thing v0.0.1                                           esc0rtd3w 2016

set root=%ProgramData%\activeMARK

del /f /s /q "%root%\instant\aminstant.log"
del /f /s /q "%root%\instant\connection.json"
del /f /s /q "%root%\instant\datagathering.json"
del /f /s /q "%root%\instant\games.json.lock"
del /f /s /q "%root%\instant\info.json"
del /f /s /q "%root%\instant\pending-requests.json"
del /f /s /q "%root%\streaming\access.lock"

rd /s /q "%root%\data"





:end
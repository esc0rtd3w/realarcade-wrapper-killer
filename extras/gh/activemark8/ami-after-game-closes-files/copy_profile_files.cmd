@echo off


:loop

copy /y "%ProgramData%\activeMARK\streaming\*.prof" "tmp.prof"
copy /y "%ProgramData%\activeMARK\streaming\*.json" "tmp.json"

goto loop


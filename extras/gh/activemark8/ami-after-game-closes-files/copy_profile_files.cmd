@echo off

title RealArcade Wrapper Killer [AM Instant Server Profile Copy Looper]     [...cRypTiCwaRe 2o16...]


:loop

copy /y "%ProgramData%\activeMARK\streaming\*.prof" "tmp.prof"
copy /y "%ProgramData%\activeMARK\streaming\*.json" "tmp.json"

goto loop


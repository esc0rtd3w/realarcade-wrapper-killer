@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Demo 2 unWrapper +-^~`+-.)     [...cRypTiCwaRe 2o16...]


color 03

::-----------------------------------------------------------------------------------
:: Demo2 games only differ from Demo1 by not having the "_r1a" as the suffix. These
:: are simply renamed with the proper suffix and sent back to "demo1.cmd"
::-----------------------------------------------------------------------------------

cls
ren "*.exe" "demo2_r1a.exe"

cls
call demo1

:end
exit
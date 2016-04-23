@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Clear RAWK Cache +-^~`+-.)     [...cRypTiCwaRe 2o13...]


cls

del "%rawkroot%\*.ini"
del "%rawkroot%\update\*.ini"

copy "%rawkroot%\temp\*.ini" "%rawkroot%\"

set restartcore=1

:end
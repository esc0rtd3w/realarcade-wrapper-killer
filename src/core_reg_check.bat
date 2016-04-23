@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Checking For Old Registry Flags +-^~`+-.)     [...cRypTiCwaRe 2o13...]

::-----------------------------------------------------------------------------------
:: This disables ALL known/tested demo windows for ALL demo types. (use with launch.ini hack)
:: Also allows launching games from any directory without errors.
::-----------------------------------------------------------------------------------

::-----------------------------------------------------------------------------------
:: Checking for older NON-WORKING v4.5 reg id
::-----------------------------------------------------------------------------------

cls
if exist %systemroot%\system32\rawk_reg.id del %systemroot%\system32\rawk_reg.id

::-----------------------------------------------------------------------------------
:: Checking for older NON-WORKING v4.6 ORIGINAL RELEASE reg id
::-----------------------------------------------------------------------------------

cls
if exist %systemroot%\system32\rawk4reg.id del %systemroot%\system32\rawk4reg.id

::-----------------------------------------------------------------------------------
:: Checking for older PARTIAL-WORKING v4.61 reg id
::-----------------------------------------------------------------------------------

cls
if exist %systemroot%\system32\rawkreg.id del %systemroot%\system32\rawkreg.id

::-----------------------------------------------------------------------------------
:: Checking for v4.7 BETA 1 reg id
::-----------------------------------------------------------------------------------

cls
if exist %systemroot%\system32\rawk4.id del %systemroot%\system32\rawk4.id


:end
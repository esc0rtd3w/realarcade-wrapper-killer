@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Reg Block Hack Reset +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

::-----------------------------------------------------------------------------------
:: Checking for older NON-WORKING v4.5 reg id
::-----------------------------------------------------------------------------------

if exist %systemroot%\system32\rawk_reg.id del %systemroot%\system32\rawk_reg.id

::-----------------------------------------------------------------------------------
:: Checking for older NON-WORKING v4.6 ORIGINAL RELEASE reg id
::-----------------------------------------------------------------------------------

if exist %systemroot%\system32\rawk4reg.id del %systemroot%\system32\rawk4reg.id

::-----------------------------------------------------------------------------------
:: Checking for older PARTIAL-WORKING v4.61 reg id
::-----------------------------------------------------------------------------------

if exist %systemroot%\system32\rawkreg.id del %systemroot%\system32\rawkreg.id

::-----------------------------------------------------------------------------------
:: Check For v4.7 reg id
::-----------------------------------------------------------------------------------

if exist %systemroot%\system32\rawk4.id del %systemroot%\system32\rawk4.id

::-----------------------------------------------------------------------------------
:: Checking for v4.7 BETA 2+ reg id
::-----------------------------------------------------------------------------------

if exist %systemroot%\system32\rawkreg.ok del %systemroot%\system32\rawkreg.ok


:end
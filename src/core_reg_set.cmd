@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Checking Game Registry Flags +-^~`+-.)     [...cRypTiCwaRe 2o2o...]


:: REGBLOCKS DISABLED ON 08-02-2011
goto end


:chkreg1
cls
if %regblock1%==None goto chkreg2
nircmd regsetval sz "%rb1%\%regblock1%" "" "" 
goto chkreg2

:chkreg2
cls
if %regblock2%==None goto chkreg3
nircmd regsetval sz "%rb2%\%regblock2%" "" "" 
goto chkreg3

:chkreg3
cls
if %regblock3%==None goto chkreg4
nircmd regsetval sz "%rb3%\%regblock3%" "" "" 
goto chkreg4

:chkreg4
cls
if %regblock4%==None goto chkreg5
nircmd regsetval sz "%rb4%\%regblock4%" "" "" 
goto chkreg5

:chkreg5
cls
if %regblock5%==None goto end
nircmd regsetval sz "%rb5%\%regblock5%" "" "" 
goto end


:end

if %testmode%==1 (
	echo [core_reg_set : finished]
	pause>nul
)

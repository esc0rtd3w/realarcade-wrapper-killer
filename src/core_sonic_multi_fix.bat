@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Sonic Multi Fix +-^~`+-.)     [...cRypTiCwaRe 2o16...]


:: Sonic The Hedgehog Fix
:sonic1
set sthfix=0
if exist "sonic.exe" set sthfix=1

if %sthfix%==0 goto sonic2

if %sthfix%==1 (
ren "sonic.exe" "sonic.exe.orig"
%waitfor% 1000
ren "sc.exe" "sonic.exe"
goto end
)


:: Sonic The Hedgehog 2 Fix
:sonic2
set sth2fix=0
if exist "sonic2.exe" set sth2fix=1

if %sth2fix%==0 goto sonic3

if %sth2fix%==1 (
ren "sonic2.exe" "sonic2.exe.orig"
%waitfor% 1000
ren "sc.exe" "sonic2.exe"
goto end
)


:: Sonic The Hedgehog 3 Fix
:sonic3
set sth3fix=0
if exist "sonic3.exe" set sth3fix=1

if %sth3fix%==0 goto sonicspin

if %sth3fix%==1 (
ren "sonic3.exe" "sonic3.exe.orig"
%waitfor% 1000
ren "sc.exe" "sonic3.exe"
goto end
)


:: Sonic Spinball Fix
:sonicspin
set ssfix=0
if exist "sonic_spinball.exe" set ssfix=1

if %ssfix%==0 goto end

if %ssfix%==1 (
ren "sonic_spinball.exe" "sonic_spinball.exe.orig"
%waitfor% 1000
ren "sc.exe" "sonic_spinball.exe"
goto end
)


:end



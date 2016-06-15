@echo off

set bin=aminstantservice.exe
set args=--console
set name=activeMARK Instant Service
set displayName=activeMARK Instant Service
set description=activeMARK Instant Service
set startupType=demand
set errorType=ignore

set path=%SystemDrive%\Program Files\unRealArcade\temp

::"%SystemRoot%\system32\sc.exe" create "%name%" binPath= "\"%path%\%bin%\" \"%args%\"" start= %startupType% DisplayName= "%displayName%" error= ignore
"%SystemRoot%\system32\sc.exe" create "%name%" binPath= "%path%\%bin%" start= %startupType% DisplayName= "%displayName%" error= ignore

::pause
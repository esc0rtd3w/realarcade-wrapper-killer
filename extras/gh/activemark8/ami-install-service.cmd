@echo off

set bin=aminstantservice.exe
::set args=--console
set args=--service-run
set name=AMInstantService
set displayName=activeMARK Instant Service
set description=activeMARK Instant Service
set startupType=demand
::set startupType=auto
set errorType=ignore

set description=Enhances gaming experience from the web browsers

set path=%SystemDrive%\Program Files\unRealArcade\temp

::"%SystemRoot%\system32\sc.exe" create "%name%" binPath= "\"%path%\%bin%\" \"%args%\"" start= %startupType% DisplayName= "%displayName%" error= ignore
::"%SystemRoot%\system32\sc.exe" create "%name%" binPath= "\"%path%\%bin%\" --console" start= %startupType% DisplayName= "%displayName%" error= ignore

"%SystemRoot%\system32\sc.exe" create %name% binPath= "\"%path%\%bin%\" %args%" displayname= "%displayName%" start= %startupType%
"%SystemRoot%\system32\sc.exe" description %name% "%description%"

::pause
@echo off

set name=activeMARK Instant Service

"%SystemRoot%\system32\sc.exe" delete "%name%"

::pause
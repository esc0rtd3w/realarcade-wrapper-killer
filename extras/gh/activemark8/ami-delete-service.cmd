@echo off

set name=AMInstantService

"%SystemRoot%\system32\sc.exe" delete "%name%"

::pause
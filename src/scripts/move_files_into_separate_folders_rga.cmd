@echo off

title Create Original Game Folder Structure For Each File        [cRypTiC 2o2o]


set list="%temp%\list.txt"

del /f /s /q %list%

cd "%~dp0"

dir /b | find "rga">>%list%

setlocal ENABLEDELAYEDEXPANSION

for /f "tokens=1 delims=." %%a in (%temp%\list.txt) do (
	md "%%a"
	move "%~dp0%%a.rga" "%~dp0%%a\"
)

endlocal


:end

pause
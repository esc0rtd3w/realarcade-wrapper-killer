@echo off

set process=%1
set tmp="%temp%\find_process.tmp"


title Get Path From Process Finder                                                 esc0rtd3w 2016


if "%process%" equ "" (
	
	cls
	echo Get Path From Process Finder
	echo.
	echo Usage: find_process sample.exe
	echo.
	echo.
	pause
	goto end
	
)

wmic process list full | find "%process%" | findstr /v "CommandLine" | findstr /v "Description" | findstr /v "Name" > %tmp%

(
set /p try1=
)<%tmp%

set path_no_quotes=%try1:~15%
set path_quotes="%path_no_quotes%"

del /f /q %tmp%



cls
echo path_quotes: %path_quotes%
echo path_no_quotes: %path_no_quotes%
echo.
pause



:end
cls


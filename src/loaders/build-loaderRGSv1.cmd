@echo off


set winrar="C:\Program Files\WinRAR\WinRAR.exe"
set loader=loaderRGSv1

del /f /s /q "%loader%.exe"
%winrar% a -r -sfx "%loader%.exe" -zloader-sfx.txt %loader%


::pause

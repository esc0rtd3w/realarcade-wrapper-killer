@echo off


set winrar="C:\Program Files\WinRAR\WinRAR.exe"

set loader=loaderAMI
del /f /s /q "%loader%.exe"
%winrar% a -r -sfx "%loader%.exe" -zloader-sfx.txt %loader%

set loader=loaderDMG
del /f /s /q "%loader%.exe"
%winrar% a -r -sfx "%loader%.exe" -zloader-sfx.txt %loader%

set loader=loaderRFS
del /f /s /q "%loader%.exe"
%winrar% a -r -sfx "%loader%.exe" -zloader-sfx.txt %loader%

set loader=loaderRGA
del /f /s /q "%loader%.exe"
%winrar% a -r -sfx "%loader%.exe" -zloader-sfx.txt %loader%

set loader=loaderRGSv1
del /f /s /q "%loader%.exe"
%winrar% a -r -sfx "%loader%.exe" -zloader-sfx.txt %loader%

set loader=loaderRGSv2
del /f /s /q "%loader%.exe"
%winrar% a -r -sfx "%loader%.exe" -zloader-sfx.txt %loader%


::pause

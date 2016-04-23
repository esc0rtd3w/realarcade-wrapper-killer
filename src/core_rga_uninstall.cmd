@echo off

:loop

cls
echo Enter stub name and press ENTER:
echo.
echo.
echo Example: luxorevolved
echo.

set /p stubname=


cls
echo Removing %stubname%....

"C:\Program Files\RealArcade\Installer\bin\gameinstaller.exe" "C:\Program Files\RealArcade\Installer\installerMain.clf" "C:\Program Files\RealArcade\Installer\uninstall\am-%stubname%.rguninst" "AddRemove"

goto loop


:end


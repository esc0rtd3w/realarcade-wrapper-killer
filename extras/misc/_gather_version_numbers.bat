@echo off

@echo. >> _test1.txt

for %%a in ("%cd%\*.exe") do rar x -y %%a "%cd%" | filver32 "%cd%\bin\InstallerDlg.dll" >> _test1.txt | echo %%a >> _test1.txt




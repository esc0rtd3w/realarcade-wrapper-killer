@echo off

title RealArcade Wrapper Killer Inno Builder

::assoc .iss=issfile
::ftype issfile="%~dp0inno\ISTool.exe" %1

"%~dp0inno\Compil32.exe" /cc "%~dp0rawk.iss"
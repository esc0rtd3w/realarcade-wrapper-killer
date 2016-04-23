@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ RGP Writer +-^~`+-.)     [...cRypTiCwaRe 2o12...]

::-----------------------------------------------------------------------------------
:: RGP Writer
:: IT'S USELESS
::-----------------------------------------------------------------------------------


set /p rgpoutfile=



::Create Nodes
:nodecreate
set PACKAGE=PACKAGE
set PACKAGE_=/PACKAGE

set TITLE=TITLE
set TITLE_=/TITLE




:: Write Output
echo <%PACKAGE%> > "%rgpoutfile%.rgp"

echo %TITLE%%TITLE_% >> "%rgpoutfile%.rgp"

echo %PACKAGE_% >> "%rgpoutfile%.rgp"



:loop





:: Removing a blank rgp created file
if exist ".rgp" del ".rgp"

:end
exit
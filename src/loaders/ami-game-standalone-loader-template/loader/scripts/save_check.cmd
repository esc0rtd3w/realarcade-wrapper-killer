@echo off
title (.-+'~^-+ AMI Game Loader +-^~`+-.)     [...cRypTiCwaRe 2o16...]


:reset
color 0e

cls
echo Setting Up Modified Environment....
echo.
echo.
title (.-+'~^-+ AMI Game Loader +-^~`+-.)     [...cRypTiCwaRe 2o16...]

mode con lines=26


%lyellow%
cls
echo Checking For Game Save Data....
echo.
echo.

if exist "%rootSaveData%" (

	%lgreen%
	cls
	echo Game Save Data Found!
	echo.
	echo. 
	pause
	
)

if not exist "%rootSaveData%" (

	%lred%
	cls
	echo Game Save Data Not Found!
	echo.
	echo. 
	pause

)















:end




@echo off
title (.-+'~^-+ AMI Game Loader +-^~`+-.)     [...cRypTiCwaRe 2o2o...]


:reset
color 0e

mode con lines=26

%lyellow%
cls
echo Checking For Game Save Data....
echo.
echo.

if not exist "%rootSaveData%\nodata.id" (

	%lgreen%
	cls
	echo Game Save Data Found!
	echo.
	echo.
	
)

if exist "%rootSaveData%\nodata.id" (

	%lred%
	cls
	echo Game Save Data Not Found!
	echo.
	echo.

)















:end




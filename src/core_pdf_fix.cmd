@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ PDF SG Fix +-^~`+-.)     [...cRypTiCwaRe 2o2o...]


:: Samantha Swift and the Fountains of Fate Strategy Guide
if exist "samantha swift 4 - se strategy guide.pdf" (
	cls
	echo This is not a game, but is simply a PDF file.
	echo.
	echo The PDF will be saved and a shortcut will be made on your desktop.
	echo.
	echo.
	echo Please Wait....
	echo.
	%waitfor% 4000

	nircmd shortcut "%cd%\samantha swift 4 - se strategy guide.pdf" "~$folder.desktop$" "%GameName%"
	nircmd shortcut "%cd%\samantha swift 4 - se strategy guide.pdf" "%rashort%" "%GameName%"

	call "core_clean_main.cmd"

	if %testmode%==1 (
		echo [core_pdf_fix : samantha swift 4 : finished]
		pause>nul
	)

	exit
)

:end

if %testmode%==1 (
	echo [core_pdf_fix : finished]
	pause>nul
)

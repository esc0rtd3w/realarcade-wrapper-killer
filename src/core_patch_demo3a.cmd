@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Demo 3a File Patcher +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_patch_demo3a : loaded]
	pause>nul
)

::-----------------------------------------------------------------------------------
::This file is for Demo 3a Files ONLY!!!!
::-----------------------------------------------------------------------------------

::20101104
:: Added variables to accomodate the new patching system. This keeps track of hex addresses and more.

set PFLindex=6694
set PFLhex=e9a50d000090909090

::set RNRindex=8166
::set RNRhex=9090

set RNRindex=8150
set RNRhex=9090

set d2index=6252
set d2hex=909090909090
::set d2hex=ff154c714000

::00401FAF  |.  FF15 A8704000 CALL NEAR DWORD PTR DS:[<&KERNEL32.GetPr>; \GetProcAddress

::0040186C   .  FF15 4C714000 CALL NEAR DWORD PTR DS:[<&USER32.DialogB>; \DialogBoxParamA






cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
::%talk% "Please do not click any buttons or press any keys until the game is finished extracting!" -2

cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
echo Patching EXE Extract Command: Please Wait....
echo.
echo.
gpatch "%wrapped%.exe" /nologo /i%PFLindex% /h"%PFLhex%"

cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
echo Patching EXE Extract Command: Success!
echo.
echo Patching 1st Demo Window: Please Wait....
echo.
echo.
gpatch "%wrapped%.exe" /nologo /i%RNRindex% /h"%RNRhex%"


cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
echo Patching EXE Extract Command: Success!
echo.
echo Patching 1st Demo Window: Success!
echo.
echo Patching 2nd Demo Window: Please Wait....
echo.
echo.
gpatch "%wrapped%.exe" /nologo /i%d2index% /h"%d2hex%"

cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
echo Patching EXE Extract Command: Success!
echo.
echo Patching 1st Demo Window: Success!
echo.
echo Patching 2nd Demo Window: Success!
echo.
echo.

::if %quw%==0 %waitfor% %timerfix%

copy "%wrapped%.exe" "%wrapped%_extract_only.exe.bak" >nul


:end

if %testmode%==1 (
	echo [core_patch_demo3a : finished]
	pause>nul
)

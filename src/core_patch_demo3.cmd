@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Demo 3 File Patcher +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_patch_demo3 : loaded]
	pause>nul
)

::-----------------------------------------------------------------------------------
::This file is for Demo 3 Files ONLY!!!!
::-----------------------------------------------------------------------------------

::20101104
:: Added variables to accomodate the new patching system. This keeps track of hex addresses and more.

set PFLindex=6694
set PFLhex=e9b50d000090909090

set RNRindex=8166
set RNRhex=9090

set d2index=6252
set d2hex=909090909090

:: Temp Fix to patch Orbz with default DemoF patches
if "%wrapped%.exe"=="orbz.exe" (
	set patch1_index=6190
	set patch1_hex=EB
	set patch2_index=6353
	set patch2_hex=EB
	set patch3_index=7411
	set patch3_hex=909090909090
	set patch4_index=7554
	set patch4_hex=909090909090
	gpatch "%wrapped%.exe" /nologo /i%patch1_index% /h"%patch1_hex%"
	gpatch "%wrapped%.exe" /nologo /i%patch2_index% /h"%patch2_hex%"
	gpatch "%wrapped%.exe" /nologo /i%patch3_index% /h"%patch3_hex%"
	gpatch "%wrapped%.exe" /nologo /i%patch4_index% /h"%patch4_hex%"
	goto done
)


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

:: used to offset the startWrapper crap
gpatch "%wrapped%.exe" /nologo /i%swindex% /h"%swhex%"

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

:done
:: Wait a few seconds after patch before copy
wait 3
copy "%wrapped%.exe" "%wrapped%_extract_only.exe.bak" >nul


:end

if %testmode%==1 (
	echo [core_patch_demo3 : finished]
	pause>nul
)

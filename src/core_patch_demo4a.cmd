@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Demo 4a File Patcher +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

::-----------------------------------------------------------------------------------
::This file is for Demo 4a Files ONLY!!!!
::-----------------------------------------------------------------------------------

::20101104
:: Added variables to accomodate the new patching system. This keeps track of hex addresses and more.

set PFLindex=6694
set PFLhex=e9b50d000090909090

set RNRindex=8166
set RNRhex=9090

set d2index=6252
set d2hex=909090909090


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
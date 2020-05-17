@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ r1a File Patcher +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_patch_full : loaded]
	pause>nul
)

::-----------------------------------------------------------------------------------
::This file is for RGS Full Files ONLY!!!!
::-----------------------------------------------------------------------------------

:main
cls
echo ----------------------------------------------------------------------------
echo Preparing To Patch The Full EXE For Extraction!
echo ----------------------------------------------------------------------------
echo.
echo.
echo Press (C) To Enter Custom Offsets and Hex Values....
echo.
echo.
echo.
echo IF NO KEYS ARE PRESSED, THEN DEFAULT VALUES WILL BE USED!
echo.
echo.
echo.

if %os%==XP choice /c:nc /t:n,5 /n
if not %os%==XP choice /c nc /d n /n /t 5
if errorlevel 2 goto custompatch
if errorlevel 1 goto nocustom

::-----------------------------------------------------------------------------------
::Setting custom variables for patching
::-----------------------------------------------------------------------------------

:custompatch
:: Patch 1
cls
echo Enter The Starting Index for Patch 1 (in decimal): 
echo.
echo.
set /p patch1_index=

cls
echo Enter The Starting Index for Patch 1 (in decimal): %patch1_index%
echo.
echo.
echo Enter The New Value for Patch 1 (in hex):
echo.
echo.
set /p patch1_hex=

:: Patch 2
cls
echo Enter The Starting Index for Patch 2 (in decimal): 
echo.
echo.
set /p patch2_index=

cls
echo Enter The Starting Index for Patch 2 (in decimal): %patch2_index%
echo.
echo.
echo Enter The New Value for Patch 2 (in hex):
echo.
echo.
set /p patch2_hex=

:: Patch 3
cls
echo Enter The Starting Index for Patch 3 (in decimal): 
echo.
echo.
set /p patch3_index=

cls
echo Enter The Starting Index for Patch 3 (in decimal): %patch3_index%
echo.
echo.
echo Enter The New Value for Patch 3 (in hex):
echo.
echo.
set /p patch3_hex=

:: Patch 4
cls
echo Enter The Starting Index for Patch 4 (in decimal): 
echo.
echo.
set /p patch4_index=

cls
echo Enter The Starting Index for Patch 4 (in decimal): %patch4_index%
echo.
echo.
echo Enter The New Value for Patch 4 (in hex):
echo.
echo.
set /p patch4_hex=

:: Patch 5
cls
echo Enter The Starting Index for Patch 5 (in decimal): 
echo.
echo.
set /p patch5_index=

cls
echo Enter The Starting Index for Patch 5 (in decimal): %patch5_index%
echo.
echo.
echo Enter The New Value for Patch 5 (in hex):
echo.
echo.
set /p patch5_hex=

:: Patch 6
cls
echo Enter The Starting Index for Patch 6 (in decimal): 
echo.
echo.
set /p patch6_index=

cls
echo Enter The Starting Index for Patch 6 (in decimal): %patch6_index%
echo.
echo.
echo Enter The New Value for Patch 6 (in hex):
echo.
echo.
set /p patch6_hex=

:: Patch Extension
cls
echo Enter 1 If you Need To Add More Patches: 
echo.
echo.
set /p patch_extension=

echo.
echo.
%waitfor% 5000

goto autopatch


:nocustom
::-----------------------------------------------------------------------------------
::Checking for alternate patches
::-----------------------------------------------------------------------------------

::if "%GameName%"=="Some Game" goto somewhere

:: Check for blank indexes
if %patch1_index%==0 goto defaultpatch
if %patch2_index%==0 goto autopatch
if %patch3_index%==0 goto autopatch
if %patch4_index%==0 goto autopatch
if %patch5_index%==0 goto autopatch
if %patch6_index%==0 goto autopatch

goto defaultpatch

::-----------------------------------------------------------------------------------
::Setting variables for patching
::-----------------------------------------------------------------------------------

:: Land here if there is no value set in INI
:defaultpatch
set patch1_name="Force registry regkey write"
set patch1_index=6190
set patch1_hex=EB
set patch2_name="Force loading exe"
set patch2_index=6353
set patch2_hex=EB
set patch3_name="Do not delete extracted exe 1"
set patch3_index=7411
set patch3_hex=909090909090
set patch4_name="Do not delete extracted exe 2"
set patch4_index=7554
set patch4_hex=909090909090
set patch5_name=None
set patch5_index=0
set patch5_hex=0
set patch6_name=None
set patch6_index=0
set patch6_hex=0
set patch_extension=0


::-----------------------------------------------------------------------------------
::Autopatch starts using variables from above
::-----------------------------------------------------------------------------------

:autopatch

:patch1
cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
echo Executing Patch 1: Please Wait....
echo.
echo.
echo.

if %patch1_index%==0 goto nopatch
if %patch1_index% gtr 0 gpatch "%wrapped%.exe" /nologo /i%patch1_index% /h"%patch1_hex%"

:patch2
cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
echo Executing Patch 2: Please Wait....
echo.
echo.
echo.

if %patch2_index%==0 goto patch3
if %patch2_index% gtr 0 gpatch "%wrapped%.exe" /nologo /i%patch2_index% /h"%patch2_hex%"

:patch3
cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
echo Executing Patch 3: Please Wait....
echo.
echo.
echo.

if %patch3_index%==0 goto patch4
if %patch3_index% gtr 0 gpatch "%wrapped%.exe" /nologo /i%patch3_index% /h"%patch3_hex%"

:patch4
cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
echo Executing Patch 4: Please Wait....
echo.
echo.
echo.

if %patch4_index%==0 goto patch5
if %patch4_index% gtr 0 gpatch "%wrapped%.exe" /nologo /i%patch4_index% /h"%patch4_hex%"

:patch5
cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
echo Executing Patch 5: Please Wait....
echo.
echo.
echo.

if %patch5_index%==0 goto patch6
if %patch5_index% gtr 0 gpatch "%wrapped%.exe" /nologo /i%patch5_index% /h"%patch5_hex%"

:patch6
cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
echo Executing Patch 6: Please Wait....
echo.
echo.
echo.

if %patch6_index%==0 goto done
if %patch6_index% gtr 0 gpatch "%wrapped%.exe" /nologo /i%patch6_index% /h"%patch6_hex%"


:done
copy "%wrapped%.exe" "%wrapped%_extract_only.exe.bak" >nul

goto end


:nopatch
echo Something went wrong!
echo Patch 1 has a 0 index value
echo.
pause
goto end


:end

if %testmode%==1 (
	echo [core_patch_full : finished]
	pause>nul
)

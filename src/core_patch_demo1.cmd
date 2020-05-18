@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ r1a File Patcher +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_patch_demo1 : loaded]
	pause>nul
)

::-----------------------------------------------------------------------------------
::This file is for r1a Demo 1 Files ONLY!!!!
::-----------------------------------------------------------------------------------

:main
cls
echo ----------------------------------------------------------------------------
echo Preparing To Patch The Demo EXE for Full EXE Extraction!
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
cls
echo Enter The Starting Index for preparingForLaunch (in decimal) (Default = 103977): 
echo.
echo.
set /p PFLindex=

cls
echo Enter The Starting Index for preparingForLaunch (in decimal): %PFLindex%
echo.
echo.
echo Enter The New Value for preparingForLaunch (in hex) (Default = e9f2f7feff90):
echo.
echo.
set /p PFLhex=

cls
echo Enter The Starting Index for preparingForLaunch (in decimal): %PFLindex%
echo.
echo.
echo Enter The New Value for preparingForLaunch (in hex): %PFLhex%
echo.
echo.
echo Enter The Starting Index for RacNotRunning (in decimal) (Default = 33227):
echo.
echo.
set /p RNRindex=

cls
echo Enter The Starting Index for preparingForLaunch (in decimal): %PFLindex%
echo.
echo.
echo Enter The New Value for preparingForLaunch (in hex): %PFLhex%
echo.
echo.
echo Enter The Starting Index for RacNotRunning (in decimal): %RNRindex%
echo.
echo.
echo Enter The New Value for RacNotRunning (in hex) (Default = e96001000090):
echo.
echo.
set /p RNRhex=

cls
echo Enter The Starting Index for preparingForLaunch (in decimal): %PFLindex%
echo.
echo.
echo Enter The New Value for preparingForLaunch (in hex): %PFLhex%
echo.
echo.
echo Enter The Starting Index for RacNotRunning (in decimal): %RNRindex%
echo.
echo.
echo Enter The New Value for RacNotRunning (in hex): %RNRhex%
echo.
echo.
echo Enter The Starting Index for startWrapper (in decimal) (Default = 34020):
echo.
echo.
set /p SWindex=

cls
echo Enter The Starting Index for preparingForLaunch (in decimal): %PFLindex%
echo.
echo.
echo Enter The New Value for preparingForLaunch (in hex): %PFLhex%
echo.
echo.
echo Enter The Starting Index for RacNotRunning (in decimal): %RNRindex%
echo.
echo.
echo Enter The New Value for RacNotRunning (in hex): %RNRhex%
echo.
echo.
echo Enter The Starting Index for startWrapper (in decimal): %SWindex%
echo.
echo.
echo Enter The New Value for startWrapper (in hex) (Default = e99500000090):
echo.
echo.
set /p SWhex=

cls
echo Enter The Starting Index for preparingForLaunch (in decimal): %PFLindex%
echo.
echo.
echo Enter The New Value for preparingForLaunch (in hex): %PFLhex%
echo.
echo.
echo Enter The Starting Index for RacNotRunning (in decimal): %RNRindex%
echo.
echo.
echo Enter The New Value for RacNotRunning (in hex): %RNRhex%
echo.
echo.
echo Enter The Starting Index for startWrapper (in decimal): %SWindex%
echo.
echo.
echo Enter The New Value for startWrapper (in hex): %SWhex%
echo.
echo.
echo Setting Up New Patching Variables. Please Wait....
echo.
echo.
%waitfor% 5000

goto autopatch


:nocustom
::-----------------------------------------------------------------------------------
::Checking for alternate patches
::-----------------------------------------------------------------------------------

if "%GameName%"=="Monopoly 3" goto demo1b
if "%GameName%"=="Risk" goto demo1b

if "%GameName%"=="GameHouse Word Collection" goto demo1c

if "%GameName%"=="3D-Knifflis" goto demo1d
if "%GameName%"=="Coffee Rush 3" goto demo1d
if "%GameName%"=="Pickers" goto demo1d
if "%GameName%"=="Sherlock Holmes and the Mystery of the Mummy" goto demo1d
if "%GameName%"=="Star Defender 3" goto demo1d

if "%GameName%"=="4 Elements" goto demo1e


if "%GameName%"=="The Game of Life" goto demo1e


if "%GameName%"=="Word Craft" goto v100500


if not %RNRindex%==0 goto autopatch
goto defaultpatch

::-----------------------------------------------------------------------------------
::Setting variables for patching
::-----------------------------------------------------------------------------------

:demo1b
::0041A079    ^\E9 B2EFFEFF   JMP 00409030  -> FORCE JUMP
::0041A07E      90            NOP

::00409030   .  FF15 18834300 CALL NEAR DWORD PTR DS:[<&USER32.PostQui>; \PostQuitMessage
set PFLindex=106617
set PFLhex=e95ac7000090

::00408454     /E9 16010000   JMP 0040856F  -> FORCE JUMP
::00408459     |90            NOP
set RNRindex=33876
set RNRhex=e91601000090


::00408728   . /0F84 8B000000 JE 004087B9  -> FORCE JUMP
::0040872E   . |E8 9D8DFFFF   CALL 004014D0
::00408733   . |68 24884300   PUSH 00438824  ;  ASCII "Wrapper::startWrapper:showPreGameUrlPage"
set SWindex=34600
set SWhex=e98c00000090

goto autopatch


:demo1c
::00408232     /E9 FC050000   JMP 00408833

set PFLindex=33330
set PFLhex=e9fc05000090

goto autopatch


:demo1d
::004081BE   . /0F85 6C010000 JNZ 00408330  <-- RacNotRunning
::change to:
::004081BE     /E9 6D010000   JMP 00408330
set RNRindex=33214
set RNRhex=e96d01000090


::0041944E  |. /0F84 B1010000 JE 00419605   <-- preparingForLaunch
::change to:
::0041944E     /E9 B2010000   JMP 00419605
set PFLindex=103502
set PFLhex=e9b201000090


::00419629  |. /72 0D         JB SHORT 00419638  <-- PrepareForLaunch
::change to:
::00419629     /E9 61C70000   JMP 00425D8F  <-- Force Jump to Exit.Process
::
:: Substituting PFL (PrepareForLaunch) with SW (StartWrapper)
set SWindex=103977
set SWhex=e961c7000090

goto autopatch


:demo1e
::0040822E     /0F85 6C010000 JNZ 004083A0   <-- FORCE JUMP
::00408234   . |E8 97E20000   CALL 004164D0
::00408239   . |84C0          TEST AL,AL
::0040823B   . |0F84 5F010000 JE 004083A0
::00408241   . |68 0C8B4300   PUSH 00438B0C                            ;  ASCII "Wrapper::startWrapper"
::00408246   . |8D8C24 840000>LEA ECX,DWORD PTR SS:[ESP+84]
::0040824D   . |E8 7E92FFFF   CALL 004014D0
::00408252   . |68 B4884300   PUSH 004388B4                            ;  ASCII "Wrapper::startWrapper:RacNotRunning"
set RNRindex=33326
set RNRhex=e96d01000090


::0041927E     /0F84 B1010000 JE 00419435   <-- FORCE JUMP
::00419284  |. |68 A49D4300   PUSH 00439DA4                            ;  ASCII "Launcher::prepareForLaunch"
::00419289  |. |8D4C24 54     LEA ECX,DWORD PTR SS:[ESP+54]
::0041928D  |. |E8 3E82FEFF   CALL 004014D0
::00419292  |. |68 589D4300   PUSH 00439D58                            ;  ASCII "Launcher::preparingForLaunch"
set PFLindex=103038
set PFLhex=e9b201000090


::00419459     /72 0D         JB SHORT 00419468   <-- FORCE JUMP TO EXITPROCESS
::0041945B  |. |8B4C24 70     MOV ECX,DWORD PTR SS:[ESP+70]
::0041945F  |. |51            PUSH ECX
::00419460  |. |E8 78B80000   CALL 00424CDD
::00419465  |. |83C4 04       ADD ESP,4
::00419468  |> \BE 0F000000   MOV ESI,0F
::0041946D  |>  6A 1A         PUSH 1A
::0041946F  |.  68 A49D4300   PUSH 00439DA4                            ;  ASCII "Launcher::prepareForLaunch"
::00419474  |.  8D4C24 58     LEA ECX,DWORD PTR SS:[ESP+58]
::00419478  |.  897424 70     MOV DWORD PTR SS:[ESP+70],ESI
::0041947C  |.  895C24 6C     MOV DWORD PTR SS:[ESP+6C],EBX
::00419480  |.  885C24 5C     MOV BYTE PTR SS:[ESP+5C],BL
::00419484  |.  E8 577FFEFF   CALL 004013E0
::00419489  |.  6A 1E         PUSH 1E
::0041948B  |.  68 389D4300   PUSH 00439D38                            ;  ASCII "Launcher::prepareForLaunch:end"
::
::
::00425BA6   .  6A 03         PUSH 3                                   ; /ExitCode = 3
::00425BA8   .  FF15 BC814300 CALL NEAR DWORD PTR DS:[<&KERNEL32.ExitP>; \ExitProcess
::00425BAE      CC            INT3
::
:: OUTPUT --> 00419459     /E9 48C70000   JMP 00425BA6
set SWindex=103513
set SWhex=e948c7000090

goto autopatch


:demo1f
set RNRindex=30528
set RNRhex=0f855a010000

set PFLindex=88297
set PFLhex=720d8b4c2470

set SWindex=34020
set SWhex=e99500000090

goto autopatch


:: v1.0.0.500
:v100500
:: 00407770   . /0F85 5A010000 JNZ 004078D0   <-- FORCE JUMP
:: 00407776   . |E8 75A60000   CALL 00411DF0
:: 0040777B   . |84C0          TEST AL,AL
:: 0040777D   . |0F84 4D010000 JE 004078D0
:: 00407783   . |68 2C294300   PUSH 0043292C                            ;  ASCII "Wrapper::startWrapper"
:: 00407788   . |8D4C24 58     LEA ECX,DWORD PTR SS:[ESP+58]
:: 0040778C   . |E8 6F9DFFFF   CALL 00401500
:: 00407791   . |68 EC274300   PUSH 004327EC                            ;  ASCII "Wrapper::startWrapper:RacNotRunning"

set RNRindex=33326
set RNRhex=e96d01000090


:: 00414A30  |. /0F85 BA000000 JNZ 00414AF0
:: 00414A36  |. |6A 1A         PUSH 1A
:: 00414A38  |. |68 28374300   PUSH 00433728                            ;  ASCII "Launcher::prepareForLaunch"
:: 00414A3D  |. |8D4C24 1C     LEA ECX,DWORD PTR SS:[ESP+1C]
:: 00414A41  |. |897424 34     MOV DWORD PTR SS:[ESP+34],ESI
:: 00414A45  |. |895C24 30     MOV DWORD PTR SS:[ESP+30],EBX
:: 00414A49  |. |885C24 20     MOV BYTE PTR SS:[ESP+20],BL
:: 00414A4D  |. |E8 8EC9FEFF   CALL 004013E0
:: 00414A52  |. |6A 1B         PUSH 1B
:: 00414A54  |. |68 0C374300   PUSH 0043370C                            ;  ASCII "Launcher::NULL == pLauncher"

set PFLindex=103038
set PFLhex=e9b201000090

set SWindex=103513
set SWhex=e948c7000090

goto autopatch


:: v1.0.0.707
:v100707
set RNRindex=
set RNRhex=

set PFLindex=
set PFLhex=

set SWindex=
set SWhex=


goto autopatch


:: v1.0.0.928
:v100928

:: 00408E20  PostQuitMessage  -> FORCE JUMP

:: old defaults
::set PFLindex=103977
::set PFLhex=e9f2f7feff90

:: new defaults (2012-02-15)
set PFLindex=103977
set PFLhex=e991ff000090

::004081CB   . /E9 60010000   JMP 00408330  -> FORCE JUMP
::004081D0     |90            NOP
::004081D1   . |68 108B4300   PUSH 00438B10  ;  ASCII "Wrapper::startWrapper"

:: old defaults
::set RNRindex=33227
::set RNRhex=e96001000090

:: new defaults (2012-02-15)
set RNRindex=33214
set RNRhex=e96d01000090

::004084E4     /0F84 94000000 JE 0040857E  -> FORCE JMP
::004084EA   . |E8 E18FFFFF   CALL 004014D0
::004084EF   . |68 28884300   PUSH 00438828  ;  ASCII "Wrapper::startWrapper:showPreGameUrlPage"
::set SWindex=34020
::set SWhex=e99500000090

:: Changed defaults to "0" (added 20120305)
set SWindex=0
set SWhex=0

goto autopatch



:defaultpatch

:: 00408E20  PostQuitMessage  -> FORCE JUMP

:: old defaults
::set PFLindex=103977
::set PFLhex=e9f2f7feff90

:: new defaults (2012-02-15)
set PFLindex=103977
set PFLhex=e991ff000090

::004081CB   . /E9 60010000   JMP 00408330  -> FORCE JUMP
::004081D0     |90            NOP
::004081D1   . |68 108B4300   PUSH 00438B10  ;  ASCII "Wrapper::startWrapper"

:: old defaults
::set RNRindex=33227
::set RNRhex=e96001000090

:: new defaults (2012-02-15)
set RNRindex=33214
set RNRhex=e96d01000090

::004084E4     /0F84 94000000 JE 0040857E  -> FORCE JMP
::004084EA   . |E8 E18FFFFF   CALL 004014D0
::004084EF   . |68 28884300   PUSH 00438828  ;  ASCII "Wrapper::startWrapper:showPreGameUrlPage"
::set SWindex=34020
::set SWhex=e99500000090

:: Changed defaults to "0" (added 20120305)
set SWindex=0
set SWhex=0

goto autopatch

:demo1afix


::-----------------------------------------------------------------------------------
::Autopatch starts using variables from above
::-----------------------------------------------------------------------------------

:autopatch

:pfl
cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
echo Patching preparingForLaunch command: Please Wait....
echo.
echo.
echo.

if %PFLindex%==0 goto rnr
if %PFLindex% gtr 0 gpatch "delete.exe" /nologo /i%PFLindex% /h"%PFLhex%"


:rnr
cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
if %PFLindex%==0 echo Patching preparingForLaunch command: Skipped
if %PFLindex% gtr 0 echo Patching preparingForLaunch command: Success!
echo.
echo Patching RacNotRunning command: Please Wait....
echo.
echo.
echo.

if %RNRindex%==0 goto sw
if %RNRindex% gtr 0 gpatch "delete.exe" /nologo /i%RNRindex% /h"%RNRhex%"


:sw
cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
if %PFLindex%==0 echo Patching preparingForLaunch command: Skipped
if %PFLindex% gtr 0 echo Patching preparingForLaunch command: Success!
echo.
if %RNRindex%==0 echo Patching RacNotRunning command: Skipped
if %RNRindex% gtr 0 echo Patching RacNotRunning command: Success!
echo.
echo Patching startWrapper command: Please Wait....
echo.
echo.
echo.

if %SWindex%==0 goto textend
if %SWindex% gtr 0 gpatch "delete.exe" /nologo /i%SWindex% /h"%SWhex%"


:textend
cls
echo ----------------------------------------------------------------------------
echo DO NOT click any buttons or press any keys until the extraction is finished!
echo ----------------------------------------------------------------------------
echo.
if %PFLindex%==0 echo Patching preparingForLaunch command: Skipped
if %PFLindex% gtr 0 echo Patching preparingForLaunch command: Success!
echo.
if %RNRindex%==0 echo Patching RacNotRunning command: Skipped
if %RNRindex% gtr 0 echo Patching RacNotRunning command: Success!
echo.
if %SWindex%==0 echo Patching startWrapper command: Skipped
if %SWindex% gtr 0 echo Patching startWrapper command: Success!
echo.
echo.
echo.

::if %quw%==0 %waitfor% %timerfix%

:done
:: Wait a few seconds after patch before copy
wait 3
copy "delete.exe" "%wrapped%_extract_only.exe.bak" >nul

:end

if %testmode%==1 (
	echo [core_patch_demo1 : finished]
	pause>nul
)

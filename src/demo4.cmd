@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Demo 4 unWrapper +-^~`+-.)     [...cRypTiCwaRe 2o2o...]


::temp fix added 11-04-2010
::call "core_config_ra_player.cmd"

color 0b

set demotype=4

::-----------------------------------------------------------------------------------
::Setting Wrapped and unWrapped EXE
::-----------------------------------------------------------------------------------

if exist "thrillride.exe" set wrapped=thrillride& set unwrapped=pba
if exist "contraptions.exe" set wrapped=contraptions& set unwrapped=pin
if exist "dynomite.exe" set wrapped=dynomite& set unwrapped=Dyn
if exist "fitznik.exe" set wrapped=fitznik& set unwrapped=ebd
if exist "gutterball3d.exe" set wrapped=gutterball3d& set unwrapped=gut
if exist "hole in one slots.exe" set wrapped=hole in one slots& set unwrapped=hio
if exist "hoyleboard.exe" set wrapped=hoyleboard& set unwrapped=hbg
if exist "hoylecard.exe" set wrapped=hoylecard& set unwrapped=hcg
if exist "kyodai.exe" set wrapped=kyodai& set unwrapped=kmj
if exist "qbz_real.exe" set wrapped=qbz_real& set unwrapped=qbz
if exist "acenet_client_release.exe" goto acefix
if exist "bounceout.exe" set wrapped=bounceout& set unwrapped=bou
if exist "collapse.exe" set wrapped=collapse& set unwrapped=cst
if exist "gemdrop.exe" set wrapped=gemdrop& set unwrapped=cai
if exist "mahjong.exe" set wrapped=mahjong& set unwrapped=smj
if exist "nisqually.exe" set wrapped=nisqually& set unwrapped=snn
if exist "penguin puzzle.exe" set wrapped=penguin puzzle& set unwrapped=png
if exist "mahjongg towers.exe" set wrapped=mahjongg towers& set unwrapped=mah

::-----------------------------------------------------------------------------------
:: PRIMAL PRAY OFFSETS
::00401E23     /74 62         JE SHORT 00401E87 <-- 1) FORCE JUMP - PATCH #1

::00401E89      E8 B2090000   CALL 00402840 <-- 2) NOP THIS - PATCH #2

::00401FC5   .  E8 86580000   CALL 00407850                            ; \primalpr.00407850 <- 3a) CALL MUST BE MADE

::0040785D  |.  E8 FEFEFFFF   CALL 00407760                            ; \primalpr.00407760 <- 3b CALL TO EXE CREATION

::00401EAB   . /0F84 86050000 JE 00402437

::00401FC5   .  E8 86580000   CALL 00407850                            ; \primalpr.00407850 <-- pp.exe not created yet

::00401FD4   . /0F84 7E030000 JE 00402358 <-- pp.exe created (0 bytes)

::00402008   .  E8 43520000   CALL 00407250                            ; \primalpr.00407250 <-- 4a) CALL MUST BE MADE - still 0 bytes

:: Once above CALL is made, the extracted EXE is in its entirety!

::0040200D   .  83C4 04       ADD ESP,4
::00402010   .  33D2          XOR EDX,EDX
::00402012   .  8A15 79544300 MOV DL,BYTE PTR DS:[435479]
::00402018   .  85D2          TEST EDX,EDX
::0040201A   .  75 0D         JNZ SHORT 00402029

::00402023   . /0F85 BC020000 JNZ 004022E5 <-- 4b) NOP THIS - THIS JUMP DELETES THE EXTRACTED FILE - PATCH #3

::004020E5   .  E8 06510000   CALL 004071F0 <-- Hides EXE and launches extracted EXE (SKIP THIS PART AND GOTO EXIT)

::004071FA  |. /74 47         JE SHORT 00407243 <-- CALLED FROM 4020E5 ABOVE (Still not hidden yet)

::00407235  |. /74 06         JE SHORT 0040723D <-- CALLED FROM 4071FA ABOVE. AFTER A FEW LOOPS THIS JUMPS TO HIDE THE EXE

::004021C1   .  E8 7A4C0000   CALL 00406E40 <-- ACTUAL CALL TO HIDE THE EXE AND LAUNCH


::00402097   . /74 25         JE SHORT 004020BE <-- 5a) USE THIS TO JUMP TO AN EXIT BEFORE HIDING TAKES PLACE

::004021F9     /0F84 E6000000 JE 004022E5 <-- CLOSE TO ABOVE - AT THIS POINT THE GAME IS LAUNCHED!!



::00402097     /E9 C5040000   JMP 00402561 <-- 5b) CHANGE ABOVE TO THIS


::00406E40  /$ /75 01         JNZ SHORT 00406E43 <-- SOMEWHERE NEAR LAUNCH AFTER EXTRACT

::004028E7     /74 3B         JE SHORT 00402924 <-- If you land here then its too late!!
::004028E9  |. |68 681C4300   PUSH 00431C68                            ; /ProcNameOrOrdinal = "fnGameBeginEnd"



:: SUMMARY (3 Patches)

::00401E23     /74 62         JE SHORT 00401E87 <-- 1) FORCE JUMP - PATCH #1

::00401E89      E8 B2090000   CALL 00402840 <-- 2) NOP THIS - PATCH #2

::00402023   . /0F85 BC020000 JMP 00402561 <-- 3) JUMP TO EXIT

if exist "primalprey.exe" set wrapped=primalprey& set unwrapped=pp
::-----------------------------------------------------------------------------------


goto start

::-----------------------------------------------------------------------------------
::Special Situations Here
::-----------------------------------------------------------------------------------

:acefix
set wrapped=acenet_client_release& set unwrapped=ras
set aceserv="acenet_server_release"
set acesing="Red Ace Squadron - Single Player"
set acemult="Red Ace Squadron - Multiplayer"

::-----------------------------------------------------------------------------------
::END Special Situations
::-----------------------------------------------------------------------------------

:start

call "core_patch_demo4.cmd"
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Demo 4 unWrapper +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

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

%gohide% "%wrapped%.exe"


::-----------------------------------------------------------------------------------
::Removing hidden attributes
::-----------------------------------------------------------------------------------

if %quw%==0 %waitfor% 5000
attrib -h "*.*"

::-----------------------------------------------------------------------------------
::Removing ALL JUNK and TEMP files
::-----------------------------------------------------------------------------------

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
echo Cleaning Up Junk Files: Please Wait....
echo.
echo.

call "core_clean_main.cmd"

::-----------------------------------------------------------------------------------
::Closing RA Software
::-----------------------------------------------------------------------------------

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
echo Cleaning Up Junk Files: Success!
echo.
echo Terminating Wrapped EXE: Please Wait....
echo.
echo.

%kill% "RNArcade.exe" >nul
%kill% "%wrapped%.exe" >nul

::-----------------------------------------------------------------------------------
::Bypass question to create shortcut
::-----------------------------------------------------------------------------------

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
echo Cleaning Up Junk Files: Success!
echo.
echo Terminating Wrapped EXE: Success!
echo.
echo.


:sc
::-----------------------------------------------------------------------------------
::Bypass question to create shortcut
::-----------------------------------------------------------------------------------

cls
call "core_shortcut_demo3.cmd"


:end

if %testmode%==1 (
	echo [demo4 : finished]
	pause>nul
)

::exit
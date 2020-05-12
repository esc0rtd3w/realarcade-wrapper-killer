@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Demo 3 unWrapper +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [demo3 : loaded]
	pause>nul
)


color 0b

set demotype=3

::temp fix added 11-04-2010
::call "core_config_ra_player.cmd"

::TEMP FIX TO SKIP UNWRAPPED VARIABLES
::goto start

::-----------------------------------------------------------------------------------
:: MAY SWITCH TO HEX EDIT HACK ON ALL DEMO 3 / DEMO 3a / DEMO 4 GAMES
:: GAME START OFFSET IS 9210 IN HEX - 4D 5A 90 00 03 00 00 00 04 00 >> COPY UNTIL FOOTER (below)
:: REMOVE FOOTER >> C4 08 C8 80 00 00 00 00 09 00 00 00 00 00 38 01 A7 00 00 00 00 00 >> until END OF FILE
::-----------------------------------------------------------------------------------

::-----------------------------------------------------------------------------------
::Setting Wrapped and unWrapped EXE
::-----------------------------------------------------------------------------------

::if exist ".exe" set wrapped=& set unwrapped=
if exist "5_spots.exe" goto 5sfix
if exist "5spots2.exe" set wrapped=5spots2& set unwrapped=5s2
if exist "aironix.exe" goto airofix
if exist "airstrike3d.exe" set wrapped=airstrike3d& set unwrapped=aird
if exist "AlienSky.exe" set wrapped=AlienSky& set unwrapped=als
if exist "alphaqueue.exe" set wrapped=alphaqueue& set unwrapped=apq
if exist "antwar.exe" set wrapped=antwar& set unwrapped=ant
if exist "Astro.exe" set wrapped=Astro& set unwrapped=Astrobatics
if exist "arcade_r1a.exe" set wrapped=arcade_r1a& set unwrapped=Arcade
if exist "Atomaders.exe" set wrapped=Atomaders& set unwrapped=atou
if exist "atomicpongling.exe" set wrapped=atomicpongling& set unwrapped=atp
if exist "atomica.exe" set wrapped=atomica& set unwrapped=atdx
if exist "axisplay.exe" set wrapped=axisplay& set unwrapped=axs
if exist "bookworm.exe" set wrapped=bookworm& set unwrapped=bkwm
if exist "bos_creatureattack.exe" set wrapped=bos_creatureattack& set unwrapped=bos_ca
if exist "chainz.exe" set wrapped=chainz& set unwrapped=chz
if exist "combo chaos.exe" set wrapped=combo chaos& set unwrapped=ccs
if exist "crimson.exe" set wrapped=crimson& set unwrapped=crimsonland
if exist "congocube.exe" set wrapped=congocube& set unwrapped=cc
if exist "cubisgold.exe" set wrapped=cubisgold& set unwrapped=cub
if exist "cycles.exe" set wrapped=cycles& set unwrapped=cyc
if exist "cyclone.exe" set wrapped=cyclone& set unwrapped=clo
if exist "deepseatycoon.exe" set wrapped=deepseatycoon& set unwrapped=ut
if exist "devils.exe" set wrapped=devils& set unwrapped=devilsislandpinball
if exist "ds.exe" set wrapped=ds& set unwrapped=ds
if exist "dungeonscroll.exe" set wrapped=dungeonscroll& set unwrapped=game
if exist "electric.exe" set wrapped=electric& set unwrapped=elc
if exist "equilibria.exe" set wrapped=equilibria& set unwrapped=eql
if exist "flip wit.exe" set wrapped=flip wit& set unwrapped=flp
if exist "freakoutgold.exe" set wrapped=freakoutgold& set unwrapped=fog
if exist "froggycastle.exe" set wrapped=froggycastle& set unwrapped=frc
if exist "fruit smash.exe" set wrapped=fruit smash& set unwrapped=frs
if exist "medieval.exe" goto medfix
if exist "gobingo.exe" set wrapped=gobingo& set unwrapped=gbo
if exist "minigolf.exe" set wrapped=minigolf& set unwrapped=gag
if exist "gemjam.exe" set wrapped=gemjam& set unwrapped=gem
if exist "gravity.exe" set wrapped=gravity& set unwrapped=gry
if exist "gruntz.exe" set wrapped=gruntz& set unwrapped=grz
if exist "highroller.exe" set wrapped=highroller& set unwrapped=hghrl
if exist "infinitecrosswords.exe" set wrapped=infinitecrosswords& set unwrapped=inc
if exist "inspector parker.exe" set wrapped=inspector parker& set unwrapped=parker
if exist "jpuzzle.exe" goto jpuzfix
if exist "lemonade.exe" set wrapped=lemonade& set unwrapped=lmt
if exist "luckystreakpoker.exe" set wrapped=luckystreakpoker& set unwrapped=lsp
if exist "magicinlay.exe" set wrapped=magicinlay& set unwrapped=mgi
if exist "marbleblast.exe" set wrapped=marbleblast& set unwrapped=mbg
if exist "moon_tycoon.exe" set wrapped=moon_tycoon& set unwrapped=mt
if exist "winmm.exe" set wrapped=winmm& set unwrapped=mummy
if exist "ningpo.exe" set wrapped=ningpo& set unwrapped=ning
if exist "winnoah.exe" set wrapped=winnoah& set unwrapped=noahsark
if exist "orbz.exe" set wrapped=orbz& set unwrapped=orb
if exist "pharbor.exe" set wrapped=pharbor& set unwrapped=phz
if exist "picture pyramid.exe" set wrapped=picture pyramid& set unwrapped=PicturePyramid
if exist "pin high.exe" set wrapped=pin high& set unwrapped=Course1
if exist "powerchips.exe" set wrapped=powerchips& set unwrapped=pch
if exist "ptjigsaw.exe" goto pjigfix
if exist "puzzleinlay.exe" set wrapped=puzzleinlay& set unwrapped=ply
if exist "rebound.exe" set wrapped=rebound& set unwrapped=rbd
if exist "rcty.exe" set wrapped=rcty& set unwrapped=rct
if exist "rumblecube.exe" set wrapped=rumblecube& set unwrapped=rbc
if exist "scrabbleblast.exe" set wrapped=scrabbleblast& set unwrapped=sbb
if exist "spell bound.exe" set wrapped=spell bound& set unwrapped=spb
if exist "spelvin.exe" set wrapped=spelvin& set unwrapped=splvn
if exist "sbcollapse.exe" set wrapped=sbcollapse& set unwrapped=sbc
if exist "squareoff.exe" set wrapped=squareoff& set unwrapped=sog
if exist "sportball.exe" set wrapped=sportball& set unwrapped=sbc
if exist "cruncher.exe" set wrapped=cruncher& set unwrapped=ccr
if exist "relapse.exe" set wrapped=relapse& set unwrapped=scii
if exist "blackjack.exe" set wrapped=blackjack& set unwrapped=ghb
if exist "solitaire.exe" set wrapped=solitaire& set unwrapped=sghs
if exist "ghsol2.exe" set wrapped=ghsol2& set unwrapped=sghsv2
if exist "glinx.exe" set wrapped=glinx& set unwrapped=supergl
if exist "supergroovy.exe" set wrapped=supergroovy& set unwrapped=sug
if exist "pileuprelease.exe" set wrapped=pileuprelease& set unwrapped=suppile
if exist "super pool.exe" set wrapped=super pool& set unwrapped=pool
if exist "tapajam.exe" set wrapped=tapajam& set unwrapped=stj
if exist "sveers.exe" set wrapped=sveers& set unwrapped=svr
if exist "swarm.exe" set wrapped=swarm& set unwrapped=swm
if exist "texttwist.exe" set wrapped=texttwist& set unwrapped=ttw
if exist "whatword.exe" set wrapped=whatword& set unwrapped=superww
if exist "winbm.exe" set wrapped=winbm& set unwrapped=bmy
if exist "wwwords.exe" set wrapped=wwwords& set unwrapped=www

:: These 4 below games use the "Sonic The Hedgehog Multi Fix"
:: This only works if the code in core_pre_clean is executed
:: Games are Sonic The Hedgehog, Sonic The Hedgehog 2, Sonic The Hedgehog 3, Sonic Spinball
if exist "sonic.exe" set wrapped=sonic& set unwrapped=snc
if exist "sonic2.exe" set wrapped=sonic2& set unwrapped=snc2
if exist "sonic3.exe" set wrapped=sonic3& set unwrapped=snc3
if exist "sonic_spinball.exe" set wrapped=sonic_spinball& set unwrapped=spn

if exist "tabletennis.exe" set wrapped=tabletennis& set unwrapped=wrp
if exist "tamaleloco.exe" set wrapped=tamaleloco& set unwrapped=tamale
if exist "moopstart.exe" goto moopfix
if exist "thinktanks.exe" set wrapped=thinktanks& set unwrapped=tht
if exist "tiptop.exe" set wrapped=tiptop& set unwrapped=tip
if exist "runandgun.exe" set wrapped=runandgun& set unwrapped=OffChal
if exist "triclops.exe" set wrapped=triclops& set unwrapped=tri
if exist "typer shark.exe" set wrapped=typer shark& set unwrapped=WinTS
if exist "ultimate dominoes.exe" set wrapped=ultimate dominoes& set unwrapped=dmn
if exist "ultraball.exe" set wrapped=ultraball& set unwrapped=utb
if exist "woj.exe" set wrapped=woj& set unwrapped=jericho
if exist "wordharmony.exe" set wrapped=wordharmony& set unwrapped=wdh
if exist "wordjolt.exe" set wrapped=wordjolt& set unwrapped=wdj
if exist "wordup.exe" set wrapped=wordup& set unwrapped=wup
if exist "zuma.exe" set wrapped=zuma& set unwrapped=zma

goto start

::-----------------------------------------------------------------------------------
::Special Situations Here
::-----------------------------------------------------------------------------------

:5sfix
::5 Spots Icon Fix
set wrapped=5_spots& set unwrapped=spo
copy /y fix1.tmp spo.ico
cls
goto start


:airofix
::Aironix Redirect
call demo3a
goto end


:medfix
::Medieval Redirect
call demo3a
goto end

:pjigfix
::Playtonium Jigsaw Fixes ptjigsaw.exe
::if exist "pk\pk0001.cct" set wrapped=ptjigsaw& set unwrapped=
if exist "pk\pk0002.cct" goto pjfix2
if exist "pk\pk0003.cct" goto pjfix2
::if exist "pk\pk0004.cct" set wrapped=ptjigsaw& set unwrapped=
::if exist "pk\pk0005.cct" set wrapped=ptjigsaw& set unwrapped=
if exist "pk\pk0006.cct" goto pjfix2
if exist "pk\pk0007.cct" set wrapped=ptjigsaw& set unwrapped=coa
::if exist "pk\pk0008.cct" set wrapped=ptjigsaw& set unwrapped=
if exist "pk\pk0009.cct" set wrapped=ptjigsaw& set unwrapped=pjg
cls
goto start

:pjfix2
::Redirects
if exist "pk\pk0002.cct" call demo3a
if exist "pk\pk0003.cct" call demo3a
if exist "pk\pk0006.cct" call demo3a
goto end

:jpuzfix
::Jigsaw Puzzle Fixes for jpuzzle.exe

::Jigsaw Puzzle Golden Edition
if exist "puzzles\white faced lady in kyoto.pzl" set wrapped=jpuzzle& set unwrapped=jig

::Jigsaw Puzzle Nature Edition
if exist "Puzzles\tortoise on ground.pzl" set wrapped=jpuzzle& set unwrapped=jna

::Jigsaw Puzzle Platinum Edition
if exist "Puzzles\racing car.pzl" set wrapped=jpuzzle& set unwrapped=jpt
cls
goto start

:moopfix
::The Treasure on Bing Bong Island Fix
ren "mooptreasure.pan" "mooptreasure.exe"
set wrapped=moopstart& set unwrapped=mooptreasure
call "core_shortcut_demo3.cmd"
goto end

::-----------------------------------------------------------------------------------
::END Special Situations
::-----------------------------------------------------------------------------------

:start

call "core_patch_demo3.cmd"
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Demo 3 unWrapper +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

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
	echo [demo3 : finished]
	pause>nul
)

::exit
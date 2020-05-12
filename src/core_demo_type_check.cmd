@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Demo Type Checker +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

::-----------------------------------------------------------------------------------
:: Demo Type 1 - r1a games
::-----------------------------------------------------------------------------------

::if exist "" call demo1
::if exist "" call demo1a

:: Puzzler World 2 Fix
if exist "PuzzlerWorld2.exe" call demo1

::-----------------------------------------------------------------------------------
:: Demo Type 2 - r1a games that do not have a _r1a suffix
::-----------------------------------------------------------------------------------

:: Super Jigsaw Puzzle Fix
if exist "puzzles\greatart.jlnk" call demo2
if exist "jigsaw.exe" call demo2

if exist "alchemy.exe" call demo2
if exist "avalanche.exe" call demo2
if exist "big kahuna reef.exe" call demo2
if exist "big kahuna words.exe" call demo2
if exist "windm.exe" call demo2
if exist "digbysdonuts.exe" call demo2
if exist "feedingfrenzy.exe" call demo2
if exist "hamsterball.exe" call demo2
if exist "magicball.exe" call demo2
if exist "word challenger.exe" call demo2

::-----------------------------------------------------------------------------------
:: Demo Type 3 - games that must be launched by clicking the PLAY NOW buttons in the
:: RealArcade software
::-----------------------------------------------------------------------------------

::if exist ".exe" call demo3
if exist "puzzles\medley.jlnk" call demo3
if exist "5_spots.exe" call demo3
if exist "5spots2.exe" call demo3
if exist "aironix.exe" call demo3
if exist "airstrike3d.exe" call demo3
if exist "AlienSky.exe" call demo3
if exist "alphaqueue.exe" call demo3
if exist "antwar.exe" call demo3
if exist "arcade_r1a.exe" call demo3
if exist "Astro.exe" call demo3
if exist "Atomaders.exe" call demo3
if exist "atomicpongling.exe" call demo3
if exist "atomica.exe" call demo3
if exist "axisplay.exe" call demo3
if exist "blackjack.exe" call demo3
if exist "bookworm.exe" call demo3
if exist "bos_creatureattack.exe" call demo3
if exist "carnivale.exe" call demo3a
if exist "chainz.exe" call demo3
if exist "combo chaos.exe" call demo3
if exist "crimson.exe" call demo3
if exist "cruncher.exe" call demo3
if exist "csolitaire.exe" call demo3
if exist "congocube.exe" call demo3
if exist "cubisgold.exe" call demo3
if exist "cycles.exe" call demo3
if exist "cyclone.exe" call demo3
if exist "deepseatycoon.exe" call demo3
if exist "devils.exe" call demo3
::if exist "diamondmine.exe" call demo3a
if exist "ds.exe" call demo3
if exist "dungeonscroll.exe" call demo3
if exist "electric.exe" call demo3
if exist "equilibria.exe" call demo3
if exist "fivecardfrenzy.exe" call demo3
if exist "flip wit.exe" call demo3
if exist "freakoutgold.exe" call demo3
if exist "froggycastle.exe" call demo3
if exist "fruit smash.exe" call demo3
if exist "gemjam.exe" call demo3
if exist "gobingo.exe" call demo3
if exist "ghsol2.exe" call demo3
if exist "glinx.exe" call demo3
if exist "gravity.exe" call demo3
if exist "gruntz.exe" call demo3
if exist "highroller.exe" call demo3
if exist "infinitecrosswords.exe" call demo3
if exist "inspector parker.exe" call demo3
if exist "inspector_parker.exe" call demo3
if exist "jpuzzle.exe" call demo3
if exist "lemonade.exe" call demo3
if exist "luckystreakpoker.exe" call demo3
if exist "magicinlay.exe" call demo3
if exist "marbleblast.exe" call demo3
if exist "medieval.exe" call demo3
if exist "minigolf.exe" call demo3
if exist "monkey.exe" call demo3a
if exist "moon_tycoon.exe" call demo3
if exist "moopstart.exe" call demo3
if exist "ningpo.exe" call demo3
if exist "orbz.exe" call demo3
if exist "pharbor.exe" call demo3
if exist "picture pyramid.exe" call demo3
if exist "pileuprelease.exe" call demo3
if exist "pin high.exe" call demo3
if exist "powerchips.exe" call demo3
if exist "ptjigsaw.exe" call demo3
if exist "puzzleinlay.exe" call demo3
if exist "rcty.exe" call demo3
if exist "rebound.exe" call demo3
if exist "relapse.exe" call demo3
if exist "rumblecube.exe" call demo3
if exist "runandgun.exe" call demo3
if exist "sbcollapse.exe" call demo3
if exist "scrabbleblast.exe" call demo3
if exist "squareoff.exe" call demo3
if exist "solitaire.exe" call demo3
if exist "sonic.exe" call demo3
if exist "sonic2.exe" call demo3
if exist "sonic3.exe" call demo3
if exist "sonic_spinball.exe" call demo3
if exist "spell bound.exe" call demo3
if exist "spelvin.exe" call demo3
if exist "sportball.exe" call demo3
if exist "supergroovy.exe" call demo3
if exist "super pool.exe" call demo3
if exist "sveers.exe" call demo3
if exist "swarm.exe" call demo3
if exist "tabletennis.exe" call demo3
if exist "tamaleloco.exe" call demo3
if exist "tapajam.exe" call demo3
if exist "texttwist.exe" call demo3
if exist "thinktanks.exe" call demo3
if exist "tiptop.exe" call demo3
if exist "triclops.exe" call demo3
if exist "typer shark.exe" call demo3
if exist "ultimate dominoes.exe" call demo3
if exist "ultraball.exe" call demo3
if exist "whatword.exe" call demo3
if exist "winbm.exe" call demo3
if exist "winmm.exe" call demo3
if exist "winnoah.exe" call demo3
if exist "woj.exe" call demo3
if exist "wordharmony.exe" call demo3
if exist "wordjolt.exe" call demo3
if exist "wordup.exe" call demo3
if exist "wwwords.exe" call demo3
if exist "zuma.exe" call demo3

::-----------------------------------------------------------------------------------
:: Demo Type 4 - games that must be launched by clicking the PLAY NOW buttons in the
:: RealArcade software. These games only differ from Type 3 games by a registration
:: box in the popup window to launch.
::-----------------------------------------------------------------------------------

if exist "thrillride.exe" call demo4
if exist "contraptions.exe" call demo4
if exist "dynomite.exe" call demo4
if exist "fitznik.exe" call demo4
if exist "gutterball3d.exe" call demo4
if exist "hole in one slots.exe" call demo4
if exist "hoyleboard.exe" call demo4
if exist "hoylecard.exe" call demo4
if exist "kyodai.exe" call demo4
if exist "qbz_real.exe" call demo4
if exist "acenet_client_release.exe" call demo4
if exist "bounceout.exe" call demo4
if exist "collapse.exe" call demo4
if exist "gemdrop.exe" call demo4
if exist "mahjong.exe" call demo4
if exist "nisqually.exe" call demo4
if exist "penguin puzzle.exe" call demo4
if exist "mahjongg towers.exe" call demo4
if exist "primalprey.exe" call demo4

::-----------------------------------------------------------------------------------
:: Demo Type 4a - games that must be launched by clicking the PLAY NOW buttons in the
:: RealArcade software. These games only differ from Type 4 games by a having a 
:: different title at the top named "Registration".
::-----------------------------------------------------------------------------------

if exist "abysma_win.exe" call demo4a

::-----------------------------------------------------------------------------------
:: Demo Type 5 - Real Demos, or EXE requires modification
::-----------------------------------------------------------------------------------

if exist "derbydemo.exe" call demo5
if exist "fluxle.exe" call demo5
if exist "geneforge.exe" call demo5
if exist "k2pc.exe" call demo5
if exist "goodsol01d.exe" call demo5

::-----------------------------------------------------------------------------------
:: Demo Type 6 - No Wrapper Protection
::-----------------------------------------------------------------------------------

if exist "popndrop.exe" call demo6
if exist "wordmojogold.exe" call demo6


::-----------------------------------------------------------------------------------
:: Demo Type - Gamehouse - v2.1 EXE Installs (added 20131107)
::-----------------------------------------------------------------------------------

::if exist "" call demoGH

::if %ghFlag%==1 call demoGH
if exist "GameuxInstallHelper.dll" call demoGH
::if exist "GDF.dll" call demoGH
::if exist "GDFUninstall.exe" call demoGH


:end
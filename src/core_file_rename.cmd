@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Filename Fixer +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_file_rename : loaded]
	pause>nul
)


color 0e

::-----------------------------------------------------------------------------------
:: Games That Use periods "." won't make a proper "set" command
::-----------------------------------------------------------------------------------

::Agatha Christie 4.50 from Paddington
if exist "4_50_from_paddington_r1a.exe" set GameName=Agatha Christie 4.50 from Paddington
if exist "4_50_from_paddington.exe" set GameName=Agatha Christie 4.50 from Paddington

::Dr. Wise - Medical Mysteries
if exist "drwise_r1a.exe" set GameName=Dr. Wise - Medical Mysteries
if exist "DrWise.exe" set GameName=Dr. Wise - Medical Mysteries

::Dr. Despicable's Dastardly Deeds
if exist "dr despicable's dastardly deeds_r1a.exe" set GameName=Dr. Despicable's Dastardly Deeds
if exist "Dr Despicable's Dastardly Deeds.exe" set GameName=Dr. Despicable's Dastardly Deeds

::Dr. Lynch - Grave Secrets
if exist "gravesecrets_r1a.exe" set GameName=Dr. Lynch - Grave Secrets
if exist "gravesecrets.exe" set GameName=Dr. Lynch - Grave Secrets
if exist "gravesecrets.ico" set GameName=Dr. Lynch - Grave Secrets

::Mystery P.I.(TM) - Stolen in San Francisco
if exist "mysterypisanfrancisco_r1a.exe" set GameName=Mystery P.I.(TM) - Stolen in San Francisco
if exist "MysteryPISanFrancisco.exe" set GameName=Mystery P.I.(TM) - Stolen in San Francisco

::The Mysterious Case of Dr. Jekyll and Mr. Hyde
if exist "jekyllandhydepc_r1a.exe" set GameName=The Mysterious Case of Dr. Jekyll and Mr. Hyde
if exist "JekyllAndHydePC.exe" set GameName=The Mysterious Case of Dr. Jekyll and Mr. Hyde

::Plants vs. Zombies(TM)
if exist "plantsvszombies_r1a.exe" set GameName=Plants vs. Zombies(TM)
if exist "PlantsVsZombies.exe" set GameName=Plants vs. Zombies(TM)


::-----------------------------------------------------------------------------------
:: THE MULTIPLE EXE FIX WAS MADE AUTOMATIC FOR V4.8.3 RELEASE AND NO LONGER
:: REQUIRES UPDATING!!!
::-----------------------------------------------------------------------------------
::-----------------------------------------------------------------------------------
::Files that are not critical for launch (rename back after unpacking)

::Games That Have more than one launch EXE or multiple game packs
::if exist ".exe" ren ".exe" ".hold"
::-----------------------------------------------------------------------------------

::Unsolved Mystery Club(TM) - Amelia Earhart(TM)
if exist "w9xpopen.exe" ren "w9xpopen.exe" "w9xpopen.hold"

::NatGeo Games Earth Day Pack
if exist "earth day_r1a.exe" ren "ecorescue.exe" "ecorescue.hold"
if exist "earth day_r1a.exe" ren "planitgreen.exe" "planitgreen.hold"

::Deadtime Stories
if exist "resource_clear.exe" ren "resource_clear.exe" "resource_clear.hold"
if exist "resource_unpack.exe" ren "resource_unpack.exe" "resource_unpack.hold"

::Buried In Time
if exist "cleanup.exe" ren "cleanup.exe" "cleanup.hold"
if exist "unpack.exe" ren "unpack.exe" "unpack.hold"

::Star Crossed Love
if exist "w9xpopen.exe" ren "w9xpopen.exe" "w9xpopen.hold"

::The Tarot's Misfortune
if exist "level_editor.exe" ren "level_editor.exe" "level_editor.hold"

::Finding Hope
if exist "settings.exe" ren "settings.exe" "settings.hold"

::Goddess Chronicles
if exist "goddess_debug_dll.exe" ren "goddess_debug_dll.exe" "goddess_debug_dll.hold"


::-----------------------------------------------------------------------------------
:: Games That Use the ampersand "&" won't make a proper "set" command
::-----------------------------------------------------------------------------------

:: 20110801
:: THIS NEEDS TO BE ADDRESSED TO HANDLE ALL GAME PATHS THAT USE THE "&" CHARACTER

set ampfix=0

::Garters & Ghouls(TM)
if exist "gg_r1a.rar" set ampfix=1
if exist "gg_r1a.exe" set ampfix=1
if exist "GG.exe" set ampfix=1

::Saints & Sinners Bingo
if exist "ssbingo_r1a.rar" set ampfix=2
if exist "ssbingo_r1a.exe" set ampfix=2
if exist "ssbingo.exe" set ampfix=2


:: ampfix for Garters & Ghouls(TM)
if %ampfix%==1 set GameName=Garters &^ Ghouls(TM)

:: ampfix for Saints & Sinners Bingo
if %ampfix%==2 set GameName=Saints &^ Sinners Bingo


:end

if %testmode%==1 (
	echo [core_file_rename : finished]
	pause>nul
)

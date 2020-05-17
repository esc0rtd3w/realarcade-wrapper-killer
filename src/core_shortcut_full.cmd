@echo off

title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Shortcut Maker +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_shortcut_full : loaded]
	pause>nul
)


::-----------------------------------------------------------------------------------
:: PDF Fix (Applies to Strategy Guide installs) (Bypasses normal shortcut)
::-----------------------------------------------------------------------------------

if %pdffix%==1 (
call "core_pdf_fix.cmd"
goto end3
)


::-----------------------------------------------------------------------------------
::Checking for a 0.exe or a screwed up unwrapped variable
::-----------------------------------------------------------------------------------

set unpackfail=0

if exist *.exe goto gourexe

%hide% %wdomain%

color 0c
cls
echo ----------------------------------------------------------------------------
echo There was a problem setting the UNWRAPPED variable.
echo ----------------------------------------------------------------------------
echo.
echo ----------------------------------------------------------------------------
echo The "RacNotRunning" patch has most likely failed!
echo.
echo This is usually caused by the game using unknown offsets to bypass RA.
echo ----------------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo We are sorry, but this game must be launched and unpacked manually!
echo.
echo.
echo.

set unpackfail=1

%talk% "The game has failed to unpack properly. Now switching to manual unpacking mode. Please wait." -2

goto end2

:gourexe

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
echo Extracting Full Version EXE: Success!
echo.
echo Cleaning Up All Junk Files: Success!
echo.
echo Creating Desktop Shortcut: Please Wait....
echo.
echo.
echo.

::-----------------------------------------------------------------------------------
::Setting Unwrapped Game EXE name (must delete all other EXEs prior)
::-----------------------------------------------------------------------------------

:: Force the deletion of "delete.exe" for making proper shortcuts. Added 11-13-2010
%waitfor% 3000

:: Fixed 01-30-2011
%kill% RNArcade.exe >nul
%kill% RGSinst.exe >nul
%kill% delete.exe >nul

del /q /f "delete.exe"
del /q /f "%wrapped%.exe"
del /q /f "wrapper.log"
del /q /f "status.js"

cls

:: Added 01-07-2011
:: Closes the Wrapper Application window if it hangs during game extraction
%kill% "WerFault.exe"

attrib -h *.*

for %%* in (*.exe) do set unwrapped=%%~n*


::-----------------------------------------------------------------------------------
::Check For Fixes
::-----------------------------------------------------------------------------------

if exist "%cd%\dropheads.exe" goto dhfix
if exist "%cd%\YLPack.exe" goto youdafix
if exist "%cd%\Earth Day.exe" goto natgeofix
if exist "%cd%\DeadtimeStories.exe" goto deadfix
if exist "%cd%\amelia.exe" goto ameliafix
if exist "%cd%\Fishdom Double Pack.exe" goto 2fishfix
if exist "%cd%\BuriedInTime.exe" goto bitfix
if exist "%cd%\FarmFrenzyAndVirtualFarm.exe" goto farmfix
if exist "%cd%\Star Crossed Love.exe" goto starfix
if exist "%cd%\tarot_gold_branding.exe" goto tarotfix
if exist "%cd%\finding hope.exe" goto hopefix
if exist "%cd%\Best of Match-3 Pack.exe" goto dp480fix
if exist "%cd%\My Games\1\gourmania.exe" goto dpgmefix
if exist "%cd%\My Games\2\farmfrenzypizzaparty.exe" goto dpfarmfix
if exist "%cd%\goddess.exe" goto goddessfix
if exist "%cd%\thetreasuresofmontezumabundle.exe" goto dpmzfix
if exist "%cd%\royaltrouble.exe" goto royalfix
if exist "%cd%\BookwormAdventures.exe" goto bookwafix
if exist "%cd%\PuzzlerWorld2.exe" goto pw2fix
if exist "%cd%\AmusementWorld.exe" goto awfix

goto scstart

:awfix
::-----------------------------------------------------------------------------------
:: Amusement World Fix
::-----------------------------------------------------------------------------------

nircmd shortcut "%cd%\hrgwrapper.exe" "~$folder.desktop$" "Amusement World" "" "%cd%\AmusementWorld.exe"

nircmd shortcut "%cd%\hrgwrapper.exe" "%rashort%" "Amusement World" "" "%cd%\AmusementWorld.exe"
cls
goto end

:bookwafix
::-----------------------------------------------------------------------------------
:: Bookworm Adventures Fix
::-----------------------------------------------------------------------------------

nircmd shortcut "%cd%\BookwormAdventures.exe" "~$folder.desktop$" "Bookworm Adventures"

nircmd shortcut "%cd%\BookwormAdventures.exe" "%rashort%" "Bookworm Adventures"
cls
goto end

:dhfix
::-----------------------------------------------------------------------------------
:: Dropheads Icon Fix
::copy /y fix2.lnk "C:\Documents and Settings\All Users\Desktop\Dropheads.lnk"
::-----------------------------------------------------------------------------------

nircmd shortcut "%cd%\%unwrapped%.exe" "~$folder.desktop$" "%GameName%" "" "%cd%\dropheads.ico"
nircmd shortcut "%cd%\%unwrapped%.exe" "%rashort%" "%GameName%" "" "%cd%\dropheads.ico"
cls
goto end

:youdafix
::-----------------------------------------------------------------------------------
:: Youda Legend Pack Fix (makes 2 shortcuts for the 2 different games)
::-----------------------------------------------------------------------------------

nircmd shortcut "%cd%\YLPack\YLAmsterdam\ylamsterdamdiamond.exe" "~$folder.desktop$" "Youda Legend - The Curse of The Amsterdam Diamond"
nircmd shortcut "%cd%\YLPack\YLGoldenBird\ylgoldenbird.exe" "~$folder.desktop$" "Youda Legend - The Golden Bird of Paradise"

nircmd shortcut "%cd%\YLPack\YLAmsterdam\ylamsterdamdiamond.exe" "%rashort%" "Youda Legend - The Curse of The Amsterdam Diamond"
nircmd shortcut "%cd%\YLPack\YLGoldenBird\ylgoldenbird.exe" "%rashort%" "Youda Legend - The Golden Bird of Paradise"
cls
goto end

:natgeofix
::-----------------------------------------------------------------------------------
:: Restoring HELD names back to original
::-----------------------------------------------------------------------------------

ren "ecorescue.hold" "ecorescue.exe"
ren "planitgreen.hold" "planitgreen.exe"

::-----------------------------------------------------------------------------------
:: NatGeo Games Earth Day Pack (makes 2 shortcuts for the 2 different games)
::-----------------------------------------------------------------------------------

nircmd shortcut "%cd%\ecorescue.exe" "~$folder.desktop$" "NatGeo EcoRescue -  Rivers"
nircmd shortcut "%cd%\planitgreen.exe" "~$folder.desktop$" "NatGeo Plan It Green"

nircmd shortcut "%cd%\ecorescue.exe" "%rashort%" "NatGeo EcoRescue -  Rivers"
nircmd shortcut "%cd%\planitgreen.exe" "%rashort%" "NatGeo Plan It Green"
cls
goto end


:deadfix
::-----------------------------------------------------------------------------------
:: Deadtime Stories
:: Restoring HELD names back to original
::-----------------------------------------------------------------------------------

ren "resource_clear.hold" "resource_clear.exe"
ren "resource_unpack.hold" "resource_unpack.exe"

cls
echo Unpacking Resources. Please Wait....
echo.
"%cd%\resource_unpack.exe"
%waitfor% 5000

nircmd shortcut "%cd%\DeadtimeStories.exe" "~$folder.desktop$" "Deadtime Stories"
nircmd shortcut "%cd%\DeadtimeStories.exe" "%rashort%" "Deadtime Stories"

goto end


:ameliafix
::-----------------------------------------------------------------------------------
:: Unsolved Mystery Club(TM) - Amelia Earhart(TM)
:: Restoring HELD names back to original
::-----------------------------------------------------------------------------------

ren "w9xpopen.hold" "w9xpopen.exe"

::-----------------------------------------------------------------------------------
::Creates regular shortcuts, NO special method needed
::-----------------------------------------------------------------------------------

goto scstart


:2fishfix
::-----------------------------------------------------------------------------------
:: Double Pack Fishdom(TM) and Fishdom H2O - Hidden Odyssey(TM) (makes 2
:: shortcuts for the 2 different games)
::-----------------------------------------------------------------------------------

nircmd shortcut "%cd%\game1\fishdom.exe" "~$folder.desktop$" "Fishdom"
nircmd shortcut "%cd%\game2\fishdom h2o.exe" "~$folder.desktop$" "Fishdom H2O"

nircmd shortcut "%cd%\game1\fishdom.exe" "%rashort%" "Fishdom"
nircmd shortcut "%cd%\game2\fishdom h2o.exe" "%rashort%" "Fishdom H2O"
cls
goto end


:bitfix
::-----------------------------------------------------------------------------------
:: Buried In Time
:: Restoring HELD names back to original
::-----------------------------------------------------------------------------------

ren "cleanup.hold" "cleanup.exe"
ren "unpack.hold" "unpack.exe"

::-----------------------------------------------------------------------------------
::NOT NEEDED BECAUSE UPON FIRST LAUNCH THE RESOURCES ARE UNPACKED!
::-----------------------------------------------------------------------------------

cls
::echo Unpacking Resources. Please Wait....
::echo.
::"%cd%\unpack.exe"
%waitfor% 5000

nircmd shortcut "%cd%\BuriedInTime.exe" "~$folder.desktop$" "Buried In Time"
nircmd shortcut "%cd%\BuriedInTime.exe" "%rashort%" "Buried In Time"

goto end


:farmfix
::-----------------------------------------------------------------------------------
:: Double Pack Farm Frenzy and Virtual Farm (makes 2 shortcuts for the 2
:: different games)
::-----------------------------------------------------------------------------------

nircmd shortcut "%cd%\My Games\1\farm.exe" "~$folder.desktop$" "Farm Frenzy"
nircmd shortcut "%cd%\My Games\2\virtualfarm.exe" "~$folder.desktop$" "Virtual Farm"

nircmd shortcut "%cd%\My Games\1\farm.exe" "%rashort%" "Farm Frenzy"
nircmd shortcut "%cd%\My Games\2\virtualfarm.exe" "%rashort%" "Virtual Farm"

goto end


:starfix
::-----------------------------------------------------------------------------------
:: Star Crossed Love
:: Restoring HELD names back to original
::-----------------------------------------------------------------------------------

ren "w9xpopen.hold" "w9xpopen.exe"

cls
nircmd shortcut "%cd%\Star Crossed Love.exe" "~$folder.desktop$" "Star Crossed Love"
nircmd shortcut "%cd%\Star Crossed Love.exe" "%rashort%" "Star Crossed Love"

goto end


:tarotfix
::-----------------------------------------------------------------------------------
:: The Tarot's Misfortune
:: Restoring HELD names back to original
::-----------------------------------------------------------------------------------

ren "level_editor.hold" "level_editor.exe"

cls
nircmd shortcut "%cd%\tarot_gold_branding.exe" "~$folder.desktop$" "The Tarot's Misfortune"
nircmd shortcut "%cd%\tarot_gold_branding.exe" "%rashort%" "The Tarot's Misfortune"

goto end


:hopefix
::-----------------------------------------------------------------------------------
:: Finding Hope
:: Restoring HELD names back to original
::-----------------------------------------------------------------------------------

ren "settings.hold" "settings.exe"

cls
nircmd shortcut "%cd%\Finding Hope.exe" "~$folder.desktop$" "Finding Hope"
nircmd shortcut "%cd%\Finding Hope.exe" "%rashort%" "Finding Hope"

goto end


:dp480fix
::-----------------------------------------------------------------------------------
:: Double Pack 4 Elements(TM) and Around the World in 80 Days(TM) Fix (makes 2
:: shortcuts for the 2 different games)
::-----------------------------------------------------------------------------------

nircmd shortcut "%cd%\game1\4 elements.exe" "~$folder.desktop$" "4 Elements"
nircmd shortcut "%cd%\game2\around the world in 80 days.exe" "~$folder.desktop$" "Around The World In 80 Days"

nircmd shortcut "%cd%\game1\4 elements.exe" "%rashort%" "4 Elements"
nircmd shortcut "%cd%\game2\around the world in 80 days.exe" "%rashort%" "Around The World In 80 Days"
cls
goto end


:dpgmefix
::-----------------------------------------------------------------------------------
:: Double Pack Gourmania and Magic Encyclopedia (makes 2 shortcuts for the 2
:: different games)
::-----------------------------------------------------------------------------------

nircmd shortcut "%cd%\My Games\1\gourmania.exe" "~$folder.desktop$" "Gourmania"
nircmd shortcut "%cd%\My Games\2\magic.exe" "~$folder.desktop$" "Magic Encyclopedia"

nircmd shortcut "%cd%\My Games\1\gourmania.exe" "%rashort%" "Gourmania"
nircmd shortcut "%cd%\My Games\2\magic.exe" "%rashort%" "Magic Encyclopedia"

goto end


:goddessfix
::-----------------------------------------------------------------------------------
:: Goddess Chronicles
:: Restoring HELD names back to original
::-----------------------------------------------------------------------------------

ren "goddess_debug_dll.hold" "goddess_debug_dll.exe"

nircmd shortcut "%cd%\goddess.exe" "~$folder.desktop$" "Goddess Chronicles"
nircmd shortcut "%cd%\goddess.exe" "%rashort%" "Goddess Chronicles"

goto end


:dpfarmfix
::-----------------------------------------------------------------------------------
:: Double Pack Farm Frenzy 2 and Farm Frenzy - Pizza (makes 2 shortcuts for the 2
:: different games)
::-----------------------------------------------------------------------------------

nircmd shortcut "%cd%\My Games\1\farm2.exe" "~$folder.desktop$" "Farm Frenzy 2"
nircmd shortcut "%cd%\My Games\2\farmfrenzypizzaparty.exe" "~$folder.desktop$" "Farm Frenzy - Pizza Party"

nircmd shortcut "%cd%\My Games\1\farm2.exe" "%rashort%" "Farm Frenzy 2"
nircmd shortcut "%cd%\My Games\2\farmfrenzypizzaparty.exe" "%rashort%" "Farm Frenzy - Pizza Party"

goto end


:dpmzfix
::-----------------------------------------------------------------------------------
:: Double Pack Treasures of Montezuma (makes 2 shortcuts for the 2 different games)
::-----------------------------------------------------------------------------------

nircmd shortcut "%cd%\My Games\1\thetreasuresofmontezuma.exe" "~$folder.desktop$" "The Treasures of Montezuma"
nircmd shortcut "%cd%\My Games\2\treasuresofmontezuma2.exe" "~$folder.desktop$" "The Treasures of Montezuma 2"

nircmd shortcut "%cd%\My Games\1\thetreasuresofmontezuma.exe" "%rashort%" "The Treasures of Montezuma"
nircmd shortcut "%cd%\My Games\2\treasuresofmontezuma2.exe" "%rashort%" "The Treasures of Montezuma 2"

goto end


:royalfix
::-----------------------------------------------------------------------------------
:: Royal Trouble Icon Fix
::copy /y fix3.lnk "C:\Documents and Settings\All Users\Desktop\Royal Trouble.lnk"
::-----------------------------------------------------------------------------------

nircmd shortcut "%cd%\%unwrapped%.exe" "~$folder.desktop$" "%GameName%" "" "%cd%\icon_gfx.ico"
nircmd shortcut "%cd%\%unwrapped%.exe" "%rashort%" "%GameName%" "" "%cd%\icon_gfx.ico"
cls
goto end


:pw2fix
::-----------------------------------------------------------------------------------
:: Puzzler World 2 Fix
::-----------------------------------------------------------------------------------

call "core_handler.cmd"

nircmd shortcut "%cd%\Puzzler World 2.exe" "~$folder.desktop$" "Puzzler World 2"

nircmd shortcut "%cd%\Puzzler World 2.exe" "%rashort%" "Puzzler World 2"

del /q /f "%cd%\PuzzlerWorld2.exe"

cls
goto end



:scstart
:: Added 01-07-2011
:: Closes the Wrapper Application window if it hangs during game extraction
taskkill /f /im "WerFault.exe"

attrib -h *.*

:: Added 20110818
:: Fix for games that need manual unpacking not getting redirected to "DemoM"
if not exist *.exe set unpackfail=1

::-----------------------------------------------------------------------------------
:: Generic RESTORE HELD FILENAMES FIX - Added 20100928
::-----------------------------------------------------------------------------------

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
echo Extracting Full Version EXE: Success!
echo.
echo Cleaning Up All Junk Files: Success!
echo.
echo Creating Desktop Shortcut: Please Wait....
echo.
echo.
echo.

if exist "*.hold" ren "*.hold" "*.exe"

::-----------------------------------------------------------------------------------
:: Force CMD Window to be on top
::-----------------------------------------------------------------------------------

%show% "[...cRypTiCwaRe 2o2o...]"

::-----------------------------------------------------------------------------------
:: Create shortcuts based on variables
::-----------------------------------------------------------------------------------

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
echo Extracting Full Version EXE: Success!
echo.
echo Cleaning Up All Junk Files: Success!
echo.
echo Creating Desktop Shortcut: Please Wait....
echo.
echo.
echo.

nircmd shortcut "%cd%\%unwrapped%.exe" "~$folder.desktop$" "%GameName%"
nircmd shortcut "%cd%\%unwrapped%.exe" "%rashort%" "%GameName%"

:end

::-----------------------------------------------------------------------------------
:: Generic RESTORE HELD FILENAMES FIX - Added 20100928
::-----------------------------------------------------------------------------------

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
echo Extracting Full Version EXE: Success!
echo.
echo Cleaning Up All Junk Files: Success!
echo.
echo Creating Desktop Shortcut: Success!
echo.
echo.
echo.

if exist "*.hold" ren "*.hold" "*.exe"

::-----------------------------------------------------------------------------------
:: Check for additional flags set
::-----------------------------------------------------------------------------------

if %cheats%==Yes call "core_cheats.cmd"
if %mods%==Yes call "core_mods.cmd"
if %dlc%==Yes call "core_dlc.cmd"
if %multicmp%==Yes call "core_multicmp.cmd"

::-----------------------------------------------------------------------------------
::Attempting to kill unwrapped EXE game process
::-----------------------------------------------------------------------------------

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
echo Extracting Full Version EXE: Success!
echo.
echo Cleaning Up All Junk Files: Success!
echo.
echo Creating Desktop Shortcut: Success!
echo.
echo Terminating Wrapped EXE: Please Wait....
echo.
echo.
echo.

%kill% "%unwrapped%.exe" >nul

::-----------------------------------------------------------------------------------
::Attempting to kill RNArcade process
::-----------------------------------------------------------------------------------

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
echo Extracting Full Version EXE: Success!
echo.
echo Cleaning Up All Junk Files: Success!
echo.
echo Creating Desktop Shortcut: Success!
echo.
echo Terminating Wrapped EXE: Please Wait....
echo.
echo.
echo.

::%kill% RNArcade.exe >nul

::-----------------------------------------------------------------------------------
::Renaming Original Wrapped EXE's back, if applicable
::-----------------------------------------------------------------------------------

::if renexe==1 set wrapped=%origexe%

::-----------------------------------------------------------------------------------
::Checking Debug Status Flag
::-----------------------------------------------------------------------------------

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
echo Extracting Full Version EXE: Success!
echo.
echo Cleaning Up All Junk Files: Success!
echo.
echo Creating Desktop Shortcut: Success!
echo.
echo Terminating Wrapped EXE: Success!
echo.
echo.
echo.

if %quw%==0 %waitfor% 3000

if %debug%==1 goto debugok

goto end2

:debugok
::-----------------------------------------------------------------------------------
:: Debug Output (USED FOR TESTING ONLY!)
::-----------------------------------------------------------------------------------

cls
call "core_debug.cmd"

goto end2


:end2


::Cleaning temp INI files for patches and cheats
call "core_clean_ini.cmd"

::Added autolaunch select on 11-13-2010
if %unpackfail%==0 call "core_autolaunch.cmd"
if %unpackfail%==1 call "demoM.cmd"

:end3

if %testmode%==1 (
	echo [core_shortcut_full : finished]
	pause>nul
)

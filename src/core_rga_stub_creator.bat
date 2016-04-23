@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ RGA Stub Creator +-^~`+-.)     [...cRypTiCwaRe 2o13...]


color 0e

:start

goto v31

::goto end


:v26
::----------------------------------------------------------------------------------------
:: This will generate RGA stub EXE files according to name, content id, and tracking id.
::
:: gpatch will need to be used to patch the trailing bytes of each stub.
::----------------------------------------------------------------------------------------

:: Content ID - Starting at offset: 1389328 [0x00153310] 0x10 bytes (16 bytes long)

:: Tracking ID - Starting at offset: 1389360 [0x00153330] 0x06 bytes (6 bytes long)

:: Update 20111116 - Contect ID may NOT be needed, below is the example game stub.
:: Its default Content ID is "00000000000000000000000000000000"
:: Sample Game: GameHouse-Installer_am-supertexttwist_gamehouse_.exe

:: Somewhere in mid-late 2011, the RGA stub was updated again. This has been taken care of
:: by versioning the stubs, starting from the first one we discovered for v3 RGA files.

:: Also sometime in mid-late 2011, the bytes increased for the Tracking ID from 6 bytes
:: to 7 bytes (123456 --> 1234567).

:: UPDATE 20111118: The version number is solely based off a file that is contained 
:: called "bin\InstallerDlg.dll". The base stub will follow this version number for
:: a number of reasons, mainly that it is an exploitable file. The stub is the
:: "GameHouse-Installer_am-*_gamehouse_" file that you download from GameHouse renamed
:: to rgastub.v.x.x.x.xxx. Example: InstallerDlg.dll -> v2.6.0.445 -> rgastub.v.2.6.0.445.bin


set bin=rgastub.bin
set pre=GameHouse-Installer_am-
set post=_gamehouse_.exe

goto createStub


:v31
set bin=rgastub.bin
set pre=Installer_
set post=.exe


goto createStub



:createStub
:: Ask for Game Name (all lowercase and NO spaces)

cls
echo.
echo ---------------------------------------------------------------------
echo Example: 
echo.
echo Folder Name: Zombie Bowl-O-Rama
echo.
echo Internal Filename: zombiebowlorama
echo ---------------------------------------------------------------------
echo.
echo ---------------------------------------------------------------------
echo If a game has a trademark or registered trademark, you must include
echo the "r" or "tm" letters at the end of the filename.
echo.
echo Examples: 
echo.
echo Bejeweled: bejeweledr
echo.
echo Kuros: kurostm
echo ---------------------------------------------------------------------
echo.
echo.
echo Enter Internal Game Stub Name:
echo.

set /p gamestring=


copy "rgastub.bin" "%pre%%gamestring%%post%"

set stub=%pre%%gamestring%%post%

cls
echo New Stub Created:  
echo.
echo %stub%
echo.
echo.
echo Press any key to continue....

pause>nul

goto start

goto end



:end




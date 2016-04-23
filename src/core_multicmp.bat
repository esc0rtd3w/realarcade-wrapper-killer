@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Multi-Game Merger +-^~`+-.)     [...cRypTiCwaRe 2o13...]


color 0e

::-----------------------------------------------------------------------------------
:: Games are to be sorted alphabetically.
:: Use %unwrapped% variable for label name
::-----------------------------------------------------------------------------------

cls
echo This game is Multi-Compatible with one or more other games.
echo.
echo Would you like to view more information? [Y/N]

if %os%==XP choice /c:yn /t:n,30 /n
if %os%==VISTA choice /c yn /d n /n /t 30
if errorlevel 2 goto end
goto multstart

::-----------------------------------------------------------------------------------
::Start Multi-Compatible Games
::-----------------------------------------------------------------------------------

:multstart

goto %unwrapped%
goto end

:5s2
cls
echo ----------------------------
echo Multi-Compatible Information
echo ----------------------------
echo.
echo Integration With The First 5 Spots Game
echo.
echo.
echo.
echo.
echo Would you like to set the "allow activation" flag now? [Y/N]
echo.
echo.

if %os%==XP choice /c:yn /t:y,30 /n
if %os%==VISTA choice /c yn /d y /n /t 30
if errorlevel 2 goto end
goto doallow

:doallow
nircmd regsetval sz "%rb2%\5spots\1" "InstallPath" ".\\\\" 
goto end



:NJigsaw
::-----------------------------------------------------------------------------------
::Checking for installed Nick Jr Puzzles
::-----------------------------------------------------------------------------------

set blue=0
set dora=0
set odd=0
set neutron=0
set spongebob=0

set pathblue=C:\My Games\Super Jigsaw Blue's Clues
set pathdora=C:\My Games\Super Jigsaw Dora the Explorer
set pathodd=C:\My Games\Super Jigsaw Fairly OddParents
set pathneutron=C:\My Games\Super Jigsaw Jimmy Neutron
set pathspongebob=C:\My Games\Super Jigsaw SpongeBob Squarepants

::Merged
set pathnickmerge=C:\My Games\Super Jigsaw Nick Jr Pack


if exist "%pathblue%\npuzzles\blue.jlnk" set blue=1
if exist "%pathdora%\npuzzles\dora.jlnk" set dora=1
if exist "%pathodd%\npuzzles\odd.jlnk" set odd=1
if exist "%pathneutron%\npuzzles\neutron.jlnk" set neutron=1
if exist "%pathspongebob%\npuzzles\spongebob.jlnk" set spongebob=1

cls
echo ----------------------------
echo Multi-Compatible Information
echo ----------------------------
echo.
echo The following Nick Jr Puzzle Games were found installed:
echo.
echo.
if blue==0 echo MISSING [Super Jigsaw Blue's Clues]
if blue==1 echo Super Jigsaw Blue's Clues
echo.
if dora==0 echo MISSING [Super Jigsaw Dora the Explorer]
if dora==1 echo Super Jigsaw Dora the Explorer
echo.
if odd==0 echo MISSING [Super Jigsaw Fairly OddParents]
if odd==1 echo Super Jigsaw Fairly OddParents
echo.
if neutron==0 echo MISSING [Super Jigsaw Jimmy Neutron]
if neutron==1 echo Super Jigsaw Jimmy Neutron
echo.
if spongebob==0 echo MISSING [Super Jigsaw SpongeBob Squarepants]
if spongebob==1 echo Super Jigsaw SpongeBob Squarepants
echo.
echo.
echo The "NJigsaw.exe" file can load ALL puzzles from any of the other Nick Puzzles.
echo.
echo Would you like to merge all available puzzles together? [Y/N]
echo.
echo.

if %os%==XP choice /c:yn /t:y,30 /n
if %os%==VISTA choice /c yn /d y /n /t 30
if errorlevel 2 goto end
goto mergepuz

:mergepuz
cls
md "%pathnickmerge%"
echo Nick Jr Puzzle Merger > "%pathnickmerge%\npuzzles\sjnjp_hybrid.id"

if blue==1 (
xcopy /e /q /y "%pathblue%\nick-jigsaw.dll" "%pathnickmerge%\nick-jigsaw.dll"
xcopy /e /q /y "%pathblue%\NJigsaw.exe" "%pathnickmerge%\NJigsaw.exe"
xcopy /e /q /y "%pathblue%\npuzzles" "%pathnickmerge%\npuzzles\"
)

if dora==1 (
xcopy /e /q /y "%pathdora%\nick-jigsaw.dll" "%pathnickmerge%\nick-jigsaw.dll"
xcopy /e /q /y "%pathdora%\NJigsaw.exe" "%pathnickmerge%\NJigsaw.exe"
xcopy /e /q /y "%pathdora%\npuzzles" "%pathnickmerge%\npuzzles\"
)

if odd==1 (
xcopy /e /q /y "%pathodd%\nick-jigsaw.dll" "%pathnickmerge%\nick-jigsaw.dll"
xcopy /e /q /y "%pathodd%\NJigsaw.exe" "%pathnickmerge%\NJigsaw.exe"
xcopy /e /q /y "%pathodd%\npuzzles" "%pathnickmerge%\npuzzles\"
)

if neutron==1 (
xcopy /e /q /y "%pathneutron%\nick-jigsaw.dll" "%pathnickmerge%\nick-jigsaw.dll"
xcopy /e /q /y "%pathneutron%\NJigsaw.exe" "%pathnickmerge%\NJigsaw.exe"
xcopy /e /q /y "%pathneutron%\npuzzles" "%pathnickmerge%\npuzzles\"
)

if spongebob==1 (
xcopy /e /q /y "%pathspongebob%\nick-jigsaw.dll" "%pathnickmerge%\nick-jigsaw.dll"
xcopy /e /q /y "%pathspongebob%\NJigsaw.exe" "%pathnickmerge%\NJigsaw.exe"
xcopy /e /q /y "%pathspongebob%\npuzzles" "%pathnickmerge%\npuzzles\"
)

nircmd shortcut "%cd%\%unwrapped%.exe" "~$folder.desktop$" "Super Jigsaw Nick Jr Pack"

goto end


:end
@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Dupe Filename Checking +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

::-----------------------------------------------------------------------------------
:: EXE filenames that are shared across multiple games
::-----------------------------------------------------------------------------------

if exist "game.exe" goto dupe1
if exist "Jigsaw.exe" goto dupe2
if exist "NJigsaw.exe" goto dupe3

goto end




:dupe1



goto end


:dupe2



goto end


:dupe3
::Super Jigsaw Nick Jr Pack Puzzle Merger
if exist "%altid%" ren "njigsaw_r1a.exe" "njigsaw0_r1a.exe"

::Super Jigsaw Blue's Clues
if exist "%altid%" ren "njigsaw_r1a.exe" "njigsaw1_r1a.exe"

::Super Jigsaw Dora the Explorer
if exist "%altid%" ren "njigsaw_r1a.exe" "njigsaw2_r1a.exe"

::Super Jigsaw Fairly OddParents
if exist "%altid%" ren "njigsaw_r1a.exe" "njigsaw3_r1a.exe"

::Super Jigsaw Jimmy Neutron
if exist "%altid%" ren "njigsaw_r1a.exe" "njigsaw4_r1a.exe"

::Super Jigsaw SpongeBob Squarepants
if exist "%altid%" ren "njigsaw_r1a.exe" "njigsaw5_r1a.exe"


goto end


:end
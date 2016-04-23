@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Patch RA Database +-^~`+-.)     [...cRypTiCwaRe 2o16...]

::-----------------------------------------------------------------------------------
::THIS FILE IS FOR THE CUSTOM RGS LOADER ONLY!!!!
::-----------------------------------------------------------------------------------


::-----------------------------------------------------------------------------------
::Patching Database Files With Proper GUID
::-----------------------------------------------------------------------------------

::gpatch "%uraroot%\loader\db\CATALOG.CDX" /nologo /i"2624" /s"%guid%""
::gpatch "%uraroot%\loader\db\CATALOG.DBF" /nologo /i"322" /s"%guid%""
::gpatch "%uraroot%\loader\db\CATALOG.FPT" /nologo /i"" /s"""
::gpatch "%uraroot%\loader\db\GAMEFIND.CDX" /nologo /i"2775" /s"%guid%""
gpatch "%uraroot%\loader\db\GAMEFIND.DBF" /nologo /i"322" /s"%guid%""
::gpatch "%uraroot%\loader\db\GAMEFIND.FPT" /nologo /i"" /s"%guid%""
::gpatch "%uraroot%\loader\db\MYGAMES.CDX" /nologo /i"" /s"%guid%""
::gpatch "%uraroot%\loader\db\MYGAMES.DBF" /nologo /i"" /s"%guid%""
::gpatch "%uraroot%\loader\db\MYGAMES.FPT" /nologo /i"" /s"%guid%""








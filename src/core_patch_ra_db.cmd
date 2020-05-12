@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Patch RA Database +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

::-----------------------------------------------------------------------------------
::THIS FILE IS FOR THE CUSTOM RGS LOADER ONLY!!!!
::-----------------------------------------------------------------------------------


::-----------------------------------------------------------------------------------
::Patching Database Files With Proper GUID
::-----------------------------------------------------------------------------------

::gpatch "%uraroot%\loaderRGSv1\db\CATALOG.CDX" /nologo /i"2624" /s"%guid%""
::gpatch "%uraroot%\loaderRGSv1\db\CATALOG.DBF" /nologo /i"322" /s"%guid%""
::gpatch "%uraroot%\loaderRGSv1\db\CATALOG.FPT" /nologo /i"" /s"""
::gpatch "%uraroot%\loaderRGSv1\db\GAMEFIND.CDX" /nologo /i"2775" /s"%guid%""
gpatch "%uraroot%\loaderRGSv1\db\GAMEFIND.DBF" /nologo /i"322" /s"%guid%""
::gpatch "%uraroot%\loaderRGSv1\db\GAMEFIND.FPT" /nologo /i"" /s"%guid%""
::gpatch "%uraroot%\loaderRGSv1\db\MYGAMES.CDX" /nologo /i"" /s"%guid%""
::gpatch "%uraroot%\loaderRGSv1\db\MYGAMES.DBF" /nologo /i"" /s"%guid%""
::gpatch "%uraroot%\loaderRGSv1\db\MYGAMES.FPT" /nologo /i"" /s"%guid%""

:end

if %testmode%==1 (
	echo [core_patch_ra_db : finished]
	pause>nul
)

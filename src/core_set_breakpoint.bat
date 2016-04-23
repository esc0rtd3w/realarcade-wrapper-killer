@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Breakpoint on Execution +-^~`+-.)     [...cRypTiCwaRe 2o16...]


:: Use below 4 lines to force a pause and outputted display
:: Copy and Paste to another module

:: DEBUGGING USE ONLY [START]
::set activemodule=%%0
::call "core_set_breakpoint.bat"
:: DEBUGGING USE ONLY [FINISH]


::------------------------------------------
::DEBUGGING START
::------------------------------------------
::cls
echo.
echo -------------------------------------------------------------------
echo.
echo -------------------------------------------------------------------
echo Current Module: %activemodule%
echo -------------------------------------------------------------------
echo.
echo -------------------------------------------------------------------
echo Wrapped EXE: %wrapped%
echo -------------------------------------------------------------------
echo.
echo -------------------------------------------------------------------
echo rawkdb.ini Output
echo -------------------------------------------------------------------
echo GameName: %gamename%
echo verified: %verified%
echo demotype: %demotype%
echo version: %version%
echo md5w: %md5w%
echo md5u: %md5u%
echo PFLindex: %PFLindex%
echo PFLhex: %PFLhex%
echo RNRindex: %RNRindex%
echo RNRhex: %RNRhex%
echo SWindex: %SWindex%
echo SWhex: %SWhex%
echo genre: %genre%
echo stubname: %stubname%
echo rlsdate: %rlsdate%
echo guid: %guid%
echo contentid: %contentid%
echo trackingid: %trackingid%
echo cheats: %cheats%
echo mods: %mods%
echo dlc: %dlc%
echo multicmp: %multicmp%
echo savexp: %savexp%
echo save7: %save7%
echo binmod: %binmod%
echo altid: %altid%
echo magicslot: %magicslot%
echo ftinit: %ftinit%
echo ftinitpath: %ftinitpath%
echo installsize: %installsize%
echo unwrapped: %unwrapped%
echo comments: %comments%
echo.
echo -------------------------------------------------------------------
echo Global Output
echo -------------------------------------------------------------------
echo os: %os%
echo getsize: %getsize%
echo pdffix: %pdffix%
echo savepathad: %savepathad%
echo savepathpd: %savepathpd%
echo msgcfg: %msgcfg%
echo wdomain: %wdomain%
echo wdoad: %wdoad%
echo wdojs: %wdojs%
echo wdowapp: %wdowapp%
echo show: %show%
echo hide: %hide%
echo hide2: %hide2%
echo gohide: %gohide%
echo gohide2: %gohide2%
echo goshow: %goshow%
echo kill: %kill%
echo min: %min%
echo waitfor: %waitfor%
echo talk: %talk%
echo rgsinst: %rgsinst%
echo rgsloader: %rgsloader%
echo uraroot: %uraroot%
echo rawkroot: %rawkroot%
echo rgsroot: %rgsroot%
echo ghroot: %ghroot%
echo gameroot: %gameroot%
echo downroot: %downroot%
echo cover1: %cover1%
echo cover2: %cover2%
echo pdxml: %pdxml%
echo raroot: %raroot%
echo catroot: %catroot%
echo dbroot: %dbroot%
echo htmlroot: %htmlroot%
echo rashort: %rashort%
echo raexec: %raexec%
echo raexec2: %raexec2%
echo baknow: %baknow%
echo restoredone: %restoredone%
echo rarexists: %rarexists%
echo rawkcore: %rawkcore%
echo rawkver: %rawkver%
echo raexist: %raexist%
echo devmode: %devmode%
echo reset: %reset%
echo clearcache: %clearcache%
echo updatedb: %updatedb%
echo rgspre: %rgspre%
echo restartcore: %restartcore%
echo quw: %quw%
echo wrestore: %wrestore%
echo iniskip: %iniskip%
echo dtor: %dtor%
echo demotype: %demotype%
echo advancedloadoptions: %advancedloadoptions%
echo.
echo -------------------------------------------------------------------
echo Displaying Debug Output.
echo.
echo Scroll up to see more information.
echo.
echo Press any key to continue....
echo -------------------------------------------------------------------
echo.
pause>nul
::------------------------------------------
::DEBUGGING FINISH
::------------------------------------------


:end

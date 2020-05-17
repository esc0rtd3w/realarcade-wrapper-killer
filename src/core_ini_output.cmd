@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Writing INI Output +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_ini_output : loaded]
	pause>nul
)

:: Check for Full Demo Type
if %demotype%==f goto isfull
	

:: All other demo types
echo [%wrapped%] > "%wrapped%.ini"
echo GameName=%GameName% >> "%wrapped%.ini"
echo verified=%verified% >> "%wrapped%.ini"
echo demotype=%demotype% >> "%wrapped%.ini"
echo version=%version% >> "%wrapped%.ini"
echo md5w=%md5w% >> "%wrapped%.ini"
echo md5u=%md5u% >> "%wrapped%.ini"
echo PFLindex=%PFLindex% >> "%wrapped%.ini"
echo PFLhex=%PFLhex% >> "%wrapped%.ini"
echo RNRindex=%RNRindex% >> "%wrapped%.ini"
echo RNRhex=%RNRhex% >> "%wrapped%.ini"
echo SWindex=%SWindex% >> "%wrapped%.ini"
echo SWhex=%SWhex% >> "%wrapped%.ini"
echo genre=%genre% >> "%wrapped%.ini"
echo stubname=%stubname% >> "%wrapped%.ini"
echo rlsdate=%rlsdate% >> "%wrapped%.ini"
echo guid=%guid% >> "%wrapped%.ini"
echo contentid=%contentid% >> "%wrapped%.ini"
echo trackingid=%trackingid% >> "%wrapped%.ini"
echo cheats=%cheats% >> "%wrapped%.ini"
echo mods=%mods% >> "%wrapped%.ini"
echo dlc=%dlc% >> "%wrapped%.ini"
echo multicmp=%multicmp% >> "%wrapped%.ini"
echo savexp=%savexp% >> "%wrapped%.ini"
echo save7=%save7% >> "%wrapped%.ini"
echo binmod=%binmod% >> "%wrapped%.ini"
echo altid=%altid% >> "%wrapped%.ini"
echo magicslot=%magicslot% >> "%wrapped%.ini"
echo ftinit=%ftinit% >> "%wrapped%.ini"
echo ftinitpath=%ftinitpath% >> "%wrapped%.ini"
echo installsize=%installsize% >> "%wrapped%.ini"
echo unwrapped=%unwrapped% >> "%wrapped%.ini"
echo comments=%comments% >> "%wrapped%.ini"

goto end

:isfull
echo [%wrapped%] > "%wrapped%.ini"
echo GameName=%GameName% >> "%wrapped%.ini"
echo verified=%verified% >> "%wrapped%.ini"
echo demotype=%demotype% >> "%wrapped%.ini"
echo version=%version% >> "%wrapped%.ini"
echo md5w=%md5w% >> "%wrapped%.ini"
echo md5u=%md5u% >> "%wrapped%.ini"
echo patch1_name=%patch1_name% >> "%wrapped%.ini"
echo patch1_index=%patch1_index% >> "%wrapped%.ini"
echo patch1_hex=%patch1_hex% >> "%wrapped%.ini"
echo patch2_name=%patch2_name% >> "%wrapped%.ini"
echo patch2_index=%patch2_index% >> "%wrapped%.ini"
echo patch2_hex=%patch2_hex% >> "%wrapped%.ini"
echo patch3_name=%patch3_name% >> "%wrapped%.ini"
echo patch3_index=%patch3_index% >> "%wrapped%.ini"
echo patch3_hex=%patch3_hex% >> "%wrapped%.ini"
echo patch4_name=%patch4_name% >> "%wrapped%.ini"
echo patch4_index=%patch4_index% >> "%wrapped%.ini"
echo patch4_hex=%patch4_hex% >> "%wrapped%.ini"
echo patch5_name=%patch5_name% >> "%wrapped%.ini"
echo patch5_index=%patch5_index% >> "%wrapped%.ini"
echo patch5_hex=%patch5_hex% >> "%wrapped%.ini"
echo patch6_name=%patch6_name% >> "%wrapped%.ini"
echo patch6_index=%patch6_index% >> "%wrapped%.ini"
echo patch6_hex=%patch6_hex% >> "%wrapped%.ini"
echo patch_extension=%patch_extension% >> "%wrapped%.ini"
echo genre=%genre% >> "%wrapped%.ini"
echo stubname=%stubname% >> "%wrapped%.ini"
echo rlsdate=%rlsdate% >> "%wrapped%.ini"
echo guid=%guid% >> "%wrapped%.ini"
echo contentid=%contentid% >> "%wrapped%.ini"
echo trackingid=%trackingid% >> "%wrapped%.ini"
echo cheats=%cheats% >> "%wrapped%.ini"
echo mods=%mods% >> "%wrapped%.ini"
echo dlc=%dlc% >> "%wrapped%.ini"
echo multicmp=%multicmp% >> "%wrapped%.ini"
echo savexp=%savexp% >> "%wrapped%.ini"
echo save7=%save7% >> "%wrapped%.ini"
echo binmod=%binmod% >> "%wrapped%.ini"
echo altid=%altid% >> "%wrapped%.ini"
echo magicslot=%magicslot% >> "%wrapped%.ini"
echo ftinit=%ftinit% >> "%wrapped%.ini"
echo ftinitpath=%ftinitpath% >> "%wrapped%.ini"
echo installsize=%installsize% >> "%wrapped%.ini"
echo unwrapped=%unwrapped% >> "%wrapped%.ini"
echo comments=%comments% >> "%wrapped%.ini"

goto end

:end

if %testmode%==1 (
	echo [core_ini_output : finished]
	pause>nul
)

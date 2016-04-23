
:: Part of the RealArcade Wrapper Killer

:: Gamehouse download stub renaming and adding to html tool


:: cRypTiCwaRe 2013





:: RGS Legacy
:: Used with RealArcade GUI for Windows
set linkRGS_HTML_New="<li><a class="newrgs" href="http://games-dl2.real.com/gameconsole/games/demorgses/"%a"_free.rgs">"%a"</a></li>"
set linkRGS_HTML_Good="<li><a class="good" href="http://games-dl2.real.com/gameconsole/games/demorgses/"%a"_free.rgs">"%a"</a></li>"
set linkRGS_HTML_Bad="<li><a class="bad" href="http://games-dl2.real.com/gameconsole/games/demorgses/"%a"_free.rgs">"%a"</a></li>"
set linkRGS_HTML_Skipped="<li><a class="skipped" href="http://games-dl2.real.com/gameconsole/games/demorgses/"%a"_free.rgs">"%a"</a></li>"



:: RGA v2
:: OLD LINK FORMAT
:: Still gets used for some games, mainly premium, double packs, and platinum
set linkRGA_v2_HTML_Good="<a class="good" href="http://games-dl2.real.com/gameconsole/realarcadev21/games/am-%a/am-%a.rga">am-%a<br></a>"
set linkRGA_v2_HTML_Bad="<a class="bad" href="http://games-dl2.real.com/gameconsole/realarcadev21/games/am-%a/am-%a.rga">am-%a<br></a>"
set linkRGA_v2_HTML_Skipped="<a class="skipped" href="http://games-dl2.real.com/gameconsole/realarcadev21/games/am-%a/am-%a.rga">am-%a<br></a>"


:: RGA v3
:: New link format found on 06-16-2011
:: Does NOT use "am" tags anymore
:: MAX LENGTH IS 32 CHARACTERS FOR FILENAME???

set linkRGA_v3_HTML_Good="<a class="good" href="http://games-dl2.real.com/gameconsole/realarcadev21/games/dip/%a/%a.rga">%a<br></a>"
set linkRGA_v3_HTML_Bad="<a class="bad" href="http://games-dl2.real.com/gameconsole/realarcadev21/games/dip/%a/%a.rga">%a<br></a>"
set linkRGA_v3_HTML_Skipped="<a class="skipped" href="http://games-dl2.real.com/gameconsole/realarcadev21/games/dip/%a/%a.rga">%a<br></a>"



:getNames
set nameList=%(ls | grep "GameHouse-Installer_")



:chopNames


set chopList=%(ls | grep "GameHouse-Installer_" | cut -c 24- | sed "s/...............%//"



:chopNamesActiveMark

set chopList=%(ls | grep "Installer_" | cut -c 11- | sed "s/....%//")



:makeLinksRGS

echo "" > tmpLinksRGS

for a in %chopList; do

echo "<li><a class="newrgs" href="http://games-dl2.real.com/gameconsole/games/demorgses/"%a%"_free.rgs">"%a%"</a></li>" >> tmpLinksRGS
echo "" >> tmpLinksRGS

done




:makeLinksRGAv3

echo "" > tmpLinksRGAv3

for a in %chopList; do

echo "<a class="good" href="http://games-dl2.real.com/gameconsole/realarcadev21/games/dip/"%a%"/"%a%".rga">"%a%"<br></a>" >> tmpLinksRGAv3
echo "" >> tmpLinksRGAv3

done




:makeLinksRGAv4


echo "" > tmpLinksRGAv4

for a in %chopList; do

echo "<a class="good" href="http://d.gamehouse.com/d/ghmigration/"%a%"/z_syn_gh_g12/"%a%".rga">"%a%"<br></a>" >> tmpLinksRGAv4
echo "" >> tmpLinksRGAv4

done





:saveChops


echo %chopList% > chops.txt




:saveChopsList


echo %chopList% > choplist.tmp

::chopTemp=%(tr "\n" " " < choplist.tmp)

::chopTemp=%(tr " " "\n" < choplist.tmp)

sed -e "s/[ \t][ \t]*/\
/g" choplist.tmp > choplist.txt

::echo %chopTemp% > choplist.txt

rm -f choplist.tmp




:saveNames


echo %nameList% > namelist.txt






::goto chopNames

goto chopNamesActiveMark

goto saveChopsList

goto makeLinksRGS
goto makeLinksRGAv3
goto makeLinksRGAv4



echo
echo "Press a key to continue...."
echo

read -p "" select






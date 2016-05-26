@echo off


wget -d --header="Cookie: gamehouseuser=true"  -O "games-windows.json" "http://www.gamehouse.com/games.json?gametype=download&genre=all&sorting=name&count=3000&filterType=null"

wget -d --header="Cookie: gamehouseuser=true" -O "games-full.json" "http://www.gamehouse.com/games.json?gametype=null&genre=all&sorting=name&count=3000&filterType=null"


echo.
echo.
echo Done!
echo.
pause>nul
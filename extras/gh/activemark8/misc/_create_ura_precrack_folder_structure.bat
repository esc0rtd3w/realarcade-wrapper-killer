@echo off

title Create unRealarcade Pre-Cracking Folder Structure        [cRypTiC 2016]


set ver=1.0


color 0e

:start
cls
echo Enter or Paste Game Name Here:
echo.
echo.
echo.
echo When finished press ENTER....
echo.
echo.

set /p game=

if "%game%"=="noentry" goto start


md "%game%"

md "%game%\config"
md "%game%\extracted"
md "%game%\installer"
md "%game%\licensing"
md "%game%\logs"
md "%game%\params"
md "%game%\registry"
md "%game%\stub"
md "%game%\uninstall"





:end





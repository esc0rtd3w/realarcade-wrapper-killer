@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ GH Web Scraper +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_gh_web_scraper : loaded]
	pause>nul
)


:reset

color 0e


::%runShellWaitTerminate% %ghWebScraper%
%runShellTerminate% %ghWebScraper%


goto end


:end

if %testmode%==1 (
	echo [core_gh_web_scraper : finished]
	pause>nul
)

REM -- Pushing \\Games-DL.stage.real.com\gameconsole files
copy /y \\Games-DL.stage.real.com\gameconsole\"go ahead and push-gameconsole" \\Games-DL.stage.real.com\gameconsole\push-gameconsole
echo OFF
date /T >> \\Games-DL.stage.real.com\gameconsole\gameconsole_push.log
time /T >> \\Games-DL.stage.real.com\gameconsole\gameconsole_push.log
echo Reason: %1 %2 %3 %4 %5 %6 %7 %8 %9 >> \\Games-DL.stage.real.com\gameconsole\gameconsole_push.log

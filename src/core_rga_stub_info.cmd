@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Getting Info From Stub +-^~`+-.)     [...cRypTiCwaRe 2o2o...]

if %testmode%==1 (
	echo [core_rga_stub_info : loaded]
	pause>nul
)

::-----------------------------------------------------------------------------------
:: Added 20131117
::-----------------------------------------------------------------------------------


:start
cls
echo Enter path to a Gamehouse Install Stub and press ENTER:
echo.
echo.
echo.
echo.
echo --------------------------------------------------------------
echo You may also drag an EXE file into this window and press ENTER
echo --------------------------------------------------------------
echo.
echo.

set /p stub=

goto getStubName



:getStubName

for %%* in (%stub%) do set stubName=%%~n*

goto loadINI



:loadINI
echo @echo off > "%temp%\rawk_stub_tmp.cmd"
echo. >> "%temp%\rawk_stub_tmp.cmd"
inifile "%cd%\stub.ini" [StubInfo] contentid >> "%temp%\rawk_stub_tmp.cmd"
inifile "%cd%\stub.ini" [StubInfo] OTP >> "%temp%\rawk_stub_tmp.cmd"
inifile "%cd%\stub.ini" [StubInfo] tracking >> "%temp%\rawk_stub_tmp.cmd"
inifile "%cd%\stub.ini" [StubInfo] affiliate >> "%temp%\rawk_stub_tmp.cmd"
inifile "%cd%\stub.ini" [StubInfo] currency >> "%temp%\rawk_stub_tmp.cmd"
inifile "%cd%\stub.ini" [StubInfo] price >> "%temp%\rawk_stub_tmp.cmd"
inifile "%cd%\stub.ini" [StubInfo] timestamp >> "%temp%\rawk_stub_tmp.cmd"
inifile "%cd%\stub.ini" [StubInfo] language >> "%temp%\rawk_stub_tmp.cmd"

goto patchEXE



:patchEXE
:: Samples
:: Pulled from installLog.txt after manipulating all strings

:: contentid = 49494949494949494949494949494949
:: OTP = 4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F
:: tracking = 54545454545454545454545454545454
:: affiliate string = z_syn_gh_g12
:: affiliate = 7A5F73796E5F67685F67313200000000
:: currency = 434343434350
:: price = 5050505050
:: timestamp = 5353535353
:: language = en-us


gpatch "%stub%" /nologo /i%IndexContentID% /h"%HexContentID%"
gpatch "%stub%" /nologo /i%IndexOTP% /h"%HexOTP%"
gpatch "%stub%" /nologo /i%IndexTracking% /h"%HexTracking%"
gpatch "%stub%" /nologo /i%IndexAffiliate% /h"%HexAffiliate%"
gpatch "%stub%" /nologo /i%IndexCurrency% /h"%HexCurrency%"
gpatch "%stub%" /nologo /i%IndexPrice% /h"%HexPrice%"
gpatch "%stub%" /nologo /i%IndexTimeStamp% /h"%HexTimeStamp%"
gpatch "%stub%" /nologo /i%IndexLanguage% /h"%HexLanguage%"


goto end




:end

del "%temp%\rawk_stub_tmp.cmd"

if %testmode%==1 (
	echo [core_rga_stub_info : finished]
	pause>nul
)

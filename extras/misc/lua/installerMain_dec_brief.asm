; source chunk: installerMain.clf
; x86 standard (32-bit, little endian, doubles)

; function [0] definition (level 1)
; 0 upvalues, 0 params, 48 stacks
.function  0 0 0 48
.local  "newLog"  ; 0
.local  "pidid"  ; 1
.local  "pid"  ; 2
.local  "mutex"  ; 3
.local  "g_gameIdMutex"  ; 4
.local  "launchDir"  ; 5
.local  "Init"  ; 6
.local  "ShutDown"  ; 7
.local  "Error"  ; 8
.local  "errHandler"  ; 9
.local  "win32"  ; 10
.local  "cdinstall"  ; 11
.local  "g_strTPS"  ; 12
.local  "g_strCDROOT"  ; 13
.local  "g_strPathSFX"  ; 14
.local  "g_strMode"  ; 15
.local  "SplashURL"  ; 16
.local  "LCIDToString"  ; 17
.local  "StringToHex"  ; 18
.local  "RawToString"  ; 19
.local  "GetDynamicStampVersion"  ; 20
.local  "ReadLegacyStampValues"  ; 21
.local  "ReadVersion1StampValues"  ; 22
.local  "ReadVersion2StampValues"  ; 23
.local  "setRgiUpgradeFlag"  ; 24
.local  "hasRgiUpgradeFlag"  ; 25
.local  "SetInstallerLoc"  ; 26
.local  "StartNewLog"  ; 27
.local  "Stubby"  ; 28
.local  "CDinstall"  ; 29
.local  "CmdLineScript"  ; 30
.local  "GameWrapper"  ; 31
.local  "Uninstall"  ; 32
.local  "ShowMyGames"  ; 33
.local  "Update"  ; 34
.local  "GenericInit"  ; 35
.local  "CleanTemps"  ; 36
.local  "GenericError"  ; 37
.local  "s"  ; 38
.local  "err"  ; 39
.local  "i"  ; 40
.local  "p"  ; 41
.local  "e"  ; 42
.const  "installLog"  ; 0
.const  "io"  ; 1
.const  "open"  ; 2
.const  "installLog.txt"  ; 3
.const  "w"  ; 4
.const  "g_installed"  ; 5
.const  "output"  ; 6
.const  " "  ; 7
.const  "arg"  ; 8
.const  2  ; 9
.const  "g_fOffline"  ; 10
.const  "g_fGamesManager"  ; 11
.const  "g_checkGoogleToolbarState"  ; 12
.const  1  ; 13
.const  -1  ; 14
.const  "g_checkChromeState"  ; 15
.const  "g_upgrademode"  ; 16
.const  "g_ogmid"  ; 17
.const  "g_ogmport"  ; 18
.const  "main_env"  ; 19
.const  "contentid"  ; 20
.const  ""  ; 21
.const  "tracking"  ; 22
.const  "affiliate"  ; 23
.const  "currency"  ; 24
.const  "price"  ; 25
.const  "timestamp"  ; 26
.const  "language"  ; 27
.const  "CopyLog"  ; 28
.const  "appendStoreFront"  ; 29
.const  "GenericShutDown"  ; 30
.const  "parseOgmCmdLine"  ; 31
.const  "write"  ; 32
.const  "\nStubby command line args..."  ; 33
.const  "\n arg["  ; 34
.const  "] = "  ; 35
.const  "flush"  ; 36
.const  "\n\n*********************STUBBY FIRST INSTANCE*************************\n\n"  ; 37
.const  "Timestamp: "  ; 38
.const  "os"  ; 39
.const  "date"  ; 40
.const  "%c"  ; 41
.const  "\n\n*******************************************************************\n\n"  ; 42
.const  "pcall"  ; 43
.const  "stubby"  ; 44
.const  "string"  ; 45
.const  "sub"  ; 46
.const  "--"  ; 47
.const  "\n\n**********************STUBBY FIRST INSTANCE OGM*******************\n\n"  ; 48
.const  "_"  ; 49
.const  "\nCommand line ogmid = "  ; 50
.const  "tostring"  ; 51
.const  "\nCommand line ogmport = "  ; 52
.const  4  ; 53
.const  "sfx:"  ; 54
.const  "\n\n**********************STUBBY SECOND INSTANCE OGM*******************\n\n"  ; 55
.const  "\n\n*********************STUBBY SECOND INSTANCE (ignore unknown params)\n\n"  ; 56
.const  "\n\n**********************STUBBY SECOND INSTANCE***********************\n\n"  ; 57
.const  5  ; 58
.const  "\n"  ; 59
.const  "%c "  ; 60
.const  "Command line SFXPath = "  ; 61
.const  "find"  ; 62
.const  "%.rguninst"  ; 63
.const  "\n\n************************UNINSTALL INSTANCE*************************\n\n"  ; 64
.const  "g_invoker"  ; 65
.const  3  ; 66
.const  "mygames"  ; 67
.const  "\n\n************************MYGAMES INSTANCE*************************\n\n"  ; 68
.const  "update"  ; 69
.const  "\n\n************************UPDATE INSTANCE****************************\n\n"  ; 70
.const  "silent"  ; 71
.const  "\n\n************************SILENT INSTALL INSTANCE********************\n\n"  ; 72
.const  "cdinstall"  ; 73
.const  "\n\n************************CD INSTALL INSTANCE************************\n\n"  ; 74
.const  "wrapper"  ; 75
.const  "\n\n************************GAME WRAPPER INSTANCE**********************\n\n"  ; 76
.const  "\n\n************************SHELL INSTANCE*****************************\n\n"  ; 77
.const  "HandleError"  ; 78
.const  "HandleError: "  ; 79
.const  "e"  ; 80
.const  "\n\nTimestamp: "  ; 81
.const  "\n\n"  ; 82
.const  "exit"  ; 83
.const  "g_exit"  ; 84
.const  "unspecified"  ; 85
.const  "\n\n\n"  ; 86
.const  "Script completed successfully!!!"  ; 87
.const  "luacom"  ; 88
.const  "CreateObject"  ; 89
.const  "RACInstaller.StateCtrl"  ; 90
.const  "ExitCode"  ; 91

; function [0] definition (level 2)
; 1 upvalues, 1 params, 11 stacks
.function  1 1 0 11
.local  "f_strFile"  ; 0
.local  "strURL"  ; 1
.upvalue  "win32"  ; 0
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Entering SplashURL, storefront = "  ; 6
.const  "g_storeFront"  ; 7
.const  "nil"  ; 8
.const  "WorkingDir"  ; 9
.const  "\\Resources\\"  ; 10
.const  "\\"  ; 11
.const  "SplashURL, storefront path = "  ; 12
.const  " exists = "  ; 13
.const  "tostring"  ; 14
.const  "FileExists"  ; 15
.const  "?affiliate="  ; 16
.const  "main_env"  ; 17
.const  "affiliate"  ; 18
.const  ""  ; 19
.const  "&contentid="  ; 20
.const  "contentid"  ; 21
.const  "&tracking="  ; 22
.const  "tracking"  ; 23
.const  "&lang="  ; 24
.const  "language"  ; 25
.const  "SplashURL returning splash URL = "  ; 26
[001] loadnil    1   1      
[002] getglobal  2   0        ; io
[003] gettable   2   2   251  ; "write"
[004] loadk      3   2        ; "\n"
[005] getglobal  4   3        ; os
[006] gettable   4   4   254  ; "date"
[007] loadk      5   5        ; "%c "
[008] call       4   2   2  
[009] loadk      5   6        ; "Entering SplashURL, storefront = "
[010] getglobal  6   7        ; g_storeFront
[011] test       6   6   1    ; to [13] if false
[012] jmp        1            ; to [14]
[013] loadk      6   8        ; "nil"
[014] concat     5   5   6  
[015] call       2   4   1  
[016] getglobal  2   7        ; g_storeFront
[017] test       2   2   0    ; to [19] if true
[018] jmp        36           ; to [55]
[019] getupval   2   0        ; win32
[020] gettable   2   2   259  ; "WorkingDir"
[021] call       2   1   2  
[022] loadk      3   10       ; "\\Resources\\"
[023] getglobal  4   7        ; g_storeFront
[024] loadk      5   11       ; "\\"
[025] move       6   0      
[026] concat     1   2   6  
[027] getglobal  2   0        ; io
[028] gettable   2   2   251  ; "write"
[029] loadk      3   2        ; "\n"
[030] getglobal  4   3        ; os
[031] gettable   4   4   254  ; "date"
[032] loadk      5   5        ; "%c "
[033] call       4   2   2  
[034] loadk      5   12       ; "SplashURL, storefront path = "
[035] test       6   1   1    ; to [37] if false
[036] jmp        1            ; to [38]
[037] loadk      6   8        ; "nil"
[038] loadk      7   13       ; " exists = "
[039] getglobal  8   14       ; tostring
[040] getupval   9   0        ; win32
[041] gettable   9   9   265  ; "FileExists"
[042] move       10  1      
[043] call       9   2   0  
[044] call       8   0   2  
[045] concat     5   5   8  
[046] call       2   4   1  
[047] getupval   2   0        ; win32
[048] gettable   2   2   265  ; "FileExists"
[049] move       3   1      
[050] call       2   2   2  
[051] loadbool   3   1   0    ; true
[052] eq         1   2   3    ; to [54] if false
[053] jmp        1            ; to [55]
[054] loadnil    1   1      
[055] test       1   1   1    ; to [57] if false
[056] jmp        6            ; to [63]
[057] getupval   2   0        ; win32
[058] gettable   2   2   259  ; "WorkingDir"
[059] call       2   1   2  
[060] loadk      3   11       ; "\\"
[061] move       4   0      
[062] concat     1   2   4  
[063] move       2   1      
[064] loadk      3   16       ; "?affiliate="
[065] getglobal  4   17       ; main_env
[066] gettable   4   4   268  ; "affiliate"
[067] test       4   4   1    ; to [69] if false
[068] jmp        1            ; to [70]
[069] loadk      4   19       ; ""
[070] loadk      5   20       ; "&contentid="
[071] getglobal  6   17       ; main_env
[072] gettable   6   6   271  ; "contentid"
[073] test       6   6   1    ; to [75] if false
[074] jmp        1            ; to [76]
[075] loadk      6   19       ; ""
[076] loadk      7   22       ; "&tracking="
[077] getglobal  8   17       ; main_env
[078] gettable   8   8   273  ; "tracking"
[079] test       8   8   1    ; to [81] if false
[080] jmp        1            ; to [82]
[081] loadk      8   19       ; ""
[082] loadk      9   24       ; "&lang="
[083] getglobal  10  17       ; main_env
[084] gettable   10  10  275  ; "language"
[085] test       10  10  1    ; to [87] if false
[086] jmp        1            ; to [88]
[087] loadk      10  19       ; ""
[088] concat     1   2   10 
[089] getglobal  2   0        ; io
[090] gettable   2   2   251  ; "write"
[091] loadk      3   2        ; "\n"
[092] getglobal  4   3        ; os
[093] gettable   4   4   254  ; "date"
[094] loadk      5   5        ; "%c "
[095] call       4   2   2  
[096] loadk      5   26       ; "SplashURL returning splash URL = "
[097] move       6   1      
[098] concat     5   5   6  
[099] call       2   4   1  
[100] return     1   2      
[101] return     0   1      
; end of function


; function [1] definition (level 2)
; 0 upvalues, 1 params, 5 stacks
.function  0 1 0 5
.local  "f_lcid"  ; 0
.local  "tableLocales"  ; 1
.local  "strLocale"  ; 2
.const  3076  ; 0
.const  "zh-hk"  ; 1
.const  5124  ; 2
.const  "zh-mo"  ; 3
.const  4100  ; 4
.const  "zh-sg"  ; 5
.const  4  ; 6
.const  "zh-zh"  ; 7
.const  31748  ; 8
.const  2067  ; 9
.const  "nl-be"  ; 10
.const  1043  ; 11
.const  "nl-nl"  ; 12
.const  3081  ; 13
.const  "en-au"  ; 14
.const  10249  ; 15
.const  "en-be"  ; 16
.const  4105  ; 17
.const  "en-ca"  ; 18
.const  9225  ; 19
.const  "en-029"  ; 20
.const  16393  ; 21
.const  "en-in"  ; 22
.const  6153  ; 23
.const  "en-ie"  ; 24
.const  8201  ; 25
.const  "en-jm"  ; 26
.const  17417  ; 27
.const  "en-my"  ; 28
.const  5129  ; 29
.const  "en-nz"  ; 30
.const  13321  ; 31
.const  "en-ph"  ; 32
.const  18441  ; 33
.const  "en-sg"  ; 34
.const  7177  ; 35
.const  "en-za"  ; 36
.const  11273  ; 37
.const  "en-tt"  ; 38
.const  2057  ; 39
.const  "en-gb"  ; 40
.const  1033  ; 41
.const  "en-us"  ; 42
.const  12297  ; 43
.const  "en-zw"  ; 44
.const  2060  ; 45
.const  "fr-be"  ; 46
.const  3084  ; 47
.const  "fr-ca"  ; 48
.const  1036  ; 49
.const  "fr-fr"  ; 50
.const  5132  ; 51
.const  "fr-lu"  ; 52
.const  6156  ; 53
.const  "fr-mc"  ; 54
.const  4108  ; 55
.const  "fr-ch"  ; 56
.const  3079  ; 57
.const  "de-at"  ; 58
.const  1031  ; 59
.const  "de-de"  ; 60
.const  5127  ; 61
.const  "de-li"  ; 62
.const  4103  ; 63
.const  "de-lu"  ; 64
.const  2055  ; 65
.const  "de-ch"  ; 66
.const  1040  ; 67
.const  "it-it"  ; 68
.const  2064  ; 69
.const  "it-ch"  ; 70
.const  1046  ; 71
.const  "pt-br"  ; 72
.const  2070  ; 73
.const  "pt-pt"  ; 74
.const  11274  ; 75
.const  "es-ar"  ; 76
.const  16394  ; 77
.const  "es-bo"  ; 78
.const  13322  ; 79
.const  "es-cl"  ; 80
.const  9226  ; 81
.const  "es-co"  ; 82
.const  5130  ; 83
.const  "es-cr"  ; 84
.const  7178  ; 85
.const  "es-do"  ; 86
.const  12298  ; 87
.const  "es-ec"  ; 88
.const  17418  ; 89
.const  "es-sv"  ; 90
.const  4106  ; 91
.const  "es-gt"  ; 92
.const  18442  ; 93
.const  "es-hn"  ; 94
.const  2058  ; 95
.const  "es-mx"  ; 96
.const  19466  ; 97
.const  "es-ni"  ; 98
.const  6154  ; 99
.const  "es-pa"  ; 100
.const  15370  ; 101
.const  "es-py"  ; 102
.const  10250  ; 103
.const  "es-pe"  ; 104
.const  20490  ; 105
.const  "es-pr"  ; 106
.const  1034  ; 107
.const  "es-es"  ; 108
.const  21514  ; 109
.const  "es-us"  ; 110
.const  14346  ; 111
.const  "es-uy"  ; 112
.const  8202  ; 113
.const  "es-ve"  ; 114
.const  2077  ; 115
.const  "sv-fi"  ; 116
.const  1053  ; 117
.const  "sv-se"  ; 118
.const  "tonumber"  ; 119
[01] newtable   1   0   0    ; array=0, hash=0
[02] loadnil    2   2      
[03] settable   1   250 251  ; 3076 "zh-hk"
[04] settable   1   252 253  ; 5124 "zh-mo"
[05] settable   1   254 255  ; 4100 "zh-sg"
[06] settable   1   256 257  ; 4 "zh-zh"
[07] settable   1   258 257  ; 31748 "zh-zh"
[08] settable   1   259 260  ; 2067 "nl-be"
[09] settable   1   261 262  ; 1043 "nl-nl"
[10] settable   1   263 264  ; 3081 "en-au"
[11] settable   1   265 266  ; 10249 "en-be"
[12] settable   1   267 268  ; 4105 "en-ca"
[13] settable   1   269 270  ; 9225 "en-029"
[14] settable   1   271 272  ; 16393 "en-in"
[15] settable   1   273 274  ; 6153 "en-ie"
[16] settable   1   275 276  ; 8201 "en-jm"
[17] settable   1   277 278  ; 17417 "en-my"
[18] settable   1   279 280  ; 5129 "en-nz"
[19] settable   1   281 282  ; 13321 "en-ph"
[20] settable   1   283 284  ; 18441 "en-sg"
[21] settable   1   285 286  ; 7177 "en-za"
[22] settable   1   287 288  ; 11273 "en-tt"
[23] settable   1   289 290  ; 2057 "en-gb"
[24] settable   1   291 292  ; 1033 "en-us"
[25] settable   1   293 294  ; 12297 "en-zw"
[26] settable   1   295 296  ; 2060 "fr-be"
[27] settable   1   297 298  ; 3084 "fr-ca"
[28] settable   1   299 300  ; 1036 "fr-fr"
[29] settable   1   301 302  ; 5132 "fr-lu"
[30] settable   1   303 304  ; 6156 "fr-mc"
[31] settable   1   305 306  ; 4108 "fr-ch"
[32] settable   1   307 308  ; 3079 "de-at"
[33] settable   1   309 310  ; 1031 "de-de"
[34] settable   1   311 312  ; 5127 "de-li"
[35] settable   1   313 314  ; 4103 "de-lu"
[36] settable   1   315 316  ; 2055 "de-ch"
[37] settable   1   317 318  ; 1040 "it-it"
[38] settable   1   319 320  ; 2064 "it-ch"
[39] settable   1   321 322  ; 1046 "pt-br"
[40] settable   1   323 324  ; 2070 "pt-pt"
[41] settable   1   325 326  ; 11274 "es-ar"
[42] settable   1   327 328  ; 16394 "es-bo"
[43] settable   1   329 330  ; 13322 "es-cl"
[44] settable   1   331 332  ; 9226 "es-co"
[45] settable   1   333 334  ; 5130 "es-cr"
[46] settable   1   335 336  ; 7178 "es-do"
[47] settable   1   337 338  ; 12298 "es-ec"
[48] settable   1   339 340  ; 17418 "es-sv"
[49] settable   1   341 342  ; 4106 "es-gt"
[50] settable   1   343 344  ; 18442 "es-hn"
[51] settable   1   345 346  ; 2058 "es-mx"
[52] settable   1   347 348  ; 19466 "es-ni"
[53] settable   1   349 350  ; 6154 "es-pa"
[54] settable   1   351 352  ; 15370 "es-py"
[55] settable   1   353 354  ; 10250 "es-pe"
[56] settable   1   355 356  ; 20490 "es-pr"
[57] settable   1   357 358  ; 1034 "es-es"
[58] settable   1   359 360  ; 21514 "es-us"
[59] settable   1   361 362  ; 14346 "es-uy"
[60] settable   1   363 364  ; 8202 "es-ve"
[61] settable   1   365 366  ; 2077 "sv-fi"
[62] settable   1   367 368  ; 1053 "sv-se"
[63] gettable   2   1   0  
[64] test       2   2   1    ; to [66] if false
[65] jmp        4            ; to [70]
[66] getglobal  3   119      ; tonumber
[67] move       4   0      
[68] call       3   2   2  
[69] move       2   3      
[70] return     2   2      
[71] return     0   1      
; end of function


; function [2] definition (level 2)
; 0 upvalues, 1 params, 10 stacks
.function  0 1 0 10
.local  "f_strBinary"  ; 0
.local  "strHex"  ; 1
.local  "ich"  ; 2
.local  "b"  ; 3
.const  ""  ; 0
.const  1  ; 1
.const  "io"  ; 2
.const  "write"  ; 3
.const  "\n"  ; 4
.const  "os"  ; 5
.const  "date"  ; 6
.const  "%c "  ; 7
.const  "StringToHex length = "  ; 8
.const  "tostring"  ; 9
.const  "string"  ; 10
.const  "len"  ; 11
.const  "sub"  ; 12
.const  "format"  ; 13
.const  "%02X"  ; 14
.const  "byte"  ; 15
.const  "StringToHex converted "  ; 16
.const  " to "  ; 17
[01] loadk      1   0        ; ""
[02] loadk      2   1        ; 1
[03] getglobal  3   2        ; io
[04] gettable   3   3   253  ; "write"
[05] loadk      4   4        ; "\n"
[06] getglobal  5   5        ; os
[07] gettable   5   5   256  ; "date"
[08] loadk      6   7        ; "%c "
[09] call       5   2   2  
[10] loadk      6   8        ; "StringToHex length = "
[11] getglobal  7   9        ; tostring
[12] getglobal  8   10       ; string
[13] gettable   8   8   261  ; "len"
[14] move       9   0      
[15] call       8   2   0  
[16] call       7   0   2  
[17] concat     6   6   7  
[18] call       3   4   1  
[19] jmp        17           ; to [37]
[20] getglobal  3   10       ; string
[21] gettable   3   3   262  ; "sub"
[22] move       4   0      
[23] move       5   2      
[24] add        6   2   251  ; 1
[25] call       3   4   2  
[26] move       4   1      
[27] getglobal  5   10       ; string
[28] gettable   5   5   263  ; "format"
[29] loadk      6   14       ; "%02X"
[30] getglobal  7   10       ; string
[31] gettable   7   7   265  ; "byte"
[32] move       8   3      
[33] call       7   2   0  
[34] call       5   0   2  
[35] concat     1   4   5  
[36] add        2   2   251  ; 1
[37] getglobal  3   10       ; string
[38] gettable   3   3   261  ; "len"
[39] move       4   0      
[40] call       3   2   2  
[41] le         1   2   3    ; to [43] if false
[42] jmp        -23          ; to [20]
[43] getglobal  3   2        ; io
[44] gettable   3   3   253  ; "write"
[45] loadk      4   4        ; "\n"
[46] getglobal  5   5        ; os
[47] gettable   5   5   256  ; "date"
[48] loadk      6   7        ; "%c "
[49] call       5   2   2  
[50] loadk      6   16       ; "StringToHex converted "
[51] getglobal  7   9        ; tostring
[52] move       8   0      
[53] call       7   2   2  
[54] loadk      8   17       ; " to "
[55] move       9   1      
[56] concat     6   6   9  
[57] call       3   4   1  
[58] return     1   2      
[59] return     0   1      
; end of function


; function [3] definition (level 2)
; 0 upvalues, 1 params, 8 stacks
.function  0 1 0 8
.local  "f_strRaw"  ; 0
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "RawToString length = "  ; 6
.const  "tostring"  ; 7
.const  "string"  ; 8
.const  "len"  ; 9
.const  "length"  ; 10
.const  "find"  ; 11
.const  "\0"  ; 12
.const  1  ; 13
.const  "sub"  ; 14
[01] getglobal  1   0        ; io
[02] gettable   1   1   251  ; "write"
[03] loadk      2   2        ; "\n"
[04] getglobal  3   3        ; os
[05] gettable   3   3   254  ; "date"
[06] loadk      4   5        ; "%c "
[07] call       3   2   2  
[08] loadk      4   6        ; "RawToString length = "
[09] getglobal  5   7        ; tostring
[10] getglobal  6   8        ; string
[11] gettable   6   6   259  ; "len"
[12] move       7   0      
[13] call       6   2   0  
[14] call       5   0   2  
[15] concat     4   4   5  
[16] call       1   4   1  
[17] getglobal  1   8        ; string
[18] gettable   1   1   261  ; "find"
[19] move       2   0      
[20] loadk      3   12       ; "\0"
[21] call       1   3   2  
[22] setglobal  1   10       ; length
[23] getglobal  1   10       ; length
[24] lt         0   263 1    ; 1, to [26] if true
[25] jmp        9            ; to [35]
[26] getglobal  1   8        ; string
[27] gettable   1   1   264  ; "sub"
[28] move       2   0      
[29] loadk      3   13       ; 1
[30] getglobal  4   10       ; length
[31] sub        4   4   263  ; 1
[32] tailcall   1   4   0  
[33] return     1   0      
[34] jmp        1            ; to [36]
[35] return     0   2      
[36] return     0   1      
; end of function


; function [4] definition (level 2)
; 1 upvalues, 0 params, 10 stacks
.function  1 0 0 10
.local  "hfile"  ; 0
.local  "idVersion"  ; 1
.local  "strMagic"  ; 2
.local  "cbStamp"  ; 3
.upvalue  "g_strPathSFX"  ; 0
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "GetDynamicStampVersion got sfx = "  ; 6
.const  "tostring"  ; 7
.const  "open"  ; 8
.const  "rb"  ; 9
.const  "assert"  ; 10
.const  "badFilename"  ; 11
.const  "seek"  ; 12
.const  "end"  ; 13
.const  8  ; 14
.const  -8  ; 15
.const  "read"  ; 16
.const  "GetDynamicStampVersion got magic = "  ; 17
.const  "*^MAGIC&"  ; 18
.const  "dynamic stamp is nonlegacy"  ; 19
.const  12  ; 20
.const  -12  ; 21
.const  "tonumber"  ; 22
.const  4  ; 23
.const  "dynamic stamp has size "  ; 24
.const  "dynamic stamp is version "  ; 25
.const  "dynamic stamp is legacy"  ; 26
.const  0  ; 27
.const  80  ; 28
.const  -80  ; 29
[001] loadnil    0   2      
[002] getupval   3   0        ; g_strPathSFX
[003] test       3   3   1    ; to [5] if false
[004] jmp        1            ; to [6]
[005] return     0   1      
[006] getglobal  3   0        ; io
[007] gettable   3   3   251  ; "write"
[008] loadk      4   2        ; "\n"
[009] getglobal  5   3        ; os
[010] gettable   5   5   254  ; "date"
[011] loadk      6   5        ; "%c "
[012] call       5   2   2  
[013] loadk      6   6        ; "GetDynamicStampVersion got sfx = "
[014] getglobal  7   7        ; tostring
[015] getupval   8   0        ; g_strPathSFX
[016] call       7   2   2  
[017] concat     6   6   7  
[018] call       3   4   1  
[019] getglobal  3   0        ; io
[020] gettable   3   3   258  ; "open"
[021] getupval   4   0        ; g_strPathSFX
[022] loadk      5   9        ; "rb"
[023] call       3   3   2  
[024] move       0   3      
[025] getglobal  3   10       ; assert
[026] move       4   0      
[027] loadk      5   11       ; "badFilename"
[028] call       3   3   1  
[029] self       3   0   262  ; "seek"
[030] loadk      5   13       ; "end"
[031] loadk      6   15       ; -8
[032] call       3   4   1  
[033] self       3   0   266  ; "read"
[034] loadk      5   14       ; 8
[035] call       3   3   2  
[036] move       2   3      
[037] getglobal  3   0        ; io
[038] gettable   3   3   251  ; "write"
[039] loadk      4   2        ; "\n"
[040] getglobal  5   3        ; os
[041] gettable   5   5   254  ; "date"
[042] loadk      6   5        ; "%c "
[043] call       5   2   2  
[044] loadk      6   17       ; "GetDynamicStampVersion got magic = "
[045] move       7   2      
[046] call       3   5   1  
[047] eq         0   2   268  ; "*^MAGIC&", to [49] if true
[048] jmp        56           ; to [105]
[049] loadnil    3   3      
[050] getglobal  4   0        ; io
[051] gettable   4   4   251  ; "write"
[052] loadk      5   2        ; "\n"
[053] getglobal  6   3        ; os
[054] gettable   6   6   254  ; "date"
[055] loadk      7   5        ; "%c "
[056] call       6   2   2  
[057] loadk      7   19       ; "dynamic stamp is nonlegacy"
[058] call       4   4   1  
[059] self       4   0   262  ; "seek"
[060] loadk      6   13       ; "end"
[061] loadk      7   21       ; -12
[062] call       4   4   1  
[063] getglobal  4   22       ; tonumber
[064] self       5   0   266  ; "read"
[065] loadk      7   23       ; 4
[066] call       5   3   0  
[067] call       4   0   2  
[068] move       3   4      
[069] getglobal  4   0        ; io
[070] gettable   4   4   251  ; "write"
[071] loadk      5   2        ; "\n"
[072] getglobal  6   3        ; os
[073] gettable   6   6   254  ; "date"
[074] loadk      7   5        ; "%c "
[075] call       6   2   2  
[076] loadk      7   24       ; "dynamic stamp has size "
[077] getglobal  8   7        ; tostring
[078] move       9   3      
[079] call       8   2   0  
[080] call       4   0   1  
[081] self       4   0   262  ; "seek"
[082] loadk      6   13       ; "end"
[083] add        7   3   270  ; 12
[084] unm        7   7      
[085] call       4   4   1  
[086] getglobal  4   22       ; tonumber
[087] self       5   0   266  ; "read"
[088] loadk      7   23       ; 4
[089] call       5   3   0  
[090] call       4   0   2  
[091] move       1   4      
[092] getglobal  4   0        ; io
[093] gettable   4   4   251  ; "write"
[094] loadk      5   2        ; "\n"
[095] getglobal  6   3        ; os
[096] gettable   6   6   254  ; "date"
[097] loadk      7   5        ; "%c "
[098] call       6   2   2  
[099] loadk      7   25       ; "dynamic stamp is version "
[100] getglobal  8   7        ; tostring
[101] move       9   1      
[102] call       8   2   0  
[103] call       4   0   1  
[104] jmp        14           ; to [119]
[105] getglobal  3   0        ; io
[106] gettable   3   3   251  ; "write"
[107] loadk      4   2        ; "\n"
[108] getglobal  5   3        ; os
[109] gettable   5   5   254  ; "date"
[110] loadk      6   5        ; "%c "
[111] call       5   2   2  
[112] loadk      6   26       ; "dynamic stamp is legacy"
[113] call       3   4   1  
[114] loadk      1   27       ; 0
[115] self       3   0   262  ; "seek"
[116] loadk      5   13       ; "end"
[117] loadk      6   29       ; -80
[118] call       3   4   1  
[119] move       3   0      
[120] move       4   1      
[121] return     3   3      
[122] return     0   1      
; end of function


; function [5] definition (level 2)
; 1 upvalues, 1 params, 15 stacks
.function  1 1 0 15
.local  "f_hfile"  ; 0
.local  "strContentID"  ; 1
.local  "strOTP"  ; 2
.local  "strTrackingID"  ; 3
.local  "strAffiliate"  ; 4
.local  "strCurrency"  ; 5
.local  "strPrice"  ; 6
.local  "strTimestamp"  ; 7
.upvalue  "StringToHex"  ; 0
.const  "read"  ; 0
.const  16  ; 1
.const  6  ; 2
.const  5  ; 3
[01] loadnil    1   7      
[02] getupval   8   0        ; StringToHex
[03] self       9   0   250  ; "read"
[04] loadk      11  1        ; 16
[05] call       9   3   0  
[06] call       8   0   2  
[07] move       1   8      
[08] getupval   8   0        ; StringToHex
[09] self       9   0   250  ; "read"
[10] loadk      11  1        ; 16
[11] call       9   3   0  
[12] call       8   0   2  
[13] move       2   8      
[14] getupval   8   0        ; StringToHex
[15] self       9   0   250  ; "read"
[16] loadk      11  1        ; 16
[17] call       9   3   0  
[18] call       8   0   2  
[19] move       3   8      
[20] self       8   0   250  ; "read"
[21] loadk      10  1        ; 16
[22] call       8   3   2  
[23] move       4   8      
[24] getupval   8   0        ; StringToHex
[25] self       9   0   250  ; "read"
[26] loadk      11  2        ; 6
[27] call       9   3   0  
[28] call       8   0   2  
[29] move       5   8      
[30] getupval   8   0        ; StringToHex
[31] self       9   0   250  ; "read"
[32] loadk      11  3        ; 5
[33] call       9   3   0  
[34] call       8   0   2  
[35] move       6   8      
[36] getupval   8   0        ; StringToHex
[37] self       9   0   250  ; "read"
[38] loadk      11  3        ; 5
[39] call       9   3   0  
[40] call       8   0   2  
[41] move       7   8      
[42] move       8   1      
[43] move       9   2      
[44] move       10  3      
[45] move       11  4      
[46] move       12  5      
[47] move       13  6      
[48] move       14  7      
[49] return     8   8      
[50] return     0   1      
; end of function


; function [6] definition (level 2)
; 2 upvalues, 1 params, 21 stacks
.function  2 1 0 21
.local  "f_hfile"  ; 0
.local  "strContentID"  ; 1
.local  "strOTP"  ; 2
.local  "strTrackingID"  ; 3
.local  "strAffiliate"  ; 4
.local  "strCurrency"  ; 5
.local  "strPrice"  ; 6
.local  "strTimestamp"  ; 7
.local  "strStorefront"  ; 8
.local  "strLanguage"  ; 9
.local  "extratracking"  ; 10
.upvalue  "StringToHex"  ; 0
.upvalue  "RawToString"  ; 1
.const  "read"  ; 0
.const  16  ; 1
.const  6  ; 2
.const  5  ; 3
.const  32  ; 4
.const  8  ; 5
.const  "string"  ; 6
.const  "gsub"  ; 7
.const  120  ; 8
.const  "^%z*"  ; 9
.const  ""  ; 10
.const  "lower"  ; 11
[01] loadnil    1   10     
[02] getupval   11  0        ; StringToHex
[03] self       12  0   250  ; "read"
[04] loadk      14  1        ; 16
[05] call       12  3   0  
[06] call       11  0   2  
[07] move       1   11     
[08] getupval   11  0        ; StringToHex
[09] self       12  0   250  ; "read"
[10] loadk      14  1        ; 16
[11] call       12  3   0  
[12] call       11  0   2  
[13] move       2   11     
[14] getupval   11  0        ; StringToHex
[15] self       12  0   250  ; "read"
[16] loadk      14  1        ; 16
[17] call       12  3   0  
[18] call       11  0   2  
[19] move       3   11     
[20] self       11  0   250  ; "read"
[21] loadk      13  1        ; 16
[22] call       11  3   2  
[23] move       4   11     
[24] getupval   11  0        ; StringToHex
[25] self       12  0   250  ; "read"
[26] loadk      14  2        ; 6
[27] call       12  3   0  
[28] call       11  0   2  
[29] move       5   11     
[30] getupval   11  0        ; StringToHex
[31] self       12  0   250  ; "read"
[32] loadk      14  3        ; 5
[33] call       12  3   0  
[34] call       11  0   2  
[35] move       6   11     
[36] getupval   11  0        ; StringToHex
[37] self       12  0   250  ; "read"
[38] loadk      14  3        ; 5
[39] call       12  3   0  
[40] call       11  0   2  
[41] move       7   11     
[42] getupval   11  1        ; RawToString
[43] self       12  0   250  ; "read"
[44] loadk      14  4        ; 32
[45] call       12  3   0  
[46] call       11  0   2  
[47] move       8   11     
[48] getupval   11  1        ; RawToString
[49] self       12  0   250  ; "read"
[50] loadk      14  5        ; 8
[51] call       12  3   0  
[52] call       11  0   2  
[53] move       9   11     
[54] getupval   11  0        ; StringToHex
[55] getglobal  12  6        ; string
[56] gettable   12  12  257  ; "gsub"
[57] self       13  0   250  ; "read"
[58] loadk      15  8        ; 120
[59] call       13  3   2  
[60] loadk      14  9        ; "^%z*"
[61] loadk      15  10       ; ""
[62] call       12  4   0  
[63] call       11  0   2  
[64] move       10  11     
[65] getglobal  11  6        ; string
[66] gettable   11  11  261  ; "lower"
[67] move       12  8      
[68] call       11  2   2  
[69] move       8   11     
[70] move       11  1      
[71] move       12  2      
[72] move       13  3      
[73] move       14  4      
[74] move       15  5      
[75] move       16  6      
[76] move       17  7      
[77] move       18  8      
[78] move       19  9      
[79] move       20  10     
[80] return     11  11     
[81] return     0   1      
; end of function


; function [7] definition (level 2)
; 2 upvalues, 1 params, 21 stacks
.function  2 1 0 21
.local  "f_hfile"  ; 0
.local  "strContentID"  ; 1
.local  "strOTP"  ; 2
.local  "strTrackingID"  ; 3
.local  "strAffiliate"  ; 4
.local  "strCurrency"  ; 5
.local  "strPrice"  ; 6
.local  "strTimestamp"  ; 7
.local  "strStorefront"  ; 8
.local  "strLanguage"  ; 9
.local  "strGamid"  ; 10
.upvalue  "StringToHex"  ; 0
.upvalue  "RawToString"  ; 1
.const  "read"  ; 0
.const  16  ; 1
.const  6  ; 2
.const  5  ; 3
.const  32  ; 4
.const  8  ; 5
.const  120  ; 6
[01] loadnil    1   10     
[02] getupval   11  0        ; StringToHex
[03] self       12  0   250  ; "read"
[04] loadk      14  1        ; 16
[05] call       12  3   0  
[06] call       11  0   2  
[07] move       1   11     
[08] getupval   11  0        ; StringToHex
[09] self       12  0   250  ; "read"
[10] loadk      14  1        ; 16
[11] call       12  3   0  
[12] call       11  0   2  
[13] move       2   11     
[14] getupval   11  0        ; StringToHex
[15] self       12  0   250  ; "read"
[16] loadk      14  1        ; 16
[17] call       12  3   0  
[18] call       11  0   2  
[19] move       3   11     
[20] self       11  0   250  ; "read"
[21] loadk      13  1        ; 16
[22] call       11  3   2  
[23] move       4   11     
[24] getupval   11  0        ; StringToHex
[25] self       12  0   250  ; "read"
[26] loadk      14  2        ; 6
[27] call       12  3   0  
[28] call       11  0   2  
[29] move       5   11     
[30] getupval   11  0        ; StringToHex
[31] self       12  0   250  ; "read"
[32] loadk      14  3        ; 5
[33] call       12  3   0  
[34] call       11  0   2  
[35] move       6   11     
[36] getupval   11  0        ; StringToHex
[37] self       12  0   250  ; "read"
[38] loadk      14  3        ; 5
[39] call       12  3   0  
[40] call       11  0   2  
[41] move       7   11     
[42] getupval   11  1        ; RawToString
[43] self       12  0   250  ; "read"
[44] loadk      14  4        ; 32
[45] call       12  3   0  
[46] call       11  0   2  
[47] move       8   11     
[48] getupval   11  1        ; RawToString
[49] self       12  0   250  ; "read"
[50] loadk      14  5        ; 8
[51] call       12  3   0  
[52] call       11  0   2  
[53] move       9   11     
[54] getupval   11  1        ; RawToString
[55] self       12  0   250  ; "read"
[56] loadk      14  6        ; 120
[57] call       12  3   0  
[58] call       11  0   2  
[59] move       10  11     
[60] move       11  1      
[61] move       12  2      
[62] move       13  3      
[63] move       14  4      
[64] move       15  5      
[65] move       16  6      
[66] move       17  7      
[67] move       18  8      
[68] move       19  9      
[69] move       20  10     
[70] return     11  11     
[71] return     0   1      
; end of function


; function [8] definition (level 2)
; 1 upvalues, 0 params, 5 stacks
.function  1 0 0 5
.upvalue  "win32"  ; 0
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "setRgiUpgradeFlag"  ; 6
.const  "CreateRegKey"  ; 7
.const  "HKEY_LOCAL_MACHINE"  ; 8
.const  "SOFTWARE\\GameInstaller\\Installer"  ; 9
.const  "upgrade"  ; 10
.const  "inProgress"  ; 11
[01] getglobal  0   0        ; io
[02] gettable   0   0   251  ; "write"
[03] loadk      1   2        ; "\n"
[04] getglobal  2   3        ; os
[05] gettable   2   2   254  ; "date"
[06] loadk      3   5        ; "%c "
[07] call       2   2   2  
[08] loadk      3   6        ; "setRgiUpgradeFlag"
[09] call       0   4   1  
[10] getupval   0   0        ; win32
[11] gettable   0   0   257  ; "CreateRegKey"
[12] loadk      1   8        ; "HKEY_LOCAL_MACHINE"
[13] loadk      2   9        ; "SOFTWARE\\GameInstaller\\Installer"
[14] loadk      3   10       ; "upgrade"
[15] loadk      4   11       ; "inProgress"
[16] call       0   5   1  
[17] return     0   1      
; end of function


; function [9] definition (level 2)
; 1 upvalues, 0 params, 8 stacks
.function  1 0 0 8
.local  "reply"  ; 0
.local  "loc"  ; 1
.upvalue  "win32"  ; 0
.const  "GetRegKeyValue"  ; 0
.const  "HKEY_LOCAL_MACHINE"  ; 1
.const  "SOFTWARE\\GameInstaller\\Installer"  ; 2
.const  "upgrade"  ; 3
.const  ""  ; 4
.const  "DeleteRegKey"  ; 5
.const  "io"  ; 6
.const  "write"  ; 7
.const  "\n"  ; 8
.const  "os"  ; 9
.const  "date"  ; 10
.const  "%c "  ; 11
.const  "hasRgiUpgradeFlag == "  ; 12
.const  "tostring"  ; 13
[01] loadbool   0   0   0    ; false
[02] getupval   1   0        ; win32
[03] gettable   1   1   250  ; "GetRegKeyValue"
[04] loadk      2   1        ; "HKEY_LOCAL_MACHINE"
[05] loadk      3   2        ; "SOFTWARE\\GameInstaller\\Installer"
[06] loadk      4   3        ; "upgrade"
[07] call       1   4   2  
[08] test       1   1   0    ; to [10] if true
[09] jmp        9            ; to [19]
[10] eq         1   1   254  ; "", to [12] if false
[11] jmp        7            ; to [19]
[12] getupval   2   0        ; win32
[13] gettable   2   2   255  ; "DeleteRegKey"
[14] loadk      3   1        ; "HKEY_LOCAL_MACHINE"
[15] loadk      4   2        ; "SOFTWARE\\GameInstaller\\Installer"
[16] loadk      5   3        ; "upgrade"
[17] call       2   4   1  
[18] loadbool   0   1   0    ; true
[19] getglobal  2   6        ; io
[20] gettable   2   2   257  ; "write"
[21] loadk      3   8        ; "\n"
[22] getglobal  4   9        ; os
[23] gettable   4   4   260  ; "date"
[24] loadk      5   11       ; "%c "
[25] call       4   2   2  
[26] loadk      5   12       ; "hasRgiUpgradeFlag == "
[27] getglobal  6   13       ; tostring
[28] move       7   0      
[29] call       6   2   0  
[30] call       2   0   1  
[31] return     0   2      
[32] return     0   1      
; end of function


; function [10] definition (level 2)
; 1 upvalues, 0 params, 6 stacks
.function  1 0 0 6
.local  "loc"  ; 0
.upvalue  "win32"  ; 0
.const  "GetRegKeyValue"  ; 0
.const  "HKEY_LOCAL_MACHINE"  ; 1
.const  "SOFTWARE\\GameInstaller\\Installer"  ; 2
.const  "Location"  ; 3
.const  ""  ; 4
.const  "g_constants"  ; 5
.const  "installerLoc"  ; 6
.const  "io"  ; 7
.const  "touch"  ; 8
.const  "g_env"  ; 9
.const  "programFiles"  ; 10
.const  "\\RealArcade\\Installer\\config.lua"  ; 11
.const  "\\RealArcade\\Installer"  ; 12
.const  "INSTALLER_LOCATION"  ; 13
.const  "write"  ; 14
.const  "\n"  ; 15
.const  "os"  ; 16
.const  "date"  ; 17
.const  "%c "  ; 18
.const  "installerLoc =  "  ; 19
[01] getupval   0   0        ; win32
[02] gettable   0   0   250  ; "GetRegKeyValue"
[03] loadk      1   1        ; "HKEY_LOCAL_MACHINE"
[04] loadk      2   2        ; "SOFTWARE\\GameInstaller\\Installer"
[05] loadk      3   3        ; "Location"
[06] call       0   4   2  
[07] test       0   0   0    ; to [9] if true
[08] jmp        5            ; to [14]
[09] eq         1   0   254  ; "", to [11] if false
[10] jmp        3            ; to [14]
[11] getglobal  1   5        ; g_constants
[12] settable   1   256 0    ; "installerLoc"
[13] jmp        22           ; to [36]
[14] getglobal  1   7        ; io
[15] gettable   1   1   258  ; "touch"
[16] getglobal  2   9        ; g_env
[17] gettable   2   2   260  ; "programFiles"
[18] loadk      3   11       ; "\\RealArcade\\Installer\\config.lua"
[19] concat     2   2   3  
[20] call       1   2   2  
[21] test       1   1   0    ; to [23] if true
[22] jmp        7            ; to [30]
[23] getglobal  1   5        ; g_constants
[24] getglobal  2   9        ; g_env
[25] gettable   2   2   260  ; "programFiles"
[26] loadk      3   12       ; "\\RealArcade\\Installer"
[27] concat     2   2   3  
[28] settable   1   256 2    ; "installerLoc"
[29] jmp        6            ; to [36]
[30] getglobal  1   5        ; g_constants
[31] getglobal  2   9        ; g_env
[32] gettable   2   2   260  ; "programFiles"
[33] getglobal  3   13       ; INSTALLER_LOCATION
[34] concat     2   2   3  
[35] settable   1   256 2    ; "installerLoc"
[36] getglobal  1   7        ; io
[37] gettable   1   1   264  ; "write"
[38] loadk      2   15       ; "\n"
[39] getglobal  3   16       ; os
[40] gettable   3   3   267  ; "date"
[41] loadk      4   18       ; "%c "
[42] call       3   2   2  
[43] loadk      4   19       ; "installerLoc =  "
[44] getglobal  5   5        ; g_constants
[45] gettable   5   5   256  ; "installerLoc"
[46] call       1   5   1  
[47] return     0   1      
; end of function


; function [11] definition (level 2)
; 3 upvalues, 0 params, 8 stacks
.function  3 0 0 8
.local  "newLogName"  ; 0
.local  "oldLog"  ; 1
.upvalue  "win32"  ; 0
.upvalue  "pid"  ; 1
.upvalue  "newLog"  ; 2
.const  "installLog"  ; 0
.const  "tostring"  ; 1
.const  "GetPid"  ; 2
.const  ".txt"  ; 3
.const  "io"  ; 4
.const  "write"  ; 5
.const  "\n"  ; 6
.const  "os"  ; 7
.const  "date"  ; 8
.const  "%c "  ; 9
.const  "Starting new log "  ; 10
.const  "flush"  ; 11
.const  "open"  ; 12
.const  "w"  ; 13
.const  "LogMessage"  ; 14
.const  "New log started for  "  ; 15
.const  " h = "  ; 16
.const  "output"  ; 17
.const  "close"  ; 18
[01] loadk      0   0        ; "installLog"
[02] getglobal  1   1        ; tostring
[03] getupval   2   0        ; win32
[04] gettable   2   2   252  ; "GetPid"
[05] call       2   1   0  
[06] call       1   0   2  
[07] loadk      2   3        ; ".txt"
[08] concat     0   0   2  
[09] getglobal  1   4        ; io
[10] gettable   1   1   255  ; "write"
[11] loadk      2   6        ; "\n"
[12] getglobal  3   7        ; os
[13] gettable   3   3   258  ; "date"
[14] loadk      4   9        ; "%c "
[15] call       3   2   2  
[16] getupval   4   1        ; pid
[17] loadk      5   10       ; "Starting new log "
[18] move       6   0      
[19] loadk      7   6        ; "\n"
[20] call       1   7   1  
[21] getglobal  1   4        ; io
[22] gettable   1   1   261  ; "flush"
[23] call       1   1   1  
[24] getglobal  1   4        ; io
[25] gettable   1   1   262  ; "open"
[26] move       2   0      
[27] loadk      3   13       ; "w"
[28] call       1   3   2  
[29] setupval   1   2        ; newLog
[30] getupval   1   0        ; win32
[31] gettable   1   1   264  ; "LogMessage"
[32] getglobal  2   7        ; os
[33] gettable   2   2   258  ; "date"
[34] loadk      3   9        ; "%c "
[35] call       2   2   2  
[36] loadk      3   15       ; "New log started for  "
[37] move       4   0      
[38] loadk      5   16       ; " h = "
[39] getglobal  6   1        ; tostring
[40] getupval   7   2        ; newLog
[41] call       6   2   2  
[42] concat     2   2   6  
[43] call       1   2   1  
[44] getupval   1   2        ; newLog
[45] test       1   1   0    ; to [47] if true
[46] jmp        25           ; to [72]
[47] getglobal  1   4        ; io
[48] gettable   1   1   267  ; "output"
[49] call       1   1   2  
[50] getglobal  2   4        ; io
[51] gettable   2   2   267  ; "output"
[52] getupval   3   2        ; newLog
[53] call       2   2   1  
[54] getglobal  2   4        ; io
[55] gettable   2   2   255  ; "write"
[56] loadk      3   6        ; "\n"
[57] getglobal  4   7        ; os
[58] gettable   4   4   258  ; "date"
[59] loadk      5   9        ; "%c "
[60] call       4   2   2  
[61] getupval   5   1        ; pid
[62] loadk      6   15       ; "New log started for  "
[63] move       7   0      
[64] call       2   6   1  
[65] getglobal  2   4        ; io
[66] gettable   2   2   261  ; "flush"
[67] call       2   1   1  
[68] getglobal  2   4        ; io
[69] gettable   2   2   268  ; "close"
[70] move       3   1      
[71] call       2   2   1  
[72] return     0   1      
; end of function


; function [12] definition (level 2)
; 19 upvalues, 1 params, 2 stacks
.function  19 1 0 2
.local  "silent"  ; 0
.upvalue  "Init"  ; 0
.upvalue  "pidid"  ; 1
.upvalue  "pid"  ; 2
.upvalue  "win32"  ; 3
.upvalue  "g_strPathSFX"  ; 4
.upvalue  "GetDynamicStampVersion"  ; 5
.upvalue  "ReadLegacyStampValues"  ; 6
.upvalue  "ReadVersion1StampValues"  ; 7
.upvalue  "ReadVersion2StampValues"  ; 8
.upvalue  "StringToHex"  ; 9
.upvalue  "SplashURL"  ; 10
.upvalue  "SetInstallerLoc"  ; 11
.upvalue  "mutex"  ; 12
.upvalue  "StartNewLog"  ; 13
.upvalue  "hasRgiUpgradeFlag"  ; 14
.upvalue  "errHandler"  ; 15
.upvalue  "g_gameIdMutex"  ; 16
.upvalue  "ShutDown"  ; 17
.upvalue  "Error"  ; 18

; function [0] definition (level 3)
; 17 upvalues, 0 params, 30 stacks
.function  17 0 0 30
.local  "shellCtl"  ; 0
.local  "GetDynamicStamp"  ; 1
.local  "GetSplashScreenDimensions"  ; 2
.local  "AreSerialDownloadsRequired"  ; 3
.local  "ui"  ; 4
.local  "workDir"  ; 5
.local  "splashMutex"  ; 6
.local  "splashLock"  ; 7
.local  "width"  ; 8
.local  "height"  ; 9
.local  "mode"  ; 10
.local  "splashUICreated"  ; 11
.local  "interpreter"  ; 12
.local  "dwnldMgr"  ; 13
.local  "serialDownLoads"  ; 14
.local  "m"  ; 15
.local  "t"  ; 16
.local  "lockedMutex"  ; 17
.local  "cmdAgs"  ; 18
.local  "ogmArgs"  ; 19
.local  "bstrapInstall"  ; 20
.local  "firstTry"  ; 21
.local  "t"  ; 22
.local  "procMgr"  ; 23
.local  "gamesRoot"  ; 24
.local  "recover"  ; 25
.local  "requestURL"  ; 26
.local  "strURLTemplates"  ; 27
.local  "ipairs"  ; 28
.local  "tableStampParameters"  ; 29
.local  "state"  ; 30
.local  "xmlMutex"  ; 31
.local  "gameIdMutexName"  ; 32
.local  "racver"  ; 33
.local  "mainapp"  ; 34
.upvalue  "pidid"  ; 0
.upvalue  "pid"  ; 1
.upvalue  "win32"  ; 2
.upvalue  "g_strPathSFX"  ; 3
.upvalue  "silent"  ; 4
.upvalue  "GetDynamicStampVersion"  ; 5
.upvalue  "ReadLegacyStampValues"  ; 6
.upvalue  "ReadVersion1StampValues"  ; 7
.upvalue  "ReadVersion2StampValues"  ; 8
.upvalue  "StringToHex"  ; 9
.upvalue  "SplashURL"  ; 10
.upvalue  "SetInstallerLoc"  ; 11
.upvalue  "mutex"  ; 12
.upvalue  "StartNewLog"  ; 13
.upvalue  "hasRgiUpgradeFlag"  ; 14
.upvalue  "errHandler"  ; 15
.upvalue  "g_gameIdMutex"  ; 16
.const  "luacom"  ; 0
.const  "CreateObject"  ; 1
.const  "StubbyUtil.ShellCtl"  ; 2
.const  "tostring"  ; 3
.const  "GetPid"  ; 4
.const  "=> "  ; 5
.const  "LogMessage"  ; 6
.const  "os"  ; 7
.const  "date"  ; 8
.const  "%c "  ; 9
.const  "Stubby started for pid: "  ; 10
.const  "g_env"  ; 11
.const  "programFiles"  ; 12
.const  "MakePathFilesWriteable"  ; 13
.const  "\\RealArcade"  ; 14
.const  "GetSFXPath"  ; 15
.const  "io"  ; 16
.const  "write"  ; 17
.const  "\n"  ; 18
.const  "GetSFXPath = "  ; 19
.const  ". Silent: "  ; 20
.const  "using command line SFXPath "  ; 21
.const  "checkRequiredFiles"  ; 22
.const  "DoVersionsMatch"  ; 23
.const  "InstallerUI"  ; 24
.const  "Created a NullUI"  ; 25
.const  "NullUI"  ; 26
.const  "WorkingDir"  ; 27
.const  "Mutex"  ; 28
.const  "RACV2InstallerSplash"  ; 29
.const  "Try lock splashMutex"  ; 30
.const  "Lock"  ; 31
.const  "Acquired splashMutex"  ; 32
.const  "Create"  ; 33
.const  "Navigate"  ; 34
.const  "wait.html"  ; 35
.const  "MetadataInterp"  ; 36
.const  "DownloadMgr"  ; 37
.const  "installerLoc =  "  ; 38
.const  "g_constants"  ; 39
.const  "installerLoc"  ; 40
.const  "workDir =  "  ; 41
.const  "RACV2InstallerStopSplash"  ; 42
.const  "clock"  ; 43
.const  1  ; 44
.const  "Wait for splashMutex"  ; 45
.const  "Wait"  ; 46
.const  -1  ; 47
.const  "Acquired splashMutex after wait"  ; 48
.const  "FAILED to acquired splashMutex"  ; 49
.const  "reply"  ; 50
.const  "RACV2InstallerInst"  ; 51
.const  "waitProc.html"  ; 52
.const  "Overwriting installer at "  ; 53
.const  " with "  ; 54
.const  "LocalCopy"  ; 55
.const  "\\bin\\gameinstaller.exe"  ; 56
.const  "\\bin\\gamewrapper.exe"  ; 57
.const  "silent"  ; 58
.const  "sfx:\""  ; 59
.const  "\""  ; 60
.const  "g_ogmid"  ; 61
.const  "g_ogmport"  ; 62
.const  " --ogmid:"  ; 63
.const  ",ogmport:"  ; 64
.const  "\\bin\\bstrapInstall.exe"  ; 65
.const  "Restarting Installer..."  ; 66
.const  " cmdAgs: "  ; 67
.const  "ExecuteCommand"  ; 68
.const  "Release mutex"  ; 69
.const  "Release"  ; 70
.const  "Close"  ; 71
.const  "Wait "  ; 72
.const  "stubbysplashseconds"  ; 73
.const  " seconds for launched process to come up"  ; 74
.const  0.5  ; 75
.const  "exiting first-stage Installer\n"  ; 76
.const  "flush"  ; 77
.const  "exit"  ; 78
.const  "g_exit"  ; 79
.const  "success"  ; 80
.const  "Release splashMutex."  ; 81
.const  "splashMutex not owned by this thread"  ; 82
.const  "See if previous install passed Eula"  ; 83
.const  "nth Version waiting for reg key update"  ; 84
.const  "Hide"  ; 85
.const  "StubbyUtil.ProcessMgr"  ; 86
.const  "wait for mutex or \""  ; 87
.const  "basekey"  ; 88
.const  "g_storeFront"  ; 89
.const  "\\1.0\\Preferences\" regkey to indicate past Eula"  ; 90
.const  "Acquired mutex. Safe(ish) to proceed"  ; 91
.const  "Past mutex skip Eula wait"  ; 92
.const  "RACConfigValue"  ; 93
.const  "gamesrootkey"  ; 94
.const  "Read"  ; 95
.const  ""  ; 96
.const  " = "  ; 97
.const  " updated. Safe(ish) to proceed"  ; 98
.const  "Past Eula skip mutex wait"  ; 99
.const  "Sleep"  ; 100
.const  1000  ; 101
.const  "Acquired mutex again or skipped???"  ; 102
.const  "Show"  ; 103
.const  "Virgin Version updating reg keys"  ; 104
.const  "CreateRegKey"  ; 105
.const  "HKEY_LOCAL_MACHINE"  ; 106
.const  "SOFTWARE\\GameInstaller\\Installer"  ; 107
.const  "Version"  ; 108
.const  "INSTALLER_VER"  ; 109
.const  "Location"  ; 110
.const  "RegisterInstallerType"  ; 111
.const  "itmUrl"  ; 112
.const  "string"  ; 113
.const  "length"  ; 114
.const  0  ; 115
.const  "RequestURLParams"  ; 116
.const  "GetMatchingURLs"  ; 117
.const  "g_tps"  ; 118
.const  "contentid"  ; 119
.const  "otp"  ; 120
.const  "tracking"  ; 121
.const  "affiliate"  ; 122
.const  "currency"  ; 123
.const  "price"  ; 124
.const  "timestamp"  ; 125
.const  "language"  ; 126
.const  "table"  ; 127
.const  "getn"  ; 128
.const  "stamp parameter = "  ; 129
.const  "main_env"  ; 130
.const  "&"  ; 131
.const  "="  ; 132
.const  "adding stamp parameter "  ; 133
.const  " value = "  ; 134
.const  " value = nil"  ; 135
.const  "state"  ; 136
.const  "upgrade"  ; 137
.const  "start"  ; 138
.const  "LogPing"  ; 139
.const  "field"  ; 140
.const  "src"  ; 141
.const  "component"  ; 142
.const  "dwnldevt"  ; 143
.const  "XML Overrides load = "  ; 144
.const  "g_tableConfig"  ; 145
.const  "strPathXMLLoad"  ; 146
.const  " save = "  ; 147
.const  "strPathXMLSave"  ; 148
.const  "RACV2InstallerXml"  ; 149
.const  "Wait for xmlMutex"  ; 150
.const  "PathXMLLoad"  ; 151
.const  "Loading payload xml from disk file "  ; 152
.const  "LoadXML"  ; 153
.const  "Requesting payload xml from "  ; 154
.const  "GetFile"  ; 155
.const  "tmp.xml"  ; 156
.const  "PathXMLSave"  ; 157
.const  "DeleteFile"  ; 158
.const  "RACV2InstallerGameId"  ; 159
.const  "curGameId"  ; 160
.const  "Wait for "  ; 161
.const  "Acquired for "  ; 162
.const  "ArcadeVersion"  ; 163
.const  "MainApp"  ; 164
.const  "touch"  ; 165
.const  "DownloadQueue"  ; 166
.const  "Add"  ; 167
.const  "SetCandyOptions"  ; 168
.const  "InitEngine"  ; 169
.const  "Run"  ; 170

; function [0] definition (level 4)
; 7 upvalues, 0 params, 23 stacks
.function  7 0 0 23
.local  "gameid"  ; 0
.local  "hfile"  ; 1
.local  "idVersion"  ; 2
.local  "affiliate"  ; 3
.local  "DynamicStamp"  ; 4
.local  "strStoreFront"  ; 5
.local  "storeFront"  ; 6
.upvalue  "GetDynamicStampVersion"  ; 0
.upvalue  "ReadLegacyStampValues"  ; 1
.upvalue  "g_strPathSFX"  ; 2
.upvalue  "pid"  ; 3
.upvalue  "ReadVersion1StampValues"  ; 4
.upvalue  "ReadVersion2StampValues"  ; 5
.upvalue  "StringToHex"  ; 6
.const  "Dynamic stamp "  ; 0
.const  0  ; 1
.const  "main_env"  ; 2
.const  "contentid"  ; 3
.const  "otp"  ; 4
.const  "tracking"  ; 5
.const  "currency"  ; 6
.const  "price"  ; 7
.const  "timestamp"  ; 8
.const  "_"  ; 9
.const  "string"  ; 10
.const  "find"  ; 11
.const  ""  ; 12
.const  "\\([%w]+)-[%w]?([%w-_]*)%s*[%[%(]?%d?[%]%)]?%.exe"  ; 13
.const  "io"  ; 14
.const  "write"  ; 15
.const  "\n"  ; 16
.const  "os"  ; 17
.const  "date"  ; 18
.const  "%c "  ; 19
.const  "l_storeFront = "  ; 20
.const  "tostring"  ; 21
.const  "g_storeFront"  ; 22
.const  "lower"  ; 23
.const  1  ; 24
.const  "language"  ; 25
.const  "extratracking"  ; 26
.const  "extratracking = "  ; 27
.const  "."  ; 28
.const  2  ; 29
.const  "g_stampedgameid"  ; 30
.const  "gsub"  ; 31
.const  "%z+"  ; 32
.const  "Gamehouse"  ; 33
.const  "g_stampedgameid = "  ; 34
.const  "g_storeFront = "  ; 35
.const  "assert"  ; 36
.const  "badFilename"  ; 37
.const  "close"  ; 38
.const  "affiliate"  ; 39
.const  "g_env"  ; 40
.const  "curTps"  ; 41
.const  "contentid = "  ; 42
.const  "OTP = "  ; 43
.const  "tracking = "  ; 44
.const  "affiliate string = "  ; 45
.const  "Undefined"  ; 46
.const  "affiliate = "  ; 47
.const  "currency = "  ; 48
.const  "price = "  ; 49
.const  "timestamp = "  ; 50
.const  "language = "  ; 51
.const  "Can not get dynamic stamp info from "  ; 52
[001] loadnil    0   3      
[002] loadk      4   0        ; "Dynamic stamp "
[003] getupval   5   0        ; GetDynamicStampVersion
[004] call       5   1   3  
[005] move       2   6      
[006] move       1   5      
[007] eq         0   2   251  ; 0, to [9] if true
[008] jmp        49           ; to [58]
[009] loadnil    5   5      
[010] getglobal  6   2        ; main_env
[011] getglobal  7   2        ; main_env
[012] getglobal  8   2        ; main_env
[013] getglobal  9   2        ; main_env
[014] getglobal  10  2        ; main_env
[015] getglobal  11  2        ; main_env
[016] getupval   12  1        ; ReadLegacyStampValues
[017] move       13  1      
[018] call       12  2   8  
[019] settable   11  258 18   ; "timestamp"
[020] settable   10  257 17   ; "price"
[021] settable   9   256 16   ; "currency"
[022] move       3   15     
[023] settable   8   255 14   ; "tracking"
[024] settable   7   254 13   ; "otp"
[025] settable   6   253 12   ; "contentid"
[026] getglobal  6   10       ; string
[027] gettable   6   6   261  ; "find"
[028] getupval   7   2        ; g_strPathSFX
[029] test       7   7   1    ; to [31] if false
[030] jmp        1            ; to [32]
[031] loadk      7   12       ; ""
[032] loadk      8   13       ; "\\([%w]+)-[%w]?([%w-_]*)%s*[%[%(]?%d?[%]%)]?%.exe"
[033] call       6   3   4  
[034] move       5   8      
[035] setglobal  7   9        ; _
[036] setglobal  6   9        ; _
[037] getglobal  6   14       ; io
[038] gettable   6   6   265  ; "write"
[039] loadk      7   16       ; "\n"
[040] getglobal  8   17       ; os
[041] gettable   8   8   268  ; "date"
[042] loadk      9   19       ; "%c "
[043] call       8   2   2  
[044] getupval   9   3        ; pid
[045] loadk      10  20       ; "l_storeFront = "
[046] getglobal  11  21       ; tostring
[047] move       12  5      
[048] call       11  2   0  
[049] call       6   0   1  
[050] getglobal  6   10       ; string
[051] gettable   6   6   273  ; "lower"
[052] getglobal  7   21       ; tostring
[053] move       8   5      
[054] call       7   2   0  
[055] call       6   0   2  
[056] setglobal  6   22       ; g_storeFront
[057] jmp        109          ; to [167]
[058] eq         0   2   274  ; 1, to [60] if true
[059] jmp        37           ; to [97]
[060] getglobal  5   2        ; main_env
[061] getglobal  6   2        ; main_env
[062] getglobal  7   2        ; main_env
[063] getglobal  8   2        ; main_env
[064] getglobal  9   2        ; main_env
[065] getglobal  10  2        ; main_env
[066] getglobal  11  2        ; main_env
[067] getglobal  12  2        ; main_env
[068] getupval   13  4        ; ReadVersion1StampValues
[069] move       14  1      
[070] call       13  2   11 
[071] settable   12  276 22   ; "extratracking"
[072] settable   11  275 21   ; "language"
[073] setglobal  20  22       ; g_storeFront
[074] settable   10  258 19   ; "timestamp"
[075] settable   9   257 18   ; "price"
[076] settable   8   256 17   ; "currency"
[077] move       3   16     
[078] settable   7   255 15   ; "tracking"
[079] settable   6   254 14   ; "otp"
[080] settable   5   253 13   ; "contentid"
[081] getglobal  5   14       ; io
[082] gettable   5   5   265  ; "write"
[083] loadk      6   16       ; "\n"
[084] getglobal  7   17       ; os
[085] gettable   7   7   268  ; "date"
[086] loadk      8   19       ; "%c "
[087] call       7   2   2  
[088] move       8   4      
[089] loadk      9   27       ; "extratracking = "
[090] getglobal  10  21       ; tostring
[091] getglobal  11  2        ; main_env
[092] gettable   11  11  276  ; "extratracking"
[093] call       10  2   2  
[094] loadk      11  28       ; "."
[095] call       5   7   1  
[096] jmp        70           ; to [167]
[097] eq         0   2   279  ; 2, to [99] if true
[098] jmp        64           ; to [163]
[099] loadnil    5   5      
[100] getglobal  6   2        ; main_env
[101] getglobal  7   2        ; main_env
[102] getglobal  8   2        ; main_env
[103] getglobal  9   2        ; main_env
[104] getglobal  10  2        ; main_env
[105] getglobal  11  2        ; main_env
[106] getupval   12  5        ; ReadVersion2StampValues
[107] move       13  1      
[108] call       12  2   11 
[109] setglobal  21  30       ; g_stampedgameid
[110] setglobal  20  9        ; _
[111] move       5   19     
[112] settable   11  258 18   ; "timestamp"
[113] settable   10  257 17   ; "price"
[114] settable   9   256 16   ; "currency"
[115] move       3   15     
[116] settable   8   255 14   ; "tracking"
[117] settable   7   254 13   ; "otp"
[118] settable   6   253 12   ; "contentid"
[119] test       5   5   0    ; to [121] if true
[120] jmp        13           ; to [134]
[121] getglobal  6   10       ; string
[122] gettable   6   6   273  ; "lower"
[123] move       7   5      
[124] call       6   2   2  
[125] move       5   6      
[126] getglobal  6   10       ; string
[127] gettable   6   6   281  ; "gsub"
[128] move       7   5      
[129] loadk      8   32       ; "%z+"
[130] loadk      9   12       ; ""
[131] call       6   4   2  
[132] setglobal  6   22       ; g_storeFront
[133] jmp        2            ; to [136]
[134] loadk      6   33       ; "Gamehouse"
[135] setglobal  6   22       ; g_storeFront
[136] getglobal  6   14       ; io
[137] gettable   6   6   265  ; "write"
[138] loadk      7   16       ; "\n"
[139] getglobal  8   17       ; os
[140] gettable   8   8   268  ; "date"
[141] loadk      9   19       ; "%c "
[142] call       8   2   2  
[143] move       9   4      
[144] loadk      10  34       ; "g_stampedgameid = "
[145] getglobal  11  21       ; tostring
[146] getglobal  12  30       ; g_stampedgameid
[147] call       11  2   0  
[148] call       6   0   1  
[149] getglobal  6   14       ; io
[150] gettable   6   6   265  ; "write"
[151] loadk      7   16       ; "\n"
[152] getglobal  8   17       ; os
[153] gettable   8   8   268  ; "date"
[154] loadk      9   19       ; "%c "
[155] call       8   2   2  
[156] move       9   4      
[157] loadk      10  35       ; "g_storeFront = "
[158] getglobal  11  21       ; tostring
[159] getglobal  12  22       ; g_storeFront
[160] call       11  2   0  
[161] call       6   0   1  
[162] jmp        4            ; to [167]
[163] getglobal  5   36       ; assert
[164] loadnil    6   6      
[165] loadk      7   37       ; "badFilename"
[166] call       5   3   1  
[167] self       5   1   288  ; "close"
[168] call       5   2   1  
[169] getglobal  5   2        ; main_env
[170] gettable   5   5   253  ; "contentid"
[171] test       5   5   0    ; to [173] if true
[172] jmp        151          ; to [324]
[173] getglobal  5   2        ; main_env
[174] gettable   5   5   254  ; "otp"
[175] test       5   5   0    ; to [177] if true
[176] jmp        147          ; to [324]
[177] getglobal  5   2        ; main_env
[178] gettable   5   5   255  ; "tracking"
[179] test       5   5   0    ; to [181] if true
[180] jmp        143          ; to [324]
[181] test       3   3   0    ; to [183] if true
[182] jmp        141          ; to [324]
[183] getglobal  5   2        ; main_env
[184] gettable   5   5   256  ; "currency"
[185] test       5   5   0    ; to [187] if true
[186] jmp        137          ; to [324]
[187] getglobal  5   2        ; main_env
[188] gettable   5   5   257  ; "price"
[189] test       5   5   0    ; to [191] if true
[190] jmp        133          ; to [324]
[191] getglobal  5   2        ; main_env
[192] gettable   5   5   258  ; "timestamp"
[193] test       5   5   0    ; to [195] if true
[194] jmp        129          ; to [324]
[195] getglobal  5   2        ; main_env
[196] getupval   6   6        ; StringToHex
[197] move       7   3      
[198] call       6   2   2  
[199] settable   5   289 6    ; "affiliate"
[200] getglobal  5   40       ; g_env
[201] getglobal  6   10       ; string
[202] gettable   6   6   281  ; "gsub"
[203] move       7   3      
[204] loadk      8   32       ; "%z+"
[205] loadk      9   12       ; ""
[206] call       6   4   2  
[207] settable   5   291 6    ; "curTps"
[208] getglobal  5   2        ; main_env
[209] gettable   0   5   253  ; "contentid"
[210] getglobal  5   14       ; io
[211] gettable   5   5   265  ; "write"
[212] loadk      6   16       ; "\n"
[213] getglobal  7   17       ; os
[214] gettable   7   7   268  ; "date"
[215] loadk      8   19       ; "%c "
[216] call       7   2   2  
[217] move       8   4      
[218] loadk      9   42       ; "contentid = "
[219] getglobal  10  2        ; main_env
[220] gettable   10  10  253  ; "contentid"
[221] call       5   6   1  
[222] getglobal  5   14       ; io
[223] gettable   5   5   265  ; "write"
[224] loadk      6   16       ; "\n"
[225] getglobal  7   17       ; os
[226] gettable   7   7   268  ; "date"
[227] loadk      8   19       ; "%c "
[228] call       7   2   2  
[229] move       8   4      
[230] loadk      9   43       ; "OTP = "
[231] getglobal  10  2        ; main_env
[232] gettable   10  10  254  ; "otp"
[233] call       5   6   1  
[234] getglobal  5   14       ; io
[235] gettable   5   5   265  ; "write"
[236] loadk      6   16       ; "\n"
[237] getglobal  7   17       ; os
[238] gettable   7   7   268  ; "date"
[239] loadk      8   19       ; "%c "
[240] call       7   2   2  
[241] move       8   4      
[242] loadk      9   44       ; "tracking = "
[243] getglobal  10  2        ; main_env
[244] gettable   10  10  255  ; "tracking"
[245] call       5   6   1  
[246] getglobal  5   14       ; io
[247] gettable   5   5   265  ; "write"
[248] loadk      6   16       ; "\n"
[249] getglobal  7   17       ; os
[250] gettable   7   7   268  ; "date"
[251] loadk      8   19       ; "%c "
[252] call       7   2   2  
[253] move       8   4      
[254] loadk      9   45       ; "affiliate string = "
[255] getglobal  10  40       ; g_env
[256] gettable   10  10  291  ; "curTps"
[257] test       10  10  1    ; to [259] if false
[258] jmp        1            ; to [260]
[259] loadk      10  46       ; "Undefined"
[260] call       5   6   1  
[261] getglobal  5   14       ; io
[262] gettable   5   5   265  ; "write"
[263] loadk      6   16       ; "\n"
[264] getglobal  7   17       ; os
[265] gettable   7   7   268  ; "date"
[266] loadk      8   19       ; "%c "
[267] call       7   2   2  
[268] move       8   4      
[269] loadk      9   47       ; "affiliate = "
[270] getglobal  10  2        ; main_env
[271] gettable   10  10  289  ; "affiliate"
[272] call       5   6   1  
[273] getglobal  5   14       ; io
[274] gettable   5   5   265  ; "write"
[275] loadk      6   16       ; "\n"
[276] getglobal  7   17       ; os
[277] gettable   7   7   268  ; "date"
[278] loadk      8   19       ; "%c "
[279] call       7   2   2  
[280] move       8   4      
[281] loadk      9   48       ; "currency = "
[282] getglobal  10  2        ; main_env
[283] gettable   10  10  256  ; "currency"
[284] call       5   6   1  
[285] getglobal  5   14       ; io
[286] gettable   5   5   265  ; "write"
[287] loadk      6   16       ; "\n"
[288] getglobal  7   17       ; os
[289] gettable   7   7   268  ; "date"
[290] loadk      8   19       ; "%c "
[291] call       7   2   2  
[292] move       8   4      
[293] loadk      9   49       ; "price = "
[294] getglobal  10  2        ; main_env
[295] gettable   10  10  257  ; "price"
[296] call       5   6   1  
[297] getglobal  5   14       ; io
[298] gettable   5   5   265  ; "write"
[299] loadk      6   16       ; "\n"
[300] getglobal  7   17       ; os
[301] gettable   7   7   268  ; "date"
[302] loadk      8   19       ; "%c "
[303] call       7   2   2  
[304] move       8   4      
[305] loadk      9   50       ; "timestamp = "
[306] getglobal  10  2        ; main_env
[307] gettable   10  10  258  ; "timestamp"
[308] call       5   6   1  
[309] getglobal  5   14       ; io
[310] gettable   5   5   265  ; "write"
[311] loadk      6   16       ; "\n"
[312] getglobal  7   17       ; os
[313] gettable   7   7   268  ; "date"
[314] loadk      8   19       ; "%c "
[315] call       7   2   2  
[316] move       8   4      
[317] loadk      9   51       ; "language = "
[318] getglobal  10  21       ; tostring
[319] getglobal  11  2        ; main_env
[320] gettable   11  11  275  ; "language"
[321] call       10  2   0  
[322] call       5   0   1  
[323] jmp        11           ; to [335]
[324] getglobal  5   14       ; io
[325] gettable   5   5   265  ; "write"
[326] loadk      6   16       ; "\n"
[327] getglobal  7   17       ; os
[328] gettable   7   7   268  ; "date"
[329] loadk      8   19       ; "%c "
[330] call       7   2   2  
[331] getupval   8   3        ; pid
[332] loadk      9   52       ; "Can not get dynamic stamp info from "
[333] getupval   10  2        ; g_strPathSFX
[334] call       5   6   1  
[335] return     0   1      
; end of function


; function [1] definition (level 4)
; 0 upvalues, 0 params, 6 stacks
.function  0 0 0 6
.local  "width"  ; 0
.local  "height"  ; 1
.local  "mode"  ; 2
.const  "tostring"  ; 0
.const  "g_storeFront"  ; 1
.const  "zylom"  ; 2
.const  800  ; 3
.const  668  ; 4
.const  2  ; 5
[01] loadnil    0   2      
[02] getglobal  3   0        ; tostring
[03] getglobal  4   1        ; g_storeFront
[04] call       3   2   2  
[05] eq         0   3   252  ; "zylom", to [7] if true
[06] jmp        3            ; to [10]
[07] loadk      0   3        ; 800
[08] loadk      1   4        ; 668
[09] loadk      2   5        ; 2
[10] move       3   0      
[11] move       4   1      
[12] move       5   2      
[13] return     3   4      
[14] return     0   1      
; end of function


; function [2] definition (level 4)
; 1 upvalues, 1 params, 10 stacks
.function  1 1 0 10
.local  "tableOfPaths"  ; 0
.local  "(for generator)"  ; 1
.local  "(for state)"  ; 2
.local  "i"  ; 3
.local  "v"  ; 4
.upvalue  "win32"  ; 0
.const  "pairs"  ; 0
.const  "FileExists"  ; 1
.const  "io"  ; 2
.const  "write"  ; 3
.const  "\n"  ; 4
.const  "os"  ; 5
.const  "date"  ; 6
.const  "%c "  ; 7
.const  "DoVersionsMatch "  ; 8
.const  "  found"  ; 9
.const  " not found"  ; 10
[01] getglobal  1   0        ; pairs
[02] move       2   0      
[03] call       1   2   5  
[04] tforprep   1   33       ; to [38]
[05] getupval   5   0        ; win32
[06] gettable   5   5   251  ; "FileExists"
[07] move       6   4      
[08] call       5   2   2  
[09] test       5   5   0    ; to [11] if true
[10] jmp        13           ; to [24]
[11] getglobal  5   2        ; io
[12] gettable   5   5   253  ; "write"
[13] loadk      6   4        ; "\n"
[14] getglobal  7   5        ; os
[15] gettable   7   7   256  ; "date"
[16] loadk      8   7        ; "%c "
[17] call       7   2   2  
[18] loadk      8   8        ; "DoVersionsMatch "
[19] move       9   4      
[20] concat     8   8   9  
[21] loadk      9   9        ; "  found"
[22] call       5   5   1  
[23] jmp        14           ; to [38]
[24] getglobal  5   2        ; io
[25] gettable   5   5   253  ; "write"
[26] loadk      6   4        ; "\n"
[27] getglobal  7   5        ; os
[28] gettable   7   7   256  ; "date"
[29] loadk      8   7        ; "%c "
[30] call       7   2   2  
[31] loadk      8   8        ; "DoVersionsMatch "
[32] move       9   4      
[33] concat     8   8   9  
[34] loadk      9   10       ; " not found"
[35] call       5   5   1  
[36] loadbool   5   0   0    ; false
[37] return     5   2      
[38] tforloop   1       1    ; to [40] if exit
[39] jmp        -35          ; to [5]
[40] loadbool   1   1   0    ; true
[41] return     1   2      
[42] return     0   1      
; end of function


; function [3] definition (level 4)
; 2 upvalues, 0 params, 15 stacks
.function  2 0 0 15
.local  "installerLoc"  ; 0
.local  "workingDirectory"  ; 1
.local  "requiredFiles"  ; 2
.local  "doVersionsMatchReply"  ; 3
.local  "installerConfigFile"  ; 4
.local  "currentVersion"  ; 5
.local  "currentVersion"  ; 6
.upvalue  "win32"  ; 0
.upvalue  "pid"  ; 1
.const  "g_constants"  ; 0
.const  "installerLoc"  ; 1
.const  "WorkingDir"  ; 2
.const  "tostring"  ; 3
.const  "\\Resources\\"  ; 4
.const  "g_storeFront"  ; 5
.const  "\\wait.html"  ; 6
.const  "\\config.lua"  ; 7
.const  "\\blob"  ; 8
.const  "\\compat-5.1.lua"  ; 9
.const  "checkRequiredFiles"  ; 10
.const  "INSTALLER_VER"  ; 11
.const  "FileExists"  ; 12
.const  "dofile"  ; 13
.const  "io"  ; 14
.const  "write"  ; 15
.const  "\n"  ; 16
.const  "os"  ; 17
.const  "date"  ; 18
.const  "%c "  ; 19
.const  "DoVersionsMatch WorkingDir  : "  ; 20
.const  " version is"  ; 21
.const  "DoVersionsMatch installerLoc: "  ; 22
.const  "DoVersionsMatch "  ; 23
.const  " does not exist"  ; 24
.const  "DoVersionsMatch already running in "  ; 25
.const  "DoVersionsMatch returning "  ; 26
[001] getglobal  0   0        ; g_constants
[002] gettable   0   0   251  ; "installerLoc"
[003] getupval   1   0        ; win32
[004] gettable   1   1   252  ; "WorkingDir"
[005] call       1   1   2  
[006] newtable   2   4   0    ; array=4, hash=0
[007] getglobal  3   3        ; tostring
[008] move       4   0      
[009] call       3   2   2  
[010] loadk      4   4        ; "\\Resources\\"
[011] getglobal  5   3        ; tostring
[012] getglobal  6   5        ; g_storeFront
[013] call       5   2   2  
[014] loadk      6   6        ; "\\wait.html"
[015] concat     3   3   6  
[016] getglobal  4   3        ; tostring
[017] move       5   0      
[018] call       4   2   2  
[019] loadk      5   7        ; "\\config.lua"
[020] concat     4   4   5  
[021] getglobal  5   3        ; tostring
[022] move       6   0      
[023] call       5   2   2  
[024] loadk      6   8        ; "\\blob"
[025] concat     5   5   6  
[026] getglobal  6   3        ; tostring
[027] move       7   0      
[028] call       6   2   2  
[029] loadk      7   9        ; "\\compat-5.1.lua"
[030] concat     6   6   7  
[031] setlist    2   3        ; index 1 to 4
[032] getglobal  3   10       ; checkRequiredFiles
[033] move       4   2      
[034] call       3   2   2  
[035] test       3   3   1    ; to [37] if false
[036] jmp        2            ; to [39]
[037] loadbool   3   0   0    ; false
[038] return     3   2      
[039] loadbool   3   0   0    ; false
[040] eq         1   1   0    ; to [42] if false
[041] jmp        66           ; to [108]
[042] move       4   0      
[043] loadk      5   7        ; "\\config.lua"
[044] concat     4   4   5  
[045] getglobal  5   11       ; INSTALLER_VER
[046] getupval   6   0        ; win32
[047] gettable   6   6   262  ; "FileExists"
[048] move       7   4      
[049] call       6   2   2  
[050] test       6   6   0    ; to [52] if true
[051] jmp        43           ; to [95]
[052] getglobal  6   11       ; INSTALLER_VER
[053] getglobal  7   13       ; dofile
[054] move       8   4      
[055] call       7   2   1  
[056] getglobal  7   11       ; INSTALLER_VER
[057] eq         1   7   6    ; to [59] if false
[058] jmp        1            ; to [60]
[059] loadbool   3   0   1    ; false, to [61]
[060] loadbool   3   1   0    ; true
[061] getglobal  7   14       ; io
[062] gettable   7   7   265  ; "write"
[063] loadk      8   16       ; "\n"
[064] getglobal  9   17       ; os
[065] gettable   9   9   268  ; "date"
[066] loadk      10  19       ; "%c "
[067] call       9   2   2  
[068] getupval   10  1        ; pid
[069] loadk      11  20       ; "DoVersionsMatch WorkingDir  : "
[070] move       12  1      
[071] loadk      13  21       ; " version is"
[072] move       14  6      
[073] call       7   8   1  
[074] getglobal  7   14       ; io
[075] gettable   7   7   265  ; "write"
[076] loadk      8   16       ; "\n"
[077] getglobal  9   17       ; os
[078] gettable   9   9   268  ; "date"
[079] loadk      10  19       ; "%c "
[080] call       9   2   2  
[081] getupval   10  1        ; pid
[082] loadk      11  22       ; "DoVersionsMatch installerLoc: "
[083] getglobal  12  3        ; tostring
[084] move       13  0      
[085] call       12  2   2  
[086] loadk      13  21       ; " version is"
[087] getglobal  14  11       ; INSTALLER_VER
[088] call       7   8   1  
[089] getglobal  7   13       ; dofile
[090] move       8   1      
[091] loadk      9   7        ; "\\config.lua"
[092] concat     8   8   9  
[093] call       7   2   1  
[094] jmp        25           ; to [120]
[095] getglobal  6   14       ; io
[096] gettable   6   6   265  ; "write"
[097] loadk      7   16       ; "\n"
[098] getglobal  8   17       ; os
[099] gettable   8   8   268  ; "date"
[100] loadk      9   19       ; "%c "
[101] call       8   2   2  
[102] getupval   9   1        ; pid
[103] loadk      10  23       ; "DoVersionsMatch "
[104] move       11  4      
[105] loadk      12  24       ; " does not exist"
[106] call       6   7   1  
[107] jmp        12           ; to [120]
[108] getglobal  4   14       ; io
[109] gettable   4   4   265  ; "write"
[110] loadk      5   16       ; "\n"
[111] getglobal  6   17       ; os
[112] gettable   6   6   268  ; "date"
[113] loadk      7   19       ; "%c "
[114] call       6   2   2  
[115] getupval   7   1        ; pid
[116] loadk      8   25       ; "DoVersionsMatch already running in "
[117] move       9   1      
[118] call       4   6   1  
[119] loadbool   3   1   0    ; true
[120] getglobal  4   14       ; io
[121] gettable   4   4   265  ; "write"
[122] loadk      5   16       ; "\n"
[123] getglobal  6   17       ; os
[124] gettable   6   6   268  ; "date"
[125] loadk      7   19       ; "%c "
[126] call       6   2   2  
[127] getupval   7   1        ; pid
[128] loadk      8   26       ; "DoVersionsMatch returning "
[129] getglobal  9   3        ; tostring
[130] move       10  3      
[131] call       9   2   0  
[132] call       4   0   1  
[133] return     3   2      
[134] return     0   1      
; end of function


; function [4] definition (level 4)
; 1 upvalues, 0 params, 9 stacks
.function  1 0 0 9
.local  "reply"  ; 0
.local  "requireStorefront"  ; 1
.upvalue  "pid"  ; 0
.const  "NOTzylomX"  ; 0
.const  "tostring"  ; 1
.const  "g_storeFront"  ; 2
.const  "io"  ; 3
.const  "write"  ; 4
.const  "\n"  ; 5
.const  "os"  ; 6
.const  "date"  ; 7
.const  "%c "  ; 8
.const  " This storefront does not support parallel downloads"  ; 9
.const  "AreSerialDownloadsRequired returning "  ; 10
[01] loadbool   0   1   0    ; true
[02] loadk      1   0        ; "NOTzylomX"
[03] getglobal  2   1        ; tostring
[04] getglobal  3   2        ; g_storeFront
[05] call       2   2   2  
[06] eq         0   2   1    ; to [8] if true
[07] jmp        2            ; to [10]
[08] loadbool   0   0   0    ; false
[09] jmp        13           ; to [23]
[10] getglobal  2   3        ; io
[11] gettable   2   2   254  ; "write"
[12] loadk      3   5        ; "\n"
[13] getglobal  4   6        ; os
[14] gettable   4   4   257  ; "date"
[15] loadk      5   8        ; "%c "
[16] call       4   2   2  
[17] getupval   5   0        ; pid
[18] getglobal  6   1        ; tostring
[19] getglobal  7   2        ; g_storeFront
[20] call       6   2   2  
[21] loadk      7   9        ; " This storefront does not support parallel downloads"
[22] call       2   6   1  
[23] getglobal  2   3        ; io
[24] gettable   2   2   254  ; "write"
[25] loadk      3   5        ; "\n"
[26] getglobal  4   6        ; os
[27] gettable   4   4   257  ; "date"
[28] loadk      5   8        ; "%c "
[29] call       4   2   2  
[30] getupval   5   0        ; pid
[31] loadk      6   10       ; "AreSerialDownloadsRequired returning "
[32] getglobal  7   1        ; tostring
[33] move       8   0      
[34] call       7   2   0  
[35] call       2   0   1  
[36] return     0   2      
[37] return     0   1      
; end of function

[001] getglobal  0   0        ; luacom
[002] gettable   0   0   251  ; "CreateObject"
[003] loadk      1   2        ; "StubbyUtil.ShellCtl"
[004] call       0   2   2  
[005] getglobal  1   3        ; tostring
[006] self       2   0   254  ; "GetPid"
[007] call       2   2   0  
[008] call       1   0   2  
[009] setupval   1   0        ; pidid
[010] getupval   1   0        ; pidid
[011] loadk      2   5        ; "=> "
[012] concat     1   1   2  
[013] setupval   1   1        ; pid
[014] getupval   1   2        ; win32
[015] gettable   1   1   256  ; "LogMessage"
[016] getglobal  2   7        ; os
[017] gettable   2   2   258  ; "date"
[018] loadk      3   9        ; "%c "
[019] call       2   2   2  
[020] loadk      3   10       ; "Stubby started for pid: "
[021] getupval   4   0        ; pidid
[022] concat     2   2   4  
[023] call       1   2   1  
[024] getglobal  1   11       ; g_env
[025] gettable   1   1   262  ; "programFiles"
[026] test       1   1   0    ; to [28] if true
[027] jmp        7            ; to [35]
[028] getupval   1   2        ; win32
[029] gettable   1   1   263  ; "MakePathFilesWriteable"
[030] getglobal  2   11       ; g_env
[031] gettable   2   2   262  ; "programFiles"
[032] loadk      3   14       ; "\\RealArcade"
[033] concat     2   2   3  
[034] call       1   2   1  
[035] getupval   1   3        ; g_strPathSFX
[036] test       1   1   1    ; to [38] if false
[037] jmp        21           ; to [59]
[038] getglobal  1   15       ; GetSFXPath
[039] call       1   1   2  
[040] setupval   1   3        ; g_strPathSFX
[041] getglobal  1   16       ; io
[042] gettable   1   1   267  ; "write"
[043] loadk      2   18       ; "\n"
[044] getglobal  3   7        ; os
[045] gettable   3   3   258  ; "date"
[046] loadk      4   9        ; "%c "
[047] call       3   2   2  
[048] getupval   4   1        ; pid
[049] loadk      5   19       ; "GetSFXPath = "
[050] getglobal  6   3        ; tostring
[051] getupval   7   3        ; g_strPathSFX
[052] call       6   2   2  
[053] loadk      7   20       ; ". Silent: "
[054] getglobal  8   3        ; tostring
[055] getupval   9   4        ; silent
[056] call       8   2   0  
[057] call       1   0   1  
[058] jmp        17           ; to [76]
[059] getglobal  1   16       ; io
[060] gettable   1   1   267  ; "write"
[061] loadk      2   18       ; "\n"
[062] getglobal  3   7        ; os
[063] gettable   3   3   258  ; "date"
[064] loadk      4   9        ; "%c "
[065] call       3   2   2  
[066] getupval   4   1        ; pid
[067] loadk      5   21       ; "using command line SFXPath "
[068] getglobal  6   3        ; tostring
[069] getupval   7   3        ; g_strPathSFX
[070] call       6   2   2  
[071] loadk      7   20       ; ". Silent: "
[072] getglobal  8   3        ; tostring
[073] getupval   9   4        ; silent
[074] call       8   2   0  
[075] call       1   0   1  
[076] closure    1   0        ; 7 upvalues
[077] getupval   0   5        ; GetDynamicStampVersion
[078] getupval   0   6        ; ReadLegacyStampValues
[079] getupval   0   3        ; g_strPathSFX
[080] getupval   0   1        ; pid
[081] getupval   0   7        ; ReadVersion1StampValues
[082] getupval   0   8        ; ReadVersion2StampValues
[083] getupval   0   9        ; StringToHex
[084] closure    2   1        ; 0 upvalues
[085] closure    3   2        ; 1 upvalues
[086] getupval   0   2        ; win32
[087] setglobal  3   22       ; checkRequiredFiles
[088] closure    3   3        ; 2 upvalues
[089] getupval   0   2        ; win32
[090] getupval   0   1        ; pid
[091] setglobal  3   23       ; DoVersionsMatch
[092] closure    3   4        ; 1 upvalues
[093] getupval   0   1        ; pid
[094] loadnil    4   4      
[095] getupval   5   4        ; silent
[096] test       5   5   1    ; to [98] if false
[097] jmp        4            ; to [102]
[098] getglobal  5   24       ; InstallerUI
[099] call       5   1   2  
[100] move       4   5      
[101] jmp        13           ; to [115]
[102] getglobal  5   16       ; io
[103] gettable   5   5   267  ; "write"
[104] loadk      6   18       ; "\n"
[105] getglobal  7   7        ; os
[106] gettable   7   7   258  ; "date"
[107] loadk      8   9        ; "%c "
[108] call       7   2   2  
[109] getupval   8   1        ; pid
[110] loadk      9   25       ; "Created a NullUI"
[111] call       5   5   1  
[112] getglobal  5   26       ; NullUI
[113] call       5   1   2  
[114] move       4   5      
[115] getupval   5   2        ; win32
[116] gettable   5   5   277  ; "WorkingDir"
[117] call       5   1   2  
[118] getupval   6   2        ; win32
[119] gettable   6   6   278  ; "Mutex"
[120] loadk      7   29       ; "RACV2InstallerSplash"
[121] call       6   2   2  
[122] getupval   7   2        ; win32
[123] gettable   7   7   256  ; "LogMessage"
[124] getglobal  8   7        ; os
[125] gettable   8   8   258  ; "date"
[126] loadk      9   9        ; "%c "
[127] call       8   2   2  
[128] loadk      9   30       ; "Try lock splashMutex"
[129] concat     8   8   9  
[130] call       7   2   1  
[131] gettable   7   6   281  ; "Lock"
[132] call       7   1   2  
[133] loadnil    8   10     
[134] loadbool   11  0   0    ; false
[135] move       12  1      
[136] call       12  1   1  
[137] move       12  2      
[138] call       12  1   4  
[139] move       10  14     
[140] move       9   13     
[141] move       8   12     
[142] test       7   7   0    ; to [144] if true
[143] jmp        20           ; to [164]
[144] getupval   12  2        ; win32
[145] gettable   12  12  256  ; "LogMessage"
[146] getglobal  13  7        ; os
[147] gettable   13  13  258  ; "date"
[148] loadk      14  9        ; "%c "
[149] call       13  2   2  
[150] loadk      14  32       ; "Acquired splashMutex"
[151] concat     13  13  14 
[152] call       12  2   1  
[153] gettable   12  4   283  ; "Create"
[154] move       13  8      
[155] move       14  9      
[156] move       15  10     
[157] call       12  4   1  
[158] gettable   12  4   284  ; "Navigate"
[159] getupval   13  10       ; SplashURL
[160] loadk      14  35       ; "wait.html"
[161] call       13  2   0  
[162] call       12  0   1  
[163] loadbool   11  1   0    ; true
[164] getglobal  12  36       ; MetadataInterp
[165] call       12  1   2  
[166] getglobal  13  37       ; DownloadMgr
[167] call       13  1   2  
[168] getupval   14  11       ; SetInstallerLoc
[169] call       14  1   1  
[170] getglobal  14  16       ; io
[171] gettable   14  14  267  ; "write"
[172] loadk      15  18       ; "\n"
[173] getglobal  16  7        ; os
[174] gettable   16  16  258  ; "date"
[175] loadk      17  9        ; "%c "
[176] call       16  2   2  
[177] getupval   17  1        ; pid
[178] loadk      18  38       ; "installerLoc =  "
[179] getglobal  19  39       ; g_constants
[180] gettable   19  19  290  ; "installerLoc"
[181] call       14  6   1  
[182] getglobal  14  16       ; io
[183] gettable   14  14  267  ; "write"
[184] loadk      15  18       ; "\n"
[185] getglobal  16  7        ; os
[186] gettable   16  16  258  ; "date"
[187] loadk      17  9        ; "%c "
[188] call       16  2   2  
[189] getupval   17  1        ; pid
[190] loadk      18  41       ; "workDir =  "
[191] move       19  5      
[192] call       14  6   1  
[193] move       14  3      
[194] call       14  1   2  
[195] test       14  14  1    ; to [197] if false
[196] jmp        63           ; to [260]
[197] test       7   7   1    ; to [199] if false
[198] jmp        52           ; to [251]
[199] getupval   15  2        ; win32
[200] gettable   15  15  278  ; "Mutex"
[201] loadk      16  42       ; "RACV2InstallerStopSplash"
[202] call       15  2   2  
[203] getglobal  16  7        ; os
[204] gettable   16  16  293  ; "clock"
[205] call       16  1   2  
[206] jmp        0            ; to [207]
[207] gettable   17  15  281  ; "Lock"
[208] call       17  1   2  
[209] test       17  17  1    ; to [211] if false
[210] jmp        6            ; to [217]
[211] getglobal  17  7        ; os
[212] gettable   17  17  293  ; "clock"
[213] call       17  1   2  
[214] sub        17  17  16 
[215] lt         1   17  294  ; 1, to [217] if false
[216] jmp        -10          ; to [207]
[217] getupval   17  2        ; win32
[218] gettable   17  17  256  ; "LogMessage"
[219] getglobal  18  7        ; os
[220] gettable   18  18  258  ; "date"
[221] loadk      19  9        ; "%c "
[222] call       18  2   2  
[223] loadk      19  45       ; "Wait for splashMutex"
[224] concat     18  18  19 
[225] call       17  2   1  
[226] gettable   17  6   296  ; "Wait"
[227] loadk      18  47       ; -1
[228] call       17  2   2  
[229] move       7   17     
[230] test       7   7   0    ; to [232] if true
[231] jmp        10           ; to [242]
[232] getupval   17  2        ; win32
[233] gettable   17  17  256  ; "LogMessage"
[234] getglobal  18  7        ; os
[235] gettable   18  18  258  ; "date"
[236] loadk      19  9        ; "%c "
[237] call       18  2   2  
[238] loadk      19  48       ; "Acquired splashMutex after wait"
[239] concat     18  18  19 
[240] call       17  2   1  
[241] jmp        9            ; to [251]
[242] getupval   17  2        ; win32
[243] gettable   17  17  256  ; "LogMessage"
[244] getglobal  18  7        ; os
[245] gettable   18  18  258  ; "date"
[246] loadk      19  9        ; "%c "
[247] call       18  2   2  
[248] loadk      19  49       ; "FAILED to acquired splashMutex"
[249] concat     18  18  19 
[250] call       17  2   1  
[251] loadbool   15  0   0    ; false
[252] getglobal  16  23       ; DoVersionsMatch
[253] call       16  1   2  
[254] eq         1   15  16   ; to [256] if false
[255] jmp        1            ; to [257]
[256] loadbool   15  0   1    ; false, to [258]
[257] loadbool   15  1   0    ; true
[258] setglobal  15  50       ; reply
[259] getglobal  14  50       ; reply
[260] getupval   15  2        ; win32
[261] gettable   15  15  278  ; "Mutex"
[262] loadk      16  51       ; "RACV2InstallerInst"
[263] call       15  2   2  
[264] setupval   15  12       ; mutex
[265] getupval   15  12       ; mutex
[266] gettable   15  15  281  ; "Lock"
[267] call       15  1   2  
[268] test       15  15  1    ; to [270] if false
[269] jmp        25           ; to [295]
[270] test       11  11  1    ; to [272] if false
[271] jmp        5            ; to [277]
[272] gettable   16  4   283  ; "Create"
[273] move       17  8      
[274] move       18  9      
[275] move       19  10     
[276] call       16  4   1  
[277] test       14  14  0    ; to [279] if true
[278] jmp        11           ; to [290]
[279] gettable   16  4   284  ; "Navigate"
[280] getupval   17  10       ; SplashURL
[281] loadk      18  52       ; "waitProc.html"
[282] call       17  2   0  
[283] call       16  0   1  
[284] jmp        0            ; to [285]
[285] getupval   16  12       ; mutex
[286] gettable   16  16  281  ; "Lock"
[287] call       16  1   2  
[288] test       16  16  0    ; to [290] if true
[289] jmp        -5           ; to [285]
[290] gettable   16  4   284  ; "Navigate"
[291] getupval   17  10       ; SplashURL
[292] loadk      18  35       ; "wait.html"
[293] call       17  2   0  
[294] call       16  0   1  
[295] getglobal  16  39       ; g_constants
[296] gettable   16  16  290  ; "installerLoc"
[297] eq         1   5   16   ; to [299] if false
[298] jmp        185          ; to [484]
[299] test       14  14  0    ; to [301] if true
[300] jmp        30           ; to [331]
[301] getglobal  16  16       ; io
[302] gettable   16  16  267  ; "write"
[303] loadk      17  18       ; "\n"
[304] getglobal  18  7        ; os
[305] gettable   18  18  258  ; "date"
[306] loadk      19  9        ; "%c "
[307] call       18  2   2  
[308] getupval   19  1        ; pid
[309] loadk      20  53       ; "Overwriting installer at "
[310] getglobal  21  39       ; g_constants
[311] gettable   21  21  290  ; "installerLoc"
[312] loadk      22  54       ; " with "
[313] move       23  5      
[314] call       16  8   1  
[315] getupval   16  2        ; win32
[316] gettable   16  16  305  ; "LocalCopy"
[317] move       17  5      
[318] getglobal  18  39       ; g_constants
[319] gettable   18  18  290  ; "installerLoc"
[320] call       16  3   1  
[321] getupval   16  2        ; win32
[322] gettable   16  16  305  ; "LocalCopy"
[323] move       17  5      
[324] loadk      18  56       ; "\\bin\\gameinstaller.exe"
[325] concat     17  17  18 
[326] getglobal  18  39       ; g_constants
[327] gettable   18  18  290  ; "installerLoc"
[328] loadk      19  57       ; "\\bin\\gamewrapper.exe"
[329] concat     18  18  19 
[330] call       16  3   1  
[331] loadnil    16  16     
[332] getupval   17  4        ; silent
[333] test       17  17  0    ; to [335] if true
[334] jmp        2            ; to [337]
[335] loadk      16  58       ; "silent"
[336] jmp        4            ; to [341]
[337] loadk      17  59       ; "sfx:\""
[338] getupval   18  3        ; g_strPathSFX
[339] loadk      19  60       ; "\""
[340] concat     16  17  19 
[341] getglobal  17  61       ; g_ogmid
[342] test       17  17  0    ; to [344] if true
[343] jmp        11           ; to [355]
[344] getglobal  17  62       ; g_ogmport
[345] test       17  17  0    ; to [347] if true
[346] jmp        8            ; to [355]
[347] loadk      17  63       ; " --ogmid:"
[348] getglobal  18  61       ; g_ogmid
[349] loadk      19  64       ; ",ogmport:"
[350] getglobal  20  62       ; g_ogmport
[351] concat     17  17  20 
[352] move       18  16     
[353] move       19  17     
[354] concat     16  18  19 
[355] getglobal  17  39       ; g_constants
[356] gettable   17  17  290  ; "installerLoc"
[357] loadk      18  65       ; "\\bin\\bstrapInstall.exe"
[358] concat     17  17  18 
[359] getglobal  18  16       ; io
[360] gettable   18  18  267  ; "write"
[361] loadk      19  18       ; "\n"
[362] getglobal  20  7        ; os
[363] gettable   20  20  258  ; "date"
[364] loadk      21  9        ; "%c "
[365] call       20  2   2  
[366] getupval   21  1        ; pid
[367] loadk      22  66       ; "Restarting Installer..."
[368] move       23  17     
[369] loadk      24  67       ; " cmdAgs: "
[370] move       25  16     
[371] call       18  8   1  
[372] getglobal  18  68       ; ExecuteCommand
[373] move       19  17     
[374] move       20  16     
[375] getglobal  21  39       ; g_constants
[376] gettable   21  21  290  ; "installerLoc"
[377] call       18  4   1  
[378] test       15  15  0    ; to [380] if true
[379] jmp        77           ; to [457]
[380] getupval   18  2        ; win32
[381] gettable   18  18  256  ; "LogMessage"
[382] getglobal  19  7        ; os
[383] gettable   19  19  258  ; "date"
[384] loadk      20  9        ; "%c "
[385] call       19  2   2  
[386] loadk      20  69       ; "Release mutex"
[387] concat     19  19  20 
[388] call       18  2   1  
[389] getupval   18  12       ; mutex
[390] gettable   18  18  320  ; "Release"
[391] call       18  1   1  
[392] getupval   18  12       ; mutex
[393] gettable   18  18  321  ; "Close"
[394] call       18  1   1  
[395] test       7   7   0    ; to [397] if true
[396] jmp        60           ; to [457]
[397] getglobal  18  16       ; io
[398] gettable   18  18  267  ; "write"
[399] loadk      19  18       ; "\n"
[400] getglobal  20  7        ; os
[401] gettable   20  20  258  ; "date"
[402] loadk      21  9        ; "%c "
[403] call       20  2   2  
[404] getupval   21  1        ; pid
[405] loadk      22  72       ; "Wait "
[406] getglobal  23  39       ; g_constants
[407] gettable   23  23  323  ; "stubbysplashseconds"
[408] loadk      24  74       ; " seconds for launched process to come up"
[409] call       18  7   1  
[410] getupval   18  2        ; win32
[411] gettable   18  18  256  ; "LogMessage"
[412] getglobal  19  7        ; os
[413] gettable   19  19  258  ; "date"
[414] loadk      20  9        ; "%c "
[415] call       19  2   2  
[416] loadk      20  72       ; "Wait "
[417] getglobal  21  39       ; g_constants
[418] gettable   21  21  323  ; "stubbysplashseconds"
[419] loadk      22  74       ; " seconds for launched process to come up"
[420] concat     19  19  22 
[421] call       18  2   1  
[422] getupval   18  2        ; win32
[423] gettable   18  18  278  ; "Mutex"
[424] loadk      19  42       ; "RACV2InstallerStopSplash"
[425] call       18  2   2  
[426] setupval   18  12       ; mutex
[427] getglobal  18  7        ; os
[428] gettable   18  18  293  ; "clock"
[429] call       18  1   2  
[430] jmp        13           ; to [444]
[431] getupval   19  12       ; mutex
[432] gettable   19  19  320  ; "Release"
[433] call       19  1   1  
[434] getglobal  19  7        ; os
[435] gettable   19  19  293  ; "clock"
[436] call       19  1   2  
[437] jmp        0            ; to [438]
[438] getglobal  20  7        ; os
[439] gettable   20  20  293  ; "clock"
[440] call       20  1   2  
[441] sub        20  20  19 
[442] lt         1   20  325  ; 0.5, to [444] if false
[443] jmp        -6           ; to [438]
[444] getupval   19  12       ; mutex
[445] gettable   19  19  281  ; "Lock"
[446] call       19  1   2  
[447] test       19  19  0    ; to [449] if true
[448] jmp        8            ; to [457]
[449] getglobal  19  7        ; os
[450] gettable   19  19  293  ; "clock"
[451] call       19  1   2  
[452] sub        19  19  18 
[453] getglobal  20  39       ; g_constants
[454] gettable   20  20  323  ; "stubbysplashseconds"
[455] lt         1   19  20   ; to [457] if false
[456] jmp        -26          ; to [431]
[457] getglobal  18  16       ; io
[458] gettable   18  18  267  ; "write"
[459] loadk      19  18       ; "\n"
[460] getglobal  20  7        ; os
[461] gettable   20  20  258  ; "date"
[462] loadk      21  9        ; "%c "
[463] call       20  2   2  
[464] getupval   21  1        ; pid
[465] loadk      22  76       ; "exiting first-stage Installer\n"
[466] call       18  5   1  
[467] getglobal  18  16       ; io
[468] gettable   18  18  327  ; "flush"
[469] call       18  1   1  
[470] getupval   18  2        ; win32
[471] gettable   18  18  256  ; "LogMessage"
[472] getglobal  19  7        ; os
[473] gettable   19  19  258  ; "date"
[474] loadk      20  9        ; "%c "
[475] call       19  2   2  
[476] loadk      20  76       ; "exiting first-stage Installer\n"
[477] concat     19  19  20 
[478] call       18  2   1  
[479] getglobal  18  7        ; os
[480] gettable   18  18  328  ; "exit"
[481] getglobal  19  79       ; g_exit
[482] gettable   19  19  330  ; "success"
[483] call       18  2   1  
[484] test       7   7   0    ; to [486] if true
[485] jmp        14           ; to [500]
[486] getupval   16  2        ; win32
[487] gettable   16  16  256  ; "LogMessage"
[488] getglobal  17  7        ; os
[489] gettable   17  17  258  ; "date"
[490] loadk      18  9        ; "%c "
[491] call       17  2   2  
[492] loadk      18  81       ; "Release splashMutex."
[493] concat     17  17  18 
[494] call       16  2   1  
[495] gettable   16  6   320  ; "Release"
[496] call       16  1   1  
[497] gettable   16  6   321  ; "Close"
[498] call       16  1   1  
[499] jmp        9            ; to [509]
[500] getupval   16  2        ; win32
[501] gettable   16  16  256  ; "LogMessage"
[502] getglobal  17  7        ; os
[503] gettable   17  17  258  ; "date"
[504] loadk      18  9        ; "%c "
[505] call       17  2   2  
[506] loadk      18  82       ; "splashMutex not owned by this thread"
[507] concat     17  17  18 
[508] call       16  2   1  
[509] test       14  14  1    ; to [511] if false
[510] jmp        2            ; to [513]
[511] getupval   16  13       ; StartNewLog
[512] call       16  1   1  
[513] test       15  15  1    ; to [515] if false
[514] jmp        120          ; to [635]
[515] test       14  14  1    ; to [517] if false
[516] jmp        118          ; to [635]
[517] getupval   16  2        ; win32
[518] gettable   16  16  256  ; "LogMessage"
[519] getglobal  17  7        ; os
[520] gettable   17  17  258  ; "date"
[521] loadk      18  9        ; "%c "
[522] call       17  2   2  
[523] loadk      18  83       ; "See if previous install passed Eula"
[524] concat     17  17  18 
[525] call       16  2   1  
[526] getglobal  16  16       ; io
[527] gettable   16  16  267  ; "write"
[528] loadk      17  18       ; "\n"
[529] getglobal  18  7        ; os
[530] gettable   18  18  258  ; "date"
[531] loadk      19  9        ; "%c "
[532] call       18  2   2  
[533] getupval   19  1        ; pid
[534] loadk      20  84       ; "nth Version waiting for reg key update"
[535] call       16  5   1  
[536] gettable   16  4   335  ; "Hide"
[537] call       16  1   1  
[538] getglobal  16  0        ; luacom
[539] gettable   16  16  251  ; "CreateObject"
[540] loadk      17  86       ; "StubbyUtil.ProcessMgr"
[541] call       16  2   2  
[542] loadnil    17  17     
[543] getupval   18  2        ; win32
[544] gettable   18  18  256  ; "LogMessage"
[545] getglobal  19  7        ; os
[546] gettable   19  19  258  ; "date"
[547] loadk      20  9        ; "%c "
[548] call       19  2   2  
[549] loadk      20  87       ; "wait for mutex or \""
[550] getglobal  21  39       ; g_constants
[551] gettable   21  21  338  ; "basekey"
[552] getglobal  22  89       ; g_storeFront
[553] loadk      23  90       ; "\\1.0\\Preferences\" regkey to indicate past Eula"
[554] concat     19  19  23 
[555] call       18  2   1  
[556] jmp        64           ; to [621]
[557] getupval   18  12       ; mutex
[558] gettable   18  18  281  ; "Lock"
[559] call       18  1   2  
[560] move       15  18     
[561] test       15  15  0    ; to [563] if true
[562] jmp        20           ; to [583]
[563] getglobal  18  16       ; io
[564] gettable   18  18  267  ; "write"
[565] loadk      19  18       ; "\n"
[566] getglobal  20  7        ; os
[567] gettable   20  20  258  ; "date"
[568] loadk      21  9        ; "%c "
[569] call       20  2   2  
[570] getupval   21  1        ; pid
[571] loadk      22  91       ; "Acquired mutex. Safe(ish) to proceed"
[572] call       18  5   1  
[573] getupval   18  2        ; win32
[574] gettable   18  18  256  ; "LogMessage"
[575] getglobal  19  7        ; os
[576] gettable   19  19  258  ; "date"
[577] loadk      20  9        ; "%c "
[578] call       19  2   2  
[579] loadk      20  92       ; "Past mutex skip Eula wait"
[580] concat     19  19  20 
[581] call       18  2   1  
[582] jmp        40           ; to [623]
[583] getglobal  18  93       ; RACConfigValue
[584] getglobal  19  39       ; g_constants
[585] gettable   19  19  344  ; "gamesrootkey"
[586] call       18  2   2  
[587] gettable   18  18  345  ; "Read"
[588] call       18  1   2  
[589] move       17  18     
[590] test       17  17  0    ; to [592] if true
[591] jmp        26           ; to [618]
[592] eq         1   17  346  ; "", to [594] if false
[593] jmp        24           ; to [618]
[594] getglobal  18  16       ; io
[595] gettable   18  18  267  ; "write"
[596] loadk      19  18       ; "\n"
[597] getglobal  20  7        ; os
[598] gettable   20  20  258  ; "date"
[599] loadk      21  9        ; "%c "
[600] call       20  2   2  
[601] getupval   21  1        ; pid
[602] getglobal  22  39       ; g_constants
[603] gettable   22  22  344  ; "gamesrootkey"
[604] loadk      23  97       ; " = "
[605] move       24  17     
[606] loadk      25  98       ; " updated. Safe(ish) to proceed"
[607] call       18  8   1  
[608] getupval   18  2        ; win32
[609] gettable   18  18  256  ; "LogMessage"
[610] getglobal  19  7        ; os
[611] gettable   19  19  258  ; "date"
[612] loadk      20  9        ; "%c "
[613] call       19  2   2  
[614] loadk      20  99       ; "Past Eula skip mutex wait"
[615] concat     19  19  20 
[616] call       18  2   1  
[617] jmp        5            ; to [623]
[618] self       18  16  350  ; "Sleep"
[619] loadk      20  101      ; 1000
[620] call       18  3   1  
[621] test       15  15  0    ; to [623] if true
[622] jmp        -66          ; to [557]
[623] getupval   18  2        ; win32
[624] gettable   18  18  256  ; "LogMessage"
[625] getglobal  19  7        ; os
[626] gettable   19  19  258  ; "date"
[627] loadk      20  9        ; "%c "
[628] call       19  2   2  
[629] loadk      20  102      ; "Acquired mutex again or skipped???"
[630] concat     19  19  20 
[631] call       18  2   1  
[632] gettable   18  4   353  ; "Show"
[633] call       18  1   1  
[634] jmp        10           ; to [645]
[635] getglobal  16  16       ; io
[636] gettable   16  16  267  ; "write"
[637] loadk      17  18       ; "\n"
[638] getglobal  18  7        ; os
[639] gettable   18  18  258  ; "date"
[640] loadk      19  9        ; "%c "
[641] call       18  2   2  
[642] getupval   19  1        ; pid
[643] loadk      20  104      ; "Virgin Version updating reg keys"
[644] call       16  5   1  
[645] getupval   16  2        ; win32
[646] gettable   16  16  355  ; "CreateRegKey"
[647] loadk      17  106      ; "HKEY_LOCAL_MACHINE"
[648] loadk      18  107      ; "SOFTWARE\\GameInstaller\\Installer"
[649] loadk      19  108      ; "Version"
[650] getglobal  20  109      ; INSTALLER_VER
[651] call       16  5   1  
[652] getupval   16  2        ; win32
[653] gettable   16  16  355  ; "CreateRegKey"
[654] loadk      17  106      ; "HKEY_LOCAL_MACHINE"
[655] loadk      18  107      ; "SOFTWARE\\GameInstaller\\Installer"
[656] loadk      19  110      ; "Location"
[657] getglobal  20  39       ; g_constants
[658] gettable   20  20  290  ; "installerLoc"
[659] call       16  5   1  
[660] getupval   16  2        ; win32
[661] gettable   16  16  361  ; "RegisterInstallerType"
[662] call       16  1   1  
[663] loadnil    16  17     
[664] getglobal  18  11       ; g_env
[665] gettable   18  18  362  ; "itmUrl"
[666] test       18  18  0    ; to [668] if true
[667] jmp        14           ; to [682]
[668] getglobal  18  113      ; string
[669] gettable   18  18  364  ; "length"
[670] getglobal  19  11       ; g_env
[671] gettable   19  19  362  ; "itmUrl"
[672] call       18  2   2  
[673] lt         0   365 18   ; 0, to [675] if true
[674] jmp        7            ; to [682]
[675] getglobal  18  11       ; g_env
[676] gettable   18  18  362  ; "itmUrl"
[677] getglobal  19  116      ; RequestURLParams
[678] move       20  16     
[679] call       19  2   2  
[680] concat     17  18  19 
[681] jmp        9            ; to [691]
[682] getglobal  18  117      ; GetMatchingURLs
[683] getglobal  19  89       ; g_storeFront
[684] getglobal  20  118      ; g_tps
[685] call       18  3   2  
[686] move       19  18     
[687] getglobal  20  116      ; RequestURLParams
[688] move       21  16     
[689] call       20  2   2  
[690] concat     17  19  20 
[691] loadk      18  44       ; 1
[692] newtable   19  12  0    ; array=8, hash=0
[693] loadk      20  119      ; "contentid"
[694] loadk      21  120      ; "otp"
[695] loadk      22  121      ; "tracking"
[696] loadk      23  122      ; "affiliate"
[697] loadk      24  123      ; "currency"
[698] loadk      25  124      ; "price"
[699] loadk      26  125      ; "timestamp"
[700] loadk      27  126      ; "language"
[701] setlist    19  7        ; index 1 to 8
[702] jmp        56           ; to [759]
[703] getglobal  20  16       ; io
[704] gettable   20  20  267  ; "write"
[705] loadk      21  18       ; "\n"
[706] getglobal  22  7        ; os
[707] gettable   22  22  258  ; "date"
[708] loadk      23  9        ; "%c "
[709] call       22  2   2  
[710] getupval   23  1        ; pid
[711] loadk      24  129      ; "stamp parameter = "
[712] gettable   25  19  18 
[713] concat     24  24  25 
[714] call       20  5   1  
[715] getglobal  20  130      ; main_env
[716] gettable   21  19  18 
[717] gettable   20  20  21 
[718] test       20  20  0    ; to [720] if true
[719] jmp        25           ; to [745]
[720] move       20  17     
[721] loadk      21  131      ; "&"
[722] gettable   22  19  18 
[723] loadk      23  132      ; "="
[724] getglobal  24  130      ; main_env
[725] gettable   25  19  18 
[726] gettable   24  24  25 
[727] concat     17  20  24 
[728] getglobal  20  16       ; io
[729] gettable   20  20  267  ; "write"
[730] loadk      21  18       ; "\n"
[731] getglobal  22  7        ; os
[732] gettable   22  22  258  ; "date"
[733] loadk      23  9        ; "%c "
[734] call       22  2   2  
[735] getupval   23  1        ; pid
[736] loadk      24  133      ; "adding stamp parameter "
[737] gettable   25  19  18 
[738] loadk      26  134      ; " value = "
[739] getglobal  27  130      ; main_env
[740] gettable   28  19  18 
[741] gettable   27  27  28 
[742] concat     24  24  27 
[743] call       20  5   1  
[744] jmp        13           ; to [758]
[745] getglobal  20  16       ; io
[746] gettable   20  20  267  ; "write"
[747] loadk      21  18       ; "\n"
[748] getglobal  22  7        ; os
[749] gettable   22  22  258  ; "date"
[750] loadk      23  9        ; "%c "
[751] call       22  2   2  
[752] getupval   23  1        ; pid
[753] loadk      24  133      ; "adding stamp parameter "
[754] gettable   25  19  18 
[755] loadk      26  135      ; " value = nil"
[756] concat     24  24  26 
[757] call       20  5   1  
[758] add        18  18  294  ; 1
[759] getglobal  20  127      ; table
[760] gettable   20  20  378  ; "getn"
[761] move       21  19     
[762] call       20  2   2  
[763] le         1   18  20   ; to [765] if false
[764] jmp        -62          ; to [703]
[765] loadnil    20  20     
[766] getupval   21  14       ; hasRgiUpgradeFlag
[767] call       21  1   2  
[768] test       21  21  0    ; to [770] if true
[769] jmp        4            ; to [774]
[770] getupval   21  15       ; errHandler
[771] gettable   21  21  386  ; "state"
[772] gettable   20  21  387  ; "upgrade"
[773] jmp        3            ; to [777]
[774] getupval   21  15       ; errHandler
[775] gettable   21  21  386  ; "state"
[776] gettable   20  21  388  ; "start"
[777] getupval   21  15       ; errHandler
[778] gettable   21  21  389  ; "LogPing"
[779] newtable   22  3   0    ; array=3, hash=0
[780] newtable   23  2   0    ; array=2, hash=0
[781] getupval   24  15       ; errHandler
[782] gettable   24  24  390  ; "field"
[783] gettable   24  24  391  ; "src"
[784] getupval   25  15       ; errHandler
[785] gettable   25  25  391  ; "src"
[786] gettable   25  25  392  ; "component"
[787] setlist    23  1        ; index 1 to 2
[788] newtable   24  2   0    ; array=2, hash=0
[789] getupval   25  15       ; errHandler
[790] gettable   25  25  390  ; "field"
[791] gettable   25  25  386  ; "state"
[792] getupval   26  15       ; errHandler
[793] gettable   26  26  386  ; "state"
[794] gettable   26  26  388  ; "start"
[795] setlist    24  1        ; index 1 to 2
[796] newtable   25  2   0    ; array=2, hash=0
[797] getupval   26  15       ; errHandler
[798] gettable   26  26  390  ; "field"
[799] gettable   26  26  393  ; "dwnldevt"
[800] move       27  20     
[801] setlist    25  1        ; index 1 to 2
[802] setlist    22  2        ; index 1 to 3
[803] loadbool   23  0   0    ; false
[804] call       21  3   1  
[805] getglobal  21  16       ; io
[806] gettable   21  21  267  ; "write"
[807] loadk      22  18       ; "\n"
[808] getglobal  23  7        ; os
[809] gettable   23  23  258  ; "date"
[810] loadk      24  9        ; "%c "
[811] call       23  2   2  
[812] getupval   24  1        ; pid
[813] loadk      25  144      ; "XML Overrides load = "
[814] getglobal  26  3        ; tostring
[815] getglobal  27  145      ; g_tableConfig
[816] gettable   27  27  396  ; "strPathXMLLoad"
[817] call       26  2   2  
[818] loadk      27  147      ; " save = "
[819] getglobal  28  3        ; tostring
[820] getglobal  29  145      ; g_tableConfig
[821] gettable   29  29  398  ; "strPathXMLSave"
[822] call       28  2   0  
[823] call       21  0   1  
[824] getupval   21  2        ; win32
[825] gettable   21  21  278  ; "Mutex"
[826] loadk      22  149      ; "RACV2InstallerXml"
[827] call       21  2   2  
[828] getupval   22  2        ; win32
[829] gettable   22  22  256  ; "LogMessage"
[830] getglobal  23  7        ; os
[831] gettable   23  23  258  ; "date"
[832] loadk      24  9        ; "%c "
[833] call       23  2   2  
[834] loadk      24  150      ; "Wait for xmlMutex"
[835] concat     23  23  24 
[836] call       22  2   1  
[837] gettable   22  21  296  ; "Wait"
[838] loadk      23  47       ; -1
[839] call       22  2   1  
[840] getglobal  22  145      ; g_tableConfig
[841] gettable   22  22  401  ; "PathXMLLoad"
[842] test       22  22  0    ; to [844] if true
[843] jmp        17           ; to [861]
[844] getglobal  22  16       ; io
[845] gettable   22  22  267  ; "write"
[846] loadk      23  18       ; "\n"
[847] getglobal  24  7        ; os
[848] gettable   24  24  258  ; "date"
[849] loadk      25  9        ; "%c "
[850] call       24  2   2  
[851] getupval   25  1        ; pid
[852] loadk      26  152      ; "Loading payload xml from disk file "
[853] getglobal  27  145      ; g_tableConfig
[854] gettable   27  27  401  ; "PathXMLLoad"
[855] call       22  6   1  
[856] gettable   22  12  403  ; "LoadXML"
[857] getglobal  23  145      ; g_tableConfig
[858] gettable   23  23  401  ; "PathXMLLoad"
[859] call       22  2   1  
[860] jmp        32           ; to [893]
[861] getglobal  22  16       ; io
[862] gettable   22  22  267  ; "write"
[863] loadk      23  18       ; "\n"
[864] getglobal  24  7        ; os
[865] gettable   24  24  258  ; "date"
[866] loadk      25  9        ; "%c "
[867] call       24  2   2  
[868] getupval   25  1        ; pid
[869] loadk      26  154      ; "Requesting payload xml from "
[870] move       27  17     
[871] call       22  6   1  
[872] gettable   22  13  405  ; "GetFile"
[873] move       23  17     
[874] loadk      24  156      ; "tmp.xml"
[875] call       22  3   1  
[876] gettable   22  12  403  ; "LoadXML"
[877] loadk      23  156      ; "tmp.xml"
[878] call       22  2   1  
[879] getglobal  22  145      ; g_tableConfig
[880] gettable   22  22  407  ; "PathXMLSave"
[881] test       22  22  0    ; to [883] if true
[882] jmp        6            ; to [889]
[883] getupval   22  2        ; win32
[884] gettable   22  22  305  ; "LocalCopy"
[885] loadk      23  156      ; "tmp.xml"
[886] getglobal  24  145      ; g_tableConfig
[887] gettable   24  24  407  ; "PathXMLSave"
[888] call       22  3   1  
[889] getupval   22  2        ; win32
[890] gettable   22  22  408  ; "DeleteFile"
[891] loadk      23  156      ; "tmp.xml"
[892] call       22  2   1  
[893] gettable   22  21  320  ; "Release"
[894] call       22  1   1  
[895] gettable   22  21  321  ; "Close"
[896] call       22  1   1  
[897] loadk      22  159      ; "RACV2InstallerGameId"
[898] getglobal  23  3        ; tostring
[899] getglobal  24  11       ; g_env
[900] gettable   24  24  410  ; "curGameId"
[901] call       23  2   2  
[902] concat     22  22  23 
[903] getupval   23  2        ; win32
[904] gettable   23  23  256  ; "LogMessage"
[905] getglobal  24  7        ; os
[906] gettable   24  24  258  ; "date"
[907] loadk      25  9        ; "%c "
[908] call       24  2   2  
[909] loadk      25  161      ; "Wait for "
[910] move       26  22     
[911] concat     24  24  26 
[912] call       23  2   1  
[913] getupval   23  2        ; win32
[914] gettable   23  23  278  ; "Mutex"
[915] move       24  22     
[916] call       23  2   2  
[917] setupval   23  16       ; g_gameIdMutex
[918] getupval   23  16       ; g_gameIdMutex
[919] gettable   23  23  296  ; "Wait"
[920] loadk      24  47       ; -1
[921] call       23  2   1  
[922] getupval   23  2        ; win32
[923] gettable   23  23  256  ; "LogMessage"
[924] getglobal  24  7        ; os
[925] gettable   24  24  258  ; "date"
[926] loadk      25  9        ; "%c "
[927] call       24  2   2  
[928] loadk      25  162      ; "Acquired for "
[929] move       26  22     
[930] concat     24  24  26 
[931] call       23  2   1  
[932] getglobal  23  93       ; RACConfigValue
[933] loadk      24  163      ; "ArcadeVersion"
[934] call       23  2   2  
[935] gettable   23  23  345  ; "Read"
[936] call       23  1   2  
[937] eq         1   23  346  ; "", to [939] if false
[938] jmp        15           ; to [954]
[939] getglobal  24  93       ; RACConfigValue
[940] loadk      25  164      ; "MainApp"
[941] call       24  2   2  
[942] gettable   24  24  345  ; "Read"
[943] call       24  1   2  
[944] test       24  24  1    ; to [946] if false
[945] jmp        1            ; to [947]
[946] loadk      24  96       ; ""
[947] getglobal  25  16       ; io
[948] gettable   25  25  415  ; "touch"
[949] move       26  24     
[950] call       25  2   2  
[951] test       25  25  1    ; to [953] if false
[952] jmp        1            ; to [954]
[953] loadbool   16  1   0    ; true
[954] getglobal  24  166      ; DownloadQueue
[955] call       24  1   2  
[956] gettable   24  24  417  ; "Add"
[957] getglobal  25  11       ; g_env
[958] gettable   25  25  410  ; "curGameId"
[959] move       26  12     
[960] call       24  3   1  
[961] gettable   24  12  418  ; "SetCandyOptions"
[962] call       24  1   1  
[963] gettable   24  12  419  ; "InitEngine"
[964] call       24  1   1  
[965] getglobal  24  166      ; DownloadQueue
[966] call       24  1   2  
[967] gettable   24  24  420  ; "Run"
[968] call       24  1   1  
[969] return     0   1      
; end of function


; function [1] definition (level 3)
; 2 upvalues, 0 params, 8 stacks
.function  2 0 0 8
.local  "IncInstallCount"  ; 0
.upvalue  "win32"  ; 0
.upvalue  "errHandler"  ; 1
.const  "LogPing"  ; 0
.const  "field"  ; 1
.const  "src"  ; 2
.const  "component"  ; 3
.const  "state"  ; 4
.const  "complete"  ; 5
.const  "bndlevt"  ; 6

; function [0] definition (level 4)
; 1 upvalues, 0 params, 6 stacks
.function  1 0 0 6
.local  "instCount"  ; 0
.upvalue  "win32"  ; 0
.const  "GetRegKeyValue"  ; 0
.const  "HKEY_CLASSES_ROOT"  ; 1
.const  "g_constants"  ; 2
.const  "basekey"  ; 3
.const  "g_storeFront"  ; 4
.const  "instcount"  ; 5
.const  ""  ; 6
.const  0  ; 7
.const  "CreateRegKey"  ; 8
.const  1  ; 9
[01] getupval   0   0        ; win32
[02] gettable   0   0   250  ; "GetRegKeyValue"
[03] loadk      1   1        ; "HKEY_CLASSES_ROOT"
[04] getglobal  2   2        ; g_constants
[05] gettable   2   2   253  ; "basekey"
[06] getglobal  3   4        ; g_storeFront
[07] concat     2   2   3  
[08] getglobal  3   2        ; g_constants
[09] gettable   3   3   255  ; "instcount"
[10] call       0   4   2  
[11] eq         1   0   256  ; "", to [13] if false
[12] jmp        2            ; to [15]
[13] test       0   0   1    ; to [15] if false
[14] jmp        1            ; to [16]
[15] loadk      0   7        ; 0
[16] getupval   1   0        ; win32
[17] gettable   1   1   258  ; "CreateRegKey"
[18] loadk      2   1        ; "HKEY_CLASSES_ROOT"
[19] getglobal  3   2        ; g_constants
[20] gettable   3   3   253  ; "basekey"
[21] getglobal  4   4        ; g_storeFront
[22] concat     3   3   4  
[23] getglobal  4   2        ; g_constants
[24] gettable   4   4   255  ; "instcount"
[25] add        5   0   259  ; 1
[26] call       1   5   1  
[27] return     0   1      
; end of function

[01] closure    0   0        ; 1 upvalues
[02] getupval   0   0        ; win32
[03] getupval   1   1        ; errHandler
[04] gettable   1   1   250  ; "LogPing"
[05] newtable   2   3   0    ; array=3, hash=0
[06] newtable   3   2   0    ; array=2, hash=0
[07] getupval   4   1        ; errHandler
[08] gettable   4   4   251  ; "field"
[09] gettable   4   4   252  ; "src"
[10] getupval   5   1        ; errHandler
[11] gettable   5   5   252  ; "src"
[12] gettable   5   5   253  ; "component"
[13] setlist    3   1        ; index 1 to 2
[14] newtable   4   2   0    ; array=2, hash=0
[15] getupval   5   1        ; errHandler
[16] gettable   5   5   251  ; "field"
[17] gettable   5   5   254  ; "state"
[18] getupval   6   1        ; errHandler
[19] gettable   6   6   254  ; "state"
[20] gettable   6   6   255  ; "complete"
[21] setlist    4   1        ; index 1 to 2
[22] newtable   5   2   0    ; array=2, hash=0
[23] getupval   6   1        ; errHandler
[24] gettable   6   6   251  ; "field"
[25] gettable   6   6   256  ; "bndlevt"
[26] getupval   7   1        ; errHandler
[27] gettable   7   7   254  ; "state"
[28] gettable   7   7   255  ; "complete"
[29] setlist    5   1        ; index 1 to 2
[30] setlist    2   2        ; index 1 to 3
[31] loadbool   3   0   0    ; false
[32] call       1   3   1  
[33] move       1   0      
[34] call       1   1   1  
[35] return     0   1      
; end of function


; function [2] definition (level 3)
; 2 upvalues, 1 params, 12 stacks
.function  2 1 0 12
.local  "errEscapedString"  ; 0
.local  "xmlMutex"  ; 1
.local  "s"  ; 2
.local  "err"  ; 3
.upvalue  "win32"  ; 0
.upvalue  "errHandler"  ; 1
.const  "Mutex"  ; 0
.const  "RACV2InstallerXml"  ; 1
.const  "LogMessage"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Error() wait for xmlMutex"  ; 6
.const  "Wait"  ; 7
.const  1  ; 8
.const  -1  ; 9
.const  "Error() Acquired xmlMutex"  ; 10
.const  "pcall"  ; 11
.const  "DeleteFile"  ; 12
.const  "tmp.xml"  ; 13
.const  "Release"  ; 14
.const  "Close"  ; 15
.const  "Error() Release xmlMutex"  ; 16
.const  "RollBack"  ; 17
.const  "io"  ; 18
.const  "write"  ; 19
.const  "\n"  ; 20
.const  "tostring"  ; 21
.const  "LogPing"  ; 22
.const  "field"  ; 23
.const  "src"  ; 24
.const  "component"  ; 25
.const  "state"  ; 26
.const  "failed"  ; 27
.const  "bndlevt"  ; 28
.const  "error"  ; 29
[01] getupval   1   0        ; win32
[02] gettable   1   1   250  ; "Mutex"
[03] loadk      2   1        ; "RACV2InstallerXml"
[04] call       1   2   2  
[05] getupval   2   0        ; win32
[06] gettable   2   2   252  ; "LogMessage"
[07] getglobal  3   3        ; os
[08] gettable   3   3   254  ; "date"
[09] loadk      4   5        ; "%c "
[10] call       3   2   2  
[11] loadk      4   6        ; "Error() wait for xmlMutex"
[12] concat     3   3   4  
[13] call       2   2   1  
[14] gettable   2   1   257  ; "Wait"
[15] loadk      3   9        ; -1
[16] call       2   2   1  
[17] getupval   2   0        ; win32
[18] gettable   2   2   252  ; "LogMessage"
[19] getglobal  3   3        ; os
[20] gettable   3   3   254  ; "date"
[21] loadk      4   5        ; "%c "
[22] call       3   2   2  
[23] loadk      4   10       ; "Error() Acquired xmlMutex"
[24] concat     3   3   4  
[25] call       2   2   1  
[26] getglobal  2   11       ; pcall
[27] getupval   3   0        ; win32
[28] gettable   3   3   262  ; "DeleteFile"
[29] loadk      4   13       ; "tmp.xml"
[30] call       2   3   1  
[31] gettable   2   1   264  ; "Release"
[32] call       2   1   1  
[33] gettable   2   1   265  ; "Close"
[34] call       2   1   1  
[35] getupval   2   0        ; win32
[36] gettable   2   2   252  ; "LogMessage"
[37] getglobal  3   3        ; os
[38] gettable   3   3   254  ; "date"
[39] loadk      4   5        ; "%c "
[40] call       3   2   2  
[41] loadk      4   16       ; "Error() Release xmlMutex"
[42] concat     3   3   4  
[43] call       2   2   1  
[44] getglobal  2   11       ; pcall
[45] getglobal  3   17       ; RollBack
[46] call       2   2   3  
[47] test       2   2   1    ; to [49] if false
[48] jmp        7            ; to [56]
[49] getglobal  4   18       ; io
[50] gettable   4   4   269  ; "write"
[51] loadk      5   20       ; "\n"
[52] getglobal  6   21       ; tostring
[53] move       7   3      
[54] call       6   2   0  
[55] call       4   0   1  
[56] getupval   4   1        ; errHandler
[57] gettable   4   4   272  ; "LogPing"
[58] newtable   5   4   0    ; array=4, hash=0
[59] newtable   6   2   0    ; array=2, hash=0
[60] getupval   7   1        ; errHandler
[61] gettable   7   7   273  ; "field"
[62] gettable   7   7   274  ; "src"
[63] getupval   8   1        ; errHandler
[64] gettable   8   8   274  ; "src"
[65] gettable   8   8   275  ; "component"
[66] setlist    6   1        ; index 1 to 2
[67] newtable   7   2   0    ; array=2, hash=0
[68] getupval   8   1        ; errHandler
[69] gettable   8   8   273  ; "field"
[70] gettable   8   8   276  ; "state"
[71] getupval   9   1        ; errHandler
[72] gettable   9   9   276  ; "state"
[73] gettable   9   9   277  ; "failed"
[74] setlist    7   1        ; index 1 to 2
[75] newtable   8   2   0    ; array=2, hash=0
[76] getupval   9   1        ; errHandler
[77] gettable   9   9   273  ; "field"
[78] gettable   9   9   278  ; "bndlevt"
[79] getupval   10  1        ; errHandler
[80] gettable   10  10  276  ; "state"
[81] gettable   10  10  277  ; "failed"
[82] setlist    8   1        ; index 1 to 2
[83] newtable   9   2   0    ; array=2, hash=0
[84] getupval   10  1        ; errHandler
[85] gettable   10  10  273  ; "field"
[86] gettable   10  10  279  ; "error"
[87] move       11  0      
[88] setlist    9   1        ; index 1 to 2
[89] setlist    5   3        ; index 1 to 4
[90] loadbool   6   0   0    ; false
[91] call       4   3   1  
[92] return     0   1      
; end of function

[01] closure    1   0        ; 17 upvalues
[02] getupval   0   1        ; pidid
[03] getupval   0   2        ; pid
[04] getupval   0   3        ; win32
[05] getupval   0   4        ; g_strPathSFX
[06] move       0   0      
[07] getupval   0   5        ; GetDynamicStampVersion
[08] getupval   0   6        ; ReadLegacyStampValues
[09] getupval   0   7        ; ReadVersion1StampValues
[10] getupval   0   8        ; ReadVersion2StampValues
[11] getupval   0   9        ; StringToHex
[12] getupval   0   10       ; SplashURL
[13] getupval   0   11       ; SetInstallerLoc
[14] getupval   0   12       ; mutex
[15] getupval   0   13       ; StartNewLog
[16] getupval   0   14       ; hasRgiUpgradeFlag
[17] getupval   0   15       ; errHandler
[18] getupval   0   16       ; g_gameIdMutex
[19] setupval   1   0        ; Init
[20] closure    1   1        ; 2 upvalues
[21] getupval   0   3        ; win32
[22] getupval   0   15       ; errHandler
[23] setupval   1   17       ; ShutDown
[24] closure    1   2        ; 2 upvalues
[25] getupval   0   3        ; win32
[26] getupval   0   15       ; errHandler
[27] setupval   1   18       ; Error
[28] return     0   1      
; end of function


; function [13] definition (level 2)
; 11 upvalues, 0 params, 2 stacks
.function  11 0 0 2
.upvalue  "launchDir"  ; 0
.upvalue  "Init"  ; 1
.upvalue  "mutex"  ; 2
.upvalue  "win32"  ; 3
.upvalue  "g_strCDROOT"  ; 4
.upvalue  "SetInstallerLoc"  ; 5
.upvalue  "SplashURL"  ; 6
.upvalue  "cdinstall"  ; 7
.upvalue  "errHandler"  ; 8
.upvalue  "ShutDown"  ; 9
.upvalue  "Error"  ; 10

; function [0] definition (level 3)
; 8 upvalues, 0 params, 17 stacks
.function  8 0 0 17
.local  "env"  ; 0
.local  "envPattern"  ; 1
.local  "(for generator)"  ; 2
.local  "(for state)"  ; 3
.local  "_"  ; 4
.local  "p"  ; 5
.local  "start"  ; 6
.local  "finish"  ; 7
.local  "key"  ; 8
.local  "value"  ; 9
.local  "workDir"  ; 10
.local  "cmdEnv"  ; 11
.local  "(for generator)"  ; 12
.local  "(for state)"  ; 13
.local  "key"  ; 14
.local  "value"  ; 15
.local  "ui"  ; 16
.local  "interpreter"  ; 17
.local  "path"  ; 18
.local  "version"  ; 19
.upvalue  "mutex"  ; 0
.upvalue  "win32"  ; 1
.upvalue  "g_strCDROOT"  ; 2
.upvalue  "SetInstallerLoc"  ; 3
.upvalue  "SplashURL"  ; 4
.upvalue  "launchDir"  ; 5
.upvalue  "cdinstall"  ; 6
.upvalue  "errHandler"  ; 7
.const  "assert"  ; 0
.const  "arg"  ; 1
.const  2  ; 2
.const  "missingrgi"  ; 3
.const  "g_tableConfig"  ; 4
.const  "gamehouse.offline"  ; 5
.const  1  ; 6
.const  "g_fOffline"  ; 7
.const  "io"  ; 8
.const  "write"  ; 9
.const  "\n"  ; 10
.const  "os"  ; 11
.const  "date"  ; 12
.const  "%c "  ; 13
.const  "offline mode on"  ; 14
.const  "Mutex"  ; 15
.const  "RACV2InstallerInst"  ; 16
.const  "Lock"  ; 17
.const  "instance"  ; 18
.const  "(%a+)=\"?([^\"=]+)\"?"  ; 19
.const  "string"  ; 20
.const  "find"  ; 21
.const  "\nAdding env["  ; 22
.const  "] = "  ; 23
.const  " orginal: "  ; 24
.const  "cdroot"  ; 25
.const  "StoreFront"  ; 26
.const  "g_storeFront"  ; 27
.const  "lower"  ; 28
.const  "WorkingDir"  ; 29
.const  "g_constants"  ; 30
.const  "installerLoc"  ; 31
.const  ""  ; 32
.const  ".rgi"  ; 33
.const  ".xml"  ; 34
.const  " "  ; 35
.const  "\""  ; 36
.const  "="  ; 37
.const  "\" "  ; 38
.const  "LocalCopy"  ; 39
.const  "\\bin\\gameinstaller.exe"  ; 40
.const  "\\bin\\gamewrapper.exe"  ; 41
.const  "\nRestarting Installer..."  ; 42
.const  "ExecuteCommand"  ; 43
.const  "\\bin\\bstrapInstall.exe"  ; 44
.const  "cdinstall "  ; 45
.const  "exit"  ; 46
.const  "g_exit"  ; 47
.const  "success"  ; 48
.const  "InstallerUI"  ; 49
.const  "Create"  ; 50
.const  "Navigate"  ; 51
.const  "wait.html"  ; 52
.const  "MetadataInterp"  ; 53
.const  "CreateRegKey"  ; 54
.const  "HKEY_LOCAL_MACHINE"  ; 55
.const  "SOFTWARE\\GameInstaller\\Installer"  ; 56
.const  "Version"  ; 57
.const  "INSTALLER_VER"  ; 58
.const  "Location"  ; 59
.const  "RegisterInstallerType"  ; 60
.const  "\\"  ; 61
.const  "loading XML "  ; 62
.const  "LoadXML"  ; 63
.const  "GetValue"  ; 64
.const  "racversion"  ; 65
.const  "CheckOverInstall"  ; 66
.const  "greaterVer"  ; 67
.const  "gameid"  ; 68
.const  "realarcade"  ; 69
.const  "gamename"  ; 70
.const  "DLPROffer"  ; 71
.const  "bundleInstall.xml"  ; 72
.const  "gameInstall.rgi"  ; 73
.const  "LogPing"  ; 74
.const  "field"  ; 75
.const  "src"  ; 76
.const  "cdinstaller"  ; 77
.const  "state"  ; 78
.const  "start"  ; 79
.const  "dwnldevt"  ; 80
.const  "DownloadQueue"  ; 81
.const  "Add"  ; 82
.const  "g_env"  ; 83
.const  "curGameId"  ; 84
.const  "InitEngine"  ; 85
.const  "Run"  ; 86
[001] getglobal  0   0        ; assert
[002] getglobal  1   1        ; arg
[003] gettable   1   1   252  ; 2
[004] loadk      2   3        ; "missingrgi"
[005] call       0   3   1  
[006] getglobal  0   4        ; g_tableConfig
[007] gettable   0   0   255  ; "gamehouse.offline"
[008] eq         0   0   256  ; 1, to [10] if true
[009] jmp        12           ; to [22]
[010] loadbool   0   1   0    ; true
[011] setglobal  0   7        ; g_fOffline
[012] getglobal  0   8        ; io
[013] gettable   0   0   259  ; "write"
[014] loadk      1   10       ; "\n"
[015] getglobal  2   11       ; os
[016] gettable   2   2   262  ; "date"
[017] loadk      3   13       ; "%c "
[018] call       2   2   2  
[019] loadk      3   14       ; "offline mode on"
[020] call       0   4   1  
[021] jmp        11           ; to [33]
[022] getupval   0   1        ; win32
[023] gettable   0   0   265  ; "Mutex"
[024] loadk      1   16       ; "RACV2InstallerInst"
[025] call       0   2   2  
[026] setupval   0   0        ; mutex
[027] getglobal  0   0        ; assert
[028] getupval   1   0        ; mutex
[029] gettable   1   1   267  ; "Lock"
[030] call       1   1   2  
[031] loadk      2   18       ; "instance"
[032] call       0   3   1  
[033] newtable   0   0   0    ; array=0, hash=0
[034] loadk      1   19       ; "(%a+)=\"?([^\"=]+)\"?"
[035] getglobal  2   1        ; arg
[036] loadnil    3   5      
[037] tforprep   2   28       ; to [66]
[038] getglobal  6   20       ; string
[039] gettable   6   6   271  ; "find"
[040] move       7   5      
[041] move       8   1      
[042] call       6   3   5  
[043] test       6   6   0    ; to [45] if true
[044] jmp        21           ; to [66]
[045] settable   0   8   9  
[046] getglobal  10  8        ; io
[047] gettable   10  10  259  ; "write"
[048] loadk      11  22       ; "\nAdding env["
[049] move       12  8      
[050] loadk      13  23       ; "] = "
[051] move       14  9      
[052] loadk      15  24       ; " orginal: "
[053] move       16  5      
[054] concat     11  11  16 
[055] call       10  2   1  
[056] eq         0   8   275  ; "cdroot", to [58] if true
[057] jmp        1            ; to [59]
[058] setupval   9   2        ; g_strCDROOT
[059] eq         0   8   276  ; "StoreFront", to [61] if true
[060] jmp        5            ; to [66]
[061] getglobal  10  20       ; string
[062] gettable   10  10  278  ; "lower"
[063] move       11  9      
[064] call       10  2   2  
[065] setglobal  10  27       ; g_storeFront
[066] tforloop   2       1    ; to [68] if exit
[067] jmp        -30          ; to [38]
[068] getupval   2   3        ; SetInstallerLoc
[069] call       2   1   1  
[070] getupval   2   1        ; win32
[071] gettable   2   2   279  ; "WorkingDir"
[072] call       2   1   2  
[073] getglobal  3   30       ; g_constants
[074] gettable   3   3   281  ; "installerLoc"
[075] eq         1   2   3    ; to [77] if false
[076] jmp        69           ; to [146]
[077] loadk      3   32       ; ""
[078] getglobal  4   20       ; string
[079] gettable   4   4   271  ; "find"
[080] getglobal  5   1        ; arg
[081] gettable   5   5   252  ; 2
[082] loadk      6   33       ; ".rgi"
[083] call       4   3   2  
[084] test       4   4   1    ; to [86] if false
[085] jmp        8            ; to [94]
[086] getglobal  4   20       ; string
[087] gettable   4   4   271  ; "find"
[088] getglobal  5   1        ; arg
[089] gettable   5   5   252  ; 2
[090] loadk      6   34       ; ".xml"
[091] call       4   3   2  
[092] test       4   4   0    ; to [94] if true
[093] jmp        4            ; to [98]
[094] getglobal  4   1        ; arg
[095] gettable   4   4   252  ; 2
[096] loadk      5   35       ; " "
[097] concat     3   4   5  
[098] move       4   0      
[099] loadnil    5   7      
[100] tforprep   4   7        ; to [108]
[101] move       8   3      
[102] loadk      9   36       ; "\""
[103] move       10  6      
[104] loadk      11  37       ; "="
[105] move       12  7      
[106] loadk      13  38       ; "\" "
[107] concat     3   8   13 
[108] tforloop   4       1    ; to [110] if exit
[109] jmp        -9           ; to [101]
[110] getupval   4   1        ; win32
[111] gettable   4   4   289  ; "LocalCopy"
[112] move       5   2      
[113] getglobal  6   30       ; g_constants
[114] gettable   6   6   281  ; "installerLoc"
[115] call       4   3   1  
[116] getupval   4   1        ; win32
[117] gettable   4   4   289  ; "LocalCopy"
[118] move       5   2      
[119] loadk      6   40       ; "\\bin\\gameinstaller.exe"
[120] concat     5   5   6  
[121] getglobal  6   30       ; g_constants
[122] gettable   6   6   281  ; "installerLoc"
[123] loadk      7   41       ; "\\bin\\gamewrapper.exe"
[124] concat     6   6   7  
[125] call       4   3   1  
[126] getglobal  4   8        ; io
[127] gettable   4   4   259  ; "write"
[128] loadk      5   42       ; "\nRestarting Installer..."
[129] call       4   2   1  
[130] getglobal  4   43       ; ExecuteCommand
[131] getglobal  5   30       ; g_constants
[132] gettable   5   5   281  ; "installerLoc"
[133] loadk      6   44       ; "\\bin\\bstrapInstall.exe"
[134] concat     5   5   6  
[135] loadk      6   45       ; "cdinstall "
[136] move       7   3      
[137] concat     6   6   7  
[138] getglobal  7   30       ; g_constants
[139] gettable   7   7   281  ; "installerLoc"
[140] call       4   4   1  
[141] getglobal  4   11       ; os
[142] gettable   4   4   296  ; "exit"
[143] getglobal  5   47       ; g_exit
[144] gettable   5   5   298  ; "success"
[145] call       4   2   1  
[146] getglobal  3   49       ; InstallerUI
[147] call       3   1   2  
[148] gettable   4   3   300  ; "Create"
[149] call       4   1   1  
[150] gettable   4   3   301  ; "Navigate"
[151] getupval   5   4        ; SplashURL
[152] loadk      6   52       ; "wait.html"
[153] call       5   2   0  
[154] call       4   0   1  
[155] getglobal  4   53       ; MetadataInterp
[156] move       5   0      
[157] call       4   2   2  
[158] loadnil    5   5      
[159] getupval   6   1        ; win32
[160] gettable   6   6   304  ; "CreateRegKey"
[161] loadk      7   55       ; "HKEY_LOCAL_MACHINE"
[162] loadk      8   56       ; "SOFTWARE\\GameInstaller\\Installer"
[163] loadk      9   57       ; "Version"
[164] getglobal  10  58       ; INSTALLER_VER
[165] call       6   5   1  
[166] getupval   6   1        ; win32
[167] gettable   6   6   304  ; "CreateRegKey"
[168] loadk      7   55       ; "HKEY_LOCAL_MACHINE"
[169] loadk      8   56       ; "SOFTWARE\\GameInstaller\\Installer"
[170] loadk      9   59       ; "Location"
[171] getglobal  10  30       ; g_constants
[172] gettable   10  10  281  ; "installerLoc"
[173] call       6   5   1  
[174] getupval   6   1        ; win32
[175] gettable   6   6   310  ; "RegisterInstallerType"
[176] call       6   1   1  
[177] getupval   6   5        ; launchDir
[178] test       6   6   0    ; to [180] if true
[179] jmp        14           ; to [194]
[180] getglobal  6   20       ; string
[181] gettable   6   6   271  ; "find"
[182] getglobal  7   1        ; arg
[183] gettable   7   7   252  ; 2
[184] move       8   1      
[185] call       6   3   2  
[186] test       6   6   1    ; to [188] if false
[187] jmp        6            ; to [194]
[188] getupval   6   5        ; launchDir
[189] loadk      7   61       ; "\\"
[190] getglobal  8   1        ; arg
[191] gettable   8   8   252  ; 2
[192] concat     5   6   8  
[193] jmp        2            ; to [196]
[194] getglobal  6   1        ; arg
[195] gettable   5   6   252  ; 2
[196] getglobal  6   8        ; io
[197] gettable   6   6   259  ; "write"
[198] loadk      7   10       ; "\n"
[199] getglobal  8   11       ; os
[200] gettable   8   8   262  ; "date"
[201] loadk      9   13       ; "%c "
[202] call       8   2   2  
[203] loadk      9   62       ; "loading XML "
[204] move       10  5      
[205] concat     9   9   10 
[206] call       6   4   1  
[207] gettable   6   4   313  ; "LoadXML"
[208] move       7   5      
[209] call       6   2   1  
[210] gettable   6   4   314  ; "GetValue"
[211] gettable   7   4   315  ; "racversion"
[212] call       6   2   2  
[213] test       6   6   0    ; to [215] if true
[214] jmp        20           ; to [235]
[215] getglobal  7   66       ; CheckOverInstall
[216] move       8   6      
[217] call       7   2   2  
[218] eq         1   7   317  ; "greaterVer", to [220] if false
[219] jmp        15           ; to [235]
[220] gettable   7   0   318  ; "gameid"
[221] test       7   7   0    ; to [223] if true
[222] jmp        12           ; to [235]
[223] gettable   7   0   318  ; "gameid"
[224] eq         1   7   319  ; "realarcade", to [226] if false
[225] jmp        9            ; to [235]
[226] gettable   7   0   320  ; "gamename"
[227] eq         0   7   321  ; "DLPROffer", to [229] if true
[228] jmp        2            ; to [231]
[229] loadk      5   72       ; "bundleInstall.xml"
[230] jmp        1            ; to [232]
[231] loadk      5   73       ; "gameInstall.rgi"
[232] gettable   7   4   313  ; "LoadXML"
[233] move       8   5      
[234] call       7   2   1  
[235] loadbool   7   1   0    ; true
[236] setupval   7   6        ; cdinstall
[237] getupval   7   7        ; errHandler
[238] gettable   7   7   324  ; "LogPing"
[239] newtable   8   3   0    ; array=3, hash=0
[240] newtable   9   2   0    ; array=2, hash=0
[241] getupval   10  7        ; errHandler
[242] gettable   10  10  325  ; "field"
[243] gettable   10  10  326  ; "src"
[244] getupval   11  7        ; errHandler
[245] gettable   11  11  326  ; "src"
[246] gettable   11  11  327  ; "cdinstaller"
[247] setlist    9   1        ; index 1 to 2
[248] newtable   10  2   0    ; array=2, hash=0
[249] getupval   11  7        ; errHandler
[250] gettable   11  11  325  ; "field"
[251] gettable   11  11  328  ; "state"
[252] getupval   12  7        ; errHandler
[253] gettable   12  12  328  ; "state"
[254] gettable   12  12  329  ; "start"
[255] setlist    10  1        ; index 1 to 2
[256] newtable   11  2   0    ; array=2, hash=0
[257] getupval   12  7        ; errHandler
[258] gettable   12  12  325  ; "field"
[259] gettable   12  12  330  ; "dwnldevt"
[260] getupval   13  7        ; errHandler
[261] gettable   13  13  328  ; "state"
[262] gettable   13  13  329  ; "start"
[263] setlist    11  1        ; index 1 to 2
[264] setlist    8   2        ; index 1 to 3
[265] loadbool   9   0   0    ; false
[266] call       7   3   1  
[267] getglobal  7   81       ; DownloadQueue
[268] call       7   1   2  
[269] gettable   7   7   332  ; "Add"
[270] getglobal  8   83       ; g_env
[271] gettable   8   8   334  ; "curGameId"
[272] move       9   4      
[273] call       7   3   1  
[274] gettable   7   4   335  ; "InitEngine"
[275] call       7   1   1  
[276] getglobal  7   81       ; DownloadQueue
[277] call       7   1   2  
[278] gettable   7   7   336  ; "Run"
[279] call       7   1   1  
[280] return     0   1      
; end of function


; function [1] definition (level 3)
; 1 upvalues, 0 params, 7 stacks
.function  1 0 0 7
.upvalue  "errHandler"  ; 0
.const  "LogPing"  ; 0
.const  "field"  ; 1
.const  "src"  ; 2
.const  "cdinstaller"  ; 3
.const  "state"  ; 4
.const  "complete"  ; 5
.const  "bndlevt"  ; 6
[01] getupval   0   0        ; errHandler
[02] gettable   0   0   250  ; "LogPing"
[03] newtable   1   3   0    ; array=3, hash=0
[04] newtable   2   2   0    ; array=2, hash=0
[05] getupval   3   0        ; errHandler
[06] gettable   3   3   251  ; "field"
[07] gettable   3   3   252  ; "src"
[08] getupval   4   0        ; errHandler
[09] gettable   4   4   252  ; "src"
[10] gettable   4   4   253  ; "cdinstaller"
[11] setlist    2   1        ; index 1 to 2
[12] newtable   3   2   0    ; array=2, hash=0
[13] getupval   4   0        ; errHandler
[14] gettable   4   4   251  ; "field"
[15] gettable   4   4   254  ; "state"
[16] getupval   5   0        ; errHandler
[17] gettable   5   5   254  ; "state"
[18] gettable   5   5   255  ; "complete"
[19] setlist    3   1        ; index 1 to 2
[20] newtable   4   2   0    ; array=2, hash=0
[21] getupval   5   0        ; errHandler
[22] gettable   5   5   251  ; "field"
[23] gettable   5   5   256  ; "bndlevt"
[24] getupval   6   0        ; errHandler
[25] gettable   6   6   254  ; "state"
[26] gettable   6   6   255  ; "complete"
[27] setlist    4   1        ; index 1 to 2
[28] setlist    1   2        ; index 1 to 3
[29] loadbool   2   0   0    ; false
[30] call       0   3   1  
[31] return     0   1      
; end of function


; function [2] definition (level 3)
; 1 upvalues, 1 params, 11 stacks
.function  1 1 0 11
.local  "errEscapedString"  ; 0
.local  "s"  ; 1
.local  "err"  ; 2
.upvalue  "errHandler"  ; 0
.const  "pcall"  ; 0
.const  "RollBack"  ; 1
.const  "io"  ; 2
.const  "write"  ; 3
.const  "\n"  ; 4
.const  "tostring"  ; 5
.const  "LogPing"  ; 6
.const  "field"  ; 7
.const  "src"  ; 8
.const  "cdinstaller"  ; 9
.const  "state"  ; 10
.const  "failed"  ; 11
.const  "bndlevt"  ; 12
.const  "error"  ; 13
[01] getglobal  1   0        ; pcall
[02] getglobal  2   1        ; RollBack
[03] call       1   2   3  
[04] test       1   1   1    ; to [6] if false
[05] jmp        7            ; to [13]
[06] getglobal  3   2        ; io
[07] gettable   3   3   253  ; "write"
[08] loadk      4   4        ; "\n"
[09] getglobal  5   5        ; tostring
[10] move       6   2      
[11] call       5   2   0  
[12] call       3   0   1  
[13] getupval   3   0        ; errHandler
[14] gettable   3   3   256  ; "LogPing"
[15] newtable   4   4   0    ; array=4, hash=0
[16] newtable   5   2   0    ; array=2, hash=0
[17] getupval   6   0        ; errHandler
[18] gettable   6   6   257  ; "field"
[19] gettable   6   6   258  ; "src"
[20] getupval   7   0        ; errHandler
[21] gettable   7   7   258  ; "src"
[22] gettable   7   7   259  ; "cdinstaller"
[23] setlist    5   1        ; index 1 to 2
[24] newtable   6   2   0    ; array=2, hash=0
[25] getupval   7   0        ; errHandler
[26] gettable   7   7   257  ; "field"
[27] gettable   7   7   260  ; "state"
[28] getupval   8   0        ; errHandler
[29] gettable   8   8   260  ; "state"
[30] gettable   8   8   261  ; "failed"
[31] setlist    6   1        ; index 1 to 2
[32] newtable   7   2   0    ; array=2, hash=0
[33] getupval   8   0        ; errHandler
[34] gettable   8   8   257  ; "field"
[35] gettable   8   8   262  ; "bndlevt"
[36] getupval   9   0        ; errHandler
[37] gettable   9   9   260  ; "state"
[38] gettable   9   9   261  ; "failed"
[39] setlist    7   1        ; index 1 to 2
[40] newtable   8   2   0    ; array=2, hash=0
[41] getupval   9   0        ; errHandler
[42] gettable   9   9   257  ; "field"
[43] gettable   9   9   263  ; "error"
[44] move       10  0      
[45] setlist    8   1        ; index 1 to 2
[46] setlist    4   3        ; index 1 to 4
[47] loadbool   5   0   0    ; false
[48] call       3   3   1  
[49] return     0   1      
; end of function

[01] loadnil    0   0      
[02] setupval   0   0        ; launchDir
[03] closure    0   0        ; 8 upvalues
[04] getupval   0   2        ; mutex
[05] getupval   0   3        ; win32
[06] getupval   0   4        ; g_strCDROOT
[07] getupval   0   5        ; SetInstallerLoc
[08] getupval   0   6        ; SplashURL
[09] getupval   0   0        ; launchDir
[10] getupval   0   7        ; cdinstall
[11] getupval   0   8        ; errHandler
[12] setupval   0   1        ; Init
[13] closure    0   1        ; 1 upvalues
[14] getupval   0   8        ; errHandler
[15] setupval   0   9        ; ShutDown
[16] closure    0   2        ; 1 upvalues
[17] getupval   0   8        ; errHandler
[18] setupval   0   10       ; Error
[19] return     0   1      
; end of function


; function [14] definition (level 2)
; 10 upvalues, 0 params, 2 stacks
.function  10 0 0 2
.upvalue  "Init"  ; 0
.upvalue  "launchDir"  ; 1
.upvalue  "mutex"  ; 2
.upvalue  "win32"  ; 3
.upvalue  "SplashURL"  ; 4
.upvalue  "errHandler"  ; 5
.upvalue  "SetInstallerLoc"  ; 6
.upvalue  "ShutDown"  ; 7
.upvalue  "setRgiUpgradeFlag"  ; 8
.upvalue  "Error"  ; 9

; function [0] definition (level 3)
; 6 upvalues, 0 params, 10 stacks
.function  6 0 0 10
.local  "ui"  ; 0
.local  "interpreter"  ; 1
.local  "path"  ; 2
.upvalue  "launchDir"  ; 0
.upvalue  "mutex"  ; 1
.upvalue  "win32"  ; 2
.upvalue  "SplashURL"  ; 3
.upvalue  "errHandler"  ; 4
.upvalue  "SetInstallerLoc"  ; 5
.const  "InstallerUI"  ; 0
.const  "assert"  ; 1
.const  "arg"  ; 2
.const  1  ; 3
.const  "missingrgi"  ; 4
.const  "MetadataInterp"  ; 5
.const  "\\"  ; 6
.const  "LoadXML"  ; 7
.const  "Mutex"  ; 8
.const  "RACV2InstallerInst"  ; 9
.const  "Lock"  ; 10
.const  "SendQDownloadMsg"  ; 11
.const  "g_env"  ; 12
.const  "curGameId"  ; 13
.const  "curTps"  ; 14
.const  "curGameName"  ; 15
.const  "Create"  ; 16
.const  "Navigate"  ; 17
.const  "wait.html"  ; 18
.const  "LogPing"  ; 19
.const  "field"  ; 20
.const  "src"  ; 21
.const  "component"  ; 22
.const  "state"  ; 23
.const  "start"  ; 24
.const  "dwnldevt"  ; 25
.const  "RequestRgi"  ; 26
.const  "DownloadQueue"  ; 27
.const  "Add"  ; 28
.const  "SetCandyOptions"  ; 29
.const  "InitEngine"  ; 30
.const  "Run"  ; 31
[001] getglobal  0   0        ; InstallerUI
[002] call       0   1   2  
[003] getglobal  1   1        ; assert
[004] getglobal  2   2        ; arg
[005] gettable   2   2   253  ; 1
[006] loadk      3   4        ; "missingrgi"
[007] call       1   3   1  
[008] getglobal  1   5        ; MetadataInterp
[009] call       1   1   2  
[010] loadnil    2   2      
[011] getupval   3   0        ; launchDir
[012] test       3   3   0    ; to [14] if true
[013] jmp        6            ; to [20]
[014] getupval   3   0        ; launchDir
[015] loadk      4   6        ; "\\"
[016] getglobal  5   2        ; arg
[017] gettable   5   5   253  ; 1
[018] concat     2   3   5  
[019] jmp        2            ; to [22]
[020] getglobal  3   2        ; arg
[021] gettable   2   3   253  ; 1
[022] gettable   3   1   257  ; "LoadXML"
[023] move       4   2      
[024] call       3   2   1  
[025] getupval   3   2        ; win32
[026] gettable   3   3   258  ; "Mutex"
[027] loadk      4   9        ; "RACV2InstallerInst"
[028] call       3   2   2  
[029] setupval   3   1        ; mutex
[030] getupval   3   1        ; mutex
[031] gettable   3   3   260  ; "Lock"
[032] call       3   1   2  
[033] test       3   3   1    ; to [35] if false
[034] jmp        9            ; to [44]
[035] gettable   3   0   261  ; "SendQDownloadMsg"
[036] getglobal  4   12       ; g_env
[037] gettable   4   4   263  ; "curGameId"
[038] getglobal  5   12       ; g_env
[039] gettable   5   5   264  ; "curTps"
[040] getglobal  6   12       ; g_env
[041] gettable   6   6   265  ; "curGameName"
[042] call       3   4   1  
[043] return     0   1      
[044] gettable   3   0   266  ; "Create"
[045] call       3   1   1  
[046] gettable   3   0   267  ; "Navigate"
[047] getupval   4   3        ; SplashURL
[048] loadk      5   18       ; "wait.html"
[049] call       4   2   0  
[050] call       3   0   1  
[051] getupval   3   4        ; errHandler
[052] gettable   3   3   269  ; "LogPing"
[053] newtable   4   3   0    ; array=3, hash=0
[054] newtable   5   2   0    ; array=2, hash=0
[055] getupval   6   4        ; errHandler
[056] gettable   6   6   270  ; "field"
[057] gettable   6   6   271  ; "src"
[058] getupval   7   4        ; errHandler
[059] gettable   7   7   271  ; "src"
[060] gettable   7   7   272  ; "component"
[061] setlist    5   1        ; index 1 to 2
[062] newtable   6   2   0    ; array=2, hash=0
[063] getupval   7   4        ; errHandler
[064] gettable   7   7   270  ; "field"
[065] gettable   7   7   273  ; "state"
[066] getupval   8   4        ; errHandler
[067] gettable   8   8   273  ; "state"
[068] gettable   8   8   274  ; "start"
[069] setlist    6   1        ; index 1 to 2
[070] newtable   7   2   0    ; array=2, hash=0
[071] getupval   8   4        ; errHandler
[072] gettable   8   8   270  ; "field"
[073] gettable   8   8   275  ; "dwnldevt"
[074] getupval   9   4        ; errHandler
[075] gettable   9   9   273  ; "state"
[076] gettable   9   9   274  ; "start"
[077] setlist    7   1        ; index 1 to 2
[078] setlist    4   2        ; index 1 to 3
[079] loadbool   5   0   0    ; false
[080] call       3   3   1  
[081] getupval   3   5        ; SetInstallerLoc
[082] call       3   1   1  
[083] gettable   3   1   276  ; "RequestRgi"
[084] call       3   1   1  
[085] getglobal  3   27       ; DownloadQueue
[086] call       3   1   2  
[087] gettable   3   3   278  ; "Add"
[088] getglobal  4   12       ; g_env
[089] gettable   4   4   263  ; "curGameId"
[090] move       5   1      
[091] call       3   3   1  
[092] gettable   3   1   279  ; "SetCandyOptions"
[093] call       3   1   1  
[094] gettable   3   1   280  ; "InitEngine"
[095] call       3   1   1  
[096] getglobal  3   27       ; DownloadQueue
[097] call       3   1   2  
[098] gettable   3   3   281  ; "Run"
[099] call       3   1   1  
[100] return     0   1      
; end of function


; function [1] definition (level 3)
; 2 upvalues, 0 params, 9 stacks
.function  2 0 0 9
.local  "state"  ; 0
.upvalue  "errHandler"  ; 0
.upvalue  "setRgiUpgradeFlag"  ; 1
.const  "g_upgrademode"  ; 0
.const  "state"  ; 1
.const  "upgrade"  ; 2
.const  "complete"  ; 3
.const  "io"  ; 4
.const  "write"  ; 5
.const  "\n"  ; 6
.const  "os"  ; 7
.const  "date"  ; 8
.const  "%c "  ; 9
.const  "\nShutDown Gameexe = "  ; 10
.const  "tostring"  ; 11
.const  "g_env"  ; 12
.const  "gameExe"  ; 13
.const  " "  ; 14
.const  "upgradeStarting"  ; 15
.const  "LogPing"  ; 16
.const  "field"  ; 17
.const  "src"  ; 18
.const  "component"  ; 19
.const  "bndlevt"  ; 20
[01] loadnil    0   0      
[02] getglobal  1   0        ; g_upgrademode
[03] test       1   1   0    ; to [5] if true
[04] jmp        6            ; to [11]
[05] getupval   1   0        ; errHandler
[06] gettable   1   1   251  ; "state"
[07] gettable   0   1   252  ; "upgrade"
[08] getupval   1   1        ; setRgiUpgradeFlag
[09] call       1   1   1  
[10] jmp        3            ; to [14]
[11] getupval   1   0        ; errHandler
[12] gettable   1   1   251  ; "state"
[13] gettable   0   1   253  ; "complete"
[14] getglobal  1   4        ; io
[15] gettable   1   1   255  ; "write"
[16] loadk      2   6        ; "\n"
[17] getglobal  3   7        ; os
[18] gettable   3   3   258  ; "date"
[19] loadk      4   9        ; "%c "
[20] call       3   2   2  
[21] loadk      4   10       ; "\nShutDown Gameexe = "
[22] getglobal  5   11       ; tostring
[23] getglobal  6   12       ; g_env
[24] gettable   6   6   263  ; "gameExe"
[25] call       5   2   2  
[26] loadk      6   14       ; " "
[27] getglobal  7   11       ; tostring
[28] getglobal  8   12       ; g_env
[29] gettable   8   8   265  ; "upgradeStarting"
[30] call       7   2   2  
[31] loadk      8   6        ; "\n"
[32] call       1   8   1  
[33] getupval   1   0        ; errHandler
[34] gettable   1   1   266  ; "LogPing"
[35] newtable   2   3   0    ; array=3, hash=0
[36] newtable   3   2   0    ; array=2, hash=0
[37] getupval   4   0        ; errHandler
[38] gettable   4   4   267  ; "field"
[39] gettable   4   4   268  ; "src"
[40] getupval   5   0        ; errHandler
[41] gettable   5   5   268  ; "src"
[42] gettable   5   5   269  ; "component"
[43] setlist    3   1        ; index 1 to 2
[44] newtable   4   2   0    ; array=2, hash=0
[45] getupval   5   0        ; errHandler
[46] gettable   5   5   267  ; "field"
[47] gettable   5   5   251  ; "state"
[48] getupval   6   0        ; errHandler
[49] gettable   6   6   251  ; "state"
[50] gettable   6   6   253  ; "complete"
[51] setlist    4   1        ; index 1 to 2
[52] newtable   5   2   0    ; array=2, hash=0
[53] getupval   6   0        ; errHandler
[54] gettable   6   6   267  ; "field"
[55] gettable   6   6   270  ; "bndlevt"
[56] move       7   0      
[57] setlist    5   1        ; index 1 to 2
[58] setlist    2   2        ; index 1 to 3
[59] loadbool   3   0   0    ; false
[60] call       1   3   1  
[61] return     0   1      
; end of function


; function [2] definition (level 3)
; 2 upvalues, 1 params, 11 stacks
.function  2 1 0 11
.local  "errEscapedString"  ; 0
.local  "s"  ; 1
.local  "err"  ; 2
.upvalue  "win32"  ; 0
.upvalue  "errHandler"  ; 1
.const  "g_upgrademode"  ; 0
.const  "DeleteRegKey"  ; 1
.const  "HKEY_LOCAL_MACHINE"  ; 2
.const  "SOFTWARE\\GameInstaller\\Installer"  ; 3
.const  "upgrade"  ; 4
.const  "pcall"  ; 5
.const  "RollBack"  ; 6
.const  "io"  ; 7
.const  "write"  ; 8
.const  "\n"  ; 9
.const  "tostring"  ; 10
.const  "LogPing"  ; 11
.const  "field"  ; 12
.const  "src"  ; 13
.const  "component"  ; 14
.const  "state"  ; 15
.const  "failed"  ; 16
.const  "bndlevt"  ; 17
.const  "error"  ; 18
[01] getglobal  1   0        ; g_upgrademode
[02] test       1   1   0    ; to [4] if true
[03] jmp        6            ; to [10]
[04] getupval   1   0        ; win32
[05] gettable   1   1   251  ; "DeleteRegKey"
[06] loadk      2   2        ; "HKEY_LOCAL_MACHINE"
[07] loadk      3   3        ; "SOFTWARE\\GameInstaller\\Installer"
[08] loadk      4   4        ; "upgrade"
[09] call       1   4   1  
[10] getglobal  1   5        ; pcall
[11] getglobal  2   6        ; RollBack
[12] call       1   2   3  
[13] test       1   1   1    ; to [15] if false
[14] jmp        7            ; to [22]
[15] getglobal  3   7        ; io
[16] gettable   3   3   258  ; "write"
[17] loadk      4   9        ; "\n"
[18] getglobal  5   10       ; tostring
[19] move       6   2      
[20] call       5   2   0  
[21] call       3   0   1  
[22] getupval   3   1        ; errHandler
[23] gettable   3   3   261  ; "LogPing"
[24] newtable   4   4   0    ; array=4, hash=0
[25] newtable   5   2   0    ; array=2, hash=0
[26] getupval   6   1        ; errHandler
[27] gettable   6   6   262  ; "field"
[28] gettable   6   6   263  ; "src"
[29] getupval   7   1        ; errHandler
[30] gettable   7   7   263  ; "src"
[31] gettable   7   7   264  ; "component"
[32] setlist    5   1        ; index 1 to 2
[33] newtable   6   2   0    ; array=2, hash=0
[34] getupval   7   1        ; errHandler
[35] gettable   7   7   262  ; "field"
[36] gettable   7   7   265  ; "state"
[37] getupval   8   1        ; errHandler
[38] gettable   8   8   265  ; "state"
[39] gettable   8   8   266  ; "failed"
[40] setlist    6   1        ; index 1 to 2
[41] newtable   7   2   0    ; array=2, hash=0
[42] getupval   8   1        ; errHandler
[43] gettable   8   8   262  ; "field"
[44] gettable   8   8   267  ; "bndlevt"
[45] getupval   9   1        ; errHandler
[46] gettable   9   9   265  ; "state"
[47] gettable   9   9   266  ; "failed"
[48] setlist    7   1        ; index 1 to 2
[49] newtable   8   2   0    ; array=2, hash=0
[50] getupval   9   1        ; errHandler
[51] gettable   9   9   262  ; "field"
[52] gettable   9   9   268  ; "error"
[53] move       10  0      
[54] setlist    8   1        ; index 1 to 2
[55] setlist    4   3        ; index 1 to 4
[56] loadbool   5   0   0    ; false
[57] call       3   3   1  
[58] return     0   1      
; end of function

[01] closure    0   0        ; 6 upvalues
[02] getupval   0   1        ; launchDir
[03] getupval   0   2        ; mutex
[04] getupval   0   3        ; win32
[05] getupval   0   4        ; SplashURL
[06] getupval   0   5        ; errHandler
[07] getupval   0   6        ; SetInstallerLoc
[08] setupval   0   0        ; Init
[09] closure    0   1        ; 2 upvalues
[10] getupval   0   5        ; errHandler
[11] getupval   0   8        ; setRgiUpgradeFlag
[12] setupval   0   7        ; ShutDown
[13] closure    0   2        ; 2 upvalues
[14] getupval   0   3        ; win32
[15] getupval   0   5        ; errHandler
[16] setupval   0   9        ; Error
[17] return     0   1      
; end of function


; function [15] definition (level 2)
; 5 upvalues, 0 params, 2 stacks
.function  5 0 0 2
.upvalue  "launchDir"  ; 0
.upvalue  "Init"  ; 1
.upvalue  "errHandler"  ; 2
.upvalue  "ShutDown"  ; 3
.upvalue  "Error"  ; 4

; function [0] definition (level 3)
; 1 upvalues, 0 params, 8 stacks
.function  1 0 0 8
.local  "interpreter"  ; 0
.upvalue  "errHandler"  ; 0
.const  "g_installed"  ; 0
.const  "assert"  ; 1
.const  "arg"  ; 2
.const  2  ; 3
.const  "missingrgi"  ; 4
.const  "MetadataInterp"  ; 5
.const  "LoadXML"  ; 6
.const  "LogPing"  ; 7
.const  "field"  ; 8
.const  "src"  ; 9
.const  "wrapper"  ; 10
.const  "state"  ; 11
.const  "start"  ; 12
.const  "dwnldevt"  ; 13
.const  "InitEngine"  ; 14
.const  "PostProcess"  ; 15
.const  "ShutdownEngine"  ; 16
[01] loadbool   0   1   0    ; true
[02] setglobal  0   0        ; g_installed
[03] getglobal  0   1        ; assert
[04] getglobal  1   2        ; arg
[05] gettable   1   1   253  ; 2
[06] loadk      2   4        ; "missingrgi"
[07] call       0   3   1  
[08] getglobal  0   5        ; MetadataInterp
[09] call       0   1   2  
[10] gettable   1   0   256  ; "LoadXML"
[11] getglobal  2   2        ; arg
[12] gettable   2   2   253  ; 2
[13] call       1   2   1  
[14] getupval   1   0        ; errHandler
[15] gettable   1   1   257  ; "LogPing"
[16] newtable   2   3   0    ; array=3, hash=0
[17] newtable   3   2   0    ; array=2, hash=0
[18] getupval   4   0        ; errHandler
[19] gettable   4   4   258  ; "field"
[20] gettable   4   4   259  ; "src"
[21] getupval   5   0        ; errHandler
[22] gettable   5   5   259  ; "src"
[23] gettable   5   5   260  ; "wrapper"
[24] setlist    3   1        ; index 1 to 2
[25] newtable   4   2   0    ; array=2, hash=0
[26] getupval   5   0        ; errHandler
[27] gettable   5   5   258  ; "field"
[28] gettable   5   5   261  ; "state"
[29] getupval   6   0        ; errHandler
[30] gettable   6   6   261  ; "state"
[31] gettable   6   6   262  ; "start"
[32] setlist    4   1        ; index 1 to 2
[33] newtable   5   2   0    ; array=2, hash=0
[34] getupval   6   0        ; errHandler
[35] gettable   6   6   258  ; "field"
[36] gettable   6   6   263  ; "dwnldevt"
[37] getupval   7   0        ; errHandler
[38] gettable   7   7   261  ; "state"
[39] gettable   7   7   262  ; "start"
[40] setlist    5   1        ; index 1 to 2
[41] setlist    2   2        ; index 1 to 3
[42] loadbool   3   0   0    ; false
[43] call       1   3   1  
[44] gettable   1   0   264  ; "InitEngine"
[45] call       1   1   1  
[46] gettable   1   0   265  ; "PostProcess"
[47] call       1   1   1  
[48] gettable   1   0   266  ; "ShutdownEngine"
[49] call       1   1   1  
[50] return     0   1      
; end of function


; function [1] definition (level 3)
; 1 upvalues, 0 params, 7 stacks
.function  1 0 0 7
.upvalue  "errHandler"  ; 0
.const  "LogPing"  ; 0
.const  "field"  ; 1
.const  "src"  ; 2
.const  "wrapper"  ; 3
.const  "state"  ; 4
.const  "complete"  ; 5
.const  "bndlevt"  ; 6
[01] getupval   0   0        ; errHandler
[02] gettable   0   0   250  ; "LogPing"
[03] newtable   1   3   0    ; array=3, hash=0
[04] newtable   2   2   0    ; array=2, hash=0
[05] getupval   3   0        ; errHandler
[06] gettable   3   3   251  ; "field"
[07] gettable   3   3   252  ; "src"
[08] getupval   4   0        ; errHandler
[09] gettable   4   4   252  ; "src"
[10] gettable   4   4   253  ; "wrapper"
[11] setlist    2   1        ; index 1 to 2
[12] newtable   3   2   0    ; array=2, hash=0
[13] getupval   4   0        ; errHandler
[14] gettable   4   4   251  ; "field"
[15] gettable   4   4   254  ; "state"
[16] getupval   5   0        ; errHandler
[17] gettable   5   5   254  ; "state"
[18] gettable   5   5   255  ; "complete"
[19] setlist    3   1        ; index 1 to 2
[20] newtable   4   2   0    ; array=2, hash=0
[21] getupval   5   0        ; errHandler
[22] gettable   5   5   251  ; "field"
[23] gettable   5   5   256  ; "bndlevt"
[24] getupval   6   0        ; errHandler
[25] gettable   6   6   254  ; "state"
[26] gettable   6   6   255  ; "complete"
[27] setlist    4   1        ; index 1 to 2
[28] setlist    1   2        ; index 1 to 3
[29] loadbool   2   0   0    ; false
[30] call       0   3   1  
[31] return     0   1      
; end of function


; function [2] definition (level 3)
; 1 upvalues, 1 params, 9 stacks
.function  1 1 0 9
.local  "errEscapedString"  ; 0
.upvalue  "errHandler"  ; 0
.const  "s"  ; 0
.const  "io"  ; 1
.const  "write"  ; 2
.const  "\n"  ; 3
.const  "tostring"  ; 4
.const  "err"  ; 5
.const  "LogPing"  ; 6
.const  "field"  ; 7
.const  "src"  ; 8
.const  "wrapper"  ; 9
.const  "state"  ; 10
.const  "failed"  ; 11
.const  "bndlevt"  ; 12
.const  "error"  ; 13
[01] getglobal  1   0        ; s
[02] test       1   1   1    ; to [4] if false
[03] jmp        7            ; to [11]
[04] getglobal  1   1        ; io
[05] gettable   1   1   252  ; "write"
[06] loadk      2   3        ; "\n"
[07] getglobal  3   4        ; tostring
[08] getglobal  4   5        ; err
[09] call       3   2   0  
[10] call       1   0   1  
[11] getupval   1   0        ; errHandler
[12] gettable   1   1   256  ; "LogPing"
[13] newtable   2   4   0    ; array=4, hash=0
[14] newtable   3   2   0    ; array=2, hash=0
[15] getupval   4   0        ; errHandler
[16] gettable   4   4   257  ; "field"
[17] gettable   4   4   258  ; "src"
[18] getupval   5   0        ; errHandler
[19] gettable   5   5   258  ; "src"
[20] gettable   5   5   259  ; "wrapper"
[21] setlist    3   1        ; index 1 to 2
[22] newtable   4   2   0    ; array=2, hash=0
[23] getupval   5   0        ; errHandler
[24] gettable   5   5   257  ; "field"
[25] gettable   5   5   260  ; "state"
[26] getupval   6   0        ; errHandler
[27] gettable   6   6   260  ; "state"
[28] gettable   6   6   261  ; "failed"
[29] setlist    4   1        ; index 1 to 2
[30] newtable   5   2   0    ; array=2, hash=0
[31] getupval   6   0        ; errHandler
[32] gettable   6   6   257  ; "field"
[33] gettable   6   6   262  ; "bndlevt"
[34] getupval   7   0        ; errHandler
[35] gettable   7   7   260  ; "state"
[36] gettable   7   7   261  ; "failed"
[37] setlist    5   1        ; index 1 to 2
[38] newtable   6   2   0    ; array=2, hash=0
[39] getupval   7   0        ; errHandler
[40] gettable   7   7   257  ; "field"
[41] gettable   7   7   263  ; "error"
[42] move       8   0      
[43] setlist    6   1        ; index 1 to 2
[44] setlist    2   3        ; index 1 to 4
[45] loadbool   3   0   0    ; false
[46] call       1   3   1  
[47] return     0   1      
; end of function

[01] loadnil    0   0      
[02] setupval   0   0        ; launchDir
[03] closure    0   0        ; 1 upvalues
[04] getupval   0   2        ; errHandler
[05] setupval   0   1        ; Init
[06] closure    0   1        ; 1 upvalues
[07] getupval   0   2        ; errHandler
[08] setupval   0   3        ; ShutDown
[09] closure    0   2        ; 1 upvalues
[10] getupval   0   2        ; errHandler
[11] setupval   0   4        ; Error
[12] return     0   1      
; end of function


; function [16] definition (level 2)
; 7 upvalues, 0 params, 2 stacks
.function  7 0 0 2
.upvalue  "Init"  ; 0
.upvalue  "mutex"  ; 1
.upvalue  "win32"  ; 2
.upvalue  "SetInstallerLoc"  ; 3
.upvalue  "errHandler"  ; 4
.upvalue  "ShutDown"  ; 5
.upvalue  "Error"  ; 6

; function [0] definition (level 3)
; 4 upvalues, 0 params, 9 stacks
.function  4 0 0 9
.local  "TryGetStorefrontFromScript"  ; 0
.local  "storefront"  ; 1
.local  "obj"  ; 2
.upvalue  "mutex"  ; 0
.upvalue  "win32"  ; 1
.upvalue  "SetInstallerLoc"  ; 2
.upvalue  "errHandler"  ; 3
.const  "Mutex"  ; 0
.const  "RACV2InstallerInst"  ; 1
.const  "assert"  ; 2
.const  "Lock"  ; 3
.const  "instance"  ; 4
.const  "arg"  ; 5
.const  1  ; 6
.const  "no_uninstall_script"  ; 7
.const  "io"  ; 8
.const  "write"  ; 9
.const  "\n"  ; 10
.const  "os"  ; 11
.const  "date"  ; 12
.const  "%c "  ; 13
.const  "Processing: "  ; 14
.const  "g_storeFront"  ; 15
.const  "string"  ; 16
.const  "lower"  ; 17
.const  "TryGetStorefrontFromScript: set g_storeFront to:"  ; 18
.const  "tostring"  ; 19
.const  "."  ; 20
.const  "UnInstaller"  ; 21
.const  "LogPing"  ; 22
.const  "field"  ; 23
.const  "src"  ; 24
.const  "uninstaller"  ; 25
.const  "state"  ; 26
.const  "start"  ; 27
.const  "ProcessScript"  ; 28

; function [0] definition (level 4)
; 0 upvalues, 1 params, 13 stacks
.function  0 1 0 13
.local  "scriptName"  ; 0
.local  "reply"  ; 1
.local  "script"  ; 2
.local  "(for generator)"  ; 3
.local  "(for state)"  ; 4
.local  "line"  ; 5
.local  "cmd"  ; 6
.local  "(for generator)"  ; 7
.local  "(for state)"  ; 8
.local  "tok"  ; 9
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "TryGetStorefrontFromScript: "  ; 6
.const  "open"  ; 7
.const  "r"  ; 8
.const  "openW"  ; 9
.const  "lines"  ; 10
.const  "string"  ; 11
.const  "gfind"  ; 12
.const  "[^,]+"  ; 13
.const  "table"  ; 14
.const  "insert"  ; 15
.const  1  ; 16
.const  "DECGAME"  ; 17
.const  "TryGetStorefrontFromScript: found DECGAME "  ; 18
.const  "tostring"  ; 19
.const  2  ; 20
.const  "close"  ; 21
.const  "TryGetStorefrontFromScript: failed to open "  ; 22
[01] getglobal  1   0        ; io
[02] gettable   1   1   251  ; "write"
[03] loadk      2   2        ; "\n"
[04] getglobal  3   3        ; os
[05] gettable   3   3   254  ; "date"
[06] loadk      4   5        ; "%c "
[07] call       3   2   2  
[08] loadk      4   6        ; "TryGetStorefrontFromScript: "
[09] move       5   0      
[10] call       1   5   1  
[11] loadnil    1   1      
[12] getglobal  2   0        ; io
[13] gettable   2   2   257  ; "open"
[14] move       3   0      
[15] loadk      4   8        ; "r"
[16] call       2   3   2  
[17] test       2   2   1    ; to [19] if false
[18] jmp        6            ; to [25]
[19] getglobal  3   0        ; io
[20] gettable   3   3   259  ; "openW"
[21] move       4   0      
[22] loadk      5   8        ; "r"
[23] call       3   3   2  
[24] move       2   3      
[25] test       2   2   0    ; to [27] if true
[26] jmp        40           ; to [67]
[27] self       3   2   260  ; "lines"
[28] call       3   2   4  
[29] tforprep   3   31       ; to [61]
[30] newtable   6   0   0    ; array=0, hash=0
[31] getglobal  7   11       ; string
[32] gettable   7   7   262  ; "gfind"
[33] move       8   5      
[34] loadk      9   13       ; "[^,]+"
[35] call       7   3   4  
[36] tforprep   7   5        ; to [42]
[37] getglobal  10  14       ; table
[38] gettable   10  10  265  ; "insert"
[39] move       11  6      
[40] move       12  9      
[41] call       10  3   1  
[42] tforloop   7       0    ; to [44] if exit
[43] jmp        -7           ; to [37]
[44] gettable   7   6   266  ; 1
[45] eq         0   7   267  ; "DECGAME", to [47] if true
[46] jmp        14           ; to [61]
[47] getglobal  7   0        ; io
[48] gettable   7   7   251  ; "write"
[49] loadk      8   2        ; "\n"
[50] getglobal  9   3        ; os
[51] gettable   9   9   254  ; "date"
[52] loadk      10  5        ; "%c "
[53] call       9   2   2  
[54] loadk      10  18       ; "TryGetStorefrontFromScript: found DECGAME "
[55] getglobal  11  19       ; tostring
[56] gettable   12  6   270  ; 2
[57] call       11  2   0  
[58] call       7   0   1  
[59] gettable   1   6   270  ; 2
[60] jmp        2            ; to [63]
[61] tforloop   3       0    ; to [63] if exit
[62] jmp        -33          ; to [30]
[63] self       3   2   271  ; "close"
[64] call       3   2   1  
[65] loadnil    2   2      
[66] jmp        10           ; to [77]
[67] getglobal  3   0        ; io
[68] gettable   3   3   251  ; "write"
[69] loadk      4   2        ; "\n"
[70] getglobal  5   3        ; os
[71] gettable   5   5   254  ; "date"
[72] loadk      6   5        ; "%c "
[73] call       5   2   2  
[74] loadk      6   22       ; "TryGetStorefrontFromScript: failed to open "
[75] move       7   0      
[76] call       3   5   1  
[77] return     1   2      
[78] return     0   1      
; end of function

[01] getupval   0   1        ; win32
[02] gettable   0   0   250  ; "Mutex"
[03] loadk      1   1        ; "RACV2InstallerInst"
[04] call       0   2   2  
[05] setupval   0   0        ; mutex
[06] getglobal  0   2        ; assert
[07] getupval   1   0        ; mutex
[08] gettable   1   1   253  ; "Lock"
[09] call       1   1   2  
[10] loadk      2   4        ; "instance"
[11] call       0   3   1  
[12] getglobal  0   2        ; assert
[13] getglobal  1   5        ; arg
[14] gettable   1   1   256  ; 1
[15] loadk      2   7        ; "no_uninstall_script"
[16] call       0   3   1  
[17] getglobal  0   8        ; io
[18] gettable   0   0   259  ; "write"
[19] loadk      1   10       ; "\n"
[20] getglobal  2   11       ; os
[21] gettable   2   2   262  ; "date"
[22] loadk      3   13       ; "%c "
[23] call       2   2   2  
[24] loadk      3   14       ; "Processing: "
[25] getglobal  4   5        ; arg
[26] gettable   4   4   256  ; 1
[27] call       0   5   1  
[28] closure    0   0        ; 0 upvalues
[29] move       1   0      
[30] getglobal  2   5        ; arg
[31] gettable   2   2   256  ; 1
[32] call       1   2   2  
[33] test       1   1   0    ; to [35] if true
[34] jmp        18           ; to [53]
[35] getglobal  2   16       ; string
[36] gettable   2   2   267  ; "lower"
[37] move       3   1      
[38] call       2   2   2  
[39] setglobal  2   15       ; g_storeFront
[40] getglobal  2   8        ; io
[41] gettable   2   2   259  ; "write"
[42] loadk      3   10       ; "\n"
[43] getglobal  4   11       ; os
[44] gettable   4   4   262  ; "date"
[45] loadk      5   13       ; "%c "
[46] call       4   2   2  
[47] loadk      5   18       ; "TryGetStorefrontFromScript: set g_storeFront to:"
[48] getglobal  6   19       ; tostring
[49] getglobal  7   15       ; g_storeFront
[50] call       6   2   2  
[51] loadk      7   20       ; "."
[52] call       2   6   1  
[53] getupval   2   2        ; SetInstallerLoc
[54] call       2   1   1  
[55] getglobal  2   21       ; UnInstaller
[56] getglobal  3   5        ; arg
[57] gettable   3   3   256  ; 1
[58] call       2   2   2  
[59] getupval   3   3        ; errHandler
[60] gettable   3   3   272  ; "LogPing"
[61] newtable   4   2   0    ; array=2, hash=0
[62] newtable   5   2   0    ; array=2, hash=0
[63] getupval   6   3        ; errHandler
[64] gettable   6   6   273  ; "field"
[65] gettable   6   6   274  ; "src"
[66] getupval   7   3        ; errHandler
[67] gettable   7   7   274  ; "src"
[68] gettable   7   7   275  ; "uninstaller"
[69] setlist    5   1        ; index 1 to 2
[70] newtable   6   2   0    ; array=2, hash=0
[71] getupval   7   3        ; errHandler
[72] gettable   7   7   273  ; "field"
[73] gettable   7   7   276  ; "state"
[74] getupval   8   3        ; errHandler
[75] gettable   8   8   276  ; "state"
[76] gettable   8   8   277  ; "start"
[77] setlist    6   1        ; index 1 to 2
[78] setlist    4   1        ; index 1 to 2
[79] loadbool   5   0   0    ; false
[80] call       3   3   1  
[81] gettable   3   2   278  ; "ProcessScript"
[82] call       3   1   1  
[83] return     0   1      
; end of function


; function [1] definition (level 3)
; 2 upvalues, 0 params, 7 stacks
.function  2 0 0 7
.local  "dlg"  ; 0
.upvalue  "win32"  ; 0
.upvalue  "errHandler"  ; 1
.const  "luacom"  ; 0
.const  "CreateObject"  ; 1
.const  "InstallerDlg.InstallDlgCtl"  ; 2
.const  "DisplayWarning"  ; 3
.const  1010  ; 4
.const  "RefreshAddRemovePrograms"  ; 5
.const  "Quit"  ; 6
.const  "LogPing"  ; 7
.const  "field"  ; 8
.const  "src"  ; 9
.const  "uninstaller"  ; 10
.const  "state"  ; 11
.const  "complete"  ; 12
[01] getglobal  0   0        ; luacom
[02] gettable   0   0   251  ; "CreateObject"
[03] loadk      1   2        ; "InstallerDlg.InstallDlgCtl"
[04] call       0   2   2  
[05] test       0   0   0    ; to [7] if true
[06] jmp        8            ; to [15]
[07] self       1   0   253  ; "DisplayWarning"
[08] loadk      3   4        ; 1010
[09] call       1   3   1  
[10] getupval   1   0        ; win32
[11] gettable   1   1   255  ; "RefreshAddRemovePrograms"
[12] call       1   1   1  
[13] self       1   0   256  ; "Quit"
[14] call       1   2   1  
[15] getupval   1   1        ; errHandler
[16] gettable   1   1   257  ; "LogPing"
[17] newtable   2   2   0    ; array=2, hash=0
[18] newtable   3   2   0    ; array=2, hash=0
[19] getupval   4   1        ; errHandler
[20] gettable   4   4   258  ; "field"
[21] gettable   4   4   259  ; "src"
[22] getupval   5   1        ; errHandler
[23] gettable   5   5   259  ; "src"
[24] gettable   5   5   260  ; "uninstaller"
[25] setlist    3   1        ; index 1 to 2
[26] newtable   4   2   0    ; array=2, hash=0
[27] getupval   5   1        ; errHandler
[28] gettable   5   5   258  ; "field"
[29] gettable   5   5   261  ; "state"
[30] getupval   6   1        ; errHandler
[31] gettable   6   6   261  ; "state"
[32] gettable   6   6   262  ; "complete"
[33] setlist    4   1        ; index 1 to 2
[34] setlist    2   1        ; index 1 to 2
[35] loadbool   3   0   0    ; false
[36] call       1   3   1  
[37] return     0   1      
; end of function


; function [2] definition (level 3)
; 1 upvalues, 1 params, 8 stacks
.function  1 1 0 8
.local  "errEscapedString"  ; 0
.upvalue  "errHandler"  ; 0
.const  "LogPing"  ; 0
.const  "field"  ; 1
.const  "src"  ; 2
.const  "uninstaller"  ; 3
.const  "state"  ; 4
.const  "failed"  ; 5
.const  "error"  ; 6
[01] getupval   1   0        ; errHandler
[02] gettable   1   1   250  ; "LogPing"
[03] newtable   2   3   0    ; array=3, hash=0
[04] newtable   3   2   0    ; array=2, hash=0
[05] getupval   4   0        ; errHandler
[06] gettable   4   4   251  ; "field"
[07] gettable   4   4   252  ; "src"
[08] getupval   5   0        ; errHandler
[09] gettable   5   5   252  ; "src"
[10] gettable   5   5   253  ; "uninstaller"
[11] setlist    3   1        ; index 1 to 2
[12] newtable   4   2   0    ; array=2, hash=0
[13] getupval   5   0        ; errHandler
[14] gettable   5   5   251  ; "field"
[15] gettable   5   5   254  ; "state"
[16] getupval   6   0        ; errHandler
[17] gettable   6   6   254  ; "state"
[18] gettable   6   6   255  ; "failed"
[19] setlist    4   1        ; index 1 to 2
[20] newtable   5   2   0    ; array=2, hash=0
[21] getupval   6   0        ; errHandler
[22] gettable   6   6   251  ; "field"
[23] gettable   6   6   256  ; "error"
[24] move       7   0      
[25] setlist    5   1        ; index 1 to 2
[26] setlist    2   2        ; index 1 to 3
[27] loadbool   3   0   0    ; false
[28] call       1   3   1  
[29] return     0   1      
; end of function

[01] closure    0   0        ; 4 upvalues
[02] getupval   0   1        ; mutex
[03] getupval   0   2        ; win32
[04] getupval   0   3        ; SetInstallerLoc
[05] getupval   0   4        ; errHandler
[06] setupval   0   0        ; Init
[07] closure    0   1        ; 2 upvalues
[08] getupval   0   2        ; win32
[09] getupval   0   4        ; errHandler
[10] setupval   0   5        ; ShutDown
[11] closure    0   2        ; 1 upvalues
[12] getupval   0   4        ; errHandler
[13] setupval   0   6        ; Error
[14] return     0   1      
; end of function


; function [17] definition (level 2)
; 4 upvalues, 0 params, 2 stacks
.function  4 0 0 2
.upvalue  "Init"  ; 0
.upvalue  "win32"  ; 1
.upvalue  "ShutDown"  ; 2
.upvalue  "Error"  ; 3
.const  "g_fGamesManager"  ; 0

; function [0] definition (level 3)
; 1 upvalues, 0 params, 14 stacks
.function  1 0 0 14
.local  "mutex"  ; 0
.local  "ui"  ; 1
.local  "shellCtl"  ; 2
.upvalue  "win32"  ; 0
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Entering ShowMyGames::Init"  ; 6
.const  "Mutex"  ; 7
.const  "GamesManager"  ; 8
.const  "Lock"  ; 9
.const  "InstallerUI"  ; 10
.const  "SetDialogOptions"  ; 11
.const  800  ; 12
.const  600  ; 13
.const  ".\\gmchrome"  ; 14
.const  1  ; 15
.const  "Navigate"  ; 16
.const  "WorkingDir"  ; 17
.const  "\\..\\resource\\gamesmanager.htm"  ; 18
.const  "WaitOnClose"  ; 19
.const  "Release"  ; 20
.const  "setting other to foreground"  ; 21
.const  "luacom"  ; 22
.const  "CreateObject"  ; 23
.const  "StubbyUtil.ShellCtl"  ; 24
.const  "InstallerToForeground"  ; 25
[01] getglobal  0   0        ; io
[02] gettable   0   0   251  ; "write"
[03] loadk      1   2        ; "\n"
[04] getglobal  2   3        ; os
[05] gettable   2   2   254  ; "date"
[06] loadk      3   5        ; "%c "
[07] call       2   2   2  
[08] loadk      3   6        ; "Entering ShowMyGames::Init"
[09] call       0   4   1  
[10] getupval   0   0        ; win32
[11] gettable   0   0   257  ; "Mutex"
[12] loadk      1   8        ; "GamesManager"
[13] call       0   2   2  
[14] gettable   1   0   259  ; "Lock"
[15] call       1   1   2  
[16] test       1   1   0    ; to [18] if true
[17] jmp        24           ; to [42]
[18] getglobal  1   10       ; InstallerUI
[19] call       1   1   2  
[20] gettable   2   1   261  ; "SetDialogOptions"
[21] loadk      3   12       ; 800
[22] loadk      4   13       ; 600
[23] loadbool   5   1   0    ; true
[24] loadbool   6   1   0    ; true
[25] loadnil    7   10     
[26] loadk      11  14       ; ".\\gmchrome"
[27] loadbool   12  1   0    ; true
[28] loadk      13  15       ; 1
[29] call       2   12  1  
[30] gettable   2   1   266  ; "Navigate"
[31] getupval   3   0        ; win32
[32] gettable   3   3   267  ; "WorkingDir"
[33] call       3   1   2  
[34] loadk      4   18       ; "\\..\\resource\\gamesmanager.htm"
[35] concat     3   3   4  
[36] call       2   2   1  
[37] gettable   2   1   269  ; "WaitOnClose"
[38] call       2   1   1  
[39] gettable   2   0   270  ; "Release"
[40] call       2   1   1  
[41] jmp        15           ; to [57]
[42] getglobal  1   0        ; io
[43] gettable   1   1   251  ; "write"
[44] loadk      2   2        ; "\n"
[45] getglobal  3   3        ; os
[46] gettable   3   3   254  ; "date"
[47] loadk      4   5        ; "%c "
[48] call       3   2   2  
[49] loadk      4   21       ; "setting other to foreground"
[50] call       1   4   1  
[51] getglobal  1   22       ; luacom
[52] gettable   1   1   273  ; "CreateObject"
[53] loadk      2   24       ; "StubbyUtil.ShellCtl"
[54] call       1   2   2  
[55] self       2   1   275  ; "InstallerToForeground"
[56] call       2   2   1  
[57] return     0   1      
; end of function


; function [1] definition (level 3)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
.const  "ui"  ; 0
.const  "Destroy"  ; 1
[1] getglobal  0   0        ; ui
[2] test       0   0   0    ; to [4] if true
[3] jmp        3            ; to [7]
[4] getglobal  0   0        ; ui
[5] gettable   0   0   251  ; "Destroy"
[6] call       0   1   1  
[7] return     0   1      
; end of function


; function [2] definition (level 3)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "errEscapedString"  ; 0
[1] return     0   1      
; end of function

[01] closure    0   0        ; 1 upvalues
[02] getupval   0   1        ; win32
[03] setupval   0   0        ; Init
[04] closure    0   1        ; 0 upvalues
[05] setupval   0   2        ; ShutDown
[06] closure    0   2        ; 0 upvalues
[07] setupval   0   3        ; Error
[08] loadbool   0   1   0    ; true
[09] setglobal  0   0        ; g_fGamesManager
[10] return     0   1      
; end of function


; function [18] definition (level 2)
; 6 upvalues, 0 params, 2 stacks
.function  6 0 0 2
.upvalue  "Init"  ; 0
.upvalue  "mutex"  ; 1
.upvalue  "win32"  ; 2
.upvalue  "errHandler"  ; 3
.upvalue  "ShutDown"  ; 4
.upvalue  "Error"  ; 5

; function [0] definition (level 3)
; 3 upvalues, 0 params, 9 stacks
.function  3 0 0 9
.local  "interpreter"  ; 0
.local  "dwnldMgr"  ; 1
.local  "s"  ; 2
.local  "err"  ; 3
.upvalue  "mutex"  ; 0
.upvalue  "win32"  ; 1
.upvalue  "errHandler"  ; 2
.const  "Mutex"  ; 0
.const  "RACV2InstallerInst"  ; 1
.const  "assert"  ; 2
.const  "Lock"  ; 3
.const  "another_instance"  ; 4
.const  "MetadataInterp"  ; 5
.const  "DownloadMgr"  ; 6
.const  "LogPing"  ; 7
.const  "field"  ; 8
.const  "src"  ; 9
.const  "component"  ; 10
.const  "state"  ; 11
.const  "start"  ; 12
.const  "dwnldevt"  ; 13
.const  "requestURL"  ; 14
.const  "DEFAULT_UPG_BASE"  ; 15
.const  "RequestURLParams"  ; 16
.const  "io"  ; 17
.const  "write"  ; 18
.const  "\n"  ; 19
.const  "os"  ; 20
.const  "date"  ; 21
.const  "%c "  ; 22
.const  "Requesting update xml from "  ; 23
.const  "pcall"  ; 24
.const  "GetFile"  ; 25
.const  "upg.xml"  ; 26
.const  "\nUpdate: "  ; 27
.const  "LoadXML"  ; 28
.const  "DeleteFile"  ; 29
.const  "DownloadQueue"  ; 30
.const  "Add"  ; 31
.const  "g_env"  ; 32
.const  "curGameId"  ; 33
.const  "InitEngine"  ; 34
.const  "Run"  ; 35
[01] getupval   0   1        ; win32
[02] gettable   0   0   250  ; "Mutex"
[03] loadk      1   1        ; "RACV2InstallerInst"
[04] call       0   2   2  
[05] setupval   0   0        ; mutex
[06] getglobal  0   2        ; assert
[07] getupval   1   0        ; mutex
[08] gettable   1   1   253  ; "Lock"
[09] call       1   1   2  
[10] loadk      2   4        ; "another_instance"
[11] call       0   3   1  
[12] getglobal  0   5        ; MetadataInterp
[13] call       0   1   2  
[14] getglobal  1   6        ; DownloadMgr
[15] call       1   1   2  
[16] getupval   2   2        ; errHandler
[17] gettable   2   2   257  ; "LogPing"
[18] newtable   3   3   0    ; array=3, hash=0
[19] newtable   4   2   0    ; array=2, hash=0
[20] getupval   5   2        ; errHandler
[21] gettable   5   5   258  ; "field"
[22] gettable   5   5   259  ; "src"
[23] getupval   6   2        ; errHandler
[24] gettable   6   6   259  ; "src"
[25] gettable   6   6   260  ; "component"
[26] setlist    4   1        ; index 1 to 2
[27] newtable   5   2   0    ; array=2, hash=0
[28] getupval   6   2        ; errHandler
[29] gettable   6   6   258  ; "field"
[30] gettable   6   6   261  ; "state"
[31] getupval   7   2        ; errHandler
[32] gettable   7   7   261  ; "state"
[33] gettable   7   7   262  ; "start"
[34] setlist    5   1        ; index 1 to 2
[35] newtable   6   2   0    ; array=2, hash=0
[36] getupval   7   2        ; errHandler
[37] gettable   7   7   258  ; "field"
[38] gettable   7   7   263  ; "dwnldevt"
[39] getupval   8   2        ; errHandler
[40] gettable   8   8   261  ; "state"
[41] gettable   8   8   262  ; "start"
[42] setlist    6   1        ; index 1 to 2
[43] setlist    3   2        ; index 1 to 3
[44] loadbool   4   0   0    ; false
[45] call       2   3   1  
[46] getglobal  2   15       ; DEFAULT_UPG_BASE
[47] getglobal  3   16       ; RequestURLParams
[48] call       3   1   2  
[49] concat     2   2   3  
[50] setglobal  2   14       ; requestURL
[51] getglobal  2   17       ; io
[52] gettable   2   2   268  ; "write"
[53] loadk      3   19       ; "\n"
[54] getglobal  4   20       ; os
[55] gettable   4   4   271  ; "date"
[56] loadk      5   22       ; "%c "
[57] call       4   2   2  
[58] loadk      5   23       ; "Requesting update xml from "
[59] getglobal  6   14       ; requestURL
[60] call       2   5   1  
[61] getglobal  2   24       ; pcall
[62] gettable   3   1   275  ; "GetFile"
[63] getglobal  4   14       ; requestURL
[64] loadk      5   26       ; "upg.xml"
[65] call       2   4   3  
[66] test       2   2   1    ; to [68] if false
[67] jmp        6            ; to [74]
[68] getglobal  4   17       ; io
[69] gettable   4   4   268  ; "write"
[70] loadk      5   27       ; "\nUpdate: "
[71] move       6   3      
[72] call       4   3   1  
[73] return     0   1      
[74] gettable   4   0   278  ; "LoadXML"
[75] loadk      5   26       ; "upg.xml"
[76] call       4   2   1  
[77] getupval   4   1        ; win32
[78] gettable   4   4   279  ; "DeleteFile"
[79] loadk      5   26       ; "upg.xml"
[80] call       4   2   1  
[81] getglobal  4   30       ; DownloadQueue
[82] call       4   1   2  
[83] gettable   4   4   281  ; "Add"
[84] getglobal  5   32       ; g_env
[85] gettable   5   5   283  ; "curGameId"
[86] move       6   0      
[87] call       4   3   1  
[88] gettable   4   0   284  ; "InitEngine"
[89] call       4   1   1  
[90] getglobal  4   30       ; DownloadQueue
[91] call       4   1   2  
[92] gettable   4   4   285  ; "Run"
[93] call       4   1   1  
[94] return     0   1      
; end of function


; function [1] definition (level 3)
; 1 upvalues, 0 params, 7 stacks
.function  1 0 0 7
.upvalue  "errHandler"  ; 0
.const  "LogPing"  ; 0
.const  "field"  ; 1
.const  "src"  ; 2
.const  "component"  ; 3
.const  "state"  ; 4
.const  "complete"  ; 5
.const  "bndlevt"  ; 6
[01] getupval   0   0        ; errHandler
[02] gettable   0   0   250  ; "LogPing"
[03] newtable   1   3   0    ; array=3, hash=0
[04] newtable   2   2   0    ; array=2, hash=0
[05] getupval   3   0        ; errHandler
[06] gettable   3   3   251  ; "field"
[07] gettable   3   3   252  ; "src"
[08] getupval   4   0        ; errHandler
[09] gettable   4   4   252  ; "src"
[10] gettable   4   4   253  ; "component"
[11] setlist    2   1        ; index 1 to 2
[12] newtable   3   2   0    ; array=2, hash=0
[13] getupval   4   0        ; errHandler
[14] gettable   4   4   251  ; "field"
[15] gettable   4   4   254  ; "state"
[16] getupval   5   0        ; errHandler
[17] gettable   5   5   254  ; "state"
[18] gettable   5   5   255  ; "complete"
[19] setlist    3   1        ; index 1 to 2
[20] newtable   4   2   0    ; array=2, hash=0
[21] getupval   5   0        ; errHandler
[22] gettable   5   5   251  ; "field"
[23] gettable   5   5   256  ; "bndlevt"
[24] getupval   6   0        ; errHandler
[25] gettable   6   6   254  ; "state"
[26] gettable   6   6   255  ; "complete"
[27] setlist    4   1        ; index 1 to 2
[28] setlist    1   2        ; index 1 to 3
[29] loadbool   2   0   0    ; false
[30] call       0   3   1  
[31] return     0   1      
; end of function


; function [2] definition (level 3)
; 1 upvalues, 1 params, 11 stacks
.function  1 1 0 11
.local  "errEscapedString"  ; 0
.local  "s"  ; 1
.local  "err"  ; 2
.upvalue  "errHandler"  ; 0
.const  "pcall"  ; 0
.const  "RollBack"  ; 1
.const  "io"  ; 2
.const  "write"  ; 3
.const  "\n"  ; 4
.const  "tostring"  ; 5
.const  "LogPing"  ; 6
.const  "field"  ; 7
.const  "src"  ; 8
.const  "component"  ; 9
.const  "state"  ; 10
.const  "failed"  ; 11
.const  "bndlevt"  ; 12
.const  "error"  ; 13
[01] getglobal  1   0        ; pcall
[02] getglobal  2   1        ; RollBack
[03] call       1   2   3  
[04] test       1   1   1    ; to [6] if false
[05] jmp        7            ; to [13]
[06] getglobal  3   2        ; io
[07] gettable   3   3   253  ; "write"
[08] loadk      4   4        ; "\n"
[09] getglobal  5   5        ; tostring
[10] move       6   2      
[11] call       5   2   0  
[12] call       3   0   1  
[13] getupval   3   0        ; errHandler
[14] gettable   3   3   256  ; "LogPing"
[15] newtable   4   4   0    ; array=4, hash=0
[16] newtable   5   2   0    ; array=2, hash=0
[17] getupval   6   0        ; errHandler
[18] gettable   6   6   257  ; "field"
[19] gettable   6   6   258  ; "src"
[20] getupval   7   0        ; errHandler
[21] gettable   7   7   258  ; "src"
[22] gettable   7   7   259  ; "component"
[23] setlist    5   1        ; index 1 to 2
[24] newtable   6   2   0    ; array=2, hash=0
[25] getupval   7   0        ; errHandler
[26] gettable   7   7   257  ; "field"
[27] gettable   7   7   260  ; "state"
[28] getupval   8   0        ; errHandler
[29] gettable   8   8   260  ; "state"
[30] gettable   8   8   261  ; "failed"
[31] setlist    6   1        ; index 1 to 2
[32] newtable   7   2   0    ; array=2, hash=0
[33] getupval   8   0        ; errHandler
[34] gettable   8   8   257  ; "field"
[35] gettable   8   8   262  ; "bndlevt"
[36] getupval   9   0        ; errHandler
[37] gettable   9   9   260  ; "state"
[38] gettable   9   9   261  ; "failed"
[39] setlist    7   1        ; index 1 to 2
[40] newtable   8   2   0    ; array=2, hash=0
[41] getupval   9   0        ; errHandler
[42] gettable   9   9   257  ; "field"
[43] gettable   9   9   263  ; "error"
[44] move       10  0      
[45] setlist    8   1        ; index 1 to 2
[46] setlist    4   3        ; index 1 to 4
[47] loadbool   5   0   0    ; false
[48] call       3   3   1  
[49] return     0   1      
; end of function

[01] closure    0   0        ; 3 upvalues
[02] getupval   0   1        ; mutex
[03] getupval   0   2        ; win32
[04] getupval   0   3        ; errHandler
[05] setupval   0   0        ; Init
[06] closure    0   1        ; 1 upvalues
[07] getupval   0   3        ; errHandler
[08] setupval   0   4        ; ShutDown
[09] closure    0   2        ; 1 upvalues
[10] getupval   0   3        ; errHandler
[11] setupval   0   5        ; Error
[12] return     0   1      
; end of function


; function [19] definition (level 2)
; 5 upvalues, 0 params, 14 stacks
.function  5 0 0 14
.local  "_"  ; 0
.local  "_"  ; 1
.local  "relativePath"  ; 2
.local  "path"  ; 3
.local  "installLog"  ; 4
.local  "tmpLog"  ; 5
.local  "tmpLog"  ; 6
.local  "shell"  ; 7
.local  "oldDir"  ; 8
.local  "ui"  ; 9
.local  "lcid"  ; 10
.upvalue  "launchDir"  ; 0
.upvalue  "errHandler"  ; 1
.upvalue  "win32"  ; 2
.upvalue  "LCIDToString"  ; 3
.upvalue  "Init"  ; 4
.const  "string"  ; 0
.const  "find"  ; 1
.const  "arg"  ; 2
.const  0  ; 3
.const  "(.+\\)%w+%.%w%w%w"  ; 4
.const  "\\"  ; 5
.const  ".\\"  ; 6
.const  "installLog"  ; 7
.const  "close"  ; 8
.const  "io"  ; 9
.const  "open"  ; 10
.const  "..\\installLog.txt"  ; 11
.const  "r"  ; 12
.const  "seek"  ; 13
.const  "end"  ; 14
.const  512000  ; 15
.const  -512000  ; 16
.const  "..\\installLogTmp.txt"  ; 17
.const  "w"  ; 18
.const  "write"  ; 19
.const  "read"  ; 20
.const  "*a"  ; 21
.const  "installLog.txt"  ; 22
.const  "output"  ; 23
.const  "LUA_PATH"  ; 24
.const  "?.lua;"  ; 25
.const  "socket\\?.lua;"  ; 26
.const  ".\\?.lua"  ; 27
.const  "LUA_CPATH"  ; 28
.const  "?.dll;"  ; 29
.const  "bin\\?.dll;"  ; 30
.const  "socket\\?.dll;"  ; 31
.const  ".\\?.dll"  ; 32
.const  "\n"  ; 33
.const  "os"  ; 34
.const  "date"  ; 35
.const  "%c "  ; 36
.const  "Loading compat-5.1.lua"  ; 37
.const  "dofile"  ; 38
.const  "compat-5.1.lua"  ; 39
.const  "Loading luacom"  ; 40
.const  "require"  ; 41
.const  "luacom"  ; 42
.const  "rainstallerpaths"  ; 43
.const  "Performing environment switch to "  ; 44
.const  "CreateObject"  ; 45
.const  "StubbyUtil.ShellCtl"  ; 46
.const  "GetWorkingDir"  ; 47
.const  "SetWorkingDir"  ; 48
.const  "Loading config.lua"  ; 49
.const  "config.lua"  ; 50
.const  "Loading blob"  ; 51
.const  "blob"  ; 52
.const  "ErrorHandler"  ; 53
.const  "Win32Interop"  ; 54
.const  "InstallerUI"  ; 55
.const  "mainDlg"  ; 56
.const  "GetUserLocale"  ; 57
.const  "LCID = "  ; 58
.const  "tonumber"  ; 59
.const  "g_strLocale"  ; 60
.const  "Locale set to "  ; 61
.const  "pcall"  ; 62
.const  "DeleteFile"  ; 63
.const  "\\installLog.txt"  ; 64
[001] getglobal  0   0        ; string
[002] gettable   0   0   251  ; "find"
[003] getglobal  1   2        ; arg
[004] gettable   1   1   253  ; 0
[005] loadk      2   4        ; "(.+\\)%w+%.%w%w%w"
[006] call       0   3   4  
[007] loadnil    3   3      
[008] getupval   4   0        ; launchDir
[009] test       4   4   0    ; to [11] if true
[010] jmp        7            ; to [18]
[011] test       2   2   0    ; to [13] if true
[012] jmp        5            ; to [18]
[013] getupval   4   0        ; launchDir
[014] loadk      5   5        ; "\\"
[015] move       6   2      
[016] concat     3   4   6  
[017] jmp        3            ; to [21]
[018] test       3   2   1    ; to [20] if false
[019] jmp        1            ; to [21]
[020] loadk      3   6        ; ".\\"
[021] getglobal  4   7        ; installLog
[022] test       4   4   0    ; to [24] if true
[023] jmp        78           ; to [102]
[024] getglobal  4   7        ; installLog
[025] self       4   4   258  ; "close"
[026] call       4   2   1  
[027] getglobal  4   9        ; io
[028] gettable   4   4   260  ; "open"
[029] move       5   3      
[030] loadk      6   11       ; "..\\installLog.txt"
[031] concat     5   5   6  
[032] loadk      6   12       ; "r"
[033] call       4   3   2  
[034] test       4   4   0    ; to [36] if true
[035] jmp        42           ; to [78]
[036] self       5   4   263  ; "seek"
[037] loadk      7   14       ; "end"
[038] loadk      8   16       ; -512000
[039] call       5   4   1  
[040] getglobal  5   9        ; io
[041] gettable   5   5   260  ; "open"
[042] move       6   3      
[043] loadk      7   17       ; "..\\installLogTmp.txt"
[044] concat     6   6   7  
[045] loadk      7   18       ; "w"
[046] call       5   3   2  
[047] self       6   5   269  ; "write"
[048] self       8   4   270  ; "read"
[049] loadk      10  21       ; "*a"
[050] call       8   3   0  
[051] call       6   0   1  
[052] self       6   5   258  ; "close"
[053] call       6   2   1  
[054] self       6   4   258  ; "close"
[055] call       6   2   1  
[056] getglobal  6   9        ; io
[057] gettable   6   6   260  ; "open"
[058] move       7   3      
[059] loadk      8   17       ; "..\\installLogTmp.txt"
[060] concat     7   7   8  
[061] loadk      8   12       ; "r"
[062] call       6   3   2  
[063] move       5   6      
[064] getglobal  6   9        ; io
[065] gettable   6   6   260  ; "open"
[066] move       7   3      
[067] loadk      8   11       ; "..\\installLog.txt"
[068] concat     7   7   8  
[069] loadk      8   18       ; "w"
[070] call       6   3   2  
[071] move       4   6      
[072] self       6   4   269  ; "write"
[073] self       8   5   270  ; "read"
[074] loadk      10  21       ; "*a"
[075] call       8   3   0  
[076] call       6   0   1  
[077] jmp        8            ; to [86]
[078] getglobal  5   9        ; io
[079] gettable   5   5   260  ; "open"
[080] move       6   3      
[081] loadk      7   11       ; "..\\installLog.txt"
[082] concat     6   6   7  
[083] loadk      7   18       ; "w"
[084] call       5   3   2  
[085] move       4   5      
[086] getglobal  5   9        ; io
[087] gettable   5   5   260  ; "open"
[088] loadk      6   22       ; "installLog.txt"
[089] loadk      7   12       ; "r"
[090] call       5   3   2  
[091] self       6   4   269  ; "write"
[092] self       8   5   270  ; "read"
[093] loadk      10  21       ; "*a"
[094] call       8   3   0  
[095] call       6   0   1  
[096] self       6   5   258  ; "close"
[097] call       6   2   1  
[098] getglobal  6   9        ; io
[099] gettable   6   6   273  ; "output"
[100] move       7   4      
[101] call       6   2   1  
[102] move       4   3      
[103] loadk      5   25       ; "?.lua;"
[104] move       6   3      
[105] loadk      7   26       ; "socket\\?.lua;"
[106] loadk      8   27       ; ".\\?.lua"
[107] concat     4   4   8  
[108] setglobal  4   24       ; LUA_PATH
[109] move       4   3      
[110] loadk      5   29       ; "?.dll;"
[111] move       6   3      
[112] loadk      7   30       ; "bin\\?.dll;"
[113] move       8   3      
[114] loadk      9   31       ; "socket\\?.dll;"
[115] loadk      10  32       ; ".\\?.dll"
[116] concat     4   4   10 
[117] setglobal  4   28       ; LUA_CPATH
[118] getglobal  4   9        ; io
[119] gettable   4   4   269  ; "write"
[120] loadk      5   33       ; "\n"
[121] getglobal  6   34       ; os
[122] gettable   6   6   285  ; "date"
[123] loadk      7   36       ; "%c "
[124] call       6   2   2  
[125] loadk      7   37       ; "Loading compat-5.1.lua"
[126] call       4   4   1  
[127] getglobal  4   38       ; dofile
[128] move       5   3      
[129] loadk      6   39       ; "compat-5.1.lua"
[130] concat     5   5   6  
[131] call       4   2   1  
[132] getglobal  4   9        ; io
[133] gettable   4   4   269  ; "write"
[134] loadk      5   33       ; "\n"
[135] getglobal  6   34       ; os
[136] gettable   6   6   285  ; "date"
[137] loadk      7   36       ; "%c "
[138] call       6   2   2  
[139] loadk      7   40       ; "Loading luacom"
[140] call       4   4   1  
[141] getglobal  4   41       ; require
[142] loadk      5   42       ; "luacom"
[143] call       4   2   1  
[144] getglobal  4   41       ; require
[145] loadk      5   43       ; "rainstallerpaths"
[146] call       4   2   1  
[147] getglobal  4   9        ; io
[148] gettable   4   4   269  ; "write"
[149] loadk      5   33       ; "\n"
[150] getglobal  6   34       ; os
[151] gettable   6   6   285  ; "date"
[152] loadk      7   36       ; "%c "
[153] call       6   2   2  
[154] loadk      7   44       ; "Performing environment switch to "
[155] move       8   3      
[156] call       4   5   1  
[157] getglobal  4   42       ; luacom
[158] gettable   4   4   295  ; "CreateObject"
[159] loadk      5   46       ; "StubbyUtil.ShellCtl"
[160] call       4   2   2  
[161] self       5   4   297  ; "GetWorkingDir"
[162] call       5   2   2  
[163] self       6   4   298  ; "SetWorkingDir"
[164] move       8   3      
[165] call       6   3   1  
[166] getglobal  6   9        ; io
[167] gettable   6   6   269  ; "write"
[168] loadk      7   33       ; "\n"
[169] getglobal  8   34       ; os
[170] gettable   8   8   285  ; "date"
[171] loadk      9   36       ; "%c "
[172] call       8   2   2  
[173] loadk      9   49       ; "Loading config.lua"
[174] call       6   4   1  
[175] getglobal  6   38       ; dofile
[176] loadk      7   50       ; "config.lua"
[177] call       6   2   1  
[178] getglobal  6   9        ; io
[179] gettable   6   6   269  ; "write"
[180] loadk      7   33       ; "\n"
[181] getglobal  8   34       ; os
[182] gettable   8   8   285  ; "date"
[183] loadk      9   36       ; "%c "
[184] call       8   2   2  
[185] loadk      9   51       ; "Loading blob"
[186] call       6   4   1  
[187] getglobal  6   38       ; dofile
[188] loadk      7   52       ; "blob"
[189] call       6   2   1  
[190] getglobal  6   53       ; ErrorHandler
[191] call       6   1   2  
[192] setupval   6   1        ; errHandler
[193] getglobal  6   54       ; Win32Interop
[194] call       6   1   2  
[195] setupval   6   2        ; win32
[196] getglobal  6   55       ; InstallerUI
[197] call       6   1   2  
[198] gettable   7   6   306  ; "mainDlg"
[199] self       7   7   307  ; "GetUserLocale"
[200] call       7   2   2  
[201] getglobal  8   9        ; io
[202] gettable   8   8   269  ; "write"
[203] loadk      9   33       ; "\n"
[204] getglobal  10  34       ; os
[205] gettable   10  10  285  ; "date"
[206] loadk      11  36       ; "%c "
[207] call       10  2   2  
[208] loadk      11  58       ; "LCID = "
[209] getglobal  12  59       ; tonumber
[210] move       13  7      
[211] call       12  2   2  
[212] concat     11  11  12 
[213] call       8   4   1  
[214] getupval   8   3        ; LCIDToString
[215] move       9   7      
[216] call       8   2   2  
[217] setglobal  8   60       ; g_strLocale
[218] getglobal  8   9        ; io
[219] gettable   8   8   269  ; "write"
[220] loadk      9   33       ; "\n"
[221] getglobal  10  34       ; os
[222] gettable   10  10  285  ; "date"
[223] loadk      11  36       ; "%c "
[224] call       10  2   2  
[225] loadk      11  61       ; "Locale set to "
[226] getglobal  12  60       ; g_strLocale
[227] concat     11  11  12 
[228] call       8   4   1  
[229] getglobal  8   62       ; pcall
[230] getupval   9   2        ; win32
[231] gettable   9   9   313  ; "DeleteFile"
[232] move       10  3      
[233] loadk      11  17       ; "..\\installLogTmp.txt"
[234] concat     10  10  11 
[235] call       8   3   1  
[236] getglobal  8   62       ; pcall
[237] getupval   9   2        ; win32
[238] gettable   9   9   313  ; "DeleteFile"
[239] move       10  5      
[240] loadk      11  64       ; "\\installLog.txt"
[241] concat     10  10  11 
[242] call       8   3   1  
[243] getupval   8   4        ; Init
[244] call       8   1   1  
[245] return     0   1      
; end of function


; function [20] definition (level 2)
; 2 upvalues, 0 params, 9 stacks
.function  2 0 0 9
.local  "tmps"  ; 0
.local  "(for generator)"  ; 1
.local  "(for state)"  ; 2
.local  "tmpCnt"  ; 3
.local  "filesys"  ; 4
.upvalue  "win32"  ; 0
.upvalue  "g_strCDROOT"  ; 1
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "In the CleanTemps method"  ; 6
.const  "table"  ; 7
.const  "reverse"  ; 8
.const  "g_tmps"  ; 9
.const  "Cleaning "  ; 10
.const  "Undefined!"  ; 11
.const  "pcall"  ; 12
.const  "DeleteFile"  ; 13
.const  "g_fOffline"  ; 14
.const  "luacom"  ; 15
.const  "CreateObject"  ; 16
.const  "Scripting.FileSystemObject"  ; 17
.const  "FolderExists"  ; 18
.const  "DeleteFolder"  ; 19
[01] getglobal  0   0        ; io
[02] gettable   0   0   251  ; "write"
[03] loadk      1   2        ; "\n"
[04] getglobal  2   3        ; os
[05] gettable   2   2   254  ; "date"
[06] loadk      3   5        ; "%c "
[07] call       2   2   2  
[08] loadk      3   6        ; "In the CleanTemps method"
[09] call       0   4   1  
[10] getglobal  0   7        ; table
[11] gettable   0   0   258  ; "reverse"
[12] getglobal  1   9        ; g_tmps
[13] call       0   2   2  
[14] move       1   0      
[15] loadnil    2   3      
[16] tforprep   1   18       ; to [35]
[17] getglobal  4   0        ; io
[18] gettable   4   4   251  ; "write"
[19] loadk      5   2        ; "\n"
[20] getglobal  6   3        ; os
[21] gettable   6   6   254  ; "date"
[22] loadk      7   5        ; "%c "
[23] call       6   2   2  
[24] loadk      7   10       ; "Cleaning "
[25] gettable   8   0   3  
[26] test       8   8   1    ; to [28] if false
[27] jmp        1            ; to [29]
[28] loadk      8   11       ; "Undefined!"
[29] call       4   5   1  
[30] getglobal  4   12       ; pcall
[31] getupval   5   0        ; win32
[32] gettable   5   5   263  ; "DeleteFile"
[33] gettable   6   0   3  
[34] call       4   3   1  
[35] tforloop   1       0    ; to [37] if exit
[36] jmp        -20          ; to [17]
[37] getglobal  1   14       ; g_fOffline
[38] loadbool   2   1   0    ; true
[39] eq         0   1   2    ; to [41] if true
[40] jmp        14           ; to [55]
[41] getglobal  1   15       ; luacom
[42] gettable   1   1   266  ; "CreateObject"
[43] loadk      2   17       ; "Scripting.FileSystemObject"
[44] call       1   2   2  
[45] test       1   1   0    ; to [47] if true
[46] jmp        8            ; to [55]
[47] self       2   1   268  ; "FolderExists"
[48] getupval   4   1        ; g_strCDROOT
[49] call       2   3   2  
[50] test       2   2   0    ; to [52] if true
[51] jmp        3            ; to [55]
[52] self       2   1   269  ; "DeleteFolder"
[53] getupval   4   1        ; g_strCDROOT
[54] call       2   3   1  
[55] return     0   1      
; end of function


; function [21] definition (level 2)
; 2 upvalues, 0 params, 13 stacks
.function  2 0 0 13
.local  "installLog"  ; 0
.local  "err"  ; 1
.local  "errNo"  ; 2
.local  "newLogFilename"  ; 3
.local  "filesys"  ; 4
.upvalue  "win32"  ; 0
.upvalue  "newLog"  ; 1
.const  "LogMessage"  ; 0
.const  "os"  ; 1
.const  "date"  ; 2
.const  "%c "  ; 3
.const  "CopyLog for h = "  ; 4
.const  "tostring"  ; 5
.const  "io"  ; 6
.const  "open"  ; 7
.const  "..\\installLog.txt"  ; 8
.const  "a+"  ; 9
.const  "GetInstallerDirectory"  ; 10
.const  "\\installLog"  ; 11
.const  "GetPid"  ; 12
.const  ".txt"  ; 13
.const  "file (closed)"  ; 14
.const  "r"  ; 15
.const  "write"  ; 16
.const  "read"  ; 17
.const  "*all"  ; 18
.const  "newlog"  ; 19
.const  "closed"  ; 20
.const  "close"  ; 21
.const  "luacom"  ; 22
.const  "CreateObject"  ; 23
.const  "Scripting.FileSystemObject"  ; 24
.const  "FileExists"  ; 25
.const  "DeleteFile"  ; 26
.const  "Failed to open "  ; 27
.const  " ERROR: "  ; 28
.const  " : "  ; 29
.const  "Failed to open ..\\installLog.txt. ERROR: "  ; 30
.const  "newlog: "  ; 31
[001] getupval   0   0        ; win32
[002] gettable   0   0   250  ; "LogMessage"
[003] getglobal  1   1        ; os
[004] gettable   1   1   252  ; "date"
[005] loadk      2   3        ; "%c "
[006] call       1   2   2  
[007] loadk      2   4        ; "CopyLog for h = "
[008] getglobal  3   5        ; tostring
[009] getupval   4   1        ; newLog
[010] call       3   2   2  
[011] concat     1   1   3  
[012] call       0   2   1  
[013] getupval   0   1        ; newLog
[014] test       0   0   0    ; to [16] if true
[015] jmp        103          ; to [119]
[016] getglobal  0   6        ; io
[017] gettable   0   0   257  ; "open"
[018] loadk      1   8        ; "..\\installLog.txt"
[019] loadk      2   9        ; "a+"
[020] call       0   3   4  
[021] test       0   0   0    ; to [23] if true
[022] jmp        79           ; to [102]
[023] getglobal  3   10       ; GetInstallerDirectory
[024] call       3   1   2  
[025] loadk      4   11       ; "\\installLog"
[026] getglobal  5   5        ; tostring
[027] getupval   6   0        ; win32
[028] gettable   6   6   262  ; "GetPid"
[029] call       6   1   0  
[030] call       5   0   2  
[031] loadk      6   13       ; ".txt"
[032] concat     3   3   6  
[033] getglobal  4   5        ; tostring
[034] getupval   5   1        ; newLog
[035] call       4   2   2  
[036] eq         0   4   264  ; "file (closed)", to [38] if true
[037] jmp        10           ; to [48]
[038] loadnil    4   4      
[039] setupval   4   1        ; newLog
[040] getglobal  4   6        ; io
[041] gettable   4   4   257  ; "open"
[042] move       5   3      
[043] loadk      6   15       ; "r"
[044] call       4   3   4  
[045] move       2   6      
[046] move       1   5      
[047] setupval   4   1        ; newLog
[048] getupval   4   1        ; newLog
[049] test       4   4   0    ; to [51] if true
[050] jmp        30           ; to [81]
[051] self       4   0   266  ; "write"
[052] getupval   6   1        ; newLog
[053] self       6   6   267  ; "read"
[054] loadk      8   18       ; "*all"
[055] call       6   3   0  
[056] call       4   0   1  
[057] getglobal  4   5        ; tostring
[058] getglobal  5   19       ; newlog
[059] call       4   2   2  
[060] eq         1   4   270  ; "closed", to [62] if false
[061] jmp        3            ; to [65]
[062] getupval   4   1        ; newLog
[063] self       4   4   271  ; "close"
[064] call       4   2   1  
[065] loadnil    4   4      
[066] setupval   4   1        ; newLog
[067] getglobal  4   22       ; luacom
[068] gettable   4   4   273  ; "CreateObject"
[069] loadk      5   24       ; "Scripting.FileSystemObject"
[070] call       4   2   2  
[071] self       5   4   275  ; "FileExists"
[072] move       7   3      
[073] call       5   3   2  
[074] test       5   5   0    ; to [76] if true
[075] jmp        23           ; to [99]
[076] self       5   4   276  ; "DeleteFile"
[077] move       7   3      
[078] loadbool   8   1   0    ; true
[079] call       5   4   1  
[080] jmp        18           ; to [99]
[081] getupval   4   0        ; win32
[082] gettable   4   4   250  ; "LogMessage"
[083] getglobal  5   1        ; os
[084] gettable   5   5   252  ; "date"
[085] loadk      6   3        ; "%c "
[086] call       5   2   2  
[087] loadk      6   27       ; "Failed to open "
[088] move       7   3      
[089] loadk      8   28       ; " ERROR: "
[090] getglobal  9   5        ; tostring
[091] move       10  1      
[092] call       9   2   2  
[093] loadk      10  29       ; " : "
[094] getglobal  11  5        ; tostring
[095] move       12  2      
[096] call       11  2   2  
[097] concat     5   5   11 
[098] call       4   2   1  
[099] self       4   0   271  ; "close"
[100] call       4   2   1  
[101] jmp        29           ; to [131]
[102] getupval   3   0        ; win32
[103] gettable   3   3   250  ; "LogMessage"
[104] getglobal  4   1        ; os
[105] gettable   4   4   252  ; "date"
[106] loadk      5   3        ; "%c "
[107] call       4   2   2  
[108] loadk      5   30       ; "Failed to open ..\\installLog.txt. ERROR: "
[109] getglobal  6   5        ; tostring
[110] move       7   1      
[111] call       6   2   2  
[112] loadk      7   29       ; " : "
[113] getglobal  8   5        ; tostring
[114] move       9   2      
[115] call       8   2   2  
[116] concat     4   4   8  
[117] call       3   2   1  
[118] jmp        12           ; to [131]
[119] getupval   0   0        ; win32
[120] gettable   0   0   250  ; "LogMessage"
[121] getglobal  1   1        ; os
[122] gettable   1   1   252  ; "date"
[123] loadk      2   3        ; "%c "
[124] call       1   2   2  
[125] loadk      2   31       ; "newlog: "
[126] getglobal  3   5        ; tostring
[127] getupval   4   1        ; newLog
[128] call       3   2   2  
[129] concat     1   1   3  
[130] call       0   2   1  
[131] return     0   1      
; end of function


; function [22] definition (level 2)
; 1 upvalues, 1 params, 21 stacks
.function  1 1 0 21
.local  "value"  ; 0
.local  "root"  ; 1
.local  "key"  ; 2
.local  "keyType"  ; 3
.local  "Storefronts"  ; 4
.local  "multiLineString"  ; 5
.local  "index"  ; 6
.local  "count"  ; 7
.local  "isfound"  ; 8
.local  "lowerincumbent"  ; 9
.local  "lowerValue"  ; 10
.local  "newMultiLineString"  ; 11
.upvalue  "win32"  ; 0
.const  "HKEY_LOCAL_MACHINE"  ; 0
.const  "SOFTWARE\\GameInstaller\\Installer"  ; 1
.const  "REG_MULTI_SZ"  ; 2
.const  "Storefronts"  ; 3
.const  "RegQueryMultLineValue"  ; 4
.const  "table"  ; 5
.const  "type"  ; 6
.const  1  ; 7
.const  "getn"  ; 8
.const  "string"  ; 9
.const  "lower"  ; 10
.const  "io"  ; 11
.const  "write"  ; 12
.const  "\n"  ; 13
.const  "os"  ; 14
.const  "date"  ; 15
.const  "%c "  ; 16
.const  "Found "  ; 17
.const  " at entry "  ; 18
.const  " of "  ; 19
.const  " entries"  ; 20
.const  "\nDid not find "  ; 21
.const  " in "  ; 22
.const  " NOT Found in "  ; 23
.const  " entries!!"  ; 24
.const  "insert"  ; 25
.const  "pcall"  ; 26
.const  "CreateRegKey"  ; 27
.const  "RegQueryValue returned a "  ; 28
[001] loadk      1   0        ; "HKEY_LOCAL_MACHINE"
[002] loadk      2   1        ; "SOFTWARE\\GameInstaller\\Installer"
[003] loadk      3   2        ; "REG_MULTI_SZ"
[004] loadk      4   3        ; "Storefronts"
[005] getupval   5   0        ; win32
[006] gettable   5   5   254  ; "RegQueryMultLineValue"
[007] move       6   1      
[008] move       7   2      
[009] move       8   4      
[010] call       5   4   2  
[011] getglobal  6   6        ; type
[012] move       7   5      
[013] call       6   2   2  
[014] eq         0   255 6    ; "table", to [16] if true
[015] jmp        74           ; to [90]
[016] loadk      6   7        ; 1
[017] getglobal  7   5        ; table
[018] gettable   7   7   258  ; "getn"
[019] move       8   5      
[020] call       7   2   2  
[021] loadbool   8   0   0    ; false
[022] jmp        36           ; to [59]
[023] getglobal  9   9        ; string
[024] gettable   9   9   260  ; "lower"
[025] gettable   10  5   6  
[026] call       9   2   2  
[027] getglobal  10  9        ; string
[028] gettable   10  10  260  ; "lower"
[029] move       11  0      
[030] call       10  2   2  
[031] eq         0   9   10   ; to [33] if true
[032] jmp        18           ; to [51]
[033] getglobal  11  11       ; io
[034] gettable   11  11  262  ; "write"
[035] loadk      12  13       ; "\n"
[036] getglobal  13  14       ; os
[037] gettable   13  13  265  ; "date"
[038] loadk      14  16       ; "%c "
[039] call       13  2   2  
[040] loadk      14  17       ; "Found "
[041] move       15  0      
[042] loadk      16  18       ; " at entry "
[043] move       17  6      
[044] loadk      18  19       ; " of "
[045] move       19  7      
[046] loadk      20  20       ; " entries"
[047] call       11  10  1  
[048] loadbool   8   1   0    ; true
[049] jmp        11           ; to [61]
[050] jmp        7            ; to [58]
[051] getglobal  11  11       ; io
[052] gettable   11  11  262  ; "write"
[053] loadk      12  21       ; "\nDid not find "
[054] move       13  10     
[055] loadk      14  22       ; " in "
[056] move       15  9      
[057] call       11  5   1  
[058] add        6   6   257  ; 1
[059] le         1   6   7    ; to [61] if false
[060] jmp        -38          ; to [23]
[061] test       8   8   1    ; to [63] if false
[062] jmp        54           ; to [117]
[063] getglobal  9   11       ; io
[064] gettable   9   9   262  ; "write"
[065] loadk      10  13       ; "\n"
[066] getglobal  11  14       ; os
[067] gettable   11  11  265  ; "date"
[068] loadk      12  16       ; "%c "
[069] call       11  2   2  
[070] move       12  0      
[071] loadk      13  23       ; " NOT Found in "
[072] move       14  7      
[073] loadk      15  24       ; " entries!!"
[074] call       9   7   1  
[075] getglobal  9   5        ; table
[076] gettable   9   9   275  ; "insert"
[077] move       10  5      
[078] move       11  0      
[079] call       9   3   1  
[080] getglobal  9   26       ; pcall
[081] getupval   10  0        ; win32
[082] gettable   10  10  277  ; "CreateRegKey"
[083] move       11  1      
[084] move       12  2      
[085] move       13  4      
[086] move       14  5      
[087] move       15  3      
[088] call       9   7   1  
[089] jmp        27           ; to [117]
[090] getglobal  6   11       ; io
[091] gettable   6   6   262  ; "write"
[092] loadk      7   13       ; "\n"
[093] getglobal  8   14       ; os
[094] gettable   8   8   265  ; "date"
[095] loadk      9   16       ; "%c "
[096] call       8   2   2  
[097] loadk      9   28       ; "RegQueryValue returned a "
[098] getglobal  10  6        ; type
[099] move       11  5      
[100] call       10  2   0  
[101] call       6   0   1  
[102] newtable   6   0   0    ; array=0, hash=0
[103] getglobal  7   5        ; table
[104] gettable   7   7   275  ; "insert"
[105] move       8   6      
[106] move       9   0      
[107] call       7   3   1  
[108] getglobal  7   26       ; pcall
[109] getupval   8   0        ; win32
[110] gettable   8   8   277  ; "CreateRegKey"
[111] move       9   1      
[112] move       10  2      
[113] move       11  4      
[114] move       12  6      
[115] move       13  3      
[116] call       7   7   1  
[117] return     0   1      
; end of function


; function [23] definition (level 2)
; 7 upvalues, 0 params, 7 stacks
.function  7 0 0 7
.local  "s"  ; 0
.local  "err"  ; 1
.local  "instVer"  ; 2
.local  "ui"  ; 3
.upvalue  "g_strPathSFX"  ; 0
.upvalue  "cdinstall"  ; 1
.upvalue  "win32"  ; 2
.upvalue  "ShutDown"  ; 3
.upvalue  "CleanTemps"  ; 4
.upvalue  "mutex"  ; 5
.upvalue  "g_gameIdMutex"  ; 6
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "GenericShutdown"  ; 6
.const  "appendStoreFront"  ; 7
.const  "g_storeFront"  ; 8
.const  "s"  ; 9
.const  "err"  ; 10
.const  "pcall"  ; 11
.const  "DeleteFile"  ; 12
.const  "\nUndefined delete error for sfx"  ; 13
.const  "tostring"  ; 14
.const  "RACConfigValue"  ; 15
.const  "InstallerVersion"  ; 16
.const  "Write"  ; 17
.const  "INSTALLER_VER"  ; 18
.const  "Calling the CleanTemps method from GenericShutdown"  ; 19
.const  "Cleanup"  ; 20
.const  "CopyLog"  ; 21
.const  "InstallerUI"  ; 22
.const  "Destroy"  ; 23
.const  "Release"  ; 24
.const  "Close"  ; 25
[01] getglobal  0   0        ; io
[02] gettable   0   0   251  ; "write"
[03] loadk      1   2        ; "\n"
[04] getglobal  2   3        ; os
[05] gettable   2   2   254  ; "date"
[06] loadk      3   5        ; "%c "
[07] call       2   2   2  
[08] loadk      3   6        ; "GenericShutdown"
[09] call       0   4   1  
[10] getglobal  0   7        ; appendStoreFront
[11] getglobal  1   8        ; g_storeFront
[12] call       0   2   1  
[13] getupval   0   0        ; g_strPathSFX
[14] test       0   0   0    ; to [16] if true
[15] jmp        21           ; to [37]
[16] getupval   0   1        ; cdinstall
[17] loadbool   1   0   0    ; false
[18] eq         0   0   1    ; to [20] if true
[19] jmp        17           ; to [37]
[20] getglobal  0   11       ; pcall
[21] getupval   1   2        ; win32
[22] gettable   1   1   262  ; "DeleteFile"
[23] getupval   2   0        ; g_strPathSFX
[24] call       0   3   3  
[25] setglobal  1   10       ; err
[26] setglobal  0   9        ; s
[27] getglobal  0   9        ; s
[28] test       0   0   1    ; to [30] if false
[29] jmp        7            ; to [37]
[30] getglobal  0   0        ; io
[31] gettable   0   0   251  ; "write"
[32] getglobal  1   10       ; err
[33] test       1   1   1    ; to [35] if false
[34] jmp        1            ; to [36]
[35] loadk      1   13       ; "\nUndefined delete error for sfx"
[36] call       0   2   1  
[37] getglobal  0   11       ; pcall
[38] getupval   1   3        ; ShutDown
[39] call       0   2   3  
[40] test       0   0   1    ; to [42] if false
[41] jmp        11           ; to [53]
[42] getglobal  2   0        ; io
[43] gettable   2   2   251  ; "write"
[44] loadk      3   2        ; "\n"
[45] getglobal  4   3        ; os
[46] gettable   4   4   254  ; "date"
[47] loadk      5   5        ; "%c "
[48] call       4   2   2  
[49] getglobal  5   14       ; tostring
[50] move       6   1      
[51] call       5   2   0  
[52] call       2   0   1  
[53] getglobal  2   15       ; RACConfigValue
[54] loadk      3   16       ; "InstallerVersion"
[55] call       2   2   2  
[56] gettable   3   2   267  ; "Write"
[57] getglobal  4   18       ; INSTALLER_VER
[58] call       3   2   1  
[59] getglobal  3   0        ; io
[60] gettable   3   3   251  ; "write"
[61] loadk      4   2        ; "\n"
[62] getglobal  5   3        ; os
[63] gettable   5   5   254  ; "date"
[64] loadk      6   5        ; "%c "
[65] call       5   2   2  
[66] loadk      6   19       ; "Calling the CleanTemps method from GenericShutdown"
[67] call       3   4   1  
[68] getupval   3   4        ; CleanTemps
[69] call       3   1   1  
[70] getglobal  3   20       ; Cleanup
[71] call       3   1   1  
[72] getglobal  3   21       ; CopyLog
[73] call       3   1   1  
[74] getglobal  3   22       ; InstallerUI
[75] call       3   1   2  
[76] getglobal  4   11       ; pcall
[77] gettable   5   3   273  ; "Destroy"
[78] call       4   2   1  
[79] getglobal  4   11       ; pcall
[80] getupval   5   5        ; mutex
[81] gettable   5   5   274  ; "Release"
[82] call       4   2   1  
[83] getglobal  4   11       ; pcall
[84] getupval   5   5        ; mutex
[85] gettable   5   5   275  ; "Close"
[86] call       4   2   1  
[87] getupval   4   6        ; g_gameIdMutex
[88] test       4   4   0    ; to [90] if true
[89] jmp        8            ; to [98]
[90] getglobal  4   11       ; pcall
[91] getupval   5   6        ; g_gameIdMutex
[92] gettable   5   5   274  ; "Release"
[93] call       4   2   1  
[94] getglobal  4   11       ; pcall
[95] getupval   5   6        ; g_gameIdMutex
[96] gettable   5   5   275  ; "Close"
[97] call       4   2   1  
[98] return     0   1      
; end of function


; function [24] definition (level 2)
; 6 upvalues, 1 params, 11 stacks
.function  6 1 0 11
.local  "err"  ; 0
.local  "s"  ; 1
.local  "e"  ; 2
.local  "ui"  ; 3
.local  "exit"  ; 4
.local  "errString"  ; 5
.local  "instVer"  ; 6
.upvalue  "Error"  ; 0
.upvalue  "errHandler"  ; 1
.upvalue  "CleanTemps"  ; 2
.upvalue  "newLog"  ; 3
.upvalue  "mutex"  ; 4
.upvalue  "g_gameIdMutex"  ; 5
.const  "InstallerUI"  ; 0
.const  "g_exit"  ; 1
.const  "unspecified"  ; 2
.const  "io"  ; 3
.const  "write"  ; 4
.const  "\n"  ; 5
.const  "os"  ; 6
.const  "date"  ; 7
.const  "%c "  ; 8
.const  "GenericError"  ; 9
.const  "tostring"  ; 10
.const  "\n\n\n"  ; 11
.const  "Script Failed!!!, "  ; 12
.const  "pcall"  ; 13
.const  "EscapeTxt"  ; 14
.const  "string"  ; 15
.const  "find"  ; 16
.const  "wndClose"  ; 17
.const  "Running Exception Slide Queue"  ; 18
.const  "ExceptionSlides"  ; 19
.const  "RACConfigValue"  ; 20
.const  "InstallerVersion"  ; 21
.const  "Write"  ; 22
.const  "INSTALLER_VER"  ; 23
.const  "Calling the CleanTemps method from GenericError"  ; 24
.const  "Cleanup"  ; 25
.const  "CopyLog"  ; 26
.const  "Destroy"  ; 27
.const  "Release"  ; 28
.const  "Close"  ; 29
[001] loadnil    1   2      
[002] getglobal  3   0        ; InstallerUI
[003] call       3   1   2  
[004] getglobal  4   1        ; g_exit
[005] gettable   4   4   252  ; "unspecified"
[006] getglobal  5   3        ; io
[007] gettable   5   5   254  ; "write"
[008] loadk      6   5        ; "\n"
[009] getglobal  7   6        ; os
[010] gettable   7   7   257  ; "date"
[011] loadk      8   8        ; "%c "
[012] call       7   2   2  
[013] loadk      8   9        ; "GenericError"
[014] call       5   4   1  
[015] getglobal  5   10       ; tostring
[016] move       6   0      
[017] call       5   2   2  
[018] getglobal  6   3        ; io
[019] gettable   6   6   254  ; "write"
[020] loadk      7   11       ; "\n\n\n"
[021] getglobal  8   6        ; os
[022] gettable   8   8   257  ; "date"
[023] loadk      9   8        ; "%c "
[024] call       8   2   2  
[025] loadk      9   12       ; "Script Failed!!!, "
[026] move       10  5      
[027] call       6   5   1  
[028] getglobal  6   13       ; pcall
[029] getupval   7   0        ; Error
[030] getupval   8   1        ; errHandler
[031] gettable   8   8   264  ; "EscapeTxt"
[032] move       9   5      
[033] call       8   2   0  
[034] call       6   0   3  
[035] move       2   7      
[036] move       1   6      
[037] getglobal  6   15       ; string
[038] gettable   6   6   266  ; "find"
[039] move       7   0      
[040] loadk      8   17       ; "wndClose"
[041] call       6   3   2  
[042] test       6   6   0    ; to [44] if true
[043] jmp        12           ; to [56]
[044] getglobal  6   3        ; io
[045] gettable   6   6   254  ; "write"
[046] loadk      7   5        ; "\n"
[047] getglobal  8   6        ; os
[048] gettable   8   8   257  ; "date"
[049] loadk      9   8        ; "%c "
[050] call       8   2   2  
[051] loadk      9   18       ; "Running Exception Slide Queue"
[052] call       6   4   1  
[053] getglobal  6   13       ; pcall
[054] gettable   7   3   269  ; "ExceptionSlides"
[055] call       6   2   1  
[056] test       1   1   1    ; to [58] if false
[057] jmp        7            ; to [65]
[058] getglobal  6   3        ; io
[059] gettable   6   6   254  ; "write"
[060] loadk      7   5        ; "\n"
[061] getglobal  8   10       ; tostring
[062] move       9   2      
[063] call       8   2   0  
[064] call       6   0   1  
[065] getglobal  6   20       ; RACConfigValue
[066] loadk      7   21       ; "InstallerVersion"
[067] call       6   2   2  
[068] gettable   7   6   272  ; "Write"
[069] getglobal  8   23       ; INSTALLER_VER
[070] call       7   2   1  
[071] getglobal  7   3        ; io
[072] gettable   7   7   254  ; "write"
[073] loadk      8   5        ; "\n"
[074] getglobal  9   6        ; os
[075] gettable   9   9   257  ; "date"
[076] loadk      10  8        ; "%c "
[077] call       9   2   2  
[078] loadk      10  24       ; "Calling the CleanTemps method from GenericError"
[079] call       7   4   1  
[080] getupval   7   2        ; CleanTemps
[081] call       7   1   1  
[082] getglobal  7   25       ; Cleanup
[083] call       7   1   1  
[084] getupval   7   3        ; newLog
[085] test       7   7   0    ; to [87] if true
[086] jmp        2            ; to [89]
[087] getglobal  7   26       ; CopyLog
[088] call       7   1   1  
[089] gettable   7   3   277  ; "Destroy"
[090] call       7   1   1  
[091] getupval   7   4        ; mutex
[092] gettable   7   7   278  ; "Release"
[093] call       7   1   1  
[094] getupval   7   4        ; mutex
[095] gettable   7   7   279  ; "Close"
[096] call       7   1   1  
[097] getupval   7   5        ; g_gameIdMutex
[098] test       7   7   0    ; to [100] if true
[099] jmp        8            ; to [108]
[100] getglobal  7   13       ; pcall
[101] getupval   8   5        ; g_gameIdMutex
[102] gettable   8   8   278  ; "Release"
[103] call       7   2   1  
[104] getglobal  7   13       ; pcall
[105] getupval   8   5        ; g_gameIdMutex
[106] gettable   8   8   279  ; "Close"
[107] call       7   2   1  
[108] return     4   2      
[109] return     0   1      
; end of function


; function [25] definition (level 2)
; 0 upvalues, 1 params, 9 stacks
.function  0 1 0 9
.local  "cmd"  ; 0
.local  "sfx"  ; 1
.local  "ogmid"  ; 2
.local  "ogmport"  ; 3
.const  "_"  ; 0
.const  "string"  ; 1
.const  "find"  ; 2
.const  ""  ; 3
.const  "sfx:([%w._-]+) [%-]+ogmid%:([%w]+),ogmport:([%d]+)"  ; 4
.const  "[%-]+ogmid:([%w]+),ogmport:([%d]+)"  ; 5
[01] loadnil    1   3      
[02] getglobal  4   1        ; string
[03] gettable   4   4   252  ; "find"
[04] test       5   0   1    ; to [6] if false
[05] jmp        1            ; to [7]
[06] loadk      5   3        ; ""
[07] loadk      6   4        ; "sfx:([%w._-]+) [%-]+ogmid%:([%w]+),ogmport:([%d]+)"
[08] call       4   3   6  
[09] move       3   8      
[10] move       2   7      
[11] move       1   6      
[12] setglobal  5   0        ; _
[13] setglobal  4   0        ; _
[14] test       1   1   0    ; to [16] if true
[15] jmp        5            ; to [21]
[16] move       4   1      
[17] move       5   2      
[18] move       6   3      
[19] return     4   4      
[20] jmp        20           ; to [41]
[21] getglobal  4   1        ; string
[22] gettable   4   4   252  ; "find"
[23] test       5   0   1    ; to [25] if false
[24] jmp        1            ; to [26]
[25] loadk      5   3        ; ""
[26] loadk      6   5        ; "[%-]+ogmid:([%w]+),ogmport:([%d]+)"
[27] call       4   3   5  
[28] move       3   7      
[29] move       2   6      
[30] setglobal  5   0        ; _
[31] setglobal  4   0        ; _
[32] test       2   2   0    ; to [34] if true
[33] jmp        6            ; to [40]
[34] test       3   3   0    ; to [36] if true
[35] jmp        4            ; to [40]
[36] move       4   2      
[37] move       5   3      
[38] return     4   3      
[39] jmp        1            ; to [41]
[40] return     0   2      
[41] return     0   1      
; end of function

[001] getglobal  0   1        ; io
[002] gettable   0   0   252  ; "open"
[003] loadk      1   3        ; "installLog.txt"
[004] loadk      2   4        ; "w"
[005] call       0   3   2  
[006] setglobal  0   0        ; installLog
[007] loadbool   0   0   0    ; false
[008] setglobal  0   5        ; g_installed
[009] getglobal  0   0        ; installLog
[010] test       0   0   0    ; to [12] if true
[011] jmp        4            ; to [16]
[012] getglobal  0   1        ; io
[013] gettable   0   0   256  ; "output"
[014] getglobal  1   0        ; installLog
[015] call       0   2   1  
[016] loadnil    0   0      
[017] loadk      1   7        ; " "
[018] loadk      2   7        ; " "
[019] loadnil    3   4      
[020] getglobal  5   8        ; arg
[021] gettable   5   5   259  ; 2
[022] loadnil    6   10     
[023] loadbool   11  0   0    ; false
[024] loadnil    12  15     
[025] loadbool   16  0   0    ; false
[026] setglobal  16  10       ; g_fOffline
[027] loadbool   16  0   0    ; false
[028] setglobal  16  11       ; g_fGamesManager
[029] loadk      16  14       ; -1
[030] setglobal  16  12       ; g_checkGoogleToolbarState
[031] loadk      16  14       ; -1
[032] setglobal  16  15       ; g_checkChromeState
[033] loadnil    16  16     
[034] setglobal  16  16       ; g_upgrademode
[035] loadnil    16  16     
[036] setglobal  16  17       ; g_ogmid
[037] loadnil    16  16     
[038] setglobal  16  18       ; g_ogmport
[039] newtable   16  0   3    ; array=0, hash=8
[040] settable   16  270 271  ; "contentid" ""
[041] settable   16  272 271  ; "tracking" ""
[042] settable   16  273 271  ; "affiliate" ""
[043] settable   16  274 271  ; "currency" ""
[044] settable   16  275 271  ; "price" ""
[045] settable   16  276 271  ; "timestamp" ""
[046] settable   16  277 271  ; "language" ""
[047] setglobal  16  19       ; main_env
[048] closure    16  0        ; 1 upvalues
[049] move       0   10     
[050] closure    17  1        ; 0 upvalues
[051] closure    18  2        ; 0 upvalues
[052] closure    19  3        ; 0 upvalues
[053] closure    20  4        ; 1 upvalues
[054] move       0   14     
[055] closure    21  5        ; 1 upvalues
[056] move       0   18     
[057] closure    22  6        ; 2 upvalues
[058] move       0   18     
[059] move       0   19     
[060] closure    23  7        ; 2 upvalues
[061] move       0   18     
[062] move       0   19     
[063] closure    24  8        ; 1 upvalues
[064] move       0   10     
[065] closure    25  9        ; 1 upvalues
[066] move       0   10     
[067] closure    26  10       ; 1 upvalues
[068] move       0   10     
[069] closure    27  11       ; 3 upvalues
[070] move       0   10     
[071] move       0   2      
[072] move       0   0      
[073] closure    28  12       ; 19 upvalues
[074] move       0   6      
[075] move       0   1      
[076] move       0   2      
[077] move       0   10     
[078] move       0   14     
[079] move       0   20     
[080] move       0   21     
[081] move       0   22     
[082] move       0   23     
[083] move       0   18     
[084] move       0   16     
[085] move       0   26     
[086] move       0   3      
[087] move       0   27     
[088] move       0   25     
[089] move       0   9      
[090] move       0   4      
[091] move       0   7      
[092] move       0   8      
[093] closure    29  13       ; 11 upvalues
[094] move       0   5      
[095] move       0   6      
[096] move       0   3      
[097] move       0   10     
[098] move       0   13     
[099] move       0   26     
[100] move       0   16     
[101] move       0   11     
[102] move       0   9      
[103] move       0   7      
[104] move       0   8      
[105] closure    30  14       ; 10 upvalues
[106] move       0   6      
[107] move       0   5      
[108] move       0   3      
[109] move       0   10     
[110] move       0   16     
[111] move       0   9      
[112] move       0   26     
[113] move       0   7      
[114] move       0   24     
[115] move       0   8      
[116] closure    31  15       ; 5 upvalues
[117] move       0   5      
[118] move       0   6      
[119] move       0   9      
[120] move       0   7      
[121] move       0   8      
[122] closure    32  16       ; 7 upvalues
[123] move       0   6      
[124] move       0   3      
[125] move       0   10     
[126] move       0   26     
[127] move       0   9      
[128] move       0   7      
[129] move       0   8      
[130] closure    33  17       ; 4 upvalues
[131] move       0   6      
[132] move       0   10     
[133] move       0   7      
[134] move       0   8      
[135] closure    34  18       ; 6 upvalues
[136] move       0   6      
[137] move       0   3      
[138] move       0   10     
[139] move       0   9      
[140] move       0   7      
[141] move       0   8      
[142] closure    35  19       ; 5 upvalues
[143] move       0   5      
[144] move       0   9      
[145] move       0   10     
[146] move       0   17     
[147] move       0   6      
[148] closure    36  20       ; 2 upvalues
[149] move       0   10     
[150] move       0   13     
[151] closure    37  21       ; 2 upvalues
[152] move       0   10     
[153] move       0   0      
[154] setglobal  37  28       ; CopyLog
[155] closure    37  22       ; 1 upvalues
[156] move       0   10     
[157] setglobal  37  29       ; appendStoreFront
[158] closure    37  23       ; 7 upvalues
[159] move       0   14     
[160] move       0   11     
[161] move       0   10     
[162] move       0   7      
[163] move       0   36     
[164] move       0   3      
[165] move       0   4      
[166] setglobal  37  30       ; GenericShutDown
[167] closure    37  24       ; 6 upvalues
[168] move       0   8      
[169] move       0   9      
[170] move       0   36     
[171] move       0   0      
[172] move       0   3      
[173] move       0   4      
[174] closure    38  25       ; 0 upvalues
[175] setglobal  38  31       ; parseOgmCmdLine
[176] loadnil    38  39     
[177] getglobal  40  1        ; io
[178] gettable   40  40  282  ; "write"
[179] loadk      41  33       ; "\nStubby command line args..."
[180] call       40  2   1  
[181] loadk      40  13       ; 1
[182] jmp        10           ; to [193]
[183] getglobal  41  1        ; io
[184] gettable   41  41  282  ; "write"
[185] loadk      42  34       ; "\n arg["
[186] move       43  40     
[187] loadk      44  35       ; "] = "
[188] getglobal  45  8        ; arg
[189] gettable   45  45  40 
[190] concat     42  42  45 
[191] call       41  2   1  
[192] add        40  40  263  ; 1
[193] getglobal  41  8        ; arg
[194] gettable   41  41  40 
[195] test       41  41  1    ; to [197] if false
[196] jmp        -14          ; to [183]
[197] getglobal  41  1        ; io
[198] gettable   41  41  286  ; "flush"
[199] call       41  1   1  
[200] getglobal  41  8        ; arg
[201] gettable   41  41  263  ; 1
[202] test       41  41  1    ; to [204] if false
[203] jmp        24           ; to [228]
[204] getglobal  41  1        ; io
[205] gettable   41  41  282  ; "write"
[206] loadk      42  37       ; "\n\n*********************STUBBY FIRST INSTANCE*************************\n\n"
[207] call       41  2   1  
[208] getglobal  41  1        ; io
[209] gettable   41  41  282  ; "write"
[210] loadk      42  38       ; "Timestamp: "
[211] getglobal  43  39       ; os
[212] gettable   43  43  290  ; "date"
[213] loadk      44  41       ; "%c"
[214] call       43  2   0  
[215] call       41  0   1  
[216] getglobal  41  1        ; io
[217] gettable   41  41  282  ; "write"
[218] loadk      42  42       ; "\n\n*******************************************************************\n\n"
[219] call       41  2   1  
[220] getglobal  41  43       ; pcall
[221] move       42  28     
[222] loadbool   43  0   0    ; false
[223] call       41  3   3  
[224] move       39  42     
[225] move       38  41     
[226] loadk      15  44       ; "stubby"
[227] jmp        321          ; to [549]
[228] getglobal  41  45       ; string
[229] gettable   41  41  296  ; "sub"
[230] getglobal  42  8        ; arg
[231] gettable   42  42  263  ; 1
[232] loadk      43  13       ; 1
[233] loadk      44  9        ; 2
[234] call       41  4   2  
[235] eq         0   41  297  ; "--", to [237] if true
[236] jmp        48           ; to [285]
[237] getglobal  41  1        ; io
[238] gettable   41  41  282  ; "write"
[239] loadk      42  48       ; "\n\n**********************STUBBY FIRST INSTANCE OGM*******************\n\n"
[240] call       41  2   1  
[241] getglobal  41  1        ; io
[242] gettable   41  41  282  ; "write"
[243] loadk      42  38       ; "Timestamp: "
[244] getglobal  43  39       ; os
[245] gettable   43  43  290  ; "date"
[246] loadk      44  41       ; "%c"
[247] call       43  2   0  
[248] call       41  0   1  
[249] getglobal  41  1        ; io
[250] gettable   41  41  282  ; "write"
[251] loadk      42  42       ; "\n\n*******************************************************************\n\n"
[252] call       41  2   1  
[253] getglobal  41  43       ; pcall
[254] getglobal  42  31       ; parseOgmCmdLine
[255] getglobal  43  8        ; arg
[256] gettable   43  43  263  ; 1
[257] call       41  3   4  
[258] setglobal  43  18       ; g_ogmport
[259] setglobal  42  17       ; g_ogmid
[260] setglobal  41  49       ; _
[261] getglobal  41  1        ; io
[262] gettable   41  41  282  ; "write"
[263] loadk      42  50       ; "\nCommand line ogmid = "
[264] getglobal  43  51       ; tostring
[265] getglobal  44  17       ; g_ogmid
[266] call       43  2   0  
[267] call       41  0   1  
[268] getglobal  41  1        ; io
[269] gettable   41  41  282  ; "write"
[270] loadk      42  52       ; "\nCommand line ogmport = "
[271] getglobal  43  51       ; tostring
[272] getglobal  44  18       ; g_ogmport
[273] call       43  2   0  
[274] call       41  0   1  
[275] getglobal  41  1        ; io
[276] gettable   41  41  286  ; "flush"
[277] call       41  1   1  
[278] getglobal  41  43       ; pcall
[279] move       42  28     
[280] loadbool   43  0   0    ; false
[281] call       41  3   3  
[282] move       39  42     
[283] move       38  41     
[284] jmp        264          ; to [549]
[285] getglobal  41  45       ; string
[286] gettable   41  41  296  ; "sub"
[287] getglobal  42  8        ; arg
[288] gettable   42  42  263  ; 1
[289] loadk      43  13       ; 1
[290] loadk      44  53       ; 4
[291] call       41  4   2  
[292] eq         0   41  304  ; "sfx:", to [294] if true
[293] jmp        68           ; to [362]
[294] getglobal  41  8        ; arg
[295] gettable   41  41  259  ; 2
[296] test       41  41  0    ; to [298] if true
[297] jmp        22           ; to [320]
[298] getglobal  41  43       ; pcall
[299] getglobal  42  31       ; parseOgmCmdLine
[300] getglobal  43  8        ; arg
[301] gettable   43  43  259  ; 2
[302] call       41  3   4  
[303] setglobal  43  18       ; g_ogmport
[304] setglobal  42  17       ; g_ogmid
[305] setglobal  41  49       ; _
[306] getglobal  41  18       ; g_ogmport
[307] test       41  41  0    ; to [309] if true
[308] jmp        6            ; to [315]
[309] loadnil    5   5      
[310] getglobal  41  1        ; io
[311] gettable   41  41  282  ; "write"
[312] loadk      42  55       ; "\n\n**********************STUBBY SECOND INSTANCE OGM*******************\n\n"
[313] call       41  2   1  
[314] jmp        9            ; to [324]
[315] getglobal  41  1        ; io
[316] gettable   41  41  282  ; "write"
[317] loadk      42  56       ; "\n\n*********************STUBBY SECOND INSTANCE (ignore unknown params)\n\n"
[318] call       41  2   1  
[319] jmp        4            ; to [324]
[320] getglobal  41  1        ; io
[321] gettable   41  41  282  ; "write"
[322] loadk      42  57       ; "\n\n**********************STUBBY SECOND INSTANCE***********************\n\n"
[323] call       41  2   1  
[324] getglobal  41  1        ; io
[325] gettable   41  41  282  ; "write"
[326] loadk      42  38       ; "Timestamp: "
[327] getglobal  43  39       ; os
[328] gettable   43  43  290  ; "date"
[329] loadk      44  41       ; "%c"
[330] call       43  2   0  
[331] call       41  0   1  
[332] getglobal  41  1        ; io
[333] gettable   41  41  282  ; "write"
[334] loadk      42  42       ; "\n\n*******************************************************************\n\n"
[335] call       41  2   1  
[336] getglobal  41  45       ; string
[337] gettable   41  41  296  ; "sub"
[338] getglobal  42  8        ; arg
[339] gettable   42  42  263  ; 1
[340] loadk      43  58       ; 5
[341] call       41  3   2  
[342] move       14  41     
[343] getglobal  41  1        ; io
[344] gettable   41  41  282  ; "write"
[345] loadk      42  59       ; "\n"
[346] getglobal  43  39       ; os
[347] gettable   43  43  290  ; "date"
[348] loadk      44  60       ; "%c "
[349] call       43  2   2  
[350] loadk      44  61       ; "Command line SFXPath = "
[351] getglobal  45  51       ; tostring
[352] move       46  14     
[353] call       45  2   0  
[354] call       41  0   1  
[355] getglobal  41  43       ; pcall
[356] move       42  28     
[357] loadbool   43  0   0    ; false
[358] call       41  3   3  
[359] move       39  42     
[360] move       38  41     
[361] jmp        187          ; to [549]
[362] getglobal  41  45       ; string
[363] gettable   41  41  312  ; "find"
[364] getglobal  42  8        ; arg
[365] gettable   42  42  263  ; 1
[366] loadk      43  63       ; "%.rguninst"
[367] call       41  3   2  
[368] test       41  41  0    ; to [370] if true
[369] jmp        27           ; to [397]
[370] getglobal  41  1        ; io
[371] gettable   41  41  282  ; "write"
[372] loadk      42  64       ; "\n\n************************UNINSTALL INSTANCE*************************\n\n"
[373] call       41  2   1  
[374] getglobal  41  1        ; io
[375] gettable   41  41  282  ; "write"
[376] loadk      42  38       ; "Timestamp: "
[377] getglobal  43  39       ; os
[378] gettable   43  43  290  ; "date"
[379] loadk      44  41       ; "%c"
[380] call       43  2   0  
[381] call       41  0   1  
[382] getglobal  41  1        ; io
[383] gettable   41  41  282  ; "write"
[384] loadk      42  42       ; "\n\n*******************************************************************\n\n"
[385] call       41  2   1  
[386] getglobal  41  8        ; arg
[387] gettable   41  41  259  ; 2
[388] setglobal  41  65       ; g_invoker
[389] getglobal  41  8        ; arg
[390] gettable   5   41  316  ; 3
[391] getglobal  41  43       ; pcall
[392] move       42  32     
[393] call       41  2   3  
[394] move       39  42     
[395] move       38  41     
[396] jmp        152          ; to [549]
[397] getglobal  41  8        ; arg
[398] gettable   41  41  263  ; 1
[399] eq         0   41  317  ; "mygames", to [401] if true
[400] jmp        22           ; to [423]
[401] getglobal  41  1        ; io
[402] gettable   41  41  282  ; "write"
[403] loadk      42  68       ; "\n\n************************MYGAMES INSTANCE*************************\n\n"
[404] call       41  2   1  
[405] getglobal  41  1        ; io
[406] gettable   41  41  282  ; "write"
[407] loadk      42  38       ; "Timestamp: "
[408] getglobal  43  39       ; os
[409] gettable   43  43  290  ; "date"
[410] loadk      44  41       ; "%c"
[411] call       43  2   0  
[412] call       41  0   1  
[413] getglobal  41  1        ; io
[414] gettable   41  41  282  ; "write"
[415] loadk      42  42       ; "\n\n*******************************************************************\n\n"
[416] call       41  2   1  
[417] getglobal  41  43       ; pcall
[418] move       42  33     
[419] call       41  2   3  
[420] move       39  42     
[421] move       38  41     
[422] jmp        126          ; to [549]
[423] getglobal  41  8        ; arg
[424] gettable   41  41  263  ; 1
[425] eq         0   41  319  ; "update", to [427] if true
[426] jmp        22           ; to [449]
[427] getglobal  41  1        ; io
[428] gettable   41  41  282  ; "write"
[429] loadk      42  70       ; "\n\n************************UPDATE INSTANCE****************************\n\n"
[430] call       41  2   1  
[431] getglobal  41  1        ; io
[432] gettable   41  41  282  ; "write"
[433] loadk      42  38       ; "Timestamp: "
[434] getglobal  43  39       ; os
[435] gettable   43  43  290  ; "date"
[436] loadk      44  41       ; "%c"
[437] call       43  2   0  
[438] call       41  0   1  
[439] getglobal  41  1        ; io
[440] gettable   41  41  282  ; "write"
[441] loadk      42  42       ; "\n\n*******************************************************************\n\n"
[442] call       41  2   1  
[443] getglobal  41  43       ; pcall
[444] move       42  34     
[445] call       41  2   3  
[446] move       39  42     
[447] move       38  41     
[448] jmp        100          ; to [549]
[449] getglobal  41  8        ; arg
[450] gettable   41  41  263  ; 1
[451] eq         0   41  321  ; "silent", to [453] if true
[452] jmp        23           ; to [476]
[453] getglobal  41  1        ; io
[454] gettable   41  41  282  ; "write"
[455] loadk      42  72       ; "\n\n************************SILENT INSTALL INSTANCE********************\n\n"
[456] call       41  2   1  
[457] getglobal  41  1        ; io
[458] gettable   41  41  282  ; "write"
[459] loadk      42  38       ; "Timestamp: "
[460] getglobal  43  39       ; os
[461] gettable   43  43  290  ; "date"
[462] loadk      44  41       ; "%c"
[463] call       43  2   0  
[464] call       41  0   1  
[465] getglobal  41  1        ; io
[466] gettable   41  41  282  ; "write"
[467] loadk      42  42       ; "\n\n*******************************************************************\n\n"
[468] call       41  2   1  
[469] getglobal  41  43       ; pcall
[470] move       42  28     
[471] loadbool   43  1   0    ; true
[472] call       41  3   3  
[473] move       39  42     
[474] move       38  41     
[475] jmp        73           ; to [549]
[476] getglobal  41  8        ; arg
[477] gettable   41  41  263  ; 1
[478] eq         0   41  323  ; "cdinstall", to [480] if true
[479] jmp        22           ; to [502]
[480] getglobal  41  1        ; io
[481] gettable   41  41  282  ; "write"
[482] loadk      42  74       ; "\n\n************************CD INSTALL INSTANCE************************\n\n"
[483] call       41  2   1  
[484] getglobal  41  1        ; io
[485] gettable   41  41  282  ; "write"
[486] loadk      42  38       ; "Timestamp: "
[487] getglobal  43  39       ; os
[488] gettable   43  43  290  ; "date"
[489] loadk      44  41       ; "%c"
[490] call       43  2   0  
[491] call       41  0   1  
[492] getglobal  41  1        ; io
[493] gettable   41  41  282  ; "write"
[494] loadk      42  42       ; "\n\n*******************************************************************\n\n"
[495] call       41  2   1  
[496] getglobal  41  43       ; pcall
[497] move       42  29     
[498] call       41  2   3  
[499] move       39  42     
[500] move       38  41     
[501] jmp        47           ; to [549]
[502] getglobal  41  8        ; arg
[503] gettable   41  41  263  ; 1
[504] eq         0   41  325  ; "wrapper", to [506] if true
[505] jmp        22           ; to [528]
[506] getglobal  41  1        ; io
[507] gettable   41  41  282  ; "write"
[508] loadk      42  76       ; "\n\n************************GAME WRAPPER INSTANCE**********************\n\n"
[509] call       41  2   1  
[510] getglobal  41  1        ; io
[511] gettable   41  41  282  ; "write"
[512] loadk      42  38       ; "Timestamp: "
[513] getglobal  43  39       ; os
[514] gettable   43  43  290  ; "date"
[515] loadk      44  41       ; "%c"
[516] call       43  2   0  
[517] call       41  0   1  
[518] getglobal  41  1        ; io
[519] gettable   41  41  282  ; "write"
[520] loadk      42  42       ; "\n\n*******************************************************************\n\n"
[521] call       41  2   1  
[522] getglobal  41  43       ; pcall
[523] move       42  31     
[524] call       41  2   3  
[525] move       39  42     
[526] move       38  41     
[527] jmp        21           ; to [549]
[528] getglobal  41  1        ; io
[529] gettable   41  41  282  ; "write"
[530] loadk      42  77       ; "\n\n************************SHELL INSTANCE*****************************\n\n"
[531] call       41  2   1  
[532] getglobal  41  1        ; io
[533] gettable   41  41  282  ; "write"
[534] loadk      42  38       ; "Timestamp: "
[535] getglobal  43  39       ; os
[536] gettable   43  43  290  ; "date"
[537] loadk      44  41       ; "%c"
[538] call       43  2   0  
[539] call       41  0   1  
[540] getglobal  41  1        ; io
[541] gettable   41  41  282  ; "write"
[542] loadk      42  42       ; "\n\n*******************************************************************\n\n"
[543] call       41  2   1  
[544] getglobal  41  43       ; pcall
[545] move       42  30     
[546] call       41  2   3  
[547] move       39  42     
[548] move       38  41     
[549] test       38  38  0    ; to [551] if true
[550] jmp        5            ; to [556]
[551] getglobal  41  43       ; pcall
[552] move       42  35     
[553] call       41  2   3  
[554] move       39  42     
[555] move       38  41     
[556] test       38  38  1    ; to [558] if false
[557] jmp        53           ; to [611]
[558] test       9   9   0    ; to [560] if true
[559] jmp        17           ; to [577]
[560] getglobal  41  43       ; pcall
[561] gettable   42  9   328  ; "HandleError"
[562] move       43  39     
[563] call       41  3   3  
[564] test       41  41  1    ; to [566] if false
[565] jmp        18           ; to [584]
[566] getglobal  43  1        ; io
[567] gettable   43  43  282  ; "write"
[568] loadk      44  59       ; "\n"
[569] getglobal  45  39       ; os
[570] gettable   45  45  290  ; "date"
[571] loadk      46  60       ; "%c "
[572] call       45  2   2  
[573] loadk      46  79       ; "HandleError: "
[574] move       47  42     
[575] call       43  5   1  
[576] jmp        7            ; to [584]
[577] getglobal  41  1        ; io
[578] gettable   41  41  282  ; "write"
[579] loadk      42  59       ; "\n"
[580] getglobal  43  51       ; tostring
[581] move       44  39     
[582] call       43  2   0  
[583] call       41  0   1  
[584] getglobal  41  43       ; pcall
[585] move       42  37     
[586] move       43  39     
[587] call       41  3   3  
[588] setglobal  42  80       ; e
[589] move       38  41     
[590] getglobal  41  1        ; io
[591] gettable   41  41  282  ; "write"
[592] loadk      42  81       ; "\n\nTimestamp: "
[593] getglobal  43  39       ; os
[594] gettable   43  43  290  ; "date"
[595] loadk      44  41       ; "%c"
[596] call       43  2   2  
[597] loadk      44  82       ; "\n\n"
[598] call       41  4   1  
[599] test       38  38  0    ; to [601] if true
[600] jmp        5            ; to [606]
[601] getglobal  41  39       ; os
[602] gettable   41  41  333  ; "exit"
[603] getglobal  42  80       ; e
[604] call       41  2   1  
[605] jmp        5            ; to [611]
[606] getglobal  41  39       ; os
[607] gettable   41  41  333  ; "exit"
[608] getglobal  42  84       ; g_exit
[609] gettable   42  42  335  ; "unspecified"
[610] call       41  2   1  
[611] getglobal  41  1        ; io
[612] gettable   41  41  282  ; "write"
[613] loadk      42  86       ; "\n\n\n"
[614] getglobal  43  39       ; os
[615] gettable   43  43  290  ; "date"
[616] loadk      44  60       ; "%c "
[617] call       43  2   2  
[618] loadk      44  87       ; "Script completed successfully!!!"
[619] call       41  4   1  
[620] getglobal  41  1        ; io
[621] gettable   41  41  282  ; "write"
[622] loadk      42  82       ; "\n\n"
[623] getglobal  43  39       ; os
[624] gettable   43  43  290  ; "date"
[625] loadk      44  60       ; "%c "
[626] call       43  2   2  
[627] loadk      44  38       ; "Timestamp: "
[628] getglobal  45  39       ; os
[629] gettable   45  45  290  ; "date"
[630] loadk      46  41       ; "%c"
[631] call       45  2   2  
[632] loadk      46  82       ; "\n\n"
[633] call       41  6   1  
[634] getglobal  41  43       ; pcall
[635] getglobal  42  30       ; GenericShutDown
[636] call       41  2   1  
[637] getglobal  41  39       ; os
[638] gettable   41  41  333  ; "exit"
[639] getglobal  42  88       ; luacom
[640] gettable   42  42  339  ; "CreateObject"
[641] loadk      43  90       ; "RACInstaller.StateCtrl"
[642] call       42  2   2  
[643] self       42  42  341  ; "ExitCode"
[644] call       42  2   0  
[645] call       41  0   1  
[646] return     0   1      
; end of function


; source chunk: mrClean.clf
; x86 standard (32-bit, little endian, doubles)

; function [0] definition (level 1)
; 0 upvalues, 0 params, 14 stacks
.function  0 0 0 14
.local  "win32"  ; 0
.local  "RemoveUIless"  ; 1
.local  "RemoveInstaller"  ; 2
.local  "waitTime"  ; 3
.local  "mutex"  ; 4
.local  "installerLoc"  ; 5
.local  "success"  ; 6
.local  "err"  ; 7
.local  "errHandler"  ; 8
.const  "io"  ; 0
.const  "output"  ; 1
.const  "open"  ; 2
.const  "..\\uninstLog.txt"  ; 3
.const  "a"  ; 4
.const  "dofile"  ; 5
.const  "compat-5.1.lua"  ; 6
.const  "require"  ; 7
.const  "luacom"  ; 8
.const  "rainstallerpaths"  ; 9
.const  "config.lua"  ; 10
.const  "blob"  ; 11
.const  "write"  ; 12
.const  "\n"  ; 13
.const  "os"  ; 14
.const  "date"  ; 15
.const  "%c "  ; 16
.const  "Loaded blob"  ; 17
.const  "Win32Interop"  ; 18
.const  "tryRemoveGamesRoot"  ; 19
.const  "removeKnownStoreFronts"  ; 20
.const  "clock"  ; 21
.const  "Mutex"  ; 22
.const  "RACV2InstallerInst"  ; 23
.const  60  ; 24
.const  "Running MrClean"  ; 25
.const  "GetRegKeyValue"  ; 26
.const  "HKEY_LOCAL_MACHINE"  ; 27
.const  "SOFTWARE\\GameInstaller\\Installer"  ; 28
.const  "Location"  ; 29
.const  ""  ; 30
.const  "g_constants"  ; 31
.const  "installerLoc"  ; 32
.const  "installerLoc: "  ; 33
.const  "tostring"  ; 34
.const  "pcall"  ; 35
.const  "ErrorHandler"  ; 36
.const  "\nUninstallation Failed!!!, "  ; 37
.const  "LogMessage"  ; 38
.const  "Uninstallation Failed!!!, "  ; 39
.const  "HandleError"  ; 40
.const  "\nUninstallation Complete!"  ; 41
.const  "Release"  ; 42
.const  "Close"  ; 43
.const  "\nUnable to obtain mutex. Couldn't uninstall clientless files."  ; 44
.const  "Unable to obtain RACV2InstallerInst mutex. Couldn't uninstall clientless files."  ; 45

; function [0] definition (level 2)
; 1 upvalues, 2 params, 9 stacks
.function  1 2 0 9
.local  "storefront"  ; 0
.local  "version"  ; 1
.local  "gamesRoot"  ; 2
.local  "msg"  ; 3
.upvalue  "win32"  ; 0
.const  "GetRegKeyValue"  ; 0
.const  "HKEY_CLASSES_ROOT"  ; 1
.const  "\\Software\\"  ; 2
.const  "\\"  ; 3
.const  "\\Preferences"  ; 4
.const  "GamesRoot"  ; 5
.const  "string"  ; 6
.const  "len"  ; 7
.const  0  ; 8
.const  "FolderIsEmpty"  ; 9
.const  "pcall"  ; 10
.const  "DeleteFile"  ; 11
.const  "Leave \""  ; 12
.const  "tostring"  ; 13
.const  "\" as it is not empty"  ; 14
.const  "io"  ; 15
.const  "write"  ; 16
.const  "\n"  ; 17
.const  "os"  ; 18
.const  "date"  ; 19
.const  "%c "  ; 20
.const  "LogMessage"  ; 21
.const  "GamesRoot not found for "  ; 22
.const  " version "  ; 23
[01] getupval   2   0        ; win32
[02] gettable   2   2   250  ; "GetRegKeyValue"
[03] loadk      3   1        ; "HKEY_CLASSES_ROOT"
[04] loadk      4   2        ; "\\Software\\"
[05] move       5   0      
[06] loadk      6   3        ; "\\"
[07] move       7   1      
[08] loadk      8   4        ; "\\Preferences"
[09] concat     4   4   8  
[10] loadk      5   5        ; "GamesRoot"
[11] call       2   4   2  
[12] test       2   2   0    ; to [14] if true
[13] jmp        43           ; to [57]
[14] getglobal  3   6        ; string
[15] gettable   3   3   257  ; "len"
[16] move       4   2      
[17] call       3   2   2  
[18] lt         0   258 3    ; 0, to [20] if true
[19] jmp        37           ; to [57]
[20] getupval   3   0        ; win32
[21] gettable   3   3   259  ; "FolderIsEmpty"
[22] move       4   2      
[23] call       3   2   2  
[24] test       3   3   0    ; to [26] if true
[25] jmp        6            ; to [32]
[26] getglobal  3   10       ; pcall
[27] getupval   4   0        ; win32
[28] gettable   4   4   261  ; "DeleteFile"
[29] move       5   2      
[30] call       3   3   1  
[31] jmp        37           ; to [69]
[32] loadk      3   12       ; "Leave \""
[33] getglobal  4   13       ; tostring
[34] move       5   2      
[35] call       4   2   2  
[36] loadk      5   14       ; "\" as it is not empty"
[37] concat     3   3   5  
[38] getglobal  4   15       ; io
[39] gettable   4   4   266  ; "write"
[40] loadk      5   17       ; "\n"
[41] getglobal  6   18       ; os
[42] gettable   6   6   269  ; "date"
[43] loadk      7   20       ; "%c "
[44] call       6   2   2  
[45] move       7   3      
[46] call       4   4   1  
[47] getupval   4   0        ; win32
[48] gettable   4   4   271  ; "LogMessage"
[49] getglobal  5   18       ; os
[50] gettable   5   5   269  ; "date"
[51] loadk      6   20       ; "%c "
[52] call       5   2   2  
[53] move       6   3      
[54] concat     5   5   6  
[55] call       4   2   1  
[56] jmp        12           ; to [69]
[57] getupval   3   0        ; win32
[58] gettable   3   3   271  ; "LogMessage"
[59] getglobal  4   18       ; os
[60] gettable   4   4   269  ; "date"
[61] loadk      5   20       ; "%c "
[62] call       4   2   2  
[63] loadk      5   22       ; "GamesRoot not found for "
[64] move       6   0      
[65] loadk      7   23       ; " version "
[66] move       8   1      
[67] concat     4   4   8  
[68] call       3   2   1  
[69] return     0   1      
; end of function


; function [1] definition (level 2)
; 1 upvalues, 0 params, 9 stacks
.function  1 0 0 9
.local  "multiLineString"  ; 0
.local  "index"  ; 1
.local  "count"  ; 2
.local  "line"  ; 3
.local  "msg"  ; 4
.local  "msg"  ; 5
.local  "msg"  ; 6
.upvalue  "win32"  ; 0
.const  "RegQueryMultLineValue"  ; 0
.const  "HKEY_LOCAL_MACHINE"  ; 1
.const  "SOFTWARE\\GameInstaller\\Installer"  ; 2
.const  "Storefronts"  ; 3
.const  "table"  ; 4
.const  "type"  ; 5
.const  1  ; 6
.const  "getn"  ; 7
.const  "string"  ; 8
.const  "len"  ; 9
.const  "io"  ; 10
.const  "write"  ; 11
.const  "\n"  ; 12
.const  "os"  ; 13
.const  "date"  ; 14
.const  "%c "  ; 15
.const  "Storefront found: "  ; 16
.const  "LogMessage"  ; 17
.const  "tryRemoveGamesRoot"  ; 18
.const  "1.0"  ; 19
.const  "2.0"  ; 20
.const  "RegDeleteTree"  ; 21
.const  "HKEY_CLASSES_ROOT"  ; 22
.const  "g_constants"  ; 23
.const  "basekey"  ; 24
.const  0  ; 25
.const  "Storefronts NOT Found in registry."  ; 26
.const  nil  ; 27
.const  "Storefronts NOT Found in registry"  ; 28
.const  "RegQueryMultLineValue returned a "  ; 29
[001] getupval   0   0        ; win32
[002] gettable   0   0   250  ; "RegQueryMultLineValue"
[003] loadk      1   1        ; "HKEY_LOCAL_MACHINE"
[004] loadk      2   2        ; "SOFTWARE\\GameInstaller\\Installer"
[005] loadk      3   3        ; "Storefronts"
[006] call       0   4   2  
[007] getglobal  1   5        ; type
[008] move       2   0      
[009] call       1   2   2  
[010] eq         0   254 1    ; "table", to [12] if true
[011] jmp        74           ; to [86]
[012] loadk      1   6        ; 1
[013] getglobal  2   4        ; table
[014] gettable   2   2   257  ; "getn"
[015] move       3   0      
[016] call       2   2   2  
[017] jmp        44           ; to [62]
[018] gettable   3   0   1  
[019] getglobal  4   8        ; string
[020] gettable   4   4   259  ; "len"
[021] move       5   3      
[022] call       4   2   2  
[023] lt         0   256 4    ; 1, to [25] if true
[024] jmp        36           ; to [61]
[025] getglobal  4   10       ; io
[026] gettable   4   4   261  ; "write"
[027] loadk      5   12       ; "\n"
[028] getglobal  6   13       ; os
[029] gettable   6   6   264  ; "date"
[030] loadk      7   15       ; "%c "
[031] call       6   2   2  
[032] loadk      7   16       ; "Storefront found: "
[033] move       8   3      
[034] call       4   5   1  
[035] getupval   4   0        ; win32
[036] gettable   4   4   267  ; "LogMessage"
[037] getglobal  5   13       ; os
[038] gettable   5   5   264  ; "date"
[039] loadk      6   15       ; "%c "
[040] call       5   2   2  
[041] loadk      6   16       ; "Storefront found: "
[042] move       7   3      
[043] concat     5   5   7  
[044] call       4   2   1  
[045] getglobal  4   18       ; tryRemoveGamesRoot
[046] move       5   3      
[047] loadk      6   19       ; "1.0"
[048] call       4   3   1  
[049] getglobal  4   18       ; tryRemoveGamesRoot
[050] move       5   3      
[051] loadk      6   20       ; "2.0"
[052] call       4   3   1  
[053] getupval   4   0        ; win32
[054] gettable   4   4   271  ; "RegDeleteTree"
[055] loadk      5   22       ; "HKEY_CLASSES_ROOT"
[056] getglobal  6   23       ; g_constants
[057] gettable   6   6   274  ; "basekey"
[058] move       7   3      
[059] concat     6   6   7  
[060] call       4   3   1  
[061] add        1   1   256  ; 1
[062] le         1   1   2    ; to [64] if false
[063] jmp        -46          ; to [18]
[064] eq         0   275 2    ; 0, to [66] if true
[065] jmp        65           ; to [131]
[066] loadk      3   26       ; "Storefronts NOT Found in registry."
[067] getglobal  4   10       ; io
[068] gettable   4   4   261  ; "write"
[069] loadk      5   12       ; "\n"
[070] getglobal  6   13       ; os
[071] gettable   6   6   264  ; "date"
[072] loadk      7   15       ; "%c "
[073] call       6   2   2  
[074] move       7   3      
[075] call       4   4   1  
[076] getupval   4   0        ; win32
[077] gettable   4   4   267  ; "LogMessage"
[078] getglobal  5   13       ; os
[079] gettable   5   5   264  ; "date"
[080] loadk      6   15       ; "%c "
[081] call       5   2   2  
[082] move       6   3      
[083] concat     5   5   6  
[084] call       4   2   1  
[085] jmp        45           ; to [131]
[086] eq         0   277 0    ; nil, to [88] if true
[087] jmp        20           ; to [108]
[088] loadk      1   28       ; "Storefronts NOT Found in registry"
[089] getglobal  2   10       ; io
[090] gettable   2   2   261  ; "write"
[091] loadk      3   12       ; "\n"
[092] getglobal  4   13       ; os
[093] gettable   4   4   264  ; "date"
[094] loadk      5   15       ; "%c "
[095] call       4   2   2  
[096] move       5   1      
[097] call       2   4   1  
[098] getupval   2   0        ; win32
[099] gettable   2   2   267  ; "LogMessage"
[100] getglobal  3   13       ; os
[101] gettable   3   3   264  ; "date"
[102] loadk      4   15       ; "%c "
[103] call       3   2   2  
[104] move       4   1      
[105] concat     3   3   4  
[106] call       2   2   1  
[107] jmp        23           ; to [131]
[108] loadk      1   29       ; "RegQueryMultLineValue returned a "
[109] getglobal  2   5        ; type
[110] move       3   0      
[111] call       2   2   2  
[112] concat     1   1   2  
[113] getglobal  2   10       ; io
[114] gettable   2   2   261  ; "write"
[115] loadk      3   12       ; "\n"
[116] getglobal  4   13       ; os
[117] gettable   4   4   264  ; "date"
[118] loadk      5   15       ; "%c "
[119] call       4   2   2  
[120] move       5   1      
[121] call       2   4   1  
[122] getupval   2   0        ; win32
[123] gettable   2   2   267  ; "LogMessage"
[124] getglobal  3   13       ; os
[125] gettable   3   3   264  ; "date"
[126] loadk      4   15       ; "%c "
[127] call       3   2   2  
[128] move       4   1      
[129] concat     3   3   4  
[130] call       2   2   1  
[131] return     0   1      
; end of function


; function [2] definition (level 2)
; 1 upvalues, 0 params, 7 stacks
.function  1 0 0 7
.local  "items"  ; 0
.local  "enum"  ; 1
.local  "invoker"  ; 2
.local  "script"  ; 3
.upvalue  "win32"  ; 0
.const  "GetFolderItems"  ; 0
.const  ".\\uninstall"  ; 1
.const  "item"  ; 2
.const  "Next"  ; 3
.const  "g_invoker"  ; 4
.const  "Parent"  ; 5
.const  "string"  ; 6
.const  "find"  ; 7
.const  "Name"  ; 8
.const  "g_constants"  ; 9
.const  "uninstExt"  ; 10
.const  "UnInstaller"  ; 11
.const  ".\\uninstall\\"  ; 12
.const  "ProcessScript"  ; 13
[01] getupval   0   0        ; win32
[02] gettable   0   0   250  ; "GetFolderItems"
[03] loadk      1   1        ; ".\\uninstall"
[04] call       0   2   3  
[05] test       0   0   1    ; to [7] if false
[06] jmp        1            ; to [8]
[07] return     0   1      
[08] self       2   1   253  ; "Next"
[09] call       2   2   2  
[10] setglobal  2   2        ; item
[11] getglobal  2   4        ; g_invoker
[12] loadk      3   5        ; "Parent"
[13] setglobal  3   4        ; g_invoker
[14] jmp        22           ; to [37]
[15] getglobal  3   6        ; string
[16] gettable   3   3   257  ; "find"
[17] getglobal  4   2        ; item
[18] gettable   4   4   258  ; "Name"
[19] getglobal  5   9        ; g_constants
[20] gettable   5   5   260  ; "uninstExt"
[21] call       3   3   2  
[22] test       3   3   0    ; to [24] if true
[23] jmp        10           ; to [34]
[24] getglobal  3   11       ; UnInstaller
[25] loadk      4   12       ; ".\\uninstall\\"
[26] getglobal  5   2        ; item
[27] gettable   5   5   258  ; "Name"
[28] concat     4   4   5  
[29] call       3   2   2  
[30] gettable   4   3   263  ; "ProcessScript"
[31] loadnil    5   5      
[32] loadbool   6   1   0    ; true
[33] call       4   3   1  
[34] self       3   1   253  ; "Next"
[35] call       3   2   2  
[36] setglobal  3   2        ; item
[37] getglobal  3   2        ; item
[38] test       3   3   1    ; to [40] if false
[39] jmp        -25          ; to [15]
[40] setglobal  2   4        ; g_invoker
[41] return     0   1      
; end of function


; function [3] definition (level 2)
; 1 upvalues, 0 params, 14 stacks
.function  1 0 0 14
.local  "s"  ; 0
.local  "err"  ; 1
.local  "procMgr"  ; 2
.local  "coPath"  ; 3
.local  "s"  ; 4
.local  "e"  ; 5
.local  "cmd"  ; 6
.upvalue  "win32"  ; 0
.const  "DeleteRegKey"  ; 0
.const  "HKEY_CLASSES_ROOT"  ; 1
.const  "Software\\.rgi"  ; 2
.const  "removeKnownStoreFronts"  ; 3
.const  "RegDeleteTree"  ; 4
.const  "HKEY_LOCAL_MACHINE"  ; 5
.const  "SOFTWARE\\GameInstaller"  ; 6
.const  "io"  ; 7
.const  "write"  ; 8
.const  "\n"  ; 9
.const  "os"  ; 10
.const  "date"  ; 11
.const  "%c "  ; 12
.const  "RemoveInstaller"  ; 13
.const  "tmpDir"  ; 14
.const  "GetEnvironmentString"  ; 15
.const  "TEMP"  ; 16
.const  "TMP"  ; 17
.const  "tmpDir: "  ; 18
.const  "tostring"  ; 19
.const  "progFiles"  ; 20
.const  "SpecialFolder"  ; 21
.const  "folderType"  ; 22
.const  "programFiles"  ; 23
.const  "progFiles: "  ; 24
.const  "pcall"  ; 25
.const  "DeleteFile"  ; 26
.const  "\\installLog.txt"  ; 27
.const  "LocalCopy"  ; 28
.const  ".\\bin\\"  ; 29
.const  "bstrapInstall.exe"  ; 30
.const  "luacom"  ; 31
.const  "CreateObject"  ; 32
.const  "StubbyUtil.ProcessMgr"  ; 33
.const  "INSTALLER_LOCATION"  ; 34
.const  "string"  ; 35
.const  "find"  ; 36
.const  ".*\\"  ; 37
.const  "sub"  ; 38
.const  1  ; 39
.const  "\""  ; 40
.const  "\\bstrapInstall.exe\" cleanup \""  ; 41
.const  "Exec: "  ; 42
.const  "Exec"  ; 43
.const  ""  ; 44
.const  "Failed to create StubbyUtil.ProcessMgr"  ; 45
[001] getupval   0   0        ; win32
[002] gettable   0   0   250  ; "DeleteRegKey"
[003] loadk      1   1        ; "HKEY_CLASSES_ROOT"
[004] loadk      2   2        ; "Software\\.rgi"
[005] call       0   3   1  
[006] getglobal  0   3        ; removeKnownStoreFronts
[007] call       0   1   1  
[008] getupval   0   0        ; win32
[009] gettable   0   0   254  ; "RegDeleteTree"
[010] loadk      1   5        ; "HKEY_LOCAL_MACHINE"
[011] loadk      2   6        ; "SOFTWARE\\GameInstaller"
[012] call       0   3   1  
[013] getglobal  0   7        ; io
[014] gettable   0   0   258  ; "write"
[015] loadk      1   9        ; "\n"
[016] getglobal  2   10       ; os
[017] gettable   2   2   261  ; "date"
[018] loadk      3   12       ; "%c "
[019] call       2   2   2  
[020] loadk      3   13       ; "RemoveInstaller"
[021] call       0   4   1  
[022] getglobal  0   15       ; GetEnvironmentString
[023] loadk      1   16       ; "TEMP"
[024] call       0   2   2  
[025] test       0   0   1    ; to [27] if false
[026] jmp        3            ; to [30]
[027] getglobal  0   15       ; GetEnvironmentString
[028] loadk      1   17       ; "TMP"
[029] call       0   2   2  
[030] setglobal  0   14       ; tmpDir
[031] getglobal  0   7        ; io
[032] gettable   0   0   258  ; "write"
[033] loadk      1   9        ; "\n"
[034] getglobal  2   10       ; os
[035] gettable   2   2   261  ; "date"
[036] loadk      3   12       ; "%c "
[037] call       2   2   2  
[038] loadk      3   18       ; "tmpDir: "
[039] getglobal  4   19       ; tostring
[040] getglobal  5   14       ; tmpDir
[041] call       4   2   0  
[042] call       0   0   1  
[043] getupval   0   0        ; win32
[044] gettable   0   0   271  ; "SpecialFolder"
[045] getupval   1   0        ; win32
[046] gettable   1   1   272  ; "folderType"
[047] gettable   1   1   273  ; "programFiles"
[048] call       0   2   2  
[049] setglobal  0   20       ; progFiles
[050] getglobal  0   7        ; io
[051] gettable   0   0   258  ; "write"
[052] loadk      1   9        ; "\n"
[053] getglobal  2   10       ; os
[054] gettable   2   2   261  ; "date"
[055] loadk      3   12       ; "%c "
[056] call       2   2   2  
[057] loadk      3   24       ; "progFiles: "
[058] getglobal  4   19       ; tostring
[059] getglobal  5   20       ; progFiles
[060] call       4   2   0  
[061] call       0   0   1  
[062] getglobal  0   25       ; pcall
[063] getupval   1   0        ; win32
[064] gettable   1   1   276  ; "DeleteFile"
[065] getglobal  2   14       ; tmpDir
[066] loadk      3   27       ; "\\installLog.txt"
[067] concat     2   2   3  
[068] call       0   3   1  
[069] getupval   0   0        ; win32
[070] gettable   0   0   278  ; "LocalCopy"
[071] loadk      1   29       ; ".\\bin\\"
[072] loadk      2   30       ; "bstrapInstall.exe"
[073] concat     1   1   2  
[074] getglobal  2   14       ; tmpDir
[075] call       0   3   3  
[076] test       0   0   0    ; to [78] if true
[077] jmp        61           ; to [139]
[078] getglobal  2   31       ; luacom
[079] gettable   2   2   282  ; "CreateObject"
[080] loadk      3   33       ; "StubbyUtil.ProcessMgr"
[081] call       2   2   2  
[082] test       2   2   0    ; to [84] if true
[083] jmp        46           ; to [130]
[084] getupval   3   0        ; win32
[085] gettable   3   3   271  ; "SpecialFolder"
[086] getupval   4   0        ; win32
[087] gettable   4   4   272  ; "folderType"
[088] gettable   4   4   273  ; "programFiles"
[089] call       3   2   2  
[090] getglobal  4   34       ; INSTALLER_LOCATION
[091] concat     3   3   4  
[092] getglobal  4   35       ; string
[093] gettable   4   4   286  ; "find"
[094] move       5   3      
[095] loadk      6   37       ; ".*\\"
[096] call       4   3   3  
[097] getglobal  6   35       ; string
[098] gettable   6   6   288  ; "sub"
[099] move       7   3      
[100] move       8   4      
[101] sub        9   5   289  ; 1
[102] call       6   4   2  
[103] move       3   6      
[104] loadk      6   40       ; "\""
[105] getglobal  7   14       ; tmpDir
[106] loadk      8   41       ; "\\bstrapInstall.exe\" cleanup \""
[107] move       9   3      
[108] loadk      10  40       ; "\""
[109] concat     6   6   10 
[110] getglobal  7   7        ; io
[111] gettable   7   7   258  ; "write"
[112] loadk      8   9        ; "\n"
[113] getglobal  9   10       ; os
[114] gettable   9   9   261  ; "date"
[115] loadk      10  12       ; "%c "
[116] call       9   2   2  
[117] loadk      10  42       ; "Exec: "
[118] getglobal  11  19       ; tostring
[119] move       12  6      
[120] call       11  2   0  
[121] call       7   0   1  
[122] self       7   2   293  ; "Exec"
[123] move       9   6      
[124] loadk      10  44       ; ""
[125] loadbool   11  1   0    ; true
[126] loadbool   12  0   0    ; false
[127] loadnil    13  13     
[128] call       7   7   1  
[129] jmp        9            ; to [139]
[130] getglobal  3   7        ; io
[131] gettable   3   3   258  ; "write"
[132] loadk      4   9        ; "\n"
[133] getglobal  5   10       ; os
[134] gettable   5   5   261  ; "date"
[135] loadk      6   12       ; "%c "
[136] call       5   2   2  
[137] loadk      6   45       ; "Failed to create StubbyUtil.ProcessMgr"
[138] call       3   4   1  
[139] loadk      2   39       ; 1
[140] return     2   2      
[141] return     0   1      
; end of function

[001] getglobal  0   0        ; io
[002] gettable   0   0   251  ; "output"
[003] getglobal  1   0        ; io
[004] gettable   1   1   252  ; "open"
[005] loadk      2   3        ; "..\\uninstLog.txt"
[006] loadk      3   4        ; "a"
[007] call       1   3   0  
[008] call       0   0   1  
[009] getglobal  0   5        ; dofile
[010] loadk      1   6        ; "compat-5.1.lua"
[011] call       0   2   1  
[012] getglobal  0   7        ; require
[013] loadk      1   8        ; "luacom"
[014] call       0   2   1  
[015] getglobal  0   7        ; require
[016] loadk      1   9        ; "rainstallerpaths"
[017] call       0   2   1  
[018] getglobal  0   5        ; dofile
[019] loadk      1   10       ; "config.lua"
[020] call       0   2   1  
[021] getglobal  0   5        ; dofile
[022] loadk      1   11       ; "blob"
[023] call       0   2   1  
[024] getglobal  0   0        ; io
[025] gettable   0   0   262  ; "write"
[026] loadk      1   13       ; "\n"
[027] getglobal  2   14       ; os
[028] gettable   2   2   265  ; "date"
[029] loadk      3   16       ; "%c "
[030] call       2   2   2  
[031] loadk      3   17       ; "Loaded blob"
[032] call       0   4   1  
[033] getglobal  0   18       ; Win32Interop
[034] call       0   1   2  
[035] closure    1   0        ; 1 upvalues
[036] move       0   0      
[037] setglobal  1   19       ; tryRemoveGamesRoot
[038] closure    1   1        ; 1 upvalues
[039] move       0   0      
[040] setglobal  1   20       ; removeKnownStoreFronts
[041] closure    1   2        ; 1 upvalues
[042] move       0   0      
[043] closure    2   3        ; 1 upvalues
[044] move       0   0      
[045] getglobal  3   14       ; os
[046] gettable   3   3   271  ; "clock"
[047] call       3   1   2  
[048] loadnil    4   4      
[049] jmp        11           ; to [61]
[050] gettable   5   0   272  ; "Mutex"
[051] loadk      6   23       ; "RACV2InstallerInst"
[052] call       5   2   2  
[053] move       4   5      
[054] getglobal  5   14       ; os
[055] gettable   5   5   271  ; "clock"
[056] call       5   1   2  
[057] sub        5   5   3  
[058] lt         0   274 5    ; 60, to [60] if true
[059] jmp        1            ; to [61]
[060] jmp        2            ; to [63]
[061] test       4   4   0    ; to [63] if true
[062] jmp        -13          ; to [50]
[063] getglobal  5   0        ; io
[064] gettable   5   5   262  ; "write"
[065] loadk      6   13       ; "\n"
[066] getglobal  7   14       ; os
[067] gettable   7   7   265  ; "date"
[068] loadk      8   16       ; "%c "
[069] call       7   2   2  
[070] loadk      8   25       ; "Running MrClean"
[071] call       5   4   1  
[072] test       4   4   0    ; to [74] if true
[073] jmp        69           ; to [143]
[074] gettable   5   0   276  ; "GetRegKeyValue"
[075] loadk      6   27       ; "HKEY_LOCAL_MACHINE"
[076] loadk      7   28       ; "SOFTWARE\\GameInstaller\\Installer"
[077] loadk      8   29       ; "Location"
[078] call       5   4   2  
[079] test       5   5   0    ; to [81] if true
[080] jmp        17           ; to [98]
[081] eq         1   5   280  ; "", to [83] if false
[082] jmp        15           ; to [98]
[083] getglobal  6   31       ; g_constants
[084] settable   6   282 5    ; "installerLoc"
[085] getglobal  6   0        ; io
[086] gettable   6   6   262  ; "write"
[087] loadk      7   13       ; "\n"
[088] getglobal  8   14       ; os
[089] gettable   8   8   265  ; "date"
[090] loadk      9   16       ; "%c "
[091] call       8   2   2  
[092] loadk      9   33       ; "installerLoc: "
[093] getglobal  10  34       ; tostring
[094] getglobal  11  31       ; g_constants
[095] gettable   11  11  282  ; "installerLoc"
[096] call       10  2   0  
[097] call       6   0   1  
[098] getglobal  6   35       ; pcall
[099] move       7   1      
[100] call       6   2   3  
[101] test       6   6   0    ; to [103] if true
[102] jmp        5            ; to [108]
[103] getglobal  8   35       ; pcall
[104] move       9   2      
[105] call       8   2   3  
[106] move       7   9      
[107] move       6   8      
[108] test       6   6   1    ; to [110] if false
[109] jmp        24           ; to [134]
[110] getglobal  8   36       ; ErrorHandler
[111] call       8   1   2  
[112] getglobal  9   0        ; io
[113] gettable   9   9   262  ; "write"
[114] loadk      10  37       ; "\nUninstallation Failed!!!, "
[115] getglobal  11  34       ; tostring
[116] move       12  7      
[117] call       11  2   0  
[118] call       9   0   1  
[119] gettable   9   0   288  ; "LogMessage"
[120] getglobal  10  14       ; os
[121] gettable   10  10  265  ; "date"
[122] loadk      11  16       ; "%c "
[123] call       10  2   2  
[124] loadk      11  39       ; "Uninstallation Failed!!!, "
[125] getglobal  12  34       ; tostring
[126] move       13  7      
[127] call       12  2   2  
[128] concat     10  10  12 
[129] call       9   2   1  
[130] gettable   9   8   290  ; "HandleError"
[131] move       10  7      
[132] call       9   2   1  
[133] jmp        4            ; to [138]
[134] getglobal  8   0        ; io
[135] gettable   8   8   262  ; "write"
[136] loadk      9   41       ; "\nUninstallation Complete!"
[137] call       8   2   1  
[138] gettable   8   4   292  ; "Release"
[139] call       8   1   1  
[140] gettable   8   4   293  ; "Close"
[141] call       8   1   1  
[142] jmp        12           ; to [155]
[143] getglobal  5   0        ; io
[144] gettable   5   5   262  ; "write"
[145] loadk      6   44       ; "\nUnable to obtain mutex. Couldn't uninstall clientless files."
[146] call       5   2   1  
[147] gettable   5   0   288  ; "LogMessage"
[148] getglobal  6   14       ; os
[149] gettable   6   6   265  ; "date"
[150] loadk      7   16       ; "%c "
[151] call       6   2   2  
[152] loadk      7   45       ; "Unable to obtain RACV2InstallerInst mutex. Couldn't uninstall clientless files."
[153] concat     6   6   7  
[154] call       5   2   1  
[155] return     0   1      
; end of function


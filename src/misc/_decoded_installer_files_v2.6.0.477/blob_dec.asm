; source chunk: blob
; x86 standard (32-bit, little endian, doubles)

; function [0] definition (level 1)
; 0 upvalues, 0 params, 1 stacks
.function  0 0 0 1

; function [0] definition (level 2)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
.const  "ConstTable"  ; 0
.const  "table"  ; 1
.const  "reverse"  ; 2
.const  "io"  ; 3
.const  "touch"  ; 4
.const  "filter"  ; 5
.const  "filterRec"  ; 6
.const  "filterBoth"  ; 7

; function [0] definition (level 3)
; 0 upvalues, 0 params, 6 stacks
.function  0 0 0 6
.local  "_t"  ; 0
.local  "proxy"  ; 1
.local  "mt"  ; 2
.const  "__index"  ; 0
.const  "__newindex"  ; 1
.const  "setmetatable"  ; 2

; function [0] definition (level 4)
; 1 upvalues, 2 params, 3 stacks
.function  1 2 0 3
.local  "t"  ; 0
.local  "k"  ; 1
.upvalue  "_t"  ; 0
[1] getupval   2   0        ; _t
[2] gettable   2   2   1  
[3] return     2   2      
[4] return     0   1      
; end of function


; function [1] definition (level 4)
; 1 upvalues, 3 params, 7 stacks
.function  1 3 0 7
.local  "t"  ; 0
.local  "k"  ; 1
.local  "v"  ; 2
.upvalue  "_t"  ; 0
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\nAttempted update of const value, "  ; 2
.const  "tostring"  ; 3
.const  "error"  ; 4
[01] getupval   3   0        ; _t
[02] gettable   3   3   1  
[03] test       3   3   0    ; to [5] if true
[04] jmp        15           ; to [20]
[05] getglobal  3   0        ; io
[06] gettable   3   3   251  ; "write"
[07] loadk      4   2        ; "\nAttempted update of const value, "
[08] getglobal  5   3        ; tostring
[09] move       6   1      
[10] call       5   2   0  
[11] call       3   0   1  
[12] getglobal  3   4        ; error
[13] loadk      4   2        ; "\nAttempted update of const value, "
[14] getglobal  5   3        ; tostring
[15] move       6   1      
[16] call       5   2   2  
[17] concat     4   4   5  
[18] call       3   2   1  
[19] jmp        2            ; to [22]
[20] getupval   3   0        ; _t
[21] settable   3   1   2  
[22] return     0   1      
; end of function

[01] newtable   0   0   0    ; array=0, hash=0
[02] newtable   1   0   0    ; array=0, hash=0
[03] newtable   2   0   2    ; array=0, hash=4
[04] closure    3   0        ; 1 upvalues
[05] move       0   0      
[06] settable   2   250 3    ; "__index"
[07] closure    3   1        ; 1 upvalues
[08] move       0   0      
[09] settable   2   251 3    ; "__newindex"
[10] getglobal  3   2        ; setmetatable
[11] move       4   1      
[12] move       5   2      
[13] call       3   3   1  
[14] return     1   2      
[15] return     0   1      
; end of function


; function [1] definition (level 3)
; 0 upvalues, 1 params, 8 stacks
.function  0 1 0 8
.local  "t"  ; 0
.local  "n"  ; 1
.local  "i"  ; 2
.local  "(for limit)"  ; 3
.local  "(for step)"  ; 4
.local  "tmp"  ; 5
.const  "table"  ; 0
.const  "getn"  ; 1
.const  1  ; 2
.const  2  ; 3
[01] getglobal  1   0        ; table
[02] gettable   1   1   251  ; "getn"
[03] move       2   0      
[04] call       1   2   2  
[05] add        1   1   252  ; 1
[06] loadk      2   2        ; 1
[07] div        3   1   253  ; 2
[08] loadk      4   2        ; 1
[09] sub        2   2   4  
[10] jmp        6            ; to [17]
[11] sub        5   1   2  
[12] gettable   5   0   5  
[13] sub        6   1   2  
[14] gettable   7   0   2  
[15] settable   0   6   7  
[16] settable   0   2   5  
[17] forloop    2   -7       ; to [11] if loop
[18] return     0   2      
[19] return     0   1      
; end of function


; function [2] definition (level 3)
; 0 upvalues, 1 params, 4 stacks
.function  0 1 0 4
.local  "filepath"  ; 0
.local  "handle"  ; 1
.const  "io"  ; 0
.const  "openW"  ; 1
.const  "r"  ; 2
.const  "close"  ; 3
[01] getglobal  1   0        ; io
[02] gettable   1   1   251  ; "openW"
[03] move       2   0      
[04] loadk      3   2        ; "r"
[05] call       1   3   2  
[06] test       1   1   1    ; to [8] if false
[07] jmp        3            ; to [11]
[08] loadbool   2   0   0    ; false
[09] return     2   2      
[10] jmp        4            ; to [15]
[11] self       2   1   253  ; "close"
[12] call       2   2   1  
[13] loadbool   2   1   0    ; true
[14] return     2   2      
[15] return     0   1      
; end of function


; function [3] definition (level 3)
; 0 upvalues, 2 params, 6 stacks
.function  0 2 0 6
.local  "func"  ; 0
.local  "tbl"  ; 1
.const  "filterBoth"  ; 0
[1] getglobal  2   0        ; filterBoth
[2] move       3   0      
[3] move       4   1      
[4] loadbool   5   0   0    ; false
[5] tailcall   2   4   0  
[6] return     2   0      
[7] return     0   1      
; end of function


; function [4] definition (level 3)
; 0 upvalues, 2 params, 6 stacks
.function  0 2 0 6
.local  "func"  ; 0
.local  "tbl"  ; 1
.const  "filterBoth"  ; 0
[1] getglobal  2   0        ; filterBoth
[2] move       3   0      
[3] move       4   1      
[4] loadbool   5   1   0    ; true
[5] tailcall   2   4   0  
[6] return     2   0      
[7] return     0   1      
; end of function


; function [5] definition (level 3)
; 0 upvalues, 3 params, 11 stacks
.function  0 3 0 11
.local  "func"  ; 0
.local  "tbl"  ; 1
.local  "rec"  ; 2
.local  "newtbl"  ; 3
.local  "(for generator)"  ; 4
.local  "(for state)"  ; 5
.local  "i"  ; 6
.local  "v"  ; 7
.const  "type"  ; 0
.const  "table"  ; 1
.const  "pairs"  ; 2
.const  "filterRec"  ; 3
[01] getglobal  3   0        ; type
[02] move       4   1      
[03] call       3   2   2  
[04] eq         1   3   251  ; "table", to [6] if false
[05] jmp        1            ; to [7]
[06] return     1   2      
[07] newtable   3   0   0    ; array=0, hash=0
[08] getglobal  4   2        ; pairs
[09] move       5   1      
[10] call       4   2   5  
[11] tforprep   4   13       ; to [25]
[12] test       2   2   0    ; to [14] if true
[13] jmp        5            ; to [19]
[14] getglobal  8   3        ; filterRec
[15] move       9   0      
[16] move       10  7      
[17] call       8   3   2  
[18] move       7   8      
[19] move       8   0      
[20] move       9   7      
[21] call       8   2   2  
[22] test       8   8   0    ; to [24] if true
[23] jmp        1            ; to [25]
[24] settable   3   6   7  
[25] tforloop   4       1    ; to [27] if exit
[26] jmp        -15          ; to [12]
[27] return     3   2      
[28] return     0   1      
; end of function

[01] closure    0   0        ; 0 upvalues
[02] setglobal  0   0        ; ConstTable
[03] getglobal  0   1        ; table
[04] closure    1   1        ; 0 upvalues
[05] settable   0   252 1    ; "reverse"
[06] getglobal  0   3        ; io
[07] closure    1   2        ; 0 upvalues
[08] settable   0   254 1    ; "touch"
[09] closure    0   3        ; 0 upvalues
[10] setglobal  0   5        ; filter
[11] closure    0   4        ; 0 upvalues
[12] setglobal  0   6        ; filterRec
[13] closure    0   5        ; 0 upvalues
[14] setglobal  0   7        ; filterBoth
[15] return     0   1      
; end of function


; function [1] definition (level 2)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
.const  "g_constants"  ; 0
.const  "ConstTable"  ; 1
.const  "uninstExt"  ; 2
.const  ".rguninst"  ; 3
.const  "uninstReg"  ; 4
.const  "Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\"  ; 5
.const  "uninstmsg"  ; 6
.const  1010  ; 7
.const  "basekey"  ; 8
.const  "Software\\"  ; 9
.const  "v1basekey"  ; 10
.const  "Software\\RealNetworks\\RealArcade\\"  ; 11
.const  "v1contextkey"  ; 12
.const  "Software\\RealNetworks\\RealArcade\\CurrentVersion"  ; 13
.const  "mainappkey"  ; 14
.const  "MainApp"  ; 15
.const  "gamesrootkey"  ; 16
.const  "GamesRoot"  ; 17
.const  "versionkey"  ; 18
.const  "ArcadeVersion"  ; 19
.const  "gamecount"  ; 20
.const  "GamesInstalled"  ; 21
.const  "uninst"  ; 22
.const  "RACUninst"  ; 23
.const  "instcount"  ; 24
.const  "ClientInstalls"  ; 25
.const  "clientless"  ; 26
.const  "arcadeinstalled"  ; 27
.const  "tpskey"  ; 28
.const  "Tps"  ; 29
.const  "ractypekey"  ; 30
.const  "RacType"  ; 31
.const  "catverkey"  ; 32
.const  "CatalogVersion"  ; 33
.const  "htmlverkey"  ; 34
.const  "HtmlVersion"  ; 35
.const  "distkey"  ; 36
.const  "DistCode"  ; 37
.const  "instanceMutex"  ; 38
.const  "RACV2InstallerInst"  ; 39
.const  "restoreDir"  ; 40
.const  "{2229EE32-E8FF-4f67-A132-194F07576117}"  ; 41
.const  "HKEY_CLASSES_ROOT"  ; 42
.const  0  ; 43
.const  "HKEY_LOCAL_MACHINE"  ; 44
.const  2  ; 45
.const  "HKEY_CURRENT_USER"  ; 46
.const  1  ; 47
.const  "REG_SZ"  ; 48
.const  "REG_DWORD"  ; 49
.const  4  ; 50
.const  "REG_BINARY"  ; 51
.const  3  ; 52
.const  "REG_MULTI_SZ"  ; 53
.const  7  ; 54
.const  "updateinterval"  ; 55
.const  0.25  ; 56
.const  "stubbysplashseconds"  ; 57
.const  20  ; 58
.const  "g_resources"  ; 59
.const  "unpacking"  ; 60
.const  1027  ; 61
.const  "downloading"  ; 62
.const  1026  ; 63
.const  "installing"  ; 64
.const  1028  ; 65
.const  "upgrading"  ; 66
.const  1029  ; 67
.const  "dwnupgrading"  ; 68
.const  1030  ; 69
.const  "downloadingMultiple"  ; 70
.const  1037  ; 71
.const  "unpackingMultiple"  ; 72
.const  1038  ; 73
.const  "g_exit"  ; 74
.const  "success"  ; 75
.const  "wndClose"  ; 76
.const  "unspecified"  ; 77
.const  "user"  ; 78
.const  "g_rollBack"  ; 79
.const  "g_tmps"  ; 80
.const  "Cleanup"  ; 81
.const  "RollBack"  ; 82
.const  "ClearRollBackTable"  ; 83
.const  "Trace"  ; 84
.const  "OpenDestFile"  ; 85

; function [0] definition (level 3)
; 0 upvalues, 0 params, 6 stacks
.function  0 0 0 6
.local  "racConfig"  ; 0
.local  "racData"  ; 1
.const  "luacom"  ; 0
.const  "CreateObject"  ; 1
.const  "RAComponents.RAConfigureMgr"  ; 2
.const  "RADataStore.RADataSourceMgr"  ; 3
.const  "init"  ; 4
.const  "shutDown"  ; 5
.const  "io"  ; 6
.const  "write"  ; 7
.const  "\n\n"  ; 8
.const  "os"  ; 9
.const  "date"  ; 10
.const  "%c "  ; 11
.const  "End of Cleanup"  ; 12
.const  "close"  ; 13
[01] getglobal  0   0        ; luacom
[02] gettable   0   0   251  ; "CreateObject"
[03] loadk      1   2        ; "RAComponents.RAConfigureMgr"
[04] call       0   2   2  
[05] getglobal  1   0        ; luacom
[06] gettable   1   1   251  ; "CreateObject"
[07] loadk      2   3        ; "RADataStore.RADataSourceMgr"
[08] call       1   2   2  
[09] test       0   0   0    ; to [11] if true
[10] jmp        8            ; to [19]
[11] test       1   1   0    ; to [13] if true
[12] jmp        6            ; to [19]
[13] self       2   1   254  ; "init"
[14] call       2   2   1  
[15] self       2   1   255  ; "shutDown"
[16] call       2   2   1  
[17] self       2   0   255  ; "shutDown"
[18] call       2   2   1  
[19] getglobal  2   6        ; io
[20] gettable   2   2   257  ; "write"
[21] loadk      3   8        ; "\n\n"
[22] getglobal  4   9        ; os
[23] gettable   4   4   260  ; "date"
[24] loadk      5   11       ; "%c "
[25] call       4   2   2  
[26] loadk      5   12       ; "End of Cleanup"
[27] call       2   4   1  
[28] getglobal  2   6        ; io
[29] gettable   2   2   263  ; "close"
[30] call       2   1   1  
[31] return     0   1      
; end of function


; function [1] definition (level 3)
; 0 upvalues, 0 params, 7 stacks
.function  0 0 0 7
.local  "t"  ; 0
.local  "(for generator)"  ; 1
.local  "(for state)"  ; 2
.local  "uninst"  ; 3
.const  "table"  ; 0
.const  "reverse"  ; 1
.const  "g_rollBack"  ; 2
[01] getglobal  0   0        ; table
[02] gettable   0   0   251  ; "reverse"
[03] getglobal  1   2        ; g_rollBack
[04] call       0   2   2  
[05] move       1   0      
[06] loadnil    2   3      
[07] tforprep   1   2        ; to [10]
[08] gettable   4   0   3  
[09] call       4   1   1  
[10] tforloop   1       0    ; to [12] if exit
[11] jmp        -4           ; to [8]
[12] return     0   1      
; end of function


; function [2] definition (level 3)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
.const  "g_rollBack"  ; 0
.const  "ConstTable"  ; 1
[1] getglobal  0   1        ; ConstTable
[2] call       0   1   2  
[3] setglobal  0   0        ; g_rollBack
[4] return     0   1      
; end of function


; function [3] definition (level 3)
; 0 upvalues, 2 params, 8 stacks
.function  0 2 0 8
.local  "event"  ; 0
.local  "line"  ; 1
.local  "inf"  ; 2
.const  "debug"  ; 0
.const  "getinfo"  ; 1
.const  2  ; 2
.const  "io"  ; 3
.const  "write"  ; 4
.const  "\n"  ; 5
.const  "short_src"  ; 6
.const  ":"  ; 7
[01] getglobal  2   0        ; debug
[02] gettable   2   2   251  ; "getinfo"
[03] loadk      3   2        ; 2
[04] call       2   2   2  
[05] getglobal  3   3        ; io
[06] gettable   3   3   254  ; "write"
[07] loadk      4   5        ; "\n"
[08] gettable   5   2   256  ; "short_src"
[09] loadk      6   7        ; ":"
[10] move       7   1      
[11] concat     4   4   7  
[12] call       3   2   1  
[13] return     0   1      
; end of function


; function [4] definition (level 3)
; 0 upvalues, 1 params, 12 stacks
.function  0 1 0 12
.local  "dest"  ; 0
.local  "file"  ; 1
.local  "err"  ; 2
.local  "b"  ; 3
.local  "e"  ; 4
.const  "io"  ; 0
.const  "openW"  ; 1
.const  "wb"  ; 2
.const  "string"  ; 3
.const  "find"  ; 4
.const  "Permission denied"  ; 5
.const  "write"  ; 6
.const  "\n"  ; 7
.const  "os"  ; 8
.const  "date"  ; 9
.const  "%c "  ; 10
.const  "Unable to open, "  ; 11
.const  " for writing, "  ; 12
.const  "InstallerUI"  ; 13
.const  "RetryCancelDialog"  ; 14
.const  1019  ; 15
.const  "OpenDestFile"  ; 16
.const  "User canceled rather than overwrite "  ; 17
.const  " for writing"  ; 18
.const  "assert"  ; 19
.const  "lesserVer"  ; 20
.const  "badRACInstall"  ; 21
.const  "writeLocal"  ; 22
[01] getglobal  1   0        ; io
[02] gettable   1   1   251  ; "openW"
[03] move       2   0      
[04] loadk      3   2        ; "wb"
[05] call       1   3   3  
[06] test       1   1   1    ; to [8] if false
[07] jmp        62           ; to [70]
[08] getglobal  3   3        ; string
[09] gettable   3   3   254  ; "find"
[10] move       4   2      
[11] loadk      5   5        ; "Permission denied"
[12] call       3   3   3  
[13] getglobal  5   0        ; io
[14] gettable   5   5   256  ; "write"
[15] loadk      6   7        ; "\n"
[16] getglobal  7   8        ; os
[17] gettable   7   7   259  ; "date"
[18] loadk      8   10       ; "%c "
[19] call       7   2   2  
[20] loadk      8   11       ; "Unable to open, "
[21] move       9   0      
[22] loadk      10  12       ; " for writing, "
[23] move       11  2      
[24] call       5   7   1  
[25] test       3   3   0    ; to [27] if true
[26] jmp        39           ; to [66]
[27] getglobal  5   13       ; InstallerUI
[28] call       5   1   2  
[29] gettable   5   5   264  ; "RetryCancelDialog"
[30] test       5   5   0    ; to [32] if true
[31] jmp        29           ; to [61]
[32] getglobal  5   13       ; InstallerUI
[33] call       5   1   2  
[34] gettable   5   5   264  ; "RetryCancelDialog"
[35] loadk      6   15       ; 1019
[36] call       5   2   2  
[37] test       5   5   0    ; to [39] if true
[38] jmp        5            ; to [44]
[39] getglobal  5   16       ; OpenDestFile
[40] move       6   0      
[41] tailcall   5   2   0  
[42] return     5   0      
[43] jmp        26           ; to [70]
[44] getglobal  5   0        ; io
[45] gettable   5   5   256  ; "write"
[46] loadk      6   7        ; "\n"
[47] getglobal  7   8        ; os
[48] gettable   7   7   259  ; "date"
[49] loadk      8   10       ; "%c "
[50] call       7   2   2  
[51] loadk      8   17       ; "User canceled rather than overwrite "
[52] move       9   0      
[53] loadk      10  18       ; " for writing"
[54] concat     8   8   10 
[55] call       5   4   1  
[56] getglobal  5   19       ; assert
[57] loadbool   6   0   0    ; false
[58] loadk      7   20       ; "lesserVer"
[59] call       5   3   1  
[60] jmp        9            ; to [70]
[61] getglobal  5   19       ; assert
[62] loadbool   6   0   0    ; false
[63] loadk      7   21       ; "badRACInstall"
[64] call       5   3   1  
[65] jmp        4            ; to [70]
[66] getglobal  5   19       ; assert
[67] loadbool   6   0   0    ; false
[68] loadk      7   22       ; "writeLocal"
[69] call       5   3   1  
[70] return     1   2      
[71] return     0   1      
; end of function

[001] getglobal  0   1        ; ConstTable
[002] call       0   1   2  
[003] setglobal  0   0        ; g_constants
[004] getglobal  0   0        ; g_constants
[005] settable   0   252 253  ; "uninstExt" ".rguninst"
[006] getglobal  0   0        ; g_constants
[007] settable   0   254 255  ; "uninstReg" "Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\"
[008] getglobal  0   0        ; g_constants
[009] settable   0   256 257  ; "uninstmsg" 1010
[010] getglobal  0   0        ; g_constants
[011] settable   0   258 259  ; "basekey" "Software\\"
[012] getglobal  0   0        ; g_constants
[013] settable   0   260 261  ; "v1basekey" "Software\\RealNetworks\\RealArcade\\"
[014] getglobal  0   0        ; g_constants
[015] settable   0   262 263  ; "v1contextkey" "Software\\RealNetworks\\RealArcade\\CurrentVersion"
[016] getglobal  0   0        ; g_constants
[017] settable   0   264 265  ; "mainappkey" "MainApp"
[018] getglobal  0   0        ; g_constants
[019] settable   0   266 267  ; "gamesrootkey" "GamesRoot"
[020] getglobal  0   0        ; g_constants
[021] settable   0   268 269  ; "versionkey" "ArcadeVersion"
[022] getglobal  0   0        ; g_constants
[023] settable   0   270 271  ; "gamecount" "GamesInstalled"
[024] getglobal  0   0        ; g_constants
[025] settable   0   272 273  ; "uninst" "RACUninst"
[026] getglobal  0   0        ; g_constants
[027] settable   0   274 275  ; "instcount" "ClientInstalls"
[028] getglobal  0   0        ; g_constants
[029] settable   0   276 276  ; "clientless" "clientless"
[030] getglobal  0   0        ; g_constants
[031] settable   0   277 277  ; "arcadeinstalled" "arcadeinstalled"
[032] getglobal  0   0        ; g_constants
[033] settable   0   278 279  ; "tpskey" "Tps"
[034] getglobal  0   0        ; g_constants
[035] settable   0   280 281  ; "ractypekey" "RacType"
[036] getglobal  0   0        ; g_constants
[037] settable   0   282 283  ; "catverkey" "CatalogVersion"
[038] getglobal  0   0        ; g_constants
[039] settable   0   284 285  ; "htmlverkey" "HtmlVersion"
[040] getglobal  0   0        ; g_constants
[041] settable   0   286 287  ; "distkey" "DistCode"
[042] getglobal  0   0        ; g_constants
[043] settable   0   288 289  ; "instanceMutex" "RACV2InstallerInst"
[044] getglobal  0   0        ; g_constants
[045] settable   0   290 291  ; "restoreDir" "{2229EE32-E8FF-4f67-A132-194F07576117}"
[046] getglobal  0   0        ; g_constants
[047] settable   0   292 293  ; "HKEY_CLASSES_ROOT" 0
[048] getglobal  0   0        ; g_constants
[049] settable   0   294 295  ; "HKEY_LOCAL_MACHINE" 2
[050] getglobal  0   0        ; g_constants
[051] settable   0   296 297  ; "HKEY_CURRENT_USER" 1
[052] getglobal  0   0        ; g_constants
[053] settable   0   298 297  ; "REG_SZ" 1
[054] getglobal  0   0        ; g_constants
[055] settable   0   299 300  ; "REG_DWORD" 4
[056] getglobal  0   0        ; g_constants
[057] settable   0   301 302  ; "REG_BINARY" 3
[058] getglobal  0   0        ; g_constants
[059] settable   0   303 304  ; "REG_MULTI_SZ" 7
[060] getglobal  0   0        ; g_constants
[061] settable   0   305 306  ; "updateinterval" 0.25
[062] getglobal  0   0        ; g_constants
[063] settable   0   307 308  ; "stubbysplashseconds" 20
[064] getglobal  0   1        ; ConstTable
[065] call       0   1   2  
[066] setglobal  0   59       ; g_resources
[067] getglobal  0   59       ; g_resources
[068] settable   0   310 311  ; "unpacking" 1027
[069] getglobal  0   59       ; g_resources
[070] settable   0   312 313  ; "downloading" 1026
[071] getglobal  0   59       ; g_resources
[072] settable   0   314 315  ; "installing" 1028
[073] getglobal  0   59       ; g_resources
[074] settable   0   316 317  ; "upgrading" 1029
[075] getglobal  0   59       ; g_resources
[076] settable   0   318 319  ; "dwnupgrading" 1030
[077] getglobal  0   59       ; g_resources
[078] settable   0   320 321  ; "downloadingMultiple" 1037
[079] getglobal  0   59       ; g_resources
[080] settable   0   322 323  ; "unpackingMultiple" 1038
[081] getglobal  0   1        ; ConstTable
[082] call       0   1   2  
[083] setglobal  0   74       ; g_exit
[084] getglobal  0   74       ; g_exit
[085] settable   0   325 293  ; "success" 0
[086] getglobal  0   74       ; g_exit
[087] settable   0   326 302  ; "wndClose" 3
[088] getglobal  0   74       ; g_exit
[089] settable   0   327 297  ; "unspecified" 1
[090] getglobal  0   74       ; g_exit
[091] settable   0   328 295  ; "user" 2
[092] getglobal  0   1        ; ConstTable
[093] call       0   1   2  
[094] setglobal  0   79       ; g_rollBack
[095] getglobal  0   1        ; ConstTable
[096] call       0   1   2  
[097] setglobal  0   80       ; g_tmps
[098] closure    0   0        ; 0 upvalues
[099] setglobal  0   81       ; Cleanup
[100] closure    0   1        ; 0 upvalues
[101] setglobal  0   82       ; RollBack
[102] closure    0   2        ; 0 upvalues
[103] setglobal  0   83       ; ClearRollBackTable
[104] closure    0   3        ; 0 upvalues
[105] setglobal  0   84       ; Trace
[106] closure    0   4        ; 0 upvalues
[107] setglobal  0   85       ; OpenDestFile
[108] return     0   1      
; end of function


; function [2] definition (level 2)
; 0 upvalues, 0 params, 9 stacks
.function  0 0 0 9
.local  "shellCtl"  ; 0
.local  "filesys"  ; 1
.local  "regAccess"  ; 2
.local  "cookieMnstr"  ; 3
.local  "procMgr"  ; 4
.local  "folderType"  ; 5
.local  "ui"  ; 6
.const  "luacom"  ; 0
.const  "CreateObject"  ; 1
.const  "StubbyUtil.ShellCtl"  ; 2
.const  "Scripting.FileSystemObject"  ; 3
.const  "StubbyUtil.RegAccess"  ; 4
.const  "StubbyUtil.CookieCtl"  ; 5
.const  "StubbyUtil.ProcessMgr"  ; 6
.const  "ConstTable"  ; 7
.const  "commonStartMenu"  ; 8
.const  22  ; 9
.const  "commonDesktop"  ; 10
.const  25  ; 11
.const  "start"  ; 12
.const  11  ; 13
.const  "desktop"  ; 14
.const  16  ; 15
.const  "programFiles"  ; 16
.const  38  ; 17
.const  "system"  ; 18
.const  37  ; 19
.const  "startPrograms"  ; 20
.const  2  ; 21
.const  "appData"  ; 22
.const  26  ; 23
.const  "favorites"  ; 24
.const  31  ; 25
.const  "userSpecificFavorites"  ; 26
.const  6  ; 27
.const  "windows"  ; 28
.const  36  ; 29
.const  "localAppData"  ; 30
.const  28  ; 31
.const  "OnProgress"  ; 32
.const  "unRarEvents"  ; 33
.const  "Win32Interop"  ; 34

; function [0] definition (level 3)
; 1 upvalues, 1 params, 15 stacks
.function  1 1 0 15
.local  "percent"  ; 0
.local  "unrarMgr"  ; 1
.local  "interval"  ; 2
.local  "howFar"  ; 3
.local  "text"  ; 4
.local  "unpackProgressData"  ; 5
.local  "textData"  ; 6
.upvalue  "ui"  ; 0
.const  "luacom"  ; 0
.const  "CreateObject"  ; 1
.const  "StubbyUtil.UnRar"  ; 2
.const  "assert"  ; 3
.const  "comError"  ; 4
.const  "InstallerUI"  ; 5
.const  "data"  ; 6
.const  "pbarDisplayProgress"  ; 7
.const  "os"  ; 8
.const  "clock"  ; 9
.const  "lastUpdateTime"  ; 10
.const  0  ; 11
.const  "g_constants"  ; 12
.const  "updateinterval"  ; 13
.const  "PercentComplete"  ; 14
.const  "string"  ; 15
.const  "format"  ; 16
.const  "statusText"  ; 17
.const  "currentPayload"  ; 18
.const  "totalPayloads"  ; 19
.const  "pbarPayloadBytes"  ; 20
.const  "pbarPayloadTotalBytes"  ; 21
.const  100  ; 22
.const  "text=%s|progress=%s|currentPackage=%d|downloadedMegs=%.1f"  ; 23
.const  "|granularity=%d|numPackages=%d|totalMegs=%.1f"  ; 24
.const  "tostring"  ; 25
.const  10000  ; 26
.const  1000  ; 27
.const  "mainDlg"  ; 28
.const  "CallJSFunction"  ; 29
.const  "RAINSTALLER.install.UpdateProgressInfo"  ; 30
.const  "\""  ; 31
.const  "main"  ; 32
.const  "g_ogmid"  ; 33
.const  "g_ogmport"  ; 34
.const  "sendProgressToOgm"  ; 35
[001] getglobal  1   0        ; luacom
[002] gettable   1   1   251  ; "CreateObject"
[003] loadk      2   2        ; "StubbyUtil.UnRar"
[004] call       1   2   2  
[005] getglobal  2   3        ; assert
[006] move       3   1      
[007] loadk      4   4        ; "comError"
[008] call       2   3   1  
[009] getupval   2   0        ; ui
[010] test       2   2   1    ; to [12] if false
[011] jmp        3            ; to [15]
[012] getglobal  2   5        ; InstallerUI
[013] call       2   1   2  
[014] setupval   2   0        ; ui
[015] getupval   2   0        ; ui
[016] gettable   2   2   256  ; "data"
[017] gettable   2   2   257  ; "pbarDisplayProgress"
[018] test       2   2   0    ; to [20] if true
[019] jmp        95           ; to [115]
[020] getglobal  2   8        ; os
[021] gettable   2   2   259  ; "clock"
[022] call       2   1   2  
[023] getupval   3   0        ; ui
[024] gettable   3   3   256  ; "data"
[025] gettable   3   3   260  ; "lastUpdateTime"
[026] sub        2   2   3  
[027] lt         1   2   261  ; 0, to [29] if false
[028] jmp        4            ; to [33]
[029] getglobal  3   12       ; g_constants
[030] gettable   3   3   263  ; "updateinterval"
[031] lt         0   3   2    ; to [33] if true
[032] jmp        82           ; to [115]
[033] self       3   1   264  ; "PercentComplete"
[034] call       3   2   2  
[035] getglobal  4   15       ; string
[036] gettable   4   4   266  ; "format"
[037] getupval   5   0        ; ui
[038] gettable   5   5   256  ; "data"
[039] gettable   5   5   267  ; "statusText"
[040] getupval   6   0        ; ui
[041] gettable   6   6   256  ; "data"
[042] gettable   6   6   268  ; "currentPayload"
[043] getupval   7   0        ; ui
[044] gettable   7   7   256  ; "data"
[045] gettable   7   7   269  ; "totalPayloads"
[046] call       4   4   2  
[047] newtable   5   0   0    ; array=0, hash=0
[048] settable   5   270 3    ; "pbarPayloadBytes"
[049] settable   5   271 272  ; "pbarPayloadTotalBytes" 100
[050] settable   5   267 4    ; "statusText"
[051] getupval   6   0        ; ui
[052] gettable   6   6   256  ; "data"
[053] gettable   6   6   268  ; "currentPayload"
[054] settable   5   268 6    ; "currentPayload"
[055] getupval   6   0        ; ui
[056] gettable   6   6   256  ; "data"
[057] gettable   6   6   269  ; "totalPayloads"
[058] settable   5   269 6    ; "totalPayloads"
[059] getglobal  6   15       ; string
[060] gettable   6   6   266  ; "format"
[061] loadk      7   23       ; "text=%s|progress=%s|currentPackage=%d|downloadedMegs=%.1f"
[062] loadk      8   24       ; "|granularity=%d|numPackages=%d|totalMegs=%.1f"
[063] concat     7   7   8  
[064] move       8   4      
[065] getglobal  9   25       ; tostring
[066] move       10  3      
[067] call       9   2   2  
[068] getupval   10  0        ; ui
[069] gettable   10  10  256  ; "data"
[070] gettable   10  10  268  ; "currentPayload"
[071] getglobal  11  25       ; tostring
[072] getupval   12  0        ; ui
[073] gettable   12  12  256  ; "data"
[074] gettable   12  12  271  ; "pbarPayloadTotalBytes"
[075] mul        12  3   12 
[076] div        12  12  276  ; 10000
[077] call       11  2   2  
[078] loadk      12  22       ; 100
[079] getupval   13  0        ; ui
[080] gettable   13  13  256  ; "data"
[081] gettable   13  13  269  ; "totalPayloads"
[082] getupval   14  0        ; ui
[083] gettable   14  14  256  ; "data"
[084] gettable   14  14  271  ; "pbarPayloadTotalBytes"
[085] div        14  14  277  ; 1000
[086] call       6   9   2  
[087] getupval   7   0        ; ui
[088] gettable   7   7   278  ; "mainDlg"
[089] self       7   7   279  ; "CallJSFunction"
[090] loadk      9   30       ; "RAINSTALLER.install.UpdateProgressInfo"
[091] loadk      10  31       ; "\""
[092] move       11  6      
[093] loadk      12  31       ; "\""
[094] concat     10  10  12 
[095] loadk      11  32       ; "main"
[096] call       7   5   1  
[097] getglobal  7   33       ; g_ogmid
[098] test       7   7   0    ; to [100] if true
[099] jmp        9            ; to [109]
[100] getglobal  7   34       ; g_ogmport
[101] test       7   7   0    ; to [103] if true
[102] jmp        6            ; to [109]
[103] getupval   7   0        ; ui
[104] gettable   7   7   285  ; "sendProgressToOgm"
[105] getglobal  8   33       ; g_ogmid
[106] getglobal  9   34       ; g_ogmport
[107] move       10  5      
[108] call       7   4   1  
[109] getupval   7   0        ; ui
[110] gettable   7   7   256  ; "data"
[111] getglobal  8   8        ; os
[112] gettable   8   8   259  ; "clock"
[113] call       8   1   2  
[114] settable   7   260 8    ; "lastUpdateTime"
[115] return     0   1      
; end of function


; function [1] definition (level 3)
; 6 upvalues, 0 params, 7 stacks
.function  6 0 0 7
.local  "methods"  ; 0
.local  "filenameExp"  ; 1
.local  "driveExp"  ; 2
.upvalue  "folderType"  ; 0
.upvalue  "shellCtl"  ; 1
.upvalue  "filesys"  ; 2
.upvalue  "regAccess"  ; 3
.upvalue  "cookieMnstr"  ; 4
.upvalue  "procMgr"  ; 5
.const  "ConstTable"  ; 0
.const  "[^:^\\^/^%*^%?^\"^<^>^|]+"  ; 1
.const  "%a?:?\\?"  ; 2
.const  "folderType"  ; 3
.const  "filenameExp"  ; 4
.const  "driveExp"  ; 5
.const  "assert"  ; 6
.const  "comError"  ; 7
.const  "dumpPath"  ; 8
.const  "widenTo16"  ; 9
.const  "ToUtf8"  ; 10
.const  "OpenBaseKey"  ; 11
.const  "CreateRegKey"  ; 12
.const  "GetRegKeyValue"  ; 13
.const  "GetRegKeyDWORDValue"  ; 14
.const  "RegQueryMultLineValue"  ; 15
.const  "GetChildKeys"  ; 16
.const  "RegDeleteTree"  ; 17
.const  "DeleteRegKey"  ; 18
.const  "CreatePath"  ; 19
.const  "FolderIsEmpty"  ; 20
.const  "StripFilename"  ; 21
.const  "FolderExists"  ; 22
.const  "FileExists"  ; 23
.const  "GetProxy"  ; 24
.const  "DeleteFile"  ; 25
.const  "ProcessInfo"  ; 26
.const  "OSVersion"  ; 27
.const  "COMRegPath"  ; 28
.const  "WorkingDir"  ; 29
.const  "SpecialFolder"  ; 30
.const  "FileSize"  ; 31
.const  "LocalCopy"  ; 32
.const  "GetFolderItems"  ; 33
.const  "GetSubFolders"  ; 34
.const  "ClearReadOnlyAttribute"  ; 35
.const  "MakePathFilesWriteable"  ; 36
.const  "IsPathWriteable"  ; 37
.const  "DiskSpace"  ; 38
.const  "SufficientDriveSpace"  ; 39
.const  "FindInstallDrive"  ; 40
.const  "CreateShortcut"  ; 41
.const  "SafeDeleteFileElement"  ; 42
.const  "ParentPath"  ; 43
.const  "DeleteEmptyFolders"  ; 44
.const  "DeleteShortcut"  ; 45
.const  "RegisterInstallerType"  ; 46
.const  "unpack"  ; 47
.const  "LaunchProcess"  ; 48
.const  "Mutex"  ; 49
.const  "getMachineID"  ; 50
.const  "GetPid"  ; 51
.const  "LogMessage"  ; 52
.const  "IEVersion"  ; 53
.const  "IsChromePresent"  ; 54
.const  "ChromeVersion"  ; 55
.const  "FireFoxVersion"  ; 56
.const  "Event"  ; 57
.const  "GetCookieItem"  ; 58
.const  "RefreshAddRemovePrograms"  ; 59
.const  "ArchitectureInfo"  ; 60
.const  "GetDefaultBrowserName"  ; 61
.const  "BrowserInfo"  ; 62
.const  "GetAvailableDrive"  ; 63
.const  "GetAllUsersFolder"  ; 64
.const  "GetLicenseRoot"  ; 65
.const  "UpdateDip"  ; 66
.const  "drivePath"  ; 67
.const  "isDriveValid"  ; 68
.const  "ChooseValidPath"  ; 69
.const  "io"  ; 70
.const  "write"  ; 71
.const  "\n"  ; 72
.const  "os"  ; 73
.const  "date"  ; 74
.const  "%c "  ; 75
.const  "Creating instance of Win32Interop"  ; 76

; function [0] definition (level 4)
; 0 upvalues, 1 params, 8 stacks
.function  0 1 0 8
.local  "path"  ; 0
.local  "i"  ; 1
.local  "(for limit)"  ; 2
.local  "(for step)"  ; 3
.local  "c"  ; 4
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  1  ; 3
.const  "string"  ; 4
.const  "len"  ; 5
.const  "tonumber"  ; 6
.const  "byte"  ; 7
.const  " "  ; 8
[01] getglobal  1   0        ; io
[02] gettable   1   1   251  ; "write"
[03] loadk      2   2        ; "\n"
[04] call       1   2   1  
[05] loadk      1   3        ; 1
[06] getglobal  2   4        ; string
[07] gettable   2   2   255  ; "len"
[08] move       3   0      
[09] call       2   2   2  
[10] loadk      3   3        ; 1
[11] sub        1   1   3  
[12] jmp        12           ; to [25]
[13] getglobal  4   6        ; tonumber
[14] getglobal  5   4        ; string
[15] gettable   5   5   257  ; "byte"
[16] move       6   0      
[17] move       7   1      
[18] call       5   3   0  
[19] call       4   0   2  
[20] getglobal  5   0        ; io
[21] gettable   5   5   251  ; "write"
[22] loadk      6   8        ; " "
[23] move       7   4      
[24] call       5   3   1  
[25] forloop    1   -13      ; to [13] if loop
[26] getglobal  1   0        ; io
[27] gettable   1   1   251  ; "write"
[28] loadk      2   2        ; "\n"
[29] call       1   2   1  
[30] return     0   1      
; end of function


; function [1] definition (level 4)
; 0 upvalues, 1 params, 10 stacks
.function  0 1 0 10
.local  "str"  ; 0
.local  "w"  ; 1
.local  "i"  ; 2
.local  "(for limit)"  ; 3
.local  "(for step)"  ; 4
.local  "c"  ; 5
.const  ""  ; 0
.const  1  ; 1
.const  "string"  ; 2
.const  "len"  ; 3
.const  "byte"  ; 4
.const  "tostring"  ; 5
.const  "char"  ; 6
.const  "\0"  ; 7
[01] loadk      1   0        ; ""
[02] loadk      2   1        ; 1
[03] getglobal  3   2        ; string
[04] gettable   3   3   253  ; "len"
[05] move       4   0      
[06] call       3   2   2  
[07] loadk      4   1        ; 1
[08] sub        2   2   4  
[09] jmp        26           ; to [36]
[10] getglobal  5   2        ; string
[11] gettable   5   5   254  ; "byte"
[12] move       6   0      
[13] move       7   2      
[14] call       5   3   2  
[15] test       1   1   0    ; to [17] if true
[16] jmp        9            ; to [26]
[17] move       6   1      
[18] getglobal  7   5        ; tostring
[19] getglobal  8   2        ; string
[20] gettable   8   8   256  ; "char"
[21] move       9   5      
[22] call       8   2   0  
[23] call       7   0   2  
[24] concat     1   6   7  
[25] jmp        7            ; to [33]
[26] getglobal  6   5        ; tostring
[27] getglobal  7   2        ; string
[28] gettable   7   7   256  ; "char"
[29] move       8   5      
[30] call       7   2   0  
[31] call       6   0   2  
[32] move       1   6      
[33] move       6   1      
[34] loadk      7   7        ; "\0"
[35] concat     1   6   7  
[36] forloop    2   -27      ; to [10] if loop
[37] return     1   2      
[38] return     0   1      
; end of function


; function [2] definition (level 4)
; 1 upvalues, 1 params, 5 stacks
.function  1 1 0 5
.local  "path"  ; 0
.upvalue  "methods"  ; 0
.const  "mainDlg"  ; 0
.const  "luacom"  ; 1
.const  "CreateObject"  ; 2
.const  "InstallerDlg.InstallDlgCtl"  ; 3
.const  "Utf32beToUtf8"  ; 4
.const  "widenTo16"  ; 5
[01] getglobal  1   1        ; luacom
[02] gettable   1   1   252  ; "CreateObject"
[03] loadk      2   3        ; "InstallerDlg.InstallDlgCtl"
[04] call       1   2   2  
[05] setglobal  1   0        ; mainDlg
[06] getglobal  1   0        ; mainDlg
[07] self       1   1   254  ; "Utf32beToUtf8"
[08] getupval   3   0        ; methods
[09] gettable   3   3   255  ; "widenTo16"
[10] move       4   0      
[11] call       3   2   0  
[12] tailcall   1   0   0  
[13] return     1   0      
[14] return     0   1      
; end of function


; function [3] definition (level 4)
; 1 upvalues, 2 params, 6 stacks
.function  1 2 0 6
.local  "base"  ; 0
.local  "key"  ; 1
.upvalue  "regAccess"  ; 0
.const  "assert"  ; 0
.const  "HKEY_CLASSES_ROOT"  ; 1
.const  "HKEY_LOCAL_MACHINE"  ; 2
.const  "HKEY_CURRENT_USER"  ; 3
.const  "barArgs"  ; 4
.const  "OpenKey"  ; 5
.const  "g_constants"  ; 6
[01] getglobal  2   0        ; assert
[02] eq         1   0   251  ; "HKEY_CLASSES_ROOT", to [4] if false
[03] jmp        5            ; to [9]
[04] eq         1   0   252  ; "HKEY_LOCAL_MACHINE", to [6] if false
[05] jmp        3            ; to [9]
[06] eq         1   0   253  ; "HKEY_CURRENT_USER", to [8] if false
[07] jmp        1            ; to [9]
[08] loadbool   3   0   1    ; false, to [10]
[09] loadbool   3   1   0    ; true
[10] loadk      4   4        ; "barArgs"
[11] call       2   3   1  
[12] getupval   2   0        ; regAccess
[13] self       2   2   255  ; "OpenKey"
[14] getglobal  4   6        ; g_constants
[15] gettable   4   4   0  
[16] move       5   1      
[17] tailcall   2   4   0  
[18] return     2   0      
[19] return     0   1      
; end of function


; function [4] definition (level 4)
; 2 upvalues, 5 params, 18 stacks
.function  2 5 0 18
.local  "base"  ; 0
.local  "key"  ; 1
.local  "name"  ; 2
.local  "val"  ; 3
.local  "type"  ; 4
.local  "(for generator)"  ; 5
.local  "(for state)"  ; 6
.local  "i"  ; 7
.local  "v"  ; 8
.upvalue  "methods"  ; 0
.upvalue  "regAccess"  ; 1
.const  "assert"  ; 0
.const  "badArgs"  ; 1
.const  "OpenBaseKey"  ; 2
.const  "REG_MULTI_SZ"  ; 3
.const  "io"  ; 4
.const  "write"  ; 5
.const  "\n"  ; 6
.const  "os"  ; 7
.const  "date"  ; 8
.const  "%c "  ; 9
.const  "CreateMLSubKey "  ; 10
.const  "tostring"  ; 11
.const  " RegKey: "  ; 12
.const  "\\"  ; 13
.const  "pairs"  ; 14
.const  "g_constants"  ; 15
.const  "CreateMLSubKey"  ; 16
.const  ""  ; 17
.const  "Creating "  ; 18
.const  " = "  ; 19
.const  "DWORD"  ; 20
.const  "REG_DWORD"  ; 21
.const  "BINARY"  ; 22
.const  "REG_BINARY"  ; 23
.const  "REG_SZ"  ; 24
.const  "CreateSubKey"  ; 25
[001] getglobal  5   0        ; assert
[002] test       6   1   0    ; to [4] if true
[003] jmp        1            ; to [5]
[004] move       6   3      
[005] loadk      7   1        ; "badArgs"
[006] call       5   3   1  
[007] getupval   5   0        ; methods
[008] gettable   5   5   252  ; "OpenBaseKey"
[009] move       6   0      
[010] call       5   2   1  
[011] eq         0   4   253  ; "REG_MULTI_SZ", to [13] if true
[012] jmp        49           ; to [62]
[013] getglobal  5   4        ; io
[014] gettable   5   5   255  ; "write"
[015] loadk      6   6        ; "\n"
[016] getglobal  7   7        ; os
[017] gettable   7   7   258  ; "date"
[018] loadk      8   9        ; "%c "
[019] call       7   2   2  
[020] loadk      8   10       ; "CreateMLSubKey "
[021] getglobal  9   11       ; tostring
[022] move       10  4      
[023] call       9   2   2  
[024] loadk      10  12       ; " RegKey: "
[025] move       11  0      
[026] loadk      12  13       ; "\\"
[027] move       13  1      
[028] loadk      14  13       ; "\\"
[029] move       15  2      
[030] call       5   11  1  
[031] getglobal  5   14       ; pairs
[032] move       6   3      
[033] call       5   2   5  
[034] tforprep   5   13       ; to [48]
[035] getglobal  9   4        ; io
[036] gettable   9   9   255  ; "write"
[037] loadk      10  6        ; "\n"
[038] getglobal  11  7        ; os
[039] gettable   11  11  258  ; "date"
[040] loadk      12  9        ; "%c "
[041] call       11  2   2  
[042] loadk      12  10       ; "CreateMLSubKey "
[043] getglobal  13  11       ; tostring
[044] move       14  8      
[045] call       13  2   2  
[046] concat     12  12  13 
[047] call       9   4   1  
[048] tforloop   5       1    ; to [50] if exit
[049] jmp        -15          ; to [35]
[050] getglobal  5   15       ; g_constants
[051] gettable   4   5   253  ; "REG_MULTI_SZ"
[052] getupval   5   1        ; regAccess
[053] self       5   5   266  ; "CreateMLSubKey"
[054] move       7   1      
[055] test       8   2   1    ; to [57] if false
[056] jmp        1            ; to [58]
[057] loadk      8   17       ; ""
[058] move       9   3      
[059] move       10  4      
[060] call       5   6   1  
[061] jmp        41           ; to [103]
[062] getglobal  5   4        ; io
[063] gettable   5   5   255  ; "write"
[064] loadk      6   6        ; "\n"
[065] getglobal  7   7        ; os
[066] gettable   7   7   258  ; "date"
[067] loadk      8   9        ; "%c "
[068] call       7   2   2  
[069] loadk      8   18       ; "Creating "
[070] getglobal  9   11       ; tostring
[071] move       10  4      
[072] call       9   2   2  
[073] loadk      10  12       ; " RegKey: "
[074] move       11  0      
[075] loadk      12  13       ; "\\"
[076] move       13  1      
[077] loadk      14  13       ; "\\"
[078] move       15  2      
[079] loadk      16  19       ; " = "
[080] move       17  3      
[081] call       5   13  1  
[082] eq         0   4   270  ; "DWORD", to [84] if true
[083] jmp        3            ; to [87]
[084] getglobal  5   15       ; g_constants
[085] gettable   4   5   271  ; "REG_DWORD"
[086] jmp        7            ; to [94]
[087] eq         0   4   272  ; "BINARY", to [89] if true
[088] jmp        3            ; to [92]
[089] getglobal  5   15       ; g_constants
[090] gettable   4   5   273  ; "REG_BINARY"
[091] jmp        2            ; to [94]
[092] getglobal  5   15       ; g_constants
[093] gettable   4   5   274  ; "REG_SZ"
[094] getupval   5   1        ; regAccess
[095] self       5   5   275  ; "CreateSubKey"
[096] move       7   1      
[097] test       8   2   1    ; to [99] if false
[098] jmp        1            ; to [100]
[099] loadk      8   17       ; ""
[100] move       9   3      
[101] move       10  4      
[102] call       5   6   1  
[103] return     0   1      
; end of function


; function [5] definition (level 4)
; 0 upvalues, 3 params, 13 stacks
.function  0 3 0 13
.local  "base"  ; 0
.local  "key"  ; 1
.local  "name"  ; 2
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "GetRegKeyValue hive = "  ; 6
.const  "tostring"  ; 7
.const  ", path = "  ; 8
.const  ", key = "  ; 9
.const  "assert"  ; 10
.const  "badArgs"  ; 11
.const  "GetRegistryPath"  ; 12
[01] getglobal  3   0        ; io
[02] gettable   3   3   251  ; "write"
[03] loadk      4   2        ; "\n"
[04] getglobal  5   3        ; os
[05] gettable   5   5   254  ; "date"
[06] loadk      6   5        ; "%c "
[07] call       5   2   2  
[08] loadk      6   6        ; "GetRegKeyValue hive = "
[09] getglobal  7   7        ; tostring
[10] move       8   0      
[11] call       7   2   2  
[12] loadk      8   8        ; ", path = "
[13] getglobal  9   7        ; tostring
[14] move       10  1      
[15] call       9   2   2  
[16] loadk      10  9        ; ", key = "
[17] getglobal  11  7        ; tostring
[18] move       12  2      
[19] call       11  2   2  
[20] concat     6   6   11 
[21] call       3   4   1  
[22] getglobal  3   10       ; assert
[23] move       4   1      
[24] loadk      5   11       ; "badArgs"
[25] call       3   3   1  
[26] getglobal  3   12       ; GetRegistryPath
[27] move       4   0      
[28] move       5   1      
[29] move       6   2      
[30] tailcall   3   4   0  
[31] return     3   0      
[32] return     0   1      
; end of function


; function [6] definition (level 4)
; 2 upvalues, 3 params, 14 stacks
.function  2 3 0 14
.local  "base"  ; 0
.local  "key"  ; 1
.local  "name"  ; 2
.local  "value"  ; 3
.upvalue  "regAccess"  ; 0
.upvalue  "methods"  ; 1
.const  0  ; 0
.const  "assert"  ; 1
.const  "badArgs"  ; 2
.const  "io"  ; 3
.const  "write"  ; 4
.const  "\n"  ; 5
.const  "os"  ; 6
.const  "date"  ; 7
.const  "%c "  ; 8
.const  "GetRegKeyDWORDValue hive = "  ; 9
.const  "tostring"  ; 10
.const  ", path = "  ; 11
.const  ", key = "  ; 12
.const  "QueryDWORDValue"  ; 13
.const  "OpenBaseKey"  ; 14
.const  ""  ; 15
.const  "QueryDWORDValue is nil"  ; 16
[01] loadk      3   0        ; 0
[02] getglobal  4   1        ; assert
[03] move       5   1      
[04] loadk      6   2        ; "badArgs"
[05] call       4   3   1  
[06] getglobal  4   3        ; io
[07] gettable   4   4   254  ; "write"
[08] loadk      5   5        ; "\n"
[09] getglobal  6   6        ; os
[10] gettable   6   6   257  ; "date"
[11] loadk      7   8        ; "%c "
[12] call       6   2   2  
[13] loadk      7   9        ; "GetRegKeyDWORDValue hive = "
[14] getglobal  8   10       ; tostring
[15] move       9   0      
[16] call       8   2   2  
[17] loadk      9   11       ; ", path = "
[18] getglobal  10  10       ; tostring
[19] move       11  1      
[20] call       10  2   2  
[21] loadk      11  12       ; ", key = "
[22] getglobal  12  10       ; tostring
[23] move       13  2      
[24] call       12  2   2  
[25] concat     7   7   12 
[26] call       4   4   1  
[27] getupval   4   0        ; regAccess
[28] gettable   4   4   263  ; "QueryDWORDValue"
[29] test       4   4   0    ; to [31] if true
[30] jmp        15           ; to [46]
[31] getupval   4   1        ; methods
[32] gettable   4   4   264  ; "OpenBaseKey"
[33] move       5   0      
[34] move       6   1      
[35] call       4   3   2  
[36] test       4   4   0    ; to [38] if true
[37] jmp        17           ; to [55]
[38] getupval   4   0        ; regAccess
[39] self       4   4   263  ; "QueryDWORDValue"
[40] test       6   2   1    ; to [42] if false
[41] jmp        1            ; to [43]
[42] loadk      6   15       ; ""
[43] call       4   3   2  
[44] move       3   4      
[45] jmp        9            ; to [55]
[46] getglobal  4   3        ; io
[47] gettable   4   4   254  ; "write"
[48] loadk      5   5        ; "\n"
[49] getglobal  6   6        ; os
[50] gettable   6   6   257  ; "date"
[51] loadk      7   8        ; "%c "
[52] call       6   2   2  
[53] loadk      7   16       ; "QueryDWORDValue is nil"
[54] call       4   4   1  
[55] return     3   2      
[56] return     0   1      
; end of function


; function [7] definition (level 4)
; 2 upvalues, 3 params, 13 stacks
.function  2 3 0 13
.local  "root"  ; 0
.local  "key"  ; 1
.local  "name"  ; 2
.local  "multiLineString"  ; 3
.upvalue  "regAccess"  ; 0
.upvalue  "methods"  ; 1
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "RegQueryMultLineValue root = "  ; 6
.const  "tostring"  ; 7
.const  ", key = "  ; 8
.const  ", name = "  ; 9
.const  "assert"  ; 10
.const  "badArgs"  ; 11
.const  "QueryValue"  ; 12
.const  "OpenBaseKey"  ; 13
.const  ""  ; 14
.const  "table"  ; 15
.const  "type"  ; 16
.const  "\nRegQueryValue returned a "  ; 17
[01] getglobal  3   0        ; io
[02] gettable   3   3   251  ; "write"
[03] loadk      4   2        ; "\n"
[04] getglobal  5   3        ; os
[05] gettable   5   5   254  ; "date"
[06] loadk      6   5        ; "%c "
[07] call       5   2   2  
[08] loadk      6   6        ; "RegQueryMultLineValue root = "
[09] getglobal  7   7        ; tostring
[10] move       8   0      
[11] call       7   2   2  
[12] loadk      8   8        ; ", key = "
[13] getglobal  9   7        ; tostring
[14] move       10  1      
[15] call       9   2   2  
[16] loadk      10  9        ; ", name = "
[17] getglobal  11  7        ; tostring
[18] move       12  2      
[19] call       11  2   2  
[20] concat     6   6   11 
[21] call       3   4   1  
[22] getglobal  3   10       ; assert
[23] move       4   1      
[24] loadk      5   11       ; "badArgs"
[25] call       3   3   1  
[26] loadnil    3   3      
[27] getupval   4   0        ; regAccess
[28] gettable   4   4   262  ; "QueryValue"
[29] test       4   4   0    ; to [31] if true
[30] jmp        26           ; to [57]
[31] getupval   4   1        ; methods
[32] gettable   4   4   263  ; "OpenBaseKey"
[33] move       5   0      
[34] move       6   1      
[35] call       4   3   2  
[36] test       4   4   0    ; to [38] if true
[37] jmp        19           ; to [57]
[38] getupval   4   0        ; regAccess
[39] self       4   4   262  ; "QueryValue"
[40] test       6   2   1    ; to [42] if false
[41] jmp        1            ; to [43]
[42] loadk      6   14       ; ""
[43] call       4   3   2  
[44] move       3   4      
[45] getglobal  4   16       ; type
[46] move       5   3      
[47] call       4   2   2  
[48] eq         1   265 4    ; "table", to [50] if false
[49] jmp        7            ; to [57]
[50] getglobal  4   0        ; io
[51] gettable   4   4   251  ; "write"
[52] loadk      5   17       ; "\nRegQueryValue returned a "
[53] getglobal  6   16       ; type
[54] move       7   3      
[55] call       6   2   0  
[56] call       4   0   1  
[57] return     3   2      
[58] return     0   1      
; end of function


; function [8] definition (level 4)
; 2 upvalues, 2 params, 8 stacks
.function  2 2 0 8
.local  "base"  ; 0
.local  "key"  ; 1
.local  "children"  ; 2
.local  "indx"  ; 3
.local  "node"  ; 4
.upvalue  "methods"  ; 0
.upvalue  "regAccess"  ; 1
.const  0  ; 0
.const  "OpenBaseKey"  ; 1
.const  "GetSubKey"  ; 2
.const  nil  ; 3
.const  ""  ; 4
.const  "table"  ; 5
.const  "insert"  ; 6
.const  1  ; 7
[01] newtable   2   0   0    ; array=0, hash=0
[02] loadk      3   0        ; 0
[03] getupval   4   0        ; methods
[04] gettable   4   4   251  ; "OpenBaseKey"
[05] move       5   0      
[06] move       6   1      
[07] call       4   3   1  
[08] jmp        16           ; to [25]
[09] getupval   4   1        ; regAccess
[10] self       4   4   252  ; "GetSubKey"
[11] move       6   3      
[12] call       4   3   2  
[13] eq         1   4   253  ; nil, to [15] if false
[14] jmp        11           ; to [26]
[15] eq         0   4   254  ; "", to [17] if true
[16] jmp        2            ; to [19]
[17] jmp        8            ; to [26]
[18] jmp        5            ; to [24]
[19] getglobal  5   5        ; table
[20] gettable   5   5   256  ; "insert"
[21] move       6   2      
[22] move       7   4      
[23] call       5   3   1  
[24] add        3   3   257  ; 1
[25] jmp        -17          ; to [9]
[26] return     2   2      
[27] return     0   1      
; end of function


; function [9] definition (level 4)
; 2 upvalues, 2 params, 9 stacks
.function  2 2 0 9
.local  "base"  ; 0
.local  "key"  ; 1
.upvalue  "methods"  ; 0
.upvalue  "regAccess"  ; 1
.const  "assert"  ; 0
.const  "badArgs"  ; 1
.const  "OpenBaseKey"  ; 2
.const  "io"  ; 3
.const  "write"  ; 4
.const  "\n"  ; 5
.const  "os"  ; 6
.const  "date"  ; 7
.const  "%c "  ; 8
.const  "Removing RegKey: "  ; 9
.const  "\\"  ; 10
.const  "RegDeleteTree"  ; 11
[01] getglobal  2   0        ; assert
[02] test       3   0   0    ; to [4] if true
[03] jmp        1            ; to [5]
[04] move       3   1      
[05] loadk      4   1        ; "badArgs"
[06] call       2   3   1  
[07] getupval   2   0        ; methods
[08] gettable   2   2   252  ; "OpenBaseKey"
[09] move       3   0      
[10] call       2   2   1  
[11] getglobal  2   3        ; io
[12] gettable   2   2   254  ; "write"
[13] loadk      3   5        ; "\n"
[14] getglobal  4   6        ; os
[15] gettable   4   4   257  ; "date"
[16] loadk      5   8        ; "%c "
[17] call       4   2   2  
[18] loadk      5   9        ; "Removing RegKey: "
[19] move       6   0      
[20] loadk      7   10       ; "\\"
[21] move       8   1      
[22] call       2   7   1  
[23] getupval   2   1        ; regAccess
[24] self       2   2   261  ; "RegDeleteTree"
[25] move       4   1      
[26] call       2   3   1  
[27] return     0   1      
; end of function


; function [10] definition (level 4)
; 2 upvalues, 3 params, 10 stacks
.function  2 3 0 10
.local  "base"  ; 0
.local  "key"  ; 1
.local  "val"  ; 2
.upvalue  "methods"  ; 0
.upvalue  "regAccess"  ; 1
.const  "assert"  ; 0
.const  "badArgs"  ; 1
.const  "OpenBaseKey"  ; 2
.const  "io"  ; 3
.const  "write"  ; 4
.const  "\n"  ; 5
.const  "os"  ; 6
.const  "date"  ; 7
.const  "%c "  ; 8
.const  "Removing RegKey: "  ; 9
.const  "\\"  ; 10
.const  "Removing RegKey value: "  ; 11
.const  "tostring"  ; 12
.const  "DeleteKey"  ; 13
[01] getglobal  3   0        ; assert
[02] test       4   0   0    ; to [4] if true
[03] jmp        1            ; to [5]
[04] move       4   1      
[05] loadk      5   1        ; "badArgs"
[06] call       3   3   1  
[07] test       2   2   0    ; to [9] if true
[08] jmp        6            ; to [15]
[09] getupval   3   0        ; methods
[10] gettable   3   3   252  ; "OpenBaseKey"
[11] move       4   0      
[12] move       5   1      
[13] call       3   3   1  
[14] jmp        4            ; to [19]
[15] getupval   3   0        ; methods
[16] gettable   3   3   252  ; "OpenBaseKey"
[17] move       4   0      
[18] call       3   2   1  
[19] getglobal  3   3        ; io
[20] gettable   3   3   254  ; "write"
[21] loadk      4   5        ; "\n"
[22] getglobal  5   6        ; os
[23] gettable   5   5   257  ; "date"
[24] loadk      6   8        ; "%c "
[25] call       5   2   2  
[26] loadk      6   9        ; "Removing RegKey: "
[27] move       7   0      
[28] loadk      8   10       ; "\\"
[29] move       9   1      
[30] call       3   7   1  
[31] test       2   2   0    ; to [33] if true
[32] jmp        12           ; to [45]
[33] getglobal  3   3        ; io
[34] gettable   3   3   254  ; "write"
[35] loadk      4   5        ; "\n"
[36] getglobal  5   6        ; os
[37] gettable   5   5   257  ; "date"
[38] loadk      6   8        ; "%c "
[39] call       5   2   2  
[40] loadk      6   11       ; "Removing RegKey value: "
[41] getglobal  7   12       ; tostring
[42] move       8   2      
[43] call       7   2   0  
[44] call       3   0   1  
[45] getupval   3   1        ; regAccess
[46] self       3   3   263  ; "DeleteKey"
[47] test       5   2   1    ; to [49] if false
[48] jmp        1            ; to [50]
[49] move       5   1      
[50] call       3   3   1  
[51] return     0   1      
; end of function


; function [11] definition (level 4)
; 3 upvalues, 2 params, 17 stacks
.function  3 2 0 17
.local  "path"  ; 0
.local  "uninst"  ; 1
.local  "_"  ; 2
.local  "_"  ; 3
.local  "str"  ; 4
.local  "(for generator)"  ; 5
.local  "(for state)"  ; 6
.local  "tok"  ; 7
.local  "s"  ; 8
.local  "err"  ; 9
.upvalue  "driveExp"  ; 0
.upvalue  "filenameExp"  ; 1
.upvalue  "filesys"  ; 2
.const  "string"  ; 0
.const  "find"  ; 1
.const  "("  ; 2
.const  ")"  ; 3
.const  ""  ; 4
.const  "io"  ; 5
.const  "write"  ; 6
.const  "\n"  ; 7
.const  "os"  ; 8
.const  "date"  ; 9
.const  "%c "  ; 10
.const  "CreatePath path = "  ; 11
.const  "tostring"  ; 12
.const  "gfind"  ; 13
.const  "\\"  ; 14
.const  "FolderExists"  ; 15
.const  "Creating, "  ; 16
.const  "FileSystem"  ; 17
.const  "pcall"  ; 18
.const  "CreateFolder"  ; 19
.const  "Create folder failed: "  ; 20
.const  " on "  ; 21
.const  "assert"  ; 22
.const  "g_env"  ; 23
.const  "tmpDir"  ; 24
.const  "table"  ; 25
.const  "insert"  ; 26
.const  "g_tmps"  ; 27
.const  "Arrange to delete folder: "  ; 28
.const  "g_constants"  ; 29
.const  "restoreDir"  ; 30
.const  0  ; 31
.const  "Arrange to delete temp: "  ; 32
[001] getglobal  2   0        ; string
[002] gettable   2   2   251  ; "find"
[003] move       3   0      
[004] loadk      4   2        ; "("
[005] getupval   5   0        ; driveExp
[006] loadk      6   3        ; ")"
[007] getupval   7   1        ; filenameExp
[008] concat     4   4   7  
[009] call       2   3   4  
[010] test       4   4   1    ; to [12] if false
[011] jmp        1            ; to [13]
[012] loadk      4   4        ; ""
[013] getglobal  5   5        ; io
[014] gettable   5   5   256  ; "write"
[015] loadk      6   7        ; "\n"
[016] getglobal  7   8        ; os
[017] gettable   7   7   259  ; "date"
[018] loadk      8   10       ; "%c "
[019] call       7   2   2  
[020] loadk      8   11       ; "CreatePath path = "
[021] getglobal  9   12       ; tostring
[022] move       10  0      
[023] call       9   2   0  
[024] call       5   0   1  
[025] getglobal  5   0        ; string
[026] gettable   5   5   263  ; "gfind"
[027] move       6   0      
[028] getupval   7   1        ; filenameExp
[029] loadk      8   14       ; "\\"
[030] concat     7   7   8  
[031] call       5   3   4  
[032] tforprep   5   105      ; to [138]
[033] move       8   4      
[034] move       9   7      
[035] concat     4   8   9  
[036] getupval   8   2        ; filesys
[037] self       8   8   265  ; "FolderExists"
[038] move       10  4      
[039] call       8   3   2  
[040] test       8   8   1    ; to [42] if false
[041] jmp        67           ; to [109]
[042] getglobal  8   5        ; io
[043] gettable   8   8   256  ; "write"
[044] loadk      9   7        ; "\n"
[045] getglobal  10  8        ; os
[046] gettable   10  10  259  ; "date"
[047] loadk      11  10       ; "%c "
[048] call       10  2   2  
[049] loadk      11  16       ; "Creating, "
[050] move       12  4      
[051] call       8   5   1  
[052] test       1   1   0    ; to [54] if true
[053] jmp        3            ; to [57]
[054] gettable   8   1   267  ; "FileSystem"
[055] move       9   4      
[056] call       8   2   1  
[057] getglobal  8   18       ; pcall
[058] getupval   9   2        ; filesys
[059] gettable   9   9   269  ; "CreateFolder"
[060] getupval   10  2        ; filesys
[061] move       11  4      
[062] call       8   4   3  
[063] test       8   8   1    ; to [65] if false
[064] jmp        16           ; to [81]
[065] getglobal  10  5        ; io
[066] gettable   10  10  256  ; "write"
[067] loadk      11  7        ; "\n"
[068] getglobal  12  8        ; os
[069] gettable   12  12  259  ; "date"
[070] loadk      13  10       ; "%c "
[071] call       12  2   2  
[072] loadk      13  20       ; "Create folder failed: "
[073] move       14  9      
[074] loadk      15  21       ; " on "
[075] move       16  4      
[076] call       10  7   1  
[077] getglobal  10  22       ; assert
[078] loadbool   11  0   0    ; false
[079] move       12  9      
[080] call       10  3   1  
[081] getglobal  10  23       ; g_env
[082] gettable   10  10  274  ; "tmpDir"
[083] test       10  10  0    ; to [85] if true
[084] jmp        53           ; to [138]
[085] getglobal  10  0        ; string
[086] gettable   10  10  251  ; "find"
[087] move       11  4      
[088] getglobal  12  23       ; g_env
[089] gettable   12  12  274  ; "tmpDir"
[090] call       10  3   2  
[091] test       10  10  0    ; to [93] if true
[092] jmp        45           ; to [138]
[093] getglobal  10  25       ; table
[094] gettable   10  10  276  ; "insert"
[095] getglobal  11  27       ; g_tmps
[096] move       12  4      
[097] call       10  3   1  
[098] getglobal  10  5        ; io
[099] gettable   10  10  256  ; "write"
[100] loadk      11  7        ; "\n"
[101] getglobal  12  8        ; os
[102] gettable   12  12  259  ; "date"
[103] loadk      13  10       ; "%c "
[104] call       12  2   2  
[105] loadk      13  28       ; "Arrange to delete folder: "
[106] move       14  4      
[107] call       10  5   1  
[108] jmp        29           ; to [138]
[109] getglobal  8   29       ; g_constants
[110] gettable   8   8   280  ; "restoreDir"
[111] test       8   8   0    ; to [113] if true
[112] jmp        25           ; to [138]
[113] getglobal  8   0        ; string
[114] gettable   8   8   251  ; "find"
[115] move       9   4      
[116] getglobal  10  29       ; g_constants
[117] gettable   10  10  280  ; "restoreDir"
[118] loadk      11  31       ; 0
[119] loadbool   12  1   0    ; true
[120] call       8   5   2  
[121] test       8   8   0    ; to [123] if true
[122] jmp        15           ; to [138]
[123] getglobal  8   25       ; table
[124] gettable   8   8   276  ; "insert"
[125] getglobal  9   27       ; g_tmps
[126] move       10  0      
[127] call       8   3   1  
[128] getglobal  8   5        ; io
[129] gettable   8   8   256  ; "write"
[130] loadk      9   7        ; "\n"
[131] getglobal  10  8        ; os
[132] gettable   10  10  259  ; "date"
[133] loadk      11  10       ; "%c "
[134] call       10  2   2  
[135] loadk      11  32       ; "Arrange to delete temp: "
[136] move       12  0      
[137] call       8   5   1  
[138] tforloop   5       0    ; to [140] if exit
[139] jmp        -107         ; to [33]
[140] return     0   1      
; end of function


; function [12] definition (level 4)
; 2 upvalues, 1 params, 11 stacks
.function  2 1 0 11
.local  "path"  ; 0
.local  "reply"  ; 1
.local  "folderItems"  ; 2
.local  "enumFolder"  ; 3
.local  "fileItems"  ; 4
.local  "enumFile"  ; 5
.upvalue  "filesys"  ; 0
.upvalue  "methods"  ; 1
.const  "FolderExists"  ; 0
.const  "io"  ; 1
.const  "write"  ; 2
.const  "\n"  ; 3
.const  "os"  ; 4
.const  "date"  ; 5
.const  "%c "  ; 6
.const  "FolderIsEmpty folder does not exist: "  ; 7
.const  "GetFolderItems"  ; 8
.const  "Next"  ; 9
.const  "!FolderIsEmpty "  ; 10
.const  "Name"  ; 11
.const  "GetSubFolders"  ; 12
[01] getupval   1   0        ; filesys
[02] self       1   1   250  ; "FolderExists"
[03] move       3   0      
[04] call       1   3   2  
[05] test       1   1   1    ; to [7] if false
[06] jmp        12           ; to [19]
[07] getglobal  1   1        ; io
[08] gettable   1   1   252  ; "write"
[09] loadk      2   3        ; "\n"
[10] getglobal  3   4        ; os
[11] gettable   3   3   255  ; "date"
[12] loadk      4   6        ; "%c "
[13] call       3   2   2  
[14] loadk      4   7        ; "FolderIsEmpty folder does not exist: "
[15] move       5   0      
[16] call       1   5   1  
[17] loadbool   1   0   0    ; false
[18] return     1   2      
[19] loadbool   1   1   0    ; true
[20] getupval   2   1        ; methods
[21] gettable   2   2   258  ; "GetFolderItems"
[22] move       3   0      
[23] call       2   2   3  
[24] test       2   2   0    ; to [26] if true
[25] jmp        17           ; to [43]
[26] self       4   3   259  ; "Next"
[27] call       4   2   2  
[28] move       2   4      
[29] test       2   2   0    ; to [31] if true
[30] jmp        12           ; to [43]
[31] getglobal  4   1        ; io
[32] gettable   4   4   252  ; "write"
[33] loadk      5   3        ; "\n"
[34] getglobal  6   4        ; os
[35] gettable   6   6   255  ; "date"
[36] loadk      7   6        ; "%c "
[37] call       6   2   2  
[38] loadk      7   10       ; "!FolderIsEmpty "
[39] gettable   8   2   261  ; "Name"
[40] concat     7   7   8  
[41] call       4   4   1  
[42] loadbool   1   0   0    ; false
[43] getupval   4   1        ; methods
[44] gettable   4   4   262  ; "GetSubFolders"
[45] move       5   0      
[46] call       4   2   3  
[47] test       4   4   0    ; to [49] if true
[48] jmp        17           ; to [66]
[49] self       6   5   259  ; "Next"
[50] call       6   2   2  
[51] move       4   6      
[52] test       4   4   0    ; to [54] if true
[53] jmp        12           ; to [66]
[54] getglobal  6   1        ; io
[55] gettable   6   6   252  ; "write"
[56] loadk      7   3        ; "\n"
[57] getglobal  8   4        ; os
[58] gettable   8   8   255  ; "date"
[59] loadk      9   6        ; "%c "
[60] call       8   2   2  
[61] loadk      9   10       ; "!FolderIsEmpty "
[62] gettable   10  4   261  ; "Name"
[63] concat     9   9   10 
[64] call       6   4   1  
[65] loadbool   1   0   0    ; false
[66] return     1   2      
[67] return     0   1      
; end of function


; function [13] definition (level 4)
; 1 upvalues, 1 params, 7 stacks
.function  1 1 0 7
.local  "path"  ; 0
.local  "_"  ; 1
.local  "_"  ; 2
.local  "path"  ; 3
.local  "filename"  ; 4
.upvalue  "filenameExp"  ; 0
.const  "string"  ; 0
.const  "gsub"  ; 1
.const  "/"  ; 2
.const  "\\"  ; 3
.const  "find"  ; 4
.const  "(.+)\\("  ; 5
.const  ")"  ; 6
[01] getglobal  1   0        ; string
[02] gettable   1   1   251  ; "gsub"
[03] move       2   0      
[04] loadk      3   2        ; "/"
[05] loadk      4   3        ; "\\"
[06] call       1   4   2  
[07] move       0   1      
[08] getglobal  1   0        ; string
[09] gettable   1   1   254  ; "find"
[10] move       2   0      
[11] loadk      3   5        ; "(.+)\\("
[12] getupval   4   0        ; filenameExp
[13] loadk      5   6        ; ")"
[14] concat     3   3   5  
[15] call       1   3   5  
[16] move       5   3      
[17] move       6   4      
[18] return     5   3      
[19] return     0   1      
; end of function


; function [14] definition (level 4)
; 1 upvalues, 1 params, 7 stacks
.function  1 1 0 7
.local  "path"  ; 0
.upvalue  "filesys"  ; 0
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "FolderExists path = "  ; 6
.const  "tostring"  ; 7
.const  "FolderExists"  ; 8
[01] getglobal  1   0        ; io
[02] gettable   1   1   251  ; "write"
[03] loadk      2   2        ; "\n"
[04] getglobal  3   3        ; os
[05] gettable   3   3   254  ; "date"
[06] loadk      4   5        ; "%c "
[07] call       3   2   2  
[08] loadk      4   6        ; "FolderExists path = "
[09] getglobal  5   7        ; tostring
[10] move       6   0      
[11] call       5   2   0  
[12] call       1   0   1  
[13] test       0   0   1    ; to [15] if false
[14] jmp        2            ; to [17]
[15] loadbool   1   0   0    ; false
[16] return     1   2      
[17] getupval   1   0        ; filesys
[18] self       1   1   258  ; "FolderExists"
[19] move       3   0      
[20] tailcall   1   3   0  
[21] return     1   0      
[22] return     0   1      
; end of function


; function [15] definition (level 4)
; 1 upvalues, 1 params, 7 stacks
.function  1 1 0 7
.local  "path"  ; 0
.upvalue  "filesys"  ; 0
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "FileExists path = "  ; 6
.const  "tostring"  ; 7
.const  "FileExists"  ; 8
[01] getglobal  1   0        ; io
[02] gettable   1   1   251  ; "write"
[03] loadk      2   2        ; "\n"
[04] getglobal  3   3        ; os
[05] gettable   3   3   254  ; "date"
[06] loadk      4   5        ; "%c "
[07] call       3   2   2  
[08] loadk      4   6        ; "FileExists path = "
[09] getglobal  5   7        ; tostring
[10] move       6   0      
[11] call       5   2   0  
[12] call       1   0   1  
[13] test       0   0   1    ; to [15] if false
[14] jmp        2            ; to [17]
[15] loadbool   1   0   0    ; false
[16] return     1   2      
[17] getupval   1   0        ; filesys
[18] self       1   1   258  ; "FileExists"
[19] move       3   0      
[20] tailcall   1   3   0  
[21] return     1   0      
[22] return     0   1      
; end of function


; function [16] definition (level 4)
; 1 upvalues, 0 params, 4 stacks
.function  1 0 0 4
.upvalue  "methods"  ; 0
.const  "GetRegKeyValue"  ; 0
.const  "HKLM"  ; 1
.const  "SOFTWARE\\GameInstaller\\Installer"  ; 2
.const  "Proxy"  ; 3
[1] getupval   0   0        ; methods
[2] gettable   0   0   250  ; "GetRegKeyValue"
[3] loadk      1   1        ; "HKLM"
[4] loadk      2   2        ; "SOFTWARE\\GameInstaller\\Installer"
[5] loadk      3   3        ; "Proxy"
[6] tailcall   0   4   0  
[7] return     0   0      
[8] return     0   1      
; end of function


; function [17] definition (level 4)
; 1 upvalues, 1 params, 11 stacks
.function  1 1 0 11
.local  "filename"  ; 0
.local  "InnerDeleteFile"  ; 1
.local  "s"  ; 2
.local  "err"  ; 3
.upvalue  "filesys"  ; 0
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "DeleteFile path = "  ; 6
.const  "tostring"  ; 7
.const  "pcall"  ; 8
.const  "Error attempting to delete: "  ; 9
.const  ", "  ; 10
.const  "unk"  ; 11

; function [0] definition (level 5)
; 2 upvalues, 0 params, 6 stacks
.function  2 0 0 6
.local  "s"  ; 0
.upvalue  "filename"  ; 0
.upvalue  "filesys"  ; 1
.const  "string"  ; 0
.const  "gsub"  ; 1
.const  "/"  ; 2
.const  "\\"  ; 3
.const  "sub"  ; 4
.const  1  ; 5
.const  -1  ; 6
.const  2  ; 7
.const  -2  ; 8
.const  "FileExists"  ; 9
.const  "io"  ; 10
.const  "write"  ; 11
.const  "\n"  ; 12
.const  "os"  ; 13
.const  "date"  ; 14
.const  "%c "  ; 15
.const  "Removing file element: "  ; 16
.const  "DeleteFile"  ; 17
.const  "FolderExists"  ; 18
.const  "Removing folder element: "  ; 19
.const  "DeleteFolder"  ; 20
[01] getglobal  0   0        ; string
[02] gettable   0   0   251  ; "gsub"
[03] getupval   1   0        ; filename
[04] loadk      2   2        ; "/"
[05] loadk      3   3        ; "\\"
[06] call       0   4   2  
[07] setupval   0   0        ; filename
[08] getglobal  0   0        ; string
[09] gettable   0   0   254  ; "sub"
[10] getupval   1   0        ; filename
[11] loadk      2   6        ; -1
[12] call       0   3   2  
[13] eq         0   0   253  ; "\\", to [15] if true
[14] jmp        7            ; to [22]
[15] getglobal  1   0        ; string
[16] gettable   1   1   254  ; "sub"
[17] getupval   2   0        ; filename
[18] loadk      3   5        ; 1
[19] loadk      4   8        ; -2
[20] call       1   4   2  
[21] setupval   1   0        ; filename
[22] getupval   1   1        ; filesys
[23] self       1   1   259  ; "FileExists"
[24] getupval   3   0        ; filename
[25] call       1   3   2  
[26] test       1   1   0    ; to [28] if true
[27] jmp        16           ; to [44]
[28] getglobal  1   10       ; io
[29] gettable   1   1   261  ; "write"
[30] loadk      2   12       ; "\n"
[31] getglobal  3   13       ; os
[32] gettable   3   3   264  ; "date"
[33] loadk      4   15       ; "%c "
[34] call       3   2   2  
[35] loadk      4   16       ; "Removing file element: "
[36] getupval   5   0        ; filename
[37] call       1   5   1  
[38] getupval   1   1        ; filesys
[39] self       1   1   267  ; "DeleteFile"
[40] getupval   3   0        ; filename
[41] loadbool   4   1   0    ; true
[42] call       1   4   1  
[43] jmp        26           ; to [70]
[44] getupval   1   1        ; filesys
[45] self       1   1   268  ; "FolderExists"
[46] getupval   3   0        ; filename
[47] call       1   3   2  
[48] test       1   1   0    ; to [50] if true
[49] jmp        16           ; to [66]
[50] getglobal  1   10       ; io
[51] gettable   1   1   261  ; "write"
[52] loadk      2   12       ; "\n"
[53] getglobal  3   13       ; os
[54] gettable   3   3   264  ; "date"
[55] loadk      4   15       ; "%c "
[56] call       3   2   2  
[57] loadk      4   19       ; "Removing folder element: "
[58] getupval   5   0        ; filename
[59] call       1   5   1  
[60] getupval   1   1        ; filesys
[61] self       1   1   270  ; "DeleteFolder"
[62] getupval   3   0        ; filename
[63] loadbool   4   1   0    ; true
[64] call       1   4   1  
[65] jmp        4            ; to [70]
[66] getupval   1   1        ; filesys
[67] self       1   1   267  ; "DeleteFile"
[68] getupval   3   0        ; filename
[69] call       1   3   1  
[70] return     0   1      
; end of function

[01] getglobal  1   0        ; io
[02] gettable   1   1   251  ; "write"
[03] loadk      2   2        ; "\n"
[04] getglobal  3   3        ; os
[05] gettable   3   3   254  ; "date"
[06] loadk      4   5        ; "%c "
[07] call       3   2   2  
[08] loadk      4   6        ; "DeleteFile path = "
[09] getglobal  5   7        ; tostring
[10] move       6   0      
[11] call       5   2   0  
[12] call       1   0   1  
[13] closure    1   0        ; 2 upvalues
[14] move       0   0      
[15] getupval   0   0        ; filesys
[16] getglobal  2   8        ; pcall
[17] move       3   1      
[18] call       2   2   3  
[19] test       2   2   1    ; to [21] if false
[20] jmp        14           ; to [35]
[21] getglobal  4   0        ; io
[22] gettable   4   4   251  ; "write"
[23] loadk      5   2        ; "\n"
[24] getglobal  6   3        ; os
[25] gettable   6   6   254  ; "date"
[26] loadk      7   5        ; "%c "
[27] call       6   2   2  
[28] loadk      7   9        ; "Error attempting to delete: "
[29] move       8   0      
[30] loadk      9   10       ; ", "
[31] test       10  3   1    ; to [33] if false
[32] jmp        1            ; to [34]
[33] loadk      10  11       ; "unk"
[34] call       4   7   1  
[35] move       4   2      
[36] move       5   3      
[37] return     4   3      
[38] return     0   1      
; end of function


; function [18] definition (level 4)
; 0 upvalues, 0 params, 10 stacks
.function  0 0 0 10
.local  "module"  ; 0
.local  "_"  ; 1
.local  "_"  ; 2
.local  "drive"  ; 3
.local  "workDir"  ; 4
.local  "exe"  ; 5
.const  "GetInstallerFileName"  ; 0
.const  "string"  ; 1
.const  "find"  ; 2
.const  "(%a:)(\\.+\\)(%w+%.%w%w%w)"  ; 3
[01] getglobal  0   0        ; GetInstallerFileName
[02] call       0   1   2  
[03] getglobal  1   1        ; string
[04] gettable   1   1   252  ; "find"
[05] move       2   0      
[06] loadk      3   3        ; "(%a:)(\\.+\\)(%w+%.%w%w%w)"
[07] call       1   3   6  
[08] move       6   3      
[09] move       7   4      
[10] move       8   5      
[11] move       9   0      
[12] return     6   5      
[13] return     0   1      
; end of function


; function [19] definition (level 4)
; 1 upvalues, 0 params, 2 stacks
.function  1 0 0 2
.upvalue  "shellCtl"  ; 0
.const  "OSVersion"  ; 0
[1] getupval   0   0        ; shellCtl
[2] self       0   0   250  ; "OSVersion"
[3] tailcall   0   2   0  
[4] return     0   0      
[5] return     0   1      
; end of function


; function [20] definition (level 4)
; 2 upvalues, 0 params, 2 stacks
.function  2 0 0 2
.upvalue  "methods"  ; 0
.upvalue  "folderType"  ; 1
.const  "SpecialFolder"  ; 0
.const  "system"  ; 1
.const  "\\regsvr32"  ; 2
[1] getupval   0   0        ; methods
[2] gettable   0   0   250  ; "SpecialFolder"
[3] getupval   1   1        ; folderType
[4] gettable   1   1   251  ; "system"
[5] call       0   2   2  
[6] loadk      1   2        ; "\\regsvr32"
[7] concat     0   0   1  
[8] return     0   2      
[9] return     0   1      
; end of function


; function [21] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
.const  "GetInstallerDirectory"  ; 0
[1] getglobal  0   0        ; GetInstallerDirectory
[2] tailcall   0   1   0  
[3] return     0   0      
[4] return     0   1      
; end of function


; function [22] definition (level 4)
; 0 upvalues, 1 params, 3 stacks
.function  0 1 0 3
.local  "id"  ; 0
.const  "GetSpecialFolder"  ; 0
[1] getglobal  1   0        ; GetSpecialFolder
[2] move       2   0      
[3] tailcall   1   2   0  
[4] return     1   0      
[5] return     0   1      
; end of function


; function [23] definition (level 4)
; 1 upvalues, 1 params, 4 stacks
.function  1 1 0 4
.local  "src"  ; 0
.local  "fileObj"  ; 1
.upvalue  "filesys"  ; 0
.const  "GetFile"  ; 0
.const  "Size"  ; 1
[1] getupval   1   0        ; filesys
[2] self       1   1   250  ; "GetFile"
[3] move       3   0      
[4] call       1   3   2  
[5] gettable   2   1   251  ; "Size"
[6] return     2   2      
[7] return     0   1      
; end of function


; function [24] definition (level 4)
; 3 upvalues, 5 params, 17 stacks
.function  3 5 0 17
.local  "src"  ; 0
.local  "dest"  ; 1
.local  "callback"  ; 2
.local  "prompt"  ; 3
.local  "access"  ; 4
.local  "InnerLocalCopy"  ; 5
.local  "s"  ; 6
.local  "err"  ; 7
.upvalue  "filesys"  ; 0
.upvalue  "methods"  ; 1
.upvalue  "filenameExp"  ; 2
.const  "pcall"  ; 0
.const  "io"  ; 1
.const  "write"  ; 2
.const  "\n"  ; 3
.const  "os"  ; 4
.const  "date"  ; 5
.const  "%c "  ; 6
.const  "LocalCopy Error: "  ; 7
.const  " on "  ; 8
.const  " TO "  ; 9

; function [0] definition (level 5)
; 6 upvalues, 0 params, 8 stacks
.function  6 0 0 8
.local  "removeReadOnly"  ; 0
.local  "c"  ; 1
.local  "_"  ; 2
.local  "_"  ; 3
.local  "path"  ; 4
.local  "filename"  ; 5
.local  "h"  ; 6
.local  "fileObj"  ; 7
.local  "folderObj"  ; 8
.upvalue  "src"  ; 0
.upvalue  "dest"  ; 1
.upvalue  "filesys"  ; 2
.upvalue  "methods"  ; 3
.upvalue  "filenameExp"  ; 4
.upvalue  "prompt"  ; 5
.const  "string"  ; 0
.const  "gsub"  ; 1
.const  "/"  ; 2
.const  "\\"  ; 3
.const  "sub"  ; 4
.const  1  ; 5
.const  -1  ; 6
.const  2  ; 7
.const  -2  ; 8
.const  "FileExists"  ; 9
.const  "CreatePath"  ; 10
.const  "FolderExists"  ; 11
.const  "len"  ; 12
.const  "find"  ; 13
.const  "(.+)\\("  ; 14
.const  ")"  ; 15
.const  "OpenDestFile"  ; 16
.const  "close"  ; 17
.const  "CopyFile"  ; 18
.const  "GetFile"  ; 19
.const  "Attributes"  ; 20
.const  "bit"  ; 21
.const  "band"  ; 22
.const  "bnot"  ; 23
.const  "CopyFolder"  ; 24
.const  "GetFolder"  ; 25

; function [0] definition (level 6)
; 1 upvalues, 1 params, 9 stacks
.function  1 1 0 9
.local  "folder"  ; 0
.local  "(for generator)"  ; 1
.local  "(for state)"  ; 2
.local  "index"  ; 3
.local  "f"  ; 4
.local  "(for generator)"  ; 5
.local  "(for state)"  ; 6
.local  "index"  ; 7
.local  "f"  ; 8
.upvalue  "removeReadOnly"  ; 0
.const  "Attributes"  ; 0
.const  "bit"  ; 1
.const  "band"  ; 2
.const  "bnot"  ; 3
.const  1  ; 4
.const  "luacom"  ; 5
.const  "pairs"  ; 6
.const  "Files"  ; 7
.const  "SubFolders"  ; 8
[01] getglobal  1   1        ; bit
[02] gettable   1   1   252  ; "band"
[03] gettable   2   0   250  ; "Attributes"
[04] getglobal  3   1        ; bit
[05] gettable   3   3   253  ; "bnot"
[06] loadk      4   4        ; 1
[07] call       3   2   0  
[08] call       1   0   2  
[09] settable   0   250 1    ; "Attributes"
[10] getglobal  1   5        ; luacom
[11] gettable   1   1   256  ; "pairs"
[12] gettable   2   0   257  ; "Files"
[13] call       1   2   5  
[14] tforprep   1   9        ; to [24]
[15] getglobal  5   1        ; bit
[16] gettable   5   5   252  ; "band"
[17] gettable   6   4   250  ; "Attributes"
[18] getglobal  7   1        ; bit
[19] gettable   7   7   253  ; "bnot"
[20] loadk      8   4        ; 1
[21] call       7   2   0  
[22] call       5   0   2  
[23] settable   4   250 5    ; "Attributes"
[24] tforloop   1       1    ; to [26] if exit
[25] jmp        -11          ; to [15]
[26] getglobal  1   5        ; luacom
[27] gettable   1   1   256  ; "pairs"
[28] gettable   2   0   258  ; "SubFolders"
[29] call       1   2   5  
[30] tforprep   1   3        ; to [34]
[31] getupval   5   0        ; removeReadOnly
[32] move       6   4      
[33] call       5   2   1  
[34] tforloop   1       1    ; to [36] if exit
[35] jmp        -5           ; to [31]
[36] return     0   1      
; end of function

[001] getglobal  0   0        ; string
[002] gettable   0   0   251  ; "gsub"
[003] getupval   1   0        ; src
[004] loadk      2   2        ; "/"
[005] loadk      3   3        ; "\\"
[006] call       0   4   2  
[007] setupval   0   0        ; src
[008] getglobal  0   0        ; string
[009] gettable   0   0   251  ; "gsub"
[010] getupval   1   1        ; dest
[011] loadk      2   2        ; "/"
[012] loadk      3   3        ; "\\"
[013] call       0   4   2  
[014] setupval   0   1        ; dest
[015] closure    0   0        ; 1 upvalues
[016] move       0   0      
[017] getglobal  1   0        ; string
[018] gettable   1   1   254  ; "sub"
[019] getupval   2   0        ; src
[020] loadk      3   6        ; -1
[021] call       1   3   2  
[022] eq         0   1   253  ; "\\", to [24] if true
[023] jmp        7            ; to [31]
[024] getglobal  2   0        ; string
[025] gettable   2   2   254  ; "sub"
[026] getupval   3   0        ; src
[027] loadk      4   5        ; 1
[028] loadk      5   8        ; -2
[029] call       2   4   2  
[030] setupval   2   0        ; src
[031] getglobal  2   0        ; string
[032] gettable   2   2   254  ; "sub"
[033] getupval   3   1        ; dest
[034] loadk      4   6        ; -1
[035] call       2   3   2  
[036] move       1   2      
[037] eq         0   1   253  ; "\\", to [39] if true
[038] jmp        7            ; to [46]
[039] getglobal  2   0        ; string
[040] gettable   2   2   254  ; "sub"
[041] getupval   3   1        ; dest
[042] loadk      4   5        ; 1
[043] loadk      5   8        ; -2
[044] call       2   4   2  
[045] setupval   2   1        ; dest
[046] getupval   2   2        ; filesys
[047] self       2   2   259  ; "FileExists"
[048] getupval   4   0        ; src
[049] call       2   3   2  
[050] test       2   2   0    ; to [52] if true
[051] jmp        70           ; to [122]
[052] getupval   2   3        ; methods
[053] gettable   2   2   260  ; "CreatePath"
[054] getupval   3   1        ; dest
[055] call       2   2   1  
[056] getupval   2   2        ; filesys
[057] self       2   2   261  ; "FolderExists"
[058] getupval   4   1        ; dest
[059] call       2   3   2  
[060] test       2   2   0    ; to [62] if true
[061] jmp        33           ; to [95]
[062] getglobal  2   0        ; string
[063] gettable   2   2   254  ; "sub"
[064] getupval   3   1        ; dest
[065] getglobal  4   0        ; string
[066] gettable   4   4   262  ; "len"
[067] getupval   5   1        ; dest
[068] call       4   2   0  
[069] call       2   0   2  
[070] eq         1   2   253  ; "\\", to [72] if false
[071] jmp        4            ; to [76]
[072] getupval   2   1        ; dest
[073] loadk      3   3        ; "\\"
[074] concat     2   2   3  
[075] setupval   2   1        ; dest
[076] getglobal  2   0        ; string
[077] gettable   2   2   251  ; "gsub"
[078] getupval   3   0        ; src
[079] loadk      4   2        ; "/"
[080] loadk      5   3        ; "\\"
[081] call       2   4   2  
[082] setupval   2   0        ; src
[083] getglobal  2   0        ; string
[084] gettable   2   2   263  ; "find"
[085] getupval   3   0        ; src
[086] loadk      4   14       ; "(.+)\\("
[087] getupval   5   4        ; filenameExp
[088] loadk      6   15       ; ")"
[089] concat     4   4   6  
[090] call       2   3   5  
[091] getupval   6   1        ; dest
[092] move       7   5      
[093] concat     6   6   7  
[094] setupval   6   1        ; dest
[095] getupval   2   5        ; prompt
[096] test       2   2   0    ; to [98] if true
[097] jmp        5            ; to [103]
[098] getglobal  2   16       ; OpenDestFile
[099] getupval   3   1        ; dest
[100] call       2   2   2  
[101] self       3   2   267  ; "close"
[102] call       3   2   1  
[103] getupval   2   2        ; filesys
[104] self       2   2   268  ; "CopyFile"
[105] getupval   4   0        ; src
[106] getupval   5   1        ; dest
[107] call       2   4   1  
[108] getupval   2   2        ; filesys
[109] self       2   2   269  ; "GetFile"
[110] getupval   4   1        ; dest
[111] call       2   3   2  
[112] getglobal  3   21       ; bit
[113] gettable   3   3   272  ; "band"
[114] gettable   4   2   270  ; "Attributes"
[115] getglobal  5   21       ; bit
[116] gettable   5   5   273  ; "bnot"
[117] loadk      6   5        ; 1
[118] call       5   2   0  
[119] call       3   0   2  
[120] settable   2   270 3    ; "Attributes"
[121] jmp        28           ; to [150]
[122] getupval   2   2        ; filesys
[123] self       2   2   261  ; "FolderExists"
[124] getupval   4   0        ; src
[125] call       2   3   2  
[126] test       2   2   0    ; to [128] if true
[127] jmp        17           ; to [145]
[128] getupval   2   3        ; methods
[129] gettable   2   2   260  ; "CreatePath"
[130] getupval   3   1        ; dest
[131] call       2   2   1  
[132] getupval   2   2        ; filesys
[133] self       2   2   274  ; "CopyFolder"
[134] getupval   4   0        ; src
[135] getupval   5   1        ; dest
[136] call       2   4   1  
[137] getupval   2   2        ; filesys
[138] self       2   2   275  ; "GetFolder"
[139] getupval   4   1        ; dest
[140] call       2   3   2  
[141] move       3   0      
[142] move       4   2      
[143] call       3   2   1  
[144] jmp        5            ; to [150]
[145] getupval   2   2        ; filesys
[146] self       2   2   268  ; "CopyFile"
[147] getupval   4   0        ; src
[148] getupval   5   1        ; dest
[149] call       2   4   1  
[150] return     0   1      
; end of function

[01] closure    5   0        ; 6 upvalues
[02] move       0   0      
[03] move       0   1      
[04] getupval   0   0        ; filesys
[05] getupval   0   1        ; methods
[06] getupval   0   2        ; filenameExp
[07] move       0   3      
[08] getglobal  6   0        ; pcall
[09] move       7   5      
[10] call       6   2   3  
[11] test       6   6   1    ; to [13] if false
[12] jmp        14           ; to [27]
[13] getglobal  8   1        ; io
[14] gettable   8   8   252  ; "write"
[15] loadk      9   3        ; "\n"
[16] getglobal  10  4        ; os
[17] gettable   10  10  255  ; "date"
[18] loadk      11  6        ; "%c "
[19] call       10  2   2  
[20] loadk      11  7        ; "LocalCopy Error: "
[21] move       12  7      
[22] loadk      13  8        ; " on "
[23] move       14  0      
[24] loadk      15  9        ; " TO "
[25] move       16  1      
[26] call       8   9   1  
[27] move       8   6      
[28] move       9   7      
[29] return     8   3      
[30] return     0   1      
; end of function


; function [25] definition (level 4)
; 1 upvalues, 1 params, 6 stacks
.function  1 1 0 6
.local  "dir"  ; 0
.local  "folder"  ; 1
.local  "items"  ; 2
.local  "enum"  ; 3
.upvalue  "filesys"  ; 0
.const  "GetFolder"  ; 0
.const  "assert"  ; 1
.const  "invalidPath"  ; 2
.const  "Files"  ; 3
.const  "_NewEnum"  ; 4
.const  "Reset"  ; 5
[01] getupval   1   0        ; filesys
[02] self       1   1   250  ; "GetFolder"
[03] move       3   0      
[04] call       1   3   2  
[05] getglobal  2   1        ; assert
[06] move       3   1      
[07] loadk      4   2        ; "invalidPath"
[08] call       2   3   1  
[09] gettable   2   1   253  ; "Files"
[10] gettable   3   2   254  ; "_NewEnum"
[11] self       4   3   255  ; "Reset"
[12] call       4   2   1  
[13] move       4   2      
[14] move       5   3      
[15] return     4   3      
[16] return     0   1      
; end of function


; function [26] definition (level 4)
; 1 upvalues, 1 params, 6 stacks
.function  1 1 0 6
.local  "dir"  ; 0
.local  "folder"  ; 1
.local  "items"  ; 2
.local  "enum"  ; 3
.upvalue  "filesys"  ; 0
.const  "GetFolder"  ; 0
.const  "assert"  ; 1
.const  "invalidPath"  ; 2
.const  "SubFolders"  ; 3
.const  "_NewEnum"  ; 4
.const  "Reset"  ; 5
[01] getupval   1   0        ; filesys
[02] self       1   1   250  ; "GetFolder"
[03] move       3   0      
[04] call       1   3   2  
[05] getglobal  2   1        ; assert
[06] move       3   1      
[07] loadk      4   2        ; "invalidPath"
[08] call       2   3   1  
[09] gettable   2   1   253  ; "SubFolders"
[10] gettable   3   2   254  ; "_NewEnum"
[11] self       4   3   255  ; "Reset"
[12] call       4   2   1  
[13] move       4   2      
[14] move       5   3      
[15] return     4   3      
[16] return     0   1      
; end of function


; function [27] definition (level 4)
; 0 upvalues, 1 params, 10 stacks
.function  0 1 0 10
.local  "filePath"  ; 0
.local  "filesys"  ; 1
.local  "fileObj"  ; 2
.const  "luacom"  ; 0
.const  "CreateObject"  ; 1
.const  "Scripting.FileSystemObject"  ; 2
.const  "GetFile"  ; 3
.const  0  ; 4
.const  "bit"  ; 5
.const  "band"  ; 6
.const  "Attributes"  ; 7
.const  1  ; 8
.const  "io"  ; 9
.const  "write"  ; 10
.const  "\n"  ; 11
.const  "os"  ; 12
.const  "date"  ; 13
.const  "%c "  ; 14
.const  "filePath = "  ; 15
.const  " Attributes: "  ; 16
.const  "bnot"  ; 17
.const  "Read-Only bit is cleared: "  ; 18
[01] getglobal  1   0        ; luacom
[02] gettable   1   1   251  ; "CreateObject"
[03] loadk      2   2        ; "Scripting.FileSystemObject"
[04] call       1   2   2  
[05] self       2   1   253  ; "GetFile"
[06] move       4   0      
[07] call       2   3   2  
[08] getglobal  3   5        ; bit
[09] gettable   3   3   256  ; "band"
[10] gettable   4   2   257  ; "Attributes"
[11] loadk      5   8        ; 1
[12] call       3   3   2  
[13] eq         1   254 3    ; 0, to [15] if false
[14] jmp        31           ; to [46]
[15] getglobal  3   9        ; io
[16] gettable   3   3   260  ; "write"
[17] loadk      4   11       ; "\n"
[18] getglobal  5   12       ; os
[19] gettable   5   5   263  ; "date"
[20] loadk      6   14       ; "%c "
[21] call       5   2   2  
[22] loadk      6   15       ; "filePath = "
[23] move       7   0      
[24] loadk      8   16       ; " Attributes: "
[25] gettable   9   2   257  ; "Attributes"
[26] call       3   7   1  
[27] getglobal  3   5        ; bit
[28] gettable   3   3   256  ; "band"
[29] gettable   4   2   257  ; "Attributes"
[30] getglobal  5   5        ; bit
[31] gettable   5   5   267  ; "bnot"
[32] loadk      6   8        ; 1
[33] call       5   2   0  
[34] call       3   0   2  
[35] settable   2   257 3    ; "Attributes"
[36] getglobal  3   9        ; io
[37] gettable   3   3   260  ; "write"
[38] loadk      4   11       ; "\n"
[39] getglobal  5   12       ; os
[40] gettable   5   5   263  ; "date"
[41] loadk      6   14       ; "%c "
[42] call       5   2   2  
[43] loadk      6   18       ; "Read-Only bit is cleared: "
[44] gettable   7   2   257  ; "Attributes"
[45] call       3   5   1  
[46] return     0   1      
; end of function


; function [28] definition (level 4)
; 1 upvalues, 1 params, 8 stacks
.function  1 1 0 8
.local  "path"  ; 0
.local  "items"  ; 1
.local  "enum"  ; 2
.local  "files"  ; 3
.local  "enumFile"  ; 4
.local  "filePath"  ; 5
.upvalue  "methods"  ; 0
.const  "FolderExists"  ; 0
.const  "GetSubFolders"  ; 1
.const  "item"  ; 2
.const  "Next"  ; 3
.const  "folderPath"  ; 4
.const  "\\"  ; 5
.const  "Name"  ; 6
.const  "GetFolderItems"  ; 7
.const  "fileItem"  ; 8
.const  "ClearReadOnlyAttribute"  ; 9
.const  "MakePathFilesWriteable"  ; 10
[01] getupval   1   0        ; methods
[02] gettable   1   1   250  ; "FolderExists"
[03] move       2   0      
[04] call       1   2   2  
[05] test       1   1   0    ; to [7] if true
[06] jmp        52           ; to [59]
[07] getupval   1   0        ; methods
[08] gettable   1   1   251  ; "GetSubFolders"
[09] move       2   0      
[10] call       1   2   3  
[11] test       1   1   0    ; to [13] if true
[12] jmp        46           ; to [59]
[13] self       3   2   253  ; "Next"
[14] call       3   2   2  
[15] setglobal  3   2        ; item
[16] jmp        39           ; to [56]
[17] move       3   0      
[18] loadk      4   5        ; "\\"
[19] getglobal  5   2        ; item
[20] gettable   5   5   256  ; "Name"
[21] concat     3   3   5  
[22] setglobal  3   4        ; folderPath
[23] getupval   3   0        ; methods
[24] gettable   3   3   257  ; "GetFolderItems"
[25] getglobal  4   4        ; folderPath
[26] call       3   2   3  
[27] test       3   3   1    ; to [29] if false
[28] jmp        1            ; to [30]
[29] jmp        29           ; to [59]
[30] self       5   4   253  ; "Next"
[31] call       5   2   2  
[32] setglobal  5   8        ; fileItem
[33] jmp        12           ; to [46]
[34] getglobal  5   4        ; folderPath
[35] loadk      6   5        ; "\\"
[36] getglobal  7   8        ; fileItem
[37] gettable   7   7   256  ; "Name"
[38] concat     5   5   7  
[39] getupval   6   0        ; methods
[40] gettable   6   6   259  ; "ClearReadOnlyAttribute"
[41] move       7   5      
[42] call       6   2   1  
[43] self       6   4   253  ; "Next"
[44] call       6   2   2  
[45] setglobal  6   8        ; fileItem
[46] getglobal  5   8        ; fileItem
[47] test       5   5   1    ; to [49] if false
[48] jmp        -15          ; to [34]
[49] getupval   5   0        ; methods
[50] gettable   5   5   260  ; "MakePathFilesWriteable"
[51] getglobal  6   4        ; folderPath
[52] call       5   2   1  
[53] self       5   2   253  ; "Next"
[54] call       5   2   2  
[55] setglobal  5   2        ; item
[56] getglobal  3   2        ; item
[57] test       3   3   1    ; to [59] if false
[58] jmp        -42          ; to [17]
[59] return     0   1      
; end of function


; function [29] definition (level 4)
; 2 upvalues, 1 params, 13 stacks
.function  2 1 0 13
.local  "path"  ; 0
.local  "reply"  ; 1
.local  "tempFilename"  ; 2
.local  "worked"  ; 3
.local  "file"  ; 4
.local  "worked"  ; 5
.local  "file"  ; 6
.upvalue  "methods"  ; 0
.upvalue  "filesys"  ; 1
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "See if "  ; 6
.const  "tostring"  ; 7
.const  " is writeable"  ; 8
.const  "FolderExists"  ; 9
.const  "CreatePath "  ; 10
.const  " as it does not exist"  ; 11
.const  "CreatePath"  ; 12
.const  "\\"  ; 13
.const  "GetTempName"  ; 14
.const  "pcall"  ; 15
.const  "CreateTextFile"  ; 16
.const  "CreateTextFile Error: "  ; 17
.const  " opening "  ; 18
.const  "file2"  ; 19
.const  "GetFile"  ; 20
.const  "GetFile Error: "  ; 21
.const  "Close"  ; 22
.const  " IsPathWriteable reply = true"  ; 23
.const  "DeleteFile "  ; 24
.const  "DeleteFile"  ; 25
.const  "DeleteFile Error: "  ; 26
.const  " deleting "  ; 27
.const  ". IsPathWriteable reply = false"  ; 28
[001] loadbool   1   0   0    ; false
[002] loadnil    2   2      
[003] getglobal  3   0        ; io
[004] gettable   3   3   251  ; "write"
[005] loadk      4   2        ; "\n"
[006] getglobal  5   3        ; os
[007] gettable   5   5   254  ; "date"
[008] loadk      6   5        ; "%c "
[009] call       5   2   2  
[010] loadk      6   6        ; "See if "
[011] getglobal  7   7        ; tostring
[012] move       8   0      
[013] call       7   2   2  
[014] loadk      8   8        ; " is writeable"
[015] call       3   6   1  
[016] test       0   0   1    ; to [18] if false
[017] jmp        1            ; to [19]
[018] return     1   2      
[019] getupval   3   0        ; methods
[020] gettable   3   3   259  ; "FolderExists"
[021] move       4   0      
[022] call       3   2   2  
[023] test       3   3   1    ; to [25] if false
[024] jmp        17           ; to [42]
[025] getglobal  3   0        ; io
[026] gettable   3   3   251  ; "write"
[027] loadk      4   2        ; "\n"
[028] getglobal  5   3        ; os
[029] gettable   5   5   254  ; "date"
[030] loadk      6   5        ; "%c "
[031] call       5   2   2  
[032] loadk      6   10       ; "CreatePath "
[033] getglobal  7   7        ; tostring
[034] move       8   0      
[035] call       7   2   2  
[036] loadk      8   11       ; " as it does not exist"
[037] call       3   6   1  
[038] getupval   3   0        ; methods
[039] gettable   3   3   262  ; "CreatePath"
[040] move       4   0      
[041] call       3   2   1  
[042] getupval   3   0        ; methods
[043] gettable   3   3   259  ; "FolderExists"
[044] move       4   0      
[045] call       3   2   2  
[046] test       3   3   0    ; to [48] if true
[047] jmp        65           ; to [113]
[048] move       3   0      
[049] loadk      4   13       ; "\\"
[050] getupval   5   1        ; filesys
[051] self       5   5   264  ; "GetTempName"
[052] call       5   2   2  
[053] concat     2   3   5  
[054] getglobal  3   15       ; pcall
[055] getupval   4   1        ; filesys
[056] gettable   4   4   266  ; "CreateTextFile"
[057] getupval   5   1        ; filesys
[058] move       6   2      
[059] loadbool   7   1   0    ; true
[060] loadbool   8   1   0    ; true
[061] call       3   6   3  
[062] test       3   3   1    ; to [64] if false
[063] jmp        13           ; to [77]
[064] getglobal  5   0        ; io
[065] gettable   5   5   251  ; "write"
[066] loadk      6   2        ; "\n"
[067] getglobal  7   3        ; os
[068] gettable   7   7   254  ; "date"
[069] loadk      8   5        ; "%c "
[070] call       7   2   2  
[071] loadk      8   17       ; "CreateTextFile Error: "
[072] move       9   4      
[073] loadk      10  18       ; " opening "
[074] move       11  2      
[075] call       5   7   1  
[076] jmp        36           ; to [113]
[077] getglobal  5   15       ; pcall
[078] getupval   6   1        ; filesys
[079] gettable   6   6   270  ; "GetFile"
[080] getupval   7   1        ; filesys
[081] move       8   2      
[082] call       5   4   3  
[083] setglobal  6   19       ; file2
[084] move       3   5      
[085] test       3   3   1    ; to [87] if false
[086] jmp        13           ; to [100]
[087] getglobal  5   0        ; io
[088] gettable   5   5   251  ; "write"
[089] loadk      6   2        ; "\n"
[090] getglobal  7   3        ; os
[091] gettable   7   7   254  ; "date"
[092] loadk      8   5        ; "%c "
[093] call       7   2   2  
[094] loadk      8   21       ; "GetFile Error: "
[095] getglobal  9   19       ; file2
[096] loadk      10  18       ; " opening "
[097] move       11  2      
[098] call       5   7   1  
[099] jmp        13           ; to [113]
[100] self       5   4   272  ; "Close"
[101] call       5   2   1  
[102] getglobal  5   0        ; io
[103] gettable   5   5   251  ; "write"
[104] loadk      6   2        ; "\n"
[105] getglobal  7   3        ; os
[106] gettable   7   7   254  ; "date"
[107] loadk      8   5        ; "%c "
[108] call       7   2   2  
[109] move       8   0      
[110] loadk      9   23       ; " IsPathWriteable reply = true"
[111] call       5   5   1  
[112] loadbool   1   1   0    ; true
[113] test       1   1   0    ; to [115] if true
[114] jmp        34           ; to [149]
[115] getglobal  3   0        ; io
[116] gettable   3   3   251  ; "write"
[117] loadk      4   2        ; "\n"
[118] getglobal  5   3        ; os
[119] gettable   5   5   254  ; "date"
[120] loadk      6   5        ; "%c "
[121] call       5   2   2  
[122] loadk      6   24       ; "DeleteFile "
[123] move       7   2      
[124] loadk      8   2        ; "\n"
[125] call       3   6   1  
[126] getglobal  3   15       ; pcall
[127] getupval   4   1        ; filesys
[128] gettable   4   4   275  ; "DeleteFile"
[129] getupval   5   1        ; filesys
[130] move       6   2      
[131] loadbool   7   1   0    ; true
[132] call       3   5   3  
[133] test       3   3   1    ; to [135] if false
[134] jmp        14           ; to [149]
[135] getglobal  5   0        ; io
[136] gettable   5   5   251  ; "write"
[137] loadk      6   2        ; "\n"
[138] getglobal  7   3        ; os
[139] gettable   7   7   254  ; "date"
[140] loadk      8   5        ; "%c "
[141] call       7   2   2  
[142] loadk      8   26       ; "DeleteFile Error: "
[143] move       9   4      
[144] loadk      10  27       ; " deleting "
[145] move       11  2      
[146] loadk      12  28       ; ". IsPathWriteable reply = false"
[147] call       5   8   1  
[148] loadbool   1   0   0    ; false
[149] return     1   2      
[150] return     0   1      
; end of function


; function [30] definition (level 4)
; 2 upvalues, 0 params, 13 stacks
.function  2 0 0 13
.local  "module"  ; 0
.local  "_"  ; 1
.local  "_"  ; 2
.local  "drive"  ; 3
.local  "d"  ; 4
.upvalue  "shellCtl"  ; 0
.upvalue  "filesys"  ; 1
.const  "ModuleFileName"  ; 0
.const  "string"  ; 1
.const  "find"  ; 2
.const  "(%a):\\"  ; 3
.const  "GetDrive"  ; 4
.const  "io"  ; 5
.const  "write"  ; 6
.const  "\n"  ; 7
.const  "os"  ; 8
.const  "date"  ; 9
.const  "%c "  ; 10
.const  "Available disk space on "  ; 11
.const  " is: "  ; 12
.const  "tostring"  ; 13
.const  "FreeSpace"  ; 14
[01] getupval   0   0        ; shellCtl
[02] self       0   0   250  ; "ModuleFileName"
[03] call       0   2   2  
[04] getglobal  1   1        ; string
[05] gettable   1   1   252  ; "find"
[06] move       2   0      
[07] loadk      3   3        ; "(%a):\\"
[08] call       1   3   4  
[09] getupval   4   1        ; filesys
[10] self       4   4   254  ; "GetDrive"
[11] move       6   3      
[12] call       4   3   2  
[13] getglobal  5   5        ; io
[14] gettable   5   5   256  ; "write"
[15] loadk      6   7        ; "\n"
[16] getglobal  7   8        ; os
[17] gettable   7   7   259  ; "date"
[18] loadk      8   10       ; "%c "
[19] call       7   2   2  
[20] loadk      8   11       ; "Available disk space on "
[21] move       9   3      
[22] loadk      10  12       ; " is: "
[23] getglobal  11  13       ; tostring
[24] gettable   12  4   264  ; "FreeSpace"
[25] call       11  2   0  
[26] call       5   0   1  
[27] gettable   5   4   264  ; "FreeSpace"
[28] return     5   2      
[29] return     0   1      
; end of function


; function [31] definition (level 4)
; 1 upvalues, 2 params, 5 stacks
.function  1 2 0 5
.local  "drive"  ; 0
.local  "size"  ; 1
.local  "drvObj"  ; 2
.upvalue  "filesys"  ; 0
.const  "GetDrive"  ; 0
.const  nil  ; 1
.const  "FreeSpace"  ; 2
[01] getupval   2   0        ; filesys
[02] self       2   2   250  ; "GetDrive"
[03] move       4   0      
[04] call       2   3   2  
[05] eq         1   2   251  ; nil, to [7] if false
[06] jmp        5            ; to [12]
[07] gettable   3   2   252  ; "FreeSpace"
[08] lt         0   1   3    ; to [10] if true
[09] jmp        2            ; to [12]
[10] loadbool   3   1   0    ; true
[11] return     3   2      
[12] loadbool   3   0   0    ; false
[13] return     3   2      
[14] return     0   1      
; end of function


; function [32] definition (level 4)
; 1 upvalues, 1 params, 26 stacks
.function  1 1 0 26
.local  "size"  ; 0
.local  "drives"  ; 1
.local  "use"  ; 2
.local  "(for generator)"  ; 3
.local  "(for state)"  ; 4
.local  "drive"  ; 5
.upvalue  "methods"  ; 0
.const  "c:"  ; 0
.const  "d:"  ; 1
.const  "e:"  ; 2
.const  "f:"  ; 3
.const  "g:"  ; 4
.const  "h:"  ; 5
.const  "i:"  ; 6
.const  "j:"  ; 7
.const  "k:"  ; 8
.const  "l:"  ; 9
.const  "m:"  ; 10
.const  "n:"  ; 11
.const  "o:"  ; 12
.const  "p:"  ; 13
.const  "q:"  ; 14
.const  "r:"  ; 15
.const  "s:"  ; 16
.const  "t:"  ; 17
.const  "u:"  ; 18
.const  "v:"  ; 19
.const  "w:"  ; 20
.const  "x:"  ; 21
.const  "y:"  ; 22
.const  "z:"  ; 23
.const  "SufficientDriveSpace"  ; 24
[01] newtable   1   22  0    ; array=24, hash=0
[02] loadk      2   0        ; "c:"
[03] loadk      3   1        ; "d:"
[04] loadk      4   2        ; "e:"
[05] loadk      5   3        ; "f:"
[06] loadk      6   4        ; "g:"
[07] loadk      7   5        ; "h:"
[08] loadk      8   6        ; "i:"
[09] loadk      9   7        ; "j:"
[10] loadk      10  8        ; "k:"
[11] loadk      11  9        ; "l:"
[12] loadk      12  10       ; "m:"
[13] loadk      13  11       ; "n:"
[14] loadk      14  12       ; "o:"
[15] loadk      15  13       ; "p:"
[16] loadk      16  14       ; "q:"
[17] loadk      17  15       ; "r:"
[18] loadk      18  16       ; "s:"
[19] loadk      19  17       ; "t:"
[20] loadk      20  18       ; "u:"
[21] loadk      21  19       ; "v:"
[22] loadk      22  20       ; "w:"
[23] loadk      23  21       ; "x:"
[24] loadk      24  22       ; "y:"
[25] loadk      25  23       ; "z:"
[26] setlist    1   23       ; index 1 to 24
[27] loadnil    2   2      
[28] move       3   1      
[29] loadnil    4   5      
[30] tforprep   3   9        ; to [40]
[31] getupval   6   0        ; methods
[32] gettable   6   6   274  ; "SufficientDriveSpace"
[33] gettable   7   1   5  
[34] move       8   0      
[35] call       6   3   2  
[36] test       6   6   0    ; to [38] if true
[37] jmp        2            ; to [40]
[38] move       2   5      
[39] jmp        2            ; to [42]
[40] tforloop   3       0    ; to [42] if exit
[41] jmp        -11          ; to [31]
[42] gettable   3   1   2  
[43] return     3   2      
[44] return     0   1      
; end of function


; function [33] definition (level 4)
; 2 upvalues, 5 params, 13 stacks
.function  2 5 0 13
.local  "linkName"  ; 0
.local  "target"  ; 1
.local  "icon"  ; 2
.local  "workDir"  ; 3
.local  "arguments"  ; 4
.local  "CreateURLShortcut"  ; 5
.upvalue  "shellCtl"  ; 0
.upvalue  "methods"  ; 1
.const  "string"  ; 0
.const  "find"  ; 1
.const  ""  ; 2
.const  "://"  ; 3
.const  "CreateShortcut"  ; 4
.const  "ToUtf8"  ; 5

; function [0] definition (level 5)
; 3 upvalues, 0 params, 8 stacks
.function  3 0 0 8
.local  "fh"  ; 0
.upvalue  "linkName"  ; 0
.upvalue  "target"  ; 1
.upvalue  "icon"  ; 2
.const  "io"  ; 0
.const  "open"  ; 1
.const  ""  ; 2
.const  "w+"  ; 3
.const  "assert"  ; 4
.const  "writeLocal"  ; 5
.const  "write"  ; 6
.const  "[InternetShortcut]\nURL="  ; 7
.const  "\nIconFile="  ; 8
.const  "\nIconIndex=0\n"  ; 9
.const  "close"  ; 10
[01] getglobal  0   0        ; io
[02] gettable   0   0   251  ; "open"
[03] getupval   1   0        ; linkName
[04] test       1   1   1    ; to [6] if false
[05] jmp        1            ; to [7]
[06] loadk      1   2        ; ""
[07] loadk      2   3        ; "w+"
[08] call       0   3   2  
[09] getglobal  1   4        ; assert
[10] move       2   0      
[11] loadk      3   5        ; "writeLocal"
[12] call       1   3   1  
[13] self       1   0   256  ; "write"
[14] loadk      3   7        ; "[InternetShortcut]\nURL="
[15] getupval   4   1        ; target
[16] test       4   4   1    ; to [18] if false
[17] jmp        1            ; to [19]
[18] loadk      4   2        ; ""
[19] loadk      5   8        ; "\nIconFile="
[20] getupval   6   2        ; icon
[21] test       6   6   1    ; to [23] if false
[22] jmp        1            ; to [24]
[23] loadk      6   2        ; ""
[24] loadk      7   9        ; "\nIconIndex=0\n"
[25] call       1   7   1  
[26] self       1   0   260  ; "close"
[27] call       1   2   1  
[28] return     0   1      
; end of function

[01] closure    5   0        ; 3 upvalues
[02] move       0   0      
[03] move       0   1      
[04] move       0   2      
[05] getglobal  6   0        ; string
[06] gettable   6   6   251  ; "find"
[07] test       7   1   1    ; to [9] if false
[08] jmp        1            ; to [10]
[09] loadk      7   2        ; ""
[10] loadk      8   3        ; "://"
[11] call       6   3   2  
[12] test       6   6   0    ; to [14] if true
[13] jmp        3            ; to [17]
[14] move       6   5      
[15] call       6   1   1  
[16] jmp        11           ; to [28]
[17] getupval   6   0        ; shellCtl
[18] self       6   6   254  ; "CreateShortcut"
[19] getupval   8   1        ; methods
[20] gettable   8   8   255  ; "ToUtf8"
[21] move       9   0      
[22] call       8   2   2  
[23] move       9   1      
[24] move       10  2      
[25] move       11  3      
[26] move       12  4      
[27] call       6   7   1  
[28] return     0   1      
; end of function


; function [34] definition (level 4)
; 1 upvalues, 1 params, 8 stacks
.function  1 1 0 8
.local  "element"  ; 0
.local  "s"  ; 1
.local  "err"  ; 2
.upvalue  "methods"  ; 0
.const  ".."  ; 0
.const  "..\\"  ; 1
.const  "pcall"  ; 2
.const  "DeleteFile"  ; 3
.const  "io"  ; 4
.const  "write"  ; 5
.const  "\n"  ; 6
.const  "os"  ; 7
.const  "date"  ; 8
.const  "%c "  ; 9
.const  "Failed to remove file. "  ; 10
.const  "Warning: Attempted to remove \"..\". Ignored"  ; 11
[01] eq         1   0   250  ; "..", to [3] if false
[02] jmp        20           ; to [23]
[03] eq         1   0   251  ; "..\\", to [5] if false
[04] jmp        18           ; to [23]
[05] getglobal  1   2        ; pcall
[06] getupval   2   0        ; methods
[07] gettable   2   2   253  ; "DeleteFile"
[08] move       3   0      
[09] call       1   3   3  
[10] test       1   1   1    ; to [12] if false
[11] jmp        20           ; to [32]
[12] getglobal  3   4        ; io
[13] gettable   3   3   255  ; "write"
[14] loadk      4   6        ; "\n"
[15] getglobal  5   7        ; os
[16] gettable   5   5   258  ; "date"
[17] loadk      6   9        ; "%c "
[18] call       5   2   2  
[19] loadk      6   10       ; "Failed to remove file. "
[20] move       7   2      
[21] call       3   5   1  
[22] jmp        9            ; to [32]
[23] getglobal  1   4        ; io
[24] gettable   1   1   255  ; "write"
[25] loadk      2   6        ; "\n"
[26] getglobal  3   7        ; os
[27] gettable   3   3   258  ; "date"
[28] loadk      4   9        ; "%c "
[29] call       3   2   2  
[30] loadk      4   11       ; "Warning: Attempted to remove \"..\". Ignored"
[31] call       1   4   1  
[32] return     0   1      
; end of function


; function [35] definition (level 4)
; 0 upvalues, 1 params, 9 stacks
.function  0 1 0 9
.local  "path"  ; 0
.local  "n"  ; 1
.local  "parent"  ; 2
.local  "s"  ; 3
.const  "string"  ; 0
.const  "len"  ; 1
.const  "assert"  ; 2
.const  0  ; 3
.const  "Bad Path"  ; 4
.const  "gsub"  ; 5
.const  "/"  ; 6
.const  "\\"  ; 7
.const  "find"  ; 8
.const  1  ; 9
.const  "sub"  ; 10
.const  -1  ; 11
.const  2  ; 12
.const  -2  ; 13
.const  "io"  ; 14
.const  "write"  ; 15
.const  "\n"  ; 16
.const  "os"  ; 17
.const  "date"  ; 18
.const  "%c "  ; 19
.const  "Parent is "  ; 20
[01] getglobal  1   0        ; string
[02] gettable   1   1   251  ; "len"
[03] move       2   0      
[04] call       1   2   2  
[05] getglobal  2   2        ; assert
[06] lt         1   253 1    ; 0, to [8] if false
[07] jmp        1            ; to [9]
[08] loadbool   3   0   1    ; false, to [10]
[09] loadbool   3   1   0    ; true
[10] loadk      4   4        ; "Bad Path"
[11] call       2   3   1  
[12] getglobal  2   0        ; string
[13] gettable   2   2   255  ; "gsub"
[14] move       3   0      
[15] loadk      4   6        ; "/"
[16] loadk      5   7        ; "\\"
[17] call       2   4   2  
[18] jmp        1            ; to [20]
[19] sub        1   1   259  ; 1
[20] lt         0   253 1    ; 0, to [22] if true
[21] jmp        8            ; to [30]
[22] getglobal  3   0        ; string
[23] gettable   3   3   258  ; "find"
[24] move       4   0      
[25] loadk      5   7        ; "\\"
[26] move       6   1      
[27] call       3   4   2  
[28] test       3   3   0    ; to [30] if true
[29] jmp        -11          ; to [19]
[30] getglobal  3   0        ; string
[31] gettable   3   3   260  ; "sub"
[32] move       4   0      
[33] loadk      5   9        ; 1
[34] move       6   1      
[35] call       3   4   2  
[36] move       2   3      
[37] getglobal  3   0        ; string
[38] gettable   3   3   260  ; "sub"
[39] move       4   2      
[40] loadk      5   11       ; -1
[41] call       3   3   2  
[42] eq         0   3   257  ; "\\", to [44] if true
[43] jmp        7            ; to [51]
[44] getglobal  4   0        ; string
[45] gettable   4   4   260  ; "sub"
[46] move       5   2      
[47] loadk      6   9        ; 1
[48] loadk      7   13       ; -2
[49] call       4   4   2  
[50] move       2   4      
[51] getglobal  4   14       ; io
[52] gettable   4   4   265  ; "write"
[53] loadk      5   16       ; "\n"
[54] getglobal  6   17       ; os
[55] gettable   6   6   268  ; "date"
[56] loadk      7   19       ; "%c "
[57] call       6   2   2  
[58] loadk      7   20       ; "Parent is "
[59] move       8   2      
[60] call       4   5   1  
[61] return     2   2      
[62] return     0   1      
; end of function


; function [36] definition (level 4)
; 1 upvalues, 1 params, 8 stacks
.function  1 1 0 8
.local  "element"  ; 0
.local  "folder"  ; 1
.local  "filename"  ; 2
.upvalue  "methods"  ; 0
.const  "StripFilename"  ; 0
.const  "io"  ; 1
.const  "write"  ; 2
.const  "\n"  ; 3
.const  "os"  ; 4
.const  "date"  ; 5
.const  "%c "  ; 6
.const  "DeleteFolderIfEmpty "  ; 7
.const  "FolderIsEmpty"  ; 8
.const  "Delete as FolderIsEmpty("  ; 9
.const  "SafeDeleteFileElement"  ; 10
.const  "ParentPath"  ; 11
[01] getupval   1   0        ; methods
[02] gettable   1   1   250  ; "StripFilename"
[03] move       2   0      
[04] call       1   2   3  
[05] getglobal  3   1        ; io
[06] gettable   3   3   252  ; "write"
[07] loadk      4   3        ; "\n"
[08] getglobal  5   4        ; os
[09] gettable   5   5   255  ; "date"
[10] loadk      6   6        ; "%c "
[11] call       5   2   2  
[12] loadk      6   7        ; "DeleteFolderIfEmpty "
[13] move       7   1      
[14] call       3   5   1  
[15] jmp        19           ; to [35]
[16] getglobal  3   1        ; io
[17] gettable   3   3   252  ; "write"
[18] loadk      4   3        ; "\n"
[19] getglobal  5   4        ; os
[20] gettable   5   5   255  ; "date"
[21] loadk      6   6        ; "%c "
[22] call       5   2   2  
[23] loadk      6   9        ; "Delete as FolderIsEmpty("
[24] move       7   1      
[25] call       3   5   1  
[26] getupval   3   0        ; methods
[27] gettable   3   3   260  ; "SafeDeleteFileElement"
[28] move       4   1      
[29] call       3   2   1  
[30] getupval   3   0        ; methods
[31] gettable   3   3   261  ; "ParentPath"
[32] move       4   1      
[33] call       3   2   2  
[34] move       1   3      
[35] getupval   3   0        ; methods
[36] gettable   3   3   258  ; "FolderIsEmpty"
[37] move       4   1      
[38] call       3   2   2  
[39] test       3   3   1    ; to [41] if false
[40] jmp        -25          ; to [16]
[41] return     0   1      
; end of function


; function [37] definition (level 4)
; 2 upvalues, 1 params, 4 stacks
.function  2 1 0 4
.local  "linkName"  ; 0
.upvalue  "shellCtl"  ; 0
.upvalue  "methods"  ; 1
.const  "DeleteShortcut"  ; 0
.const  "DeleteEmptyFolders"  ; 1
[1] getupval   1   0        ; shellCtl
[2] self       1   1   250  ; "DeleteShortcut"
[3] move       3   0      
[4] call       1   3   1  
[5] getupval   1   1        ; methods
[6] gettable   1   1   251  ; "DeleteEmptyFolders"
[7] move       2   0      
[8] call       1   2   1  
[9] return     0   1      
; end of function


; function [38] definition (level 4)
; 3 upvalues, 0 params, 10 stacks
.function  3 0 0 10
.local  "module"  ; 0
.local  "_"  ; 1
.local  "_"  ; 2
.local  "path"  ; 3
.upvalue  "shellCtl"  ; 0
.upvalue  "regAccess"  ; 1
.upvalue  "methods"  ; 2
.const  "ModuleFileName"  ; 0
.const  "string"  ; 1
.const  "find"  ; 2
.const  "(.+)\\%w+%.%w%w%w"  ; 3
.const  "InstallProgramType"  ; 4
.const  "\\..\\installerMain.clf"  ; 5
.const  "rgi"  ; 6
.const  "RegMimeType"  ; 7
.const  ".rgi"  ; 8
.const  "application/vnd.rn-realarcade-rgi"  ; 9
.const  "rguninst"  ; 10
.const  "CreateRegKey"  ; 11
.const  "HKEY_LOCAL_MACHINE"  ; 12
.const  "Software\\Microsoft\\Internet Explorer\\Low Rights\\ElevationPolicy\\{D62088BE-DBCC-11DB-8D0A-D0DD55D89595}"  ; 13
.const  "Policy"  ; 14
.const  "3"  ; 15
.const  "DWORD"  ; 16
.const  "AppName"  ; 17
.const  "gameinstaller.exe"  ; 18
.const  "AppPath"  ; 19
.const  "WorkingDir"  ; 20
.const  "\\bin"  ; 21
[01] getupval   0   0        ; shellCtl
[02] self       0   0   250  ; "ModuleFileName"
[03] call       0   2   2  
[04] getglobal  1   1        ; string
[05] gettable   1   1   252  ; "find"
[06] move       2   0      
[07] loadk      3   3        ; "(.+)\\%w+%.%w%w%w"
[08] call       1   3   4  
[09] getupval   4   1        ; regAccess
[10] self       4   4   254  ; "InstallProgramType"
[11] move       6   0      
[12] move       7   3      
[13] loadk      8   5        ; "\\..\\installerMain.clf"
[14] concat     7   7   8  
[15] loadk      8   6        ; "rgi"
[16] loadbool   9   1   0    ; true
[17] call       4   6   1  
[18] getupval   4   1        ; regAccess
[19] self       4   4   257  ; "RegMimeType"
[20] loadk      6   8        ; ".rgi"
[21] loadk      7   9        ; "application/vnd.rn-realarcade-rgi"
[22] call       4   4   1  
[23] getupval   4   1        ; regAccess
[24] self       4   4   254  ; "InstallProgramType"
[25] move       6   0      
[26] move       7   3      
[27] loadk      8   5        ; "\\..\\installerMain.clf"
[28] concat     7   7   8  
[29] loadk      8   10       ; "rguninst"
[30] loadbool   9   0   0    ; false
[31] call       4   6   1  
[32] getupval   4   2        ; methods
[33] gettable   4   4   261  ; "CreateRegKey"
[34] loadk      5   12       ; "HKEY_LOCAL_MACHINE"
[35] loadk      6   13       ; "Software\\Microsoft\\Internet Explorer\\Low Rights\\ElevationPolicy\\{D62088BE-DBCC-11DB-8D0A-D0DD55D89595}"
[36] loadk      7   14       ; "Policy"
[37] loadk      8   15       ; "3"
[38] loadk      9   16       ; "DWORD"
[39] call       4   6   1  
[40] getupval   4   2        ; methods
[41] gettable   4   4   261  ; "CreateRegKey"
[42] loadk      5   12       ; "HKEY_LOCAL_MACHINE"
[43] loadk      6   13       ; "Software\\Microsoft\\Internet Explorer\\Low Rights\\ElevationPolicy\\{D62088BE-DBCC-11DB-8D0A-D0DD55D89595}"
[44] loadk      7   17       ; "AppName"
[45] loadk      8   18       ; "gameinstaller.exe"
[46] call       4   5   1  
[47] getupval   4   2        ; methods
[48] gettable   4   4   261  ; "CreateRegKey"
[49] loadk      5   12       ; "HKEY_LOCAL_MACHINE"
[50] loadk      6   13       ; "Software\\Microsoft\\Internet Explorer\\Low Rights\\ElevationPolicy\\{D62088BE-DBCC-11DB-8D0A-D0DD55D89595}"
[51] loadk      7   19       ; "AppPath"
[52] getupval   8   2        ; methods
[53] gettable   8   8   270  ; "WorkingDir"
[54] call       8   1   2  
[55] loadk      9   21       ; "\\bin"
[56] concat     8   8   9  
[57] call       4   5   1  
[58] return     0   1      
; end of function


; function [39] definition (level 4)
; 0 upvalues, 2 params, 11 stacks
.function  0 2 0 11
.local  "bundle"  ; 0
.local  "target"  ; 1
.local  "unrarMgr"  ; 2
.const  "assert"  ; 0
.const  "type"  ; 1
.const  "string"  ; 2
.const  "luacom"  ; 3
.const  "CreateObject"  ; 4
.const  "StubbyUtil.UnRar"  ; 5
.const  "comError"  ; 6
.const  "res"  ; 7
.const  "Connect"  ; 8
.const  "unRarEvents"  ; 9
.const  "io"  ; 10
.const  "write"  ; 11
.const  "\n"  ; 12
.const  "os"  ; 13
.const  "date"  ; 14
.const  "%c "  ; 15
.const  "UnRar: "  ; 16
.const  "tostring"  ; 17
.const  " to "  ; 18
.const  "Unpack"  ; 19
[01] getglobal  2   0        ; assert
[02] getglobal  3   1        ; type
[03] move       4   0      
[04] call       3   2   2  
[05] eq         1   3   252  ; "string", to [7] if false
[06] jmp        1            ; to [8]
[07] loadbool   3   0   1    ; false, to [9]
[08] loadbool   3   1   0    ; true
[09] call       2   2   1  
[10] getglobal  2   0        ; assert
[11] getglobal  3   1        ; type
[12] move       4   1      
[13] call       3   2   2  
[14] eq         1   3   252  ; "string", to [16] if false
[15] jmp        1            ; to [17]
[16] loadbool   3   0   1    ; false, to [18]
[17] loadbool   3   1   0    ; true
[18] call       2   2   1  
[19] getglobal  2   3        ; luacom
[20] gettable   2   2   254  ; "CreateObject"
[21] loadk      3   5        ; "StubbyUtil.UnRar"
[22] call       2   2   2  
[23] getglobal  3   0        ; assert
[24] move       4   2      
[25] loadk      5   6        ; "comError"
[26] call       3   3   1  
[27] getglobal  3   3        ; luacom
[28] gettable   3   3   258  ; "Connect"
[29] move       4   2      
[30] getglobal  5   9        ; unRarEvents
[31] call       3   3   2  
[32] setglobal  3   7        ; res
[33] getglobal  3   0        ; assert
[34] getglobal  4   7        ; res
[35] loadk      5   6        ; "comError"
[36] call       3   3   1  
[37] getglobal  3   10       ; io
[38] gettable   3   3   261  ; "write"
[39] loadk      4   12       ; "\n"
[40] getglobal  5   13       ; os
[41] gettable   5   5   264  ; "date"
[42] loadk      6   15       ; "%c "
[43] call       5   2   2  
[44] loadk      6   16       ; "UnRar: "
[45] getglobal  7   17       ; tostring
[46] move       8   0      
[47] call       7   2   2  
[48] loadk      8   18       ; " to "
[49] getglobal  9   17       ; tostring
[50] move       10  1      
[51] call       9   2   0  
[52] call       3   0   1  
[53] self       3   2   269  ; "Unpack"
[54] move       5   0      
[55] move       6   1      
[56] call       3   4   1  
[57] return     0   1      
; end of function


; function [40] definition (level 4)
; 0 upvalues, 5 params, 15 stacks
.function  0 5 0 15
.local  "app"  ; 0
.local  "params"  ; 1
.local  "hide"  ; 2
.local  "installStep"  ; 3
.local  "waitProc"  ; 4
.local  "complete"  ; 5
.local  "procMgr"  ; 6
.const  "luacom"  ; 0
.const  "CreateObject"  ; 1
.const  "StubbyUtil.ProcessMgr"  ; 2
.const  "assert"  ; 3
.const  "comError"  ; 4
.const  "io"  ; 5
.const  "write"  ; 6
.const  "\n"  ; 7
.const  "os"  ; 8
.const  "date"  ; 9
.const  "%c "  ; 10
.const  "Launching: "  ; 11
.const  ""  ; 12
.const  "Exec"  ; 13
.const  "createProc"  ; 14
.const  "IsFinished"  ; 15
.const  "ExitCode"  ; 16

; function [0] definition (level 5)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
[2] return     0   1      
; end of function

[01] loadbool   5   0   0    ; false
[02] getglobal  6   0        ; luacom
[03] gettable   6   6   251  ; "CreateObject"
[04] loadk      7   2        ; "StubbyUtil.ProcessMgr"
[05] call       6   2   2  
[06] getglobal  7   3        ; assert
[07] move       8   6      
[08] loadk      9   4        ; "comError"
[09] call       7   3   1  
[10] getglobal  7   5        ; io
[11] gettable   7   7   256  ; "write"
[12] loadk      8   7        ; "\n"
[13] getglobal  9   8        ; os
[14] gettable   9   9   259  ; "date"
[15] loadk      10  10       ; "%c "
[16] call       9   2   2  
[17] loadk      10  11       ; "Launching: "
[18] move       11  0      
[19] test       12  1   1    ; to [21] if false
[20] jmp        1            ; to [22]
[21] loadk      12  12       ; ""
[22] call       7   6   1  
[23] getglobal  7   3        ; assert
[24] self       8   6   263  ; "Exec"
[25] move       10  0      
[26] test       11  1   1    ; to [28] if false
[27] jmp        1            ; to [29]
[28] loadk      11  12       ; ""
[29] move       12  2      
[30] loadbool   13  1   0    ; true
[31] loadnil    14  14     
[32] call       8   7   2  
[33] loadk      9   14       ; "createProc"
[34] call       7   3   1  
[35] test       4   4   1    ; to [37] if false
[36] jmp        5            ; to [42]
[37] closure    4   0        ; 0 upvalues
[38] jmp        3            ; to [42]
[39] move       7   4      
[40] move       8   3      
[41] call       7   2   1  
[42] self       7   6   265  ; "IsFinished"
[43] call       7   2   2  
[44] loadbool   8   0   0    ; false
[45] eq         1   7   8    ; to [47] if false
[46] jmp        -8           ; to [39]
[47] self       7   6   266  ; "ExitCode"
[48] tailcall   7   2   0  
[49] return     7   0      
[50] return     0   1      
; end of function


; function [41] definition (level 4)
; 1 upvalues, 1 params, 8 stacks
.function  1 1 0 8
.local  "name"  ; 0
.local  "m"  ; 1
.local  "handle"  ; 2
.upvalue  "procMgr"  ; 0
.const  "ConstTable"  ; 0
.const  "CreateNamedMutex"  ; 1
.const  "io"  ; 2
.const  "write"  ; 3
.const  "\n"  ; 4
.const  "os"  ; 5
.const  "date"  ; 6
.const  "%c "  ; 7
.const  "Error: Failed to create Mutex, "  ; 8
.const  "Lock"  ; 9
.const  "Wait"  ; 10
.const  "Release"  ; 11
.const  "Close"  ; 12

; function [0] definition (level 5)
; 2 upvalues, 0 params, 3 stacks
.function  2 0 0 3
.upvalue  "procMgr"  ; 0
.upvalue  "handle"  ; 1
.const  "ObtainMutex"  ; 0
[1] getupval   0   0        ; procMgr
[2] self       0   0   250  ; "ObtainMutex"
[3] getupval   2   1        ; handle
[4] tailcall   0   3   0  
[5] return     0   0      
[6] return     0   1      
; end of function


; function [1] definition (level 5)
; 2 upvalues, 1 params, 5 stacks
.function  2 1 0 5
.local  "timeout"  ; 0
.upvalue  "procMgr"  ; 0
.upvalue  "handle"  ; 1
.const  nil  ; 0
.const  10000  ; 1
.const  "WaitOnMutex"  ; 2
[01] eq         0   0   250  ; nil, to [3] if true
[02] jmp        1            ; to [4]
[03] loadk      0   1        ; 10000
[04] getupval   1   0        ; procMgr
[05] self       1   1   252  ; "WaitOnMutex"
[06] getupval   3   1        ; handle
[07] move       4   0      
[08] tailcall   1   4   0  
[09] return     1   0      
[10] return     0   1      
; end of function


; function [2] definition (level 5)
; 2 upvalues, 0 params, 3 stacks
.function  2 0 0 3
.upvalue  "procMgr"  ; 0
.upvalue  "handle"  ; 1
.const  "ReleaseMutex"  ; 0
[1] getupval   0   0        ; procMgr
[2] self       0   0   250  ; "ReleaseMutex"
[3] getupval   2   1        ; handle
[4] call       0   3   1  
[5] return     0   1      
; end of function


; function [3] definition (level 5)
; 2 upvalues, 0 params, 3 stacks
.function  2 0 0 3
.upvalue  "procMgr"  ; 0
.upvalue  "handle"  ; 1
.const  "CloseMutex"  ; 0
[1] getupval   0   0        ; procMgr
[2] self       0   0   250  ; "CloseMutex"
[3] getupval   2   1        ; handle
[4] call       0   3   1  
[5] return     0   1      
; end of function

[01] getglobal  1   0        ; ConstTable
[02] call       1   1   2  
[03] getupval   2   0        ; procMgr
[04] self       2   2   251  ; "CreateNamedMutex"
[05] move       4   0      
[06] call       2   3   2  
[07] test       2   2   1    ; to [9] if false
[08] jmp        10           ; to [19]
[09] getglobal  3   2        ; io
[10] gettable   3   3   253  ; "write"
[11] loadk      4   4        ; "\n"
[12] getglobal  5   5        ; os
[13] gettable   5   5   256  ; "date"
[14] loadk      6   7        ; "%c "
[15] call       5   2   2  
[16] loadk      6   8        ; "Error: Failed to create Mutex, "
[17] move       7   0      
[18] call       3   5   1  
[19] closure    3   0        ; 2 upvalues
[20] getupval   0   0        ; procMgr
[21] move       0   2      
[22] settable   1   259 3    ; "Lock"
[23] closure    3   1        ; 2 upvalues
[24] getupval   0   0        ; procMgr
[25] move       0   2      
[26] settable   1   260 3    ; "Wait"
[27] closure    3   2        ; 2 upvalues
[28] getupval   0   0        ; procMgr
[29] move       0   2      
[30] settable   1   261 3    ; "Release"
[31] closure    3   3        ; 2 upvalues
[32] getupval   0   0        ; procMgr
[33] move       0   2      
[34] settable   1   262 3    ; "Close"
[35] return     1   2      
[36] return     0   1      
; end of function


; function [42] definition (level 4)
; 1 upvalues, 0 params, 2 stacks
.function  1 0 0 2
.local  "machineID"  ; 0
.upvalue  "shellCtl"  ; 0
.const  "GetSystemID"  ; 0
[1] getupval   0   0        ; shellCtl
[2] self       0   0   250  ; "GetSystemID"
[3] call       0   2   2  
[4] return     0   2      
[5] return     0   1      
; end of function


; function [43] definition (level 4)
; 1 upvalues, 0 params, 2 stacks
.function  1 0 0 2
.local  "pid"  ; 0
.upvalue  "shellCtl"  ; 0
.const  "GetPid"  ; 0
[1] getupval   0   0        ; shellCtl
[2] self       0   0   250  ; "GetPid"
[3] call       0   2   2  
[4] return     0   2      
[5] return     0   1      
; end of function


; function [44] definition (level 4)
; 1 upvalues, 1 params, 4 stacks
.function  1 1 0 4
.local  "message"  ; 0
.upvalue  "shellCtl"  ; 0
.const  "LogMessage"  ; 0
[1] getupval   1   0        ; shellCtl
[2] self       1   1   250  ; "LogMessage"
[3] move       3   0      
[4] call       1   3   1  
[5] return     0   1      
; end of function


; function [45] definition (level 4)
; 1 upvalues, 0 params, 4 stacks
.function  1 0 0 4
.upvalue  "methods"  ; 0
.const  "GetRegKeyValue"  ; 0
.const  "HKEY_LOCAL_MACHINE"  ; 1
.const  "Software\\Microsoft\\Internet Explorer"  ; 2
.const  "Version"  ; 3
[1] getupval   0   0        ; methods
[2] gettable   0   0   250  ; "GetRegKeyValue"
[3] loadk      1   1        ; "HKEY_LOCAL_MACHINE"
[4] loadk      2   2        ; "Software\\Microsoft\\Internet Explorer"
[5] loadk      3   3        ; "Version"
[6] tailcall   0   4   0  
[7] return     0   0      
[8] return     0   1      
; end of function


; function [46] definition (level 4)
; 1 upvalues, 0 params, 9 stacks
.function  1 0 0 9
.local  "fChromePresent"  ; 0
.local  "chromeapi"  ; 1
.local  "dllPath"  ; 2
.local  "regPath"  ; 3
.local  "RecordQuery"  ; 4
.local  "reasons"  ; 5
.local  "GCCC_ERROR_USERLEVELALREADYPRESENT"  ; 6
.local  "GCCC_ERROR_SYSTEMLEVELALREADYPRESENT"  ; 7
.upvalue  "methods"  ; 0
.const  "luacom"  ; 0
.const  "CreateObject"  ; 1
.const  "GCHROME.ChromeCompatibilityChecker"  ; 2
.const  "io"  ; 3
.const  "write"  ; 4
.const  "\n"  ; 5
.const  "os"  ; 6
.const  "date"  ; 7
.const  "%c "  ; 8
.const  "In IsChromePresent"  ; 9
.const  "bin\\GCHROME.dll"  ; 10
.const  "COMRegPath"  ; 11
.const  "LaunchProcess"  ; 12
.const  " /s \""  ; 13
.const  "\""  ; 14
.const  "ChromeCheck"  ; 15
.const  1  ; 16
.const  2  ; 17
.const  "IsChromePresent returning "  ; 18
.const  "tostring"  ; 19
[01] loadbool   0   0   0    ; false
[02] getglobal  1   0        ; luacom
[03] gettable   1   1   251  ; "CreateObject"
[04] loadk      2   2        ; "GCHROME.ChromeCompatibilityChecker"
[05] call       1   2   2  
[06] getglobal  2   3        ; io
[07] gettable   2   2   254  ; "write"
[08] loadk      3   5        ; "\n"
[09] getglobal  4   6        ; os
[10] gettable   4   4   257  ; "date"
[11] loadk      5   8        ; "%c "
[12] call       4   2   2  
[13] loadk      5   9        ; "In IsChromePresent"
[14] call       2   4   1  
[15] test       1   1   1    ; to [17] if false
[16] jmp        18           ; to [35]
[17] loadk      2   10       ; "bin\\GCHROME.dll"
[18] getupval   3   0        ; methods
[19] gettable   3   3   261  ; "COMRegPath"
[20] call       3   1   2  
[21] getupval   4   0        ; methods
[22] gettable   4   4   262  ; "LaunchProcess"
[23] move       5   3      
[24] loadk      6   13       ; " /s \""
[25] move       7   2      
[26] loadk      8   14       ; "\""
[27] concat     6   6   8  
[28] loadbool   7   1   0    ; true
[29] call       4   4   1  
[30] getglobal  4   0        ; luacom
[31] gettable   4   4   251  ; "CreateObject"
[32] loadk      5   2        ; "GCHROME.ChromeCompatibilityChecker"
[33] call       4   2   2  
[34] move       1   4      
[35] test       1   1   0    ; to [37] if true
[36] jmp        13           ; to [50]
[37] loadbool   2   0   0    ; false
[38] self       3   1   265  ; "ChromeCheck"
[39] move       5   2      
[40] call       3   3   2  
[41] loadk      4   16       ; 1
[42] loadk      5   17       ; 2
[43] test       3   3   0    ; to [45] if true
[44] jmp        5            ; to [50]
[45] eq         1   3   4    ; to [47] if false
[46] jmp        2            ; to [49]
[47] eq         0   3   5    ; to [49] if true
[48] jmp        1            ; to [50]
[49] loadbool   0   1   0    ; true
[50] getglobal  2   3        ; io
[51] gettable   2   2   254  ; "write"
[52] loadk      3   5        ; "\n"
[53] getglobal  4   6        ; os
[54] gettable   4   4   257  ; "date"
[55] loadk      5   8        ; "%c "
[56] call       4   2   2  
[57] loadk      5   18       ; "IsChromePresent returning "
[58] getglobal  6   19       ; tostring
[59] move       7   0      
[60] call       6   2   2  
[61] concat     5   5   6  
[62] call       2   4   1  
[63] return     0   2      
[64] return     0   1      
; end of function


; function [47] definition (level 4)
; 1 upvalues, 0 params, 4 stacks
.function  1 0 0 4
.upvalue  "methods"  ; 0
.const  "GetRegKeyValue"  ; 0
.const  "HKEY_LOCAL_MACHINE"  ; 1
.const  "Software\\Google\\Update\\Clients\\{8A69D345-D564-463c-AFF1-A69D9E530F96}"  ; 2
.const  "pv"  ; 3
.const  "HKEY_CURRENT_USER"  ; 4
.const  "Software\\Google\\Update\\ClientState\\{8A69D345-D564-463c-AFF1-A69D9E530F96}"  ; 5
[01] getupval   0   0        ; methods
[02] gettable   0   0   250  ; "GetRegKeyValue"
[03] loadk      1   1        ; "HKEY_LOCAL_MACHINE"
[04] loadk      2   2        ; "Software\\Google\\Update\\Clients\\{8A69D345-D564-463c-AFF1-A69D9E530F96}"
[05] loadk      3   3        ; "pv"
[06] call       0   4   2  
[07] test       0   0   1    ; to [9] if false
[08] jmp        22           ; to [31]
[09] getupval   0   0        ; methods
[10] gettable   0   0   250  ; "GetRegKeyValue"
[11] loadk      1   4        ; "HKEY_CURRENT_USER"
[12] loadk      2   2        ; "Software\\Google\\Update\\Clients\\{8A69D345-D564-463c-AFF1-A69D9E530F96}"
[13] loadk      3   3        ; "pv"
[14] call       0   4   2  
[15] test       0   0   1    ; to [17] if false
[16] jmp        14           ; to [31]
[17] getupval   0   0        ; methods
[18] gettable   0   0   250  ; "GetRegKeyValue"
[19] loadk      1   1        ; "HKEY_LOCAL_MACHINE"
[20] loadk      2   5        ; "Software\\Google\\Update\\ClientState\\{8A69D345-D564-463c-AFF1-A69D9E530F96}"
[21] loadk      3   3        ; "pv"
[22] call       0   4   2  
[23] test       0   0   1    ; to [25] if false
[24] jmp        6            ; to [31]
[25] getupval   0   0        ; methods
[26] gettable   0   0   250  ; "GetRegKeyValue"
[27] loadk      1   4        ; "HKEY_CURRENT_USER"
[28] loadk      2   5        ; "Software\\Google\\Update\\ClientState\\{8A69D345-D564-463c-AFF1-A69D9E530F96}"
[29] loadk      3   3        ; "pv"
[30] call       0   4   2  
[31] return     0   2      
[32] return     0   1      
; end of function


; function [48] definition (level 4)
; 1 upvalues, 0 params, 4 stacks
.function  1 0 0 4
.upvalue  "methods"  ; 0
.const  "GetRegKeyValue"  ; 0
.const  "HKEY_LOCAL_MACHINE"  ; 1
.const  "Software\\Mozilla\\Mozilla Firefox"  ; 2
.const  "CurrentVersion"  ; 3
[1] getupval   0   0        ; methods
[2] gettable   0   0   250  ; "GetRegKeyValue"
[3] loadk      1   1        ; "HKEY_LOCAL_MACHINE"
[4] loadk      2   2        ; "Software\\Mozilla\\Mozilla Firefox"
[5] loadk      3   3        ; "CurrentVersion"
[6] tailcall   0   4   0  
[7] return     0   0      
[8] return     0   1      
; end of function


; function [49] definition (level 4)
; 0 upvalues, 1 params, 7 stacks
.function  0 1 0 7
.local  "name"  ; 0
.local  "m"  ; 1
.local  "procMgr"  ; 2
.local  "handle"  ; 3
.const  "ConstTable"  ; 0
.const  "luacom"  ; 1
.const  "CreateObject"  ; 2
.const  "StubbyUtil.ProcessMgr"  ; 3
.const  "CreateNamedEvent"  ; 4
.const  "io"  ; 5
.const  "write"  ; 6
.const  "\nError: Failed to create Event, "  ; 7
.const  "Fire"  ; 8
.const  "Close"  ; 9

; function [0] definition (level 5)
; 2 upvalues, 0 params, 3 stacks
.function  2 0 0 3
.upvalue  "procMgr"  ; 0
.upvalue  "handle"  ; 1
.const  "FireEvent"  ; 0
[1] getupval   0   0        ; procMgr
[2] self       0   0   250  ; "FireEvent"
[3] getupval   2   1        ; handle
[4] call       0   3   1  
[5] return     0   1      
; end of function


; function [1] definition (level 5)
; 2 upvalues, 0 params, 3 stacks
.function  2 0 0 3
.upvalue  "procMgr"  ; 0
.upvalue  "handle"  ; 1
.const  "CloseEvent"  ; 0
[1] getupval   0   0        ; procMgr
[2] self       0   0   250  ; "CloseEvent"
[3] getupval   2   1        ; handle
[4] call       0   3   1  
[5] return     0   1      
; end of function

[01] getglobal  1   0        ; ConstTable
[02] call       1   1   2  
[03] getglobal  2   1        ; luacom
[04] gettable   2   2   252  ; "CreateObject"
[05] loadk      3   3        ; "StubbyUtil.ProcessMgr"
[06] call       2   2   2  
[07] self       3   2   254  ; "CreateNamedEvent"
[08] move       5   0      
[09] call       3   3   2  
[10] test       3   3   1    ; to [12] if false
[11] jmp        5            ; to [17]
[12] getglobal  4   5        ; io
[13] gettable   4   4   256  ; "write"
[14] loadk      5   7        ; "\nError: Failed to create Event, "
[15] move       6   0      
[16] call       4   3   1  
[17] closure    4   0        ; 2 upvalues
[18] move       0   2      
[19] move       0   3      
[20] settable   1   258 4    ; "Fire"
[21] closure    4   1        ; 2 upvalues
[22] move       0   2      
[23] move       0   3      
[24] settable   1   259 4    ; "Close"
[25] return     1   2      
[26] return     0   1      
; end of function


; function [50] definition (level 4)
; 1 upvalues, 2 params, 11 stacks
.function  1 2 0 11
.local  "url"  ; 0
.local  "item"  ; 1
.local  "s"  ; 2
.local  "retVal"  ; 3
.upvalue  "cookieMnstr"  ; 0
.const  "pcall"  ; 0
.const  "getCookieItem"  ; 1
.const  "io"  ; 2
.const  "write"  ; 3
.const  "\n"  ; 4
.const  "os"  ; 5
.const  "date"  ; 6
.const  "%c "  ; 7
.const  "Error reading cookie, "  ; 8
.const  " "  ; 9
.const  "unk"  ; 10
[01] getglobal  2   0        ; pcall
[02] getupval   3   0        ; cookieMnstr
[03] gettable   3   3   251  ; "getCookieItem"
[04] getupval   4   0        ; cookieMnstr
[05] move       5   0      
[06] move       6   1      
[07] call       2   5   3  
[08] test       2   2   0    ; to [10] if true
[09] jmp        2            ; to [12]
[10] return     3   2      
[11] jmp        16           ; to [28]
[12] getglobal  4   2        ; io
[13] gettable   4   4   253  ; "write"
[14] loadk      5   4        ; "\n"
[15] getglobal  6   5        ; os
[16] gettable   6   6   256  ; "date"
[17] loadk      7   7        ; "%c "
[18] call       6   2   2  
[19] loadk      7   8        ; "Error reading cookie, "
[20] move       8   1      
[21] loadk      9   9        ; " "
[22] test       10  3   1    ; to [24] if false
[23] jmp        1            ; to [25]
[24] loadk      10  10       ; "unk"
[25] call       4   7   1  
[26] loadnil    4   4      
[27] return     4   2      
[28] return     0   1      
; end of function


; function [51] definition (level 4)
; 1 upvalues, 0 params, 2 stacks
.function  1 0 0 2
.upvalue  "shellCtl"  ; 0
.const  "RefreshAddRemovePrograms"  ; 0
[1] getupval   0   0        ; shellCtl
[2] self       0   0   250  ; "RefreshAddRemovePrograms"
[3] call       0   2   1  
[4] return     0   1      
; end of function


; function [52] definition (level 4)
; 1 upvalues, 0 params, 2 stacks
.function  1 0 0 2
.upvalue  "shellCtl"  ; 0
.const  "PlatformInfo"  ; 0
[1] getupval   0   0        ; shellCtl
[2] self       0   0   250  ; "PlatformInfo"
[3] tailcall   0   2   0  
[4] return     0   0      
[5] return     0   1      
; end of function


; function [53] definition (level 4)
; 2 upvalues, 0 params, 7 stacks
.function  2 0 0 7
.local  "browserName"  ; 0
.local  "strBrowser"  ; 1
.upvalue  "methods"  ; 0
.upvalue  "filenameExp"  ; 1
.const  "GetRegKeyValue"  ; 0
.const  "HKCU"  ; 1
.const  "Software\\Clients\\StartMenuInternet"  ; 2
.const  nil  ; 3
.const  ""  ; 4
.const  "HKEY_CLASSES_ROOT"  ; 5
.const  "http\\shell\\open\\command"  ; 6
.const  "_"  ; 7
.const  "string"  ; 8
.const  "find"  ; 9
.const  ".+\\("  ; 10
.const  ")"  ; 11
[01] getupval   0   0        ; methods
[02] gettable   0   0   250  ; "GetRegKeyValue"
[03] loadk      1   1        ; "HKCU"
[04] loadk      2   2        ; "Software\\Clients\\StartMenuInternet"
[05] call       0   3   2  
[06] eq         1   0   253  ; nil, to [8] if false
[07] jmp        2            ; to [10]
[08] eq         0   0   254  ; "", to [10] if true
[09] jmp        18           ; to [28]
[10] getupval   1   0        ; methods
[11] gettable   1   1   250  ; "GetRegKeyValue"
[12] loadk      2   5        ; "HKEY_CLASSES_ROOT"
[13] loadk      3   6        ; "http\\shell\\open\\command"
[14] call       1   3   2  
[15] test       1   1   0    ; to [17] if true
[16] jmp        11           ; to [28]
[17] getglobal  2   8        ; string
[18] gettable   2   2   259  ; "find"
[19] move       3   1      
[20] loadk      4   10       ; ".+\\("
[21] getupval   5   1        ; filenameExp
[22] loadk      6   11       ; ")"
[23] concat     4   4   6  
[24] call       2   3   4  
[25] move       0   4      
[26] setglobal  3   7        ; _
[27] setglobal  2   7        ; _
[28] return     0   2      
[29] return     0   1      
; end of function


; function [54] definition (level 4)
; 2 upvalues, 0 params, 10 stacks
.function  2 0 0 10
.local  "strBrowser"  ; 0
.local  "browserExe"  ; 1
.upvalue  "methods"  ; 0
.upvalue  "filenameExp"  ; 1
.const  "PlatformInfoStr"  ; 0
.const  "GetRegKeyValue"  ; 1
.const  "HKEY_CLASSES_ROOT"  ; 2
.const  "http\\shell\\open\\command"  ; 3
.const  "_"  ; 4
.const  "string"  ; 5
.const  "find"  ; 6
.const  ".+\\("  ; 7
.const  ")"  ; 8
.const  "IsChromePresent"  ; 9
.const  "unk"  ; 10
.const  "|IE: "  ; 11
.const  "IEVersion"  ; 12
.const  "none"  ; 13
.const  "|Firefox: "  ; 14
.const  "FireFoxVersion"  ; 15
.const  "|Chrome: "  ; 16
.const  "ChromeVersion"  ; 17
.const  "|Chrome: none"  ; 18
[01] getupval   0   0        ; methods
[02] gettable   0   0   250  ; "PlatformInfoStr"
[03] test       0   0   1    ; to [5] if false
[04] jmp        73           ; to [78]
[05] getupval   0   0        ; methods
[06] gettable   0   0   251  ; "GetRegKeyValue"
[07] loadk      1   2        ; "HKEY_CLASSES_ROOT"
[08] loadk      2   3        ; "http\\shell\\open\\command"
[09] call       0   3   2  
[10] loadnil    1   1      
[11] test       0   0   0    ; to [13] if true
[12] jmp        11           ; to [24]
[13] getglobal  2   5        ; string
[14] gettable   2   2   256  ; "find"
[15] move       3   0      
[16] loadk      4   7        ; ".+\\("
[17] getupval   5   1        ; filenameExp
[18] loadk      6   8        ; ")"
[19] concat     4   4   6  
[20] call       2   3   4  
[21] move       1   4      
[22] setglobal  3   4        ; _
[23] setglobal  2   4        ; _
[24] getupval   2   0        ; methods
[25] gettable   2   2   259  ; "IsChromePresent"
[26] call       2   1   2  
[27] test       2   2   0    ; to [29] if true
[28] jmp        28           ; to [57]
[29] getupval   2   0        ; methods
[30] test       3   1   1    ; to [32] if false
[31] jmp        1            ; to [33]
[32] loadk      3   10       ; "unk"
[33] loadk      4   11       ; "|IE: "
[34] getupval   5   0        ; methods
[35] gettable   5   5   262  ; "IEVersion"
[36] call       5   1   2  
[37] test       5   5   1    ; to [39] if false
[38] jmp        1            ; to [40]
[39] loadk      5   13       ; "none"
[40] loadk      6   14       ; "|Firefox: "
[41] getupval   7   0        ; methods
[42] gettable   7   7   265  ; "FireFoxVersion"
[43] call       7   1   2  
[44] test       7   7   1    ; to [46] if false
[45] jmp        1            ; to [47]
[46] loadk      7   13       ; "none"
[47] loadk      8   16       ; "|Chrome: "
[48] getupval   9   0        ; methods
[49] gettable   9   9   267  ; "ChromeVersion"
[50] call       9   1   2  
[51] test       9   9   1    ; to [53] if false
[52] jmp        1            ; to [54]
[53] loadk      9   13       ; "none"
[54] concat     3   3   9  
[55] settable   2   250 3    ; "PlatformInfoStr"
[56] jmp        21           ; to [78]
[57] getupval   2   0        ; methods
[58] test       3   1   1    ; to [60] if false
[59] jmp        1            ; to [61]
[60] loadk      3   10       ; "unk"
[61] loadk      4   11       ; "|IE: "
[62] getupval   5   0        ; methods
[63] gettable   5   5   262  ; "IEVersion"
[64] call       5   1   2  
[65] test       5   5   1    ; to [67] if false
[66] jmp        1            ; to [68]
[67] loadk      5   13       ; "none"
[68] loadk      6   14       ; "|Firefox: "
[69] getupval   7   0        ; methods
[70] gettable   7   7   265  ; "FireFoxVersion"
[71] call       7   1   2  
[72] test       7   7   1    ; to [74] if false
[73] jmp        1            ; to [75]
[74] loadk      7   13       ; "none"
[75] loadk      8   18       ; "|Chrome: none"
[76] concat     3   3   8  
[77] settable   2   250 3    ; "PlatformInfoStr"
[78] getupval   0   0        ; methods
[79] gettable   0   0   250  ; "PlatformInfoStr"
[80] return     0   2      
[81] return     0   1      
; end of function


; function [55] definition (level 4)
; 1 upvalues, 1 params, 4 stacks
.function  1 1 0 4
.local  "reqSize"  ; 0
.upvalue  "shellCtl"  ; 0
.const  "GetAvailableDrive"  ; 0
[1] getupval   1   0        ; shellCtl
[2] self       1   1   250  ; "GetAvailableDrive"
[3] move       3   0      
[4] tailcall   1   3   0  
[5] return     1   0      
[6] return     0   1      
; end of function


; function [56] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
.const  "GetEnvironmentString"  ; 0
.const  "ALLUSERSPROFILE"  ; 1
[1] getglobal  0   0        ; GetEnvironmentString
[2] loadk      1   1        ; "ALLUSERSPROFILE"
[3] tailcall   0   2   0  
[4] return     0   0      
[5] return     0   1      
; end of function


; function [57] definition (level 4)
; 1 upvalues, 0 params, 4 stacks
.function  1 0 0 4
.local  "CSIDL_COMMON_APPDATA"  ; 0
.local  "path"  ; 1
.upvalue  "shellCtl"  ; 0
.const  35  ; 0
.const  "GetFolderPath"  ; 1
[1] loadk      0   0        ; 35
[2] getupval   1   0        ; shellCtl
[3] self       1   1   251  ; "GetFolderPath"
[4] move       3   0      
[5] call       1   3   2  
[6] return     1   2      
[7] return     0   1      
; end of function


; function [58] definition (level 4)
; 1 upvalues, 1 params, 7 stacks
.function  1 1 0 7
.local  "ContentId"  ; 0
.local  "strPathLicense"  ; 1
.upvalue  "methods"  ; 0
.const  "GetLicenseRoot"  ; 0
.const  "\\Trymedia\\Licenses\\"  ; 1
.const  ".dlcn"  ; 2
.const  "FileExists"  ; 3
.const  "DeleteFile"  ; 4
.const  "io"  ; 5
.const  "write"  ; 6
.const  "\n"  ; 7
.const  "os"  ; 8
.const  "date"  ; 9
.const  "%c "  ; 10
.const  "UpdateDip File does not exist "  ; 11
.const  "UpdateDip No ContentId. Dip not updated"  ; 12
[01] test       0   0   0    ; to [3] if true
[02] jmp        29           ; to [32]
[03] getupval   1   0        ; methods
[04] gettable   1   1   250  ; "GetLicenseRoot"
[05] call       1   1   2  
[06] loadk      2   1        ; "\\Trymedia\\Licenses\\"
[07] move       3   0      
[08] loadk      4   2        ; ".dlcn"
[09] concat     1   1   4  
[10] getupval   2   0        ; methods
[11] gettable   2   2   253  ; "FileExists"
[12] move       3   1      
[13] call       2   2   2  
[14] test       2   2   0    ; to [16] if true
[15] jmp        5            ; to [21]
[16] getupval   2   0        ; methods
[17] gettable   2   2   254  ; "DeleteFile"
[18] move       3   1      
[19] call       2   2   1  
[20] jmp        20           ; to [41]
[21] getglobal  2   5        ; io
[22] gettable   2   2   256  ; "write"
[23] loadk      3   7        ; "\n"
[24] getglobal  4   8        ; os
[25] gettable   4   4   259  ; "date"
[26] loadk      5   10       ; "%c "
[27] call       4   2   2  
[28] loadk      5   11       ; "UpdateDip File does not exist "
[29] move       6   1      
[30] call       2   5   1  
[31] jmp        9            ; to [41]
[32] getglobal  1   5        ; io
[33] gettable   1   1   256  ; "write"
[34] loadk      2   7        ; "\n"
[35] getglobal  3   8        ; os
[36] gettable   3   3   259  ; "date"
[37] loadk      4   10       ; "%c "
[38] call       3   2   2  
[39] loadk      4   12       ; "UpdateDip No ContentId. Dip not updated"
[40] call       1   4   1  
[41] return     0   1      
; end of function


; function [59] definition (level 4)
; 0 upvalues, 1 params, 5 stacks
.function  0 1 0 5
.local  "path"  ; 0
.const  "type"  ; 0
.const  "string"  ; 1
.const  "sub"  ; 2
.const  2  ; 3
.const  3  ; 4
.const  ":\\"  ; 5
.const  1  ; 6
[01] getglobal  1   0        ; type
[02] move       2   0      
[03] call       1   2   2  
[04] eq         0   1   251  ; "string", to [6] if true
[05] jmp        15           ; to [21]
[06] getglobal  1   1        ; string
[07] gettable   1   1   252  ; "sub"
[08] move       2   0      
[09] loadk      3   3        ; 2
[10] loadk      4   4        ; 3
[11] call       1   4   2  
[12] eq         0   1   255  ; ":\\", to [14] if true
[13] jmp        7            ; to [21]
[14] getglobal  1   1        ; string
[15] gettable   1   1   252  ; "sub"
[16] move       2   0      
[17] loadk      3   6        ; 1
[18] loadk      4   4        ; 3
[19] tailcall   1   4   0  
[20] return     1   0      
[21] loadnil    1   1      
[22] return     1   2      
[23] return     0   1      
; end of function


; function [60] definition (level 4)
; 1 upvalues, 1 params, 4 stacks
.function  1 1 0 4
.local  "path"  ; 0
.upvalue  "methods"  ; 0
.const  "FolderExists"  ; 0
.const  "drivePath"  ; 1
[01] getupval   1   0        ; methods
[02] gettable   1   1   250  ; "FolderExists"
[03] getupval   2   0        ; methods
[04] gettable   2   2   251  ; "drivePath"
[05] move       3   0      
[06] call       2   2   0  
[07] call       1   0   2  
[08] test       1   1   1    ; to [10] if false
[09] jmp        2            ; to [12]
[10] loadbool   1   0   0    ; false
[11] return     1   2      
[12] loadbool   1   1   0    ; true
[13] return     1   2      
[14] return     0   1      
; end of function


; function [61] definition (level 4)
; 1 upvalues, 1 params, 6 stacks
.function  1 1 0 6
.local  "path"  ; 0
.local  "programFiles"  ; 1
.upvalue  "folderType"  ; 0
.const  "GetSpecialFolder"  ; 0
.const  "programFiles"  ; 1
.const  "assert"  ; 2
.const  2  ; 3
.const  "string"  ; 4
.const  "find"  ; 5
.const  ":"  ; 6
.const  "No : in Path "  ; 7
.const  "sub"  ; 8
.const  1  ; 9
.const  3  ; 10
.const  4  ; 11
[01] getglobal  1   0        ; GetSpecialFolder
[02] getupval   2   0        ; folderType
[03] gettable   2   2   251  ; "programFiles"
[04] call       1   2   2  
[05] test       0   0   0    ; to [7] if true
[06] jmp        26           ; to [33]
[07] getglobal  2   2        ; assert
[08] getglobal  3   4        ; string
[09] gettable   3   3   255  ; "find"
[10] move       4   0      
[11] loadk      5   6        ; ":"
[12] call       3   3   2  
[13] eq         1   253 3    ; 2, to [15] if false
[14] jmp        1            ; to [16]
[15] loadbool   3   0   1    ; false, to [17]
[16] loadbool   3   1   0    ; true
[17] loadk      4   7        ; "No : in Path "
[18] call       2   3   1  
[19] getglobal  2   4        ; string
[20] gettable   2   2   258  ; "sub"
[21] move       3   1      
[22] loadk      4   9        ; 1
[23] loadk      5   10       ; 3
[24] call       2   4   2  
[25] getglobal  3   4        ; string
[26] gettable   3   3   258  ; "sub"
[27] move       4   0      
[28] loadk      5   11       ; 4
[29] call       3   3   2  
[30] concat     2   2   3  
[31] return     2   2      
[32] jmp        1            ; to [34]
[33] return     1   2      
[34] return     0   1      
; end of function

[001] getglobal  0   0        ; ConstTable
[002] call       0   1   2  
[003] loadk      1   1        ; "[^:^\\^/^%*^%?^\"^<^>^|]+"
[004] loadk      2   2        ; "%a?:?\\?"
[005] getupval   3   0        ; folderType
[006] settable   0   253 3    ; "folderType"
[007] settable   0   254 1    ; "filenameExp"
[008] settable   0   255 2    ; "driveExp"
[009] getglobal  3   6        ; assert
[010] getupval   4   1        ; shellCtl
[011] test       4   4   0    ; to [13] if true
[012] jmp        7            ; to [20]
[013] getupval   4   2        ; filesys
[014] test       4   4   0    ; to [16] if true
[015] jmp        4            ; to [20]
[016] getupval   4   3        ; regAccess
[017] test       4   4   0    ; to [19] if true
[018] jmp        1            ; to [20]
[019] getupval   4   4        ; cookieMnstr
[020] loadk      5   7        ; "comError"
[021] call       3   3   1  
[022] closure    3   0        ; 0 upvalues
[023] settable   0   258 3    ; "dumpPath"
[024] closure    3   1        ; 0 upvalues
[025] settable   0   259 3    ; "widenTo16"
[026] closure    3   2        ; 1 upvalues
[027] move       0   0      
[028] settable   0   260 3    ; "ToUtf8"
[029] closure    3   3        ; 1 upvalues
[030] getupval   0   3        ; regAccess
[031] settable   0   261 3    ; "OpenBaseKey"
[032] closure    3   4        ; 2 upvalues
[033] move       0   0      
[034] getupval   0   3        ; regAccess
[035] settable   0   262 3    ; "CreateRegKey"
[036] closure    3   5        ; 0 upvalues
[037] settable   0   263 3    ; "GetRegKeyValue"
[038] closure    3   6        ; 2 upvalues
[039] getupval   0   3        ; regAccess
[040] move       0   0      
[041] settable   0   264 3    ; "GetRegKeyDWORDValue"
[042] closure    3   7        ; 2 upvalues
[043] getupval   0   3        ; regAccess
[044] move       0   0      
[045] settable   0   265 3    ; "RegQueryMultLineValue"
[046] closure    3   8        ; 2 upvalues
[047] move       0   0      
[048] getupval   0   3        ; regAccess
[049] settable   0   266 3    ; "GetChildKeys"
[050] closure    3   9        ; 2 upvalues
[051] move       0   0      
[052] getupval   0   3        ; regAccess
[053] settable   0   267 3    ; "RegDeleteTree"
[054] closure    3   10       ; 2 upvalues
[055] move       0   0      
[056] getupval   0   3        ; regAccess
[057] settable   0   268 3    ; "DeleteRegKey"
[058] closure    3   11       ; 3 upvalues
[059] move       0   2      
[060] move       0   1      
[061] getupval   0   2        ; filesys
[062] settable   0   269 3    ; "CreatePath"
[063] closure    3   12       ; 2 upvalues
[064] getupval   0   2        ; filesys
[065] move       0   0      
[066] settable   0   270 3    ; "FolderIsEmpty"
[067] closure    3   13       ; 1 upvalues
[068] move       0   1      
[069] settable   0   271 3    ; "StripFilename"
[070] closure    3   14       ; 1 upvalues
[071] getupval   0   2        ; filesys
[072] settable   0   272 3    ; "FolderExists"
[073] closure    3   15       ; 1 upvalues
[074] getupval   0   2        ; filesys
[075] settable   0   273 3    ; "FileExists"
[076] closure    3   16       ; 1 upvalues
[077] move       0   0      
[078] settable   0   274 3    ; "GetProxy"
[079] closure    3   17       ; 1 upvalues
[080] getupval   0   2        ; filesys
[081] settable   0   275 3    ; "DeleteFile"
[082] closure    3   18       ; 0 upvalues
[083] settable   0   276 3    ; "ProcessInfo"
[084] closure    3   19       ; 1 upvalues
[085] getupval   0   1        ; shellCtl
[086] settable   0   277 3    ; "OSVersion"
[087] closure    3   20       ; 2 upvalues
[088] move       0   0      
[089] getupval   0   0        ; folderType
[090] settable   0   278 3    ; "COMRegPath"
[091] closure    3   21       ; 0 upvalues
[092] settable   0   279 3    ; "WorkingDir"
[093] closure    3   22       ; 0 upvalues
[094] settable   0   280 3    ; "SpecialFolder"
[095] closure    3   23       ; 1 upvalues
[096] getupval   0   2        ; filesys
[097] settable   0   281 3    ; "FileSize"
[098] closure    3   24       ; 3 upvalues
[099] getupval   0   2        ; filesys
[100] move       0   0      
[101] move       0   1      
[102] settable   0   282 3    ; "LocalCopy"
[103] closure    3   25       ; 1 upvalues
[104] getupval   0   2        ; filesys
[105] settable   0   283 3    ; "GetFolderItems"
[106] closure    3   26       ; 1 upvalues
[107] getupval   0   2        ; filesys
[108] settable   0   284 3    ; "GetSubFolders"
[109] closure    3   27       ; 0 upvalues
[110] settable   0   285 3    ; "ClearReadOnlyAttribute"
[111] closure    3   28       ; 1 upvalues
[112] move       0   0      
[113] settable   0   286 3    ; "MakePathFilesWriteable"
[114] closure    3   29       ; 2 upvalues
[115] move       0   0      
[116] getupval   0   2        ; filesys
[117] settable   0   287 3    ; "IsPathWriteable"
[118] closure    3   30       ; 2 upvalues
[119] getupval   0   1        ; shellCtl
[120] getupval   0   2        ; filesys
[121] settable   0   288 3    ; "DiskSpace"
[122] closure    3   31       ; 1 upvalues
[123] getupval   0   2        ; filesys
[124] settable   0   289 3    ; "SufficientDriveSpace"
[125] closure    3   32       ; 1 upvalues
[126] move       0   0      
[127] settable   0   290 3    ; "FindInstallDrive"
[128] closure    3   33       ; 2 upvalues
[129] getupval   0   1        ; shellCtl
[130] move       0   0      
[131] settable   0   291 3    ; "CreateShortcut"
[132] closure    3   34       ; 1 upvalues
[133] move       0   0      
[134] settable   0   292 3    ; "SafeDeleteFileElement"
[135] closure    3   35       ; 0 upvalues
[136] settable   0   293 3    ; "ParentPath"
[137] closure    3   36       ; 1 upvalues
[138] move       0   0      
[139] settable   0   294 3    ; "DeleteEmptyFolders"
[140] closure    3   37       ; 2 upvalues
[141] getupval   0   1        ; shellCtl
[142] move       0   0      
[143] settable   0   295 3    ; "DeleteShortcut"
[144] closure    3   38       ; 3 upvalues
[145] getupval   0   1        ; shellCtl
[146] getupval   0   3        ; regAccess
[147] move       0   0      
[148] settable   0   296 3    ; "RegisterInstallerType"
[149] closure    3   39       ; 0 upvalues
[150] settable   0   297 3    ; "unpack"
[151] closure    3   40       ; 0 upvalues
[152] settable   0   298 3    ; "LaunchProcess"
[153] closure    3   41       ; 1 upvalues
[154] getupval   0   5        ; procMgr
[155] settable   0   299 3    ; "Mutex"
[156] closure    3   42       ; 1 upvalues
[157] getupval   0   1        ; shellCtl
[158] settable   0   300 3    ; "getMachineID"
[159] closure    3   43       ; 1 upvalues
[160] getupval   0   1        ; shellCtl
[161] settable   0   301 3    ; "GetPid"
[162] closure    3   44       ; 1 upvalues
[163] getupval   0   1        ; shellCtl
[164] settable   0   302 3    ; "LogMessage"
[165] closure    3   45       ; 1 upvalues
[166] move       0   0      
[167] settable   0   303 3    ; "IEVersion"
[168] closure    3   46       ; 1 upvalues
[169] move       0   0      
[170] settable   0   304 3    ; "IsChromePresent"
[171] closure    3   47       ; 1 upvalues
[172] move       0   0      
[173] settable   0   305 3    ; "ChromeVersion"
[174] closure    3   48       ; 1 upvalues
[175] move       0   0      
[176] settable   0   306 3    ; "FireFoxVersion"
[177] closure    3   49       ; 0 upvalues
[178] settable   0   307 3    ; "Event"
[179] closure    3   50       ; 1 upvalues
[180] getupval   0   4        ; cookieMnstr
[181] settable   0   308 3    ; "GetCookieItem"
[182] closure    3   51       ; 1 upvalues
[183] getupval   0   1        ; shellCtl
[184] settable   0   309 3    ; "RefreshAddRemovePrograms"
[185] closure    3   52       ; 1 upvalues
[186] getupval   0   1        ; shellCtl
[187] settable   0   310 3    ; "ArchitectureInfo"
[188] closure    3   53       ; 2 upvalues
[189] move       0   0      
[190] move       0   1      
[191] settable   0   311 3    ; "GetDefaultBrowserName"
[192] closure    3   54       ; 2 upvalues
[193] move       0   0      
[194] move       0   1      
[195] settable   0   312 3    ; "BrowserInfo"
[196] closure    3   55       ; 1 upvalues
[197] getupval   0   1        ; shellCtl
[198] settable   0   313 3    ; "GetAvailableDrive"
[199] closure    3   56       ; 0 upvalues
[200] settable   0   314 3    ; "GetAllUsersFolder"
[201] closure    3   57       ; 1 upvalues
[202] getupval   0   1        ; shellCtl
[203] settable   0   315 3    ; "GetLicenseRoot"
[204] closure    3   58       ; 1 upvalues
[205] move       0   0      
[206] settable   0   316 3    ; "UpdateDip"
[207] closure    3   59       ; 0 upvalues
[208] settable   0   317 3    ; "drivePath"
[209] closure    3   60       ; 1 upvalues
[210] move       0   0      
[211] settable   0   318 3    ; "isDriveValid"
[212] closure    3   61       ; 1 upvalues
[213] getupval   0   0        ; folderType
[214] settable   0   319 3    ; "ChooseValidPath"
[215] getglobal  3   70       ; io
[216] gettable   3   3   321  ; "write"
[217] loadk      4   72       ; "\n"
[218] getglobal  5   73       ; os
[219] gettable   5   5   324  ; "date"
[220] loadk      6   75       ; "%c "
[221] call       5   2   2  
[222] loadk      6   76       ; "Creating instance of Win32Interop"
[223] call       3   4   1  
[224] return     0   2      
[225] return     0   1      
; end of function

[01] getglobal  0   0        ; luacom
[02] gettable   0   0   251  ; "CreateObject"
[03] loadk      1   2        ; "StubbyUtil.ShellCtl"
[04] call       0   2   2  
[05] getglobal  1   0        ; luacom
[06] gettable   1   1   251  ; "CreateObject"
[07] loadk      2   3        ; "Scripting.FileSystemObject"
[08] call       1   2   2  
[09] getglobal  2   0        ; luacom
[10] gettable   2   2   251  ; "CreateObject"
[11] loadk      3   4        ; "StubbyUtil.RegAccess"
[12] call       2   2   2  
[13] getglobal  3   0        ; luacom
[14] gettable   3   3   251  ; "CreateObject"
[15] loadk      4   5        ; "StubbyUtil.CookieCtl"
[16] call       3   2   2  
[17] getglobal  4   0        ; luacom
[18] gettable   4   4   251  ; "CreateObject"
[19] loadk      5   6        ; "StubbyUtil.ProcessMgr"
[20] call       4   2   2  
[21] getglobal  5   7        ; ConstTable
[22] call       5   1   2  
[23] settable   5   258 259  ; "commonStartMenu" 22
[24] settable   5   260 261  ; "commonDesktop" 25
[25] settable   5   262 263  ; "start" 11
[26] settable   5   264 265  ; "desktop" 16
[27] settable   5   266 267  ; "programFiles" 38
[28] settable   5   268 269  ; "system" 37
[29] settable   5   270 271  ; "startPrograms" 2
[30] settable   5   272 273  ; "appData" 26
[31] settable   5   274 275  ; "favorites" 31
[32] settable   5   276 277  ; "userSpecificFavorites" 6
[33] settable   5   278 279  ; "windows" 36
[34] settable   5   280 281  ; "localAppData" 28
[35] loadnil    6   6      
[36] closure    7   0        ; 1 upvalues
[37] move       0   6      
[38] setglobal  7   32       ; OnProgress
[39] newtable   7   0   0    ; array=0, hash=0
[40] setglobal  7   33       ; unRarEvents
[41] getglobal  7   33       ; unRarEvents
[42] getglobal  8   32       ; OnProgress
[43] settable   7   282 8    ; "OnProgress"
[44] closure    7   1        ; 6 upvalues
[45] move       0   5      
[46] move       0   0      
[47] move       0   1      
[48] move       0   2      
[49] move       0   3      
[50] move       0   4      
[51] setglobal  7   34       ; Win32Interop
[52] return     0   1      
; end of function


; function [3] definition (level 2)
; 0 upvalues, 0 params, 13 stacks
.function  0 0 0 13
.local  "check_int"  ; 0
.local  "to_bits"  ; 1
.local  "tbl_to_number"  ; 2
.local  "expand"  ; 3
.local  "bit_or"  ; 4
.local  "bit_and"  ; 5
.local  "bit_not"  ; 6
.local  "bit_xor"  ; 7
.local  "bit_rshift"  ; 8
.local  "bit_logic_rshift"  ; 9
.local  "bit_lshift"  ; 10
.local  "bit_xor2"  ; 11
.const  "bit"  ; 0
.const  "bnot"  ; 1
.const  "band"  ; 2
.const  "bor"  ; 3
.const  "bxor"  ; 4
.const  "brshift"  ; 5
.const  "blshift"  ; 6
.const  "bxor2"  ; 7
.const  "blogic_rshift"  ; 8
.const  "tobits"  ; 9
.const  "tonumb"  ; 10

; function [0] definition (level 3)
; 0 upvalues, 1 params, 3 stacks
.function  0 1 0 3
.local  "n"  ; 0
.const  "math"  ; 0
.const  "floor"  ; 1
.const  0  ; 2
.const  "error"  ; 3
.const  "trying to use bitwise operation on non-integer!"  ; 4
[01] getglobal  1   0        ; math
[02] gettable   1   1   251  ; "floor"
[03] move       2   0      
[04] call       1   2   2  
[05] sub        1   0   1  
[06] lt         0   252 1    ; 0, to [8] if true
[07] jmp        3            ; to [11]
[08] getglobal  1   3        ; error
[09] loadk      2   4        ; "trying to use bitwise operation on non-integer!"
[10] call       1   2   1  
[11] return     0   1      
; end of function


; function [1] definition (level 3)
; 2 upvalues, 1 params, 6 stacks
.function  2 1 0 6
.local  "n"  ; 0
.local  "tbl"  ; 1
.local  "cnt"  ; 2
.local  "last"  ; 3
.upvalue  "check_int"  ; 0
.upvalue  "to_bits"  ; 1
.const  0  ; 0
.const  "bit"  ; 1
.const  "bnot"  ; 2
.const  "math"  ; 3
.const  "abs"  ; 4
.const  1  ; 5
.const  "mod"  ; 6
.const  2  ; 7
[01] getupval   1   0        ; check_int
[02] move       2   0      
[03] call       1   2   1  
[04] lt         0   0   250  ; 0, to [6] if true
[05] jmp        11           ; to [17]
[06] getupval   1   1        ; to_bits
[07] getglobal  2   1        ; bit
[08] gettable   2   2   252  ; "bnot"
[09] getglobal  3   3        ; math
[10] gettable   3   3   254  ; "abs"
[11] move       4   0      
[12] call       3   2   0  
[13] call       2   0   2  
[14] add        2   2   255  ; 1
[15] tailcall   1   2   0  
[16] return     1   0      
[17] newtable   1   0   0    ; array=0, hash=0
[18] loadk      2   5        ; 1
[19] jmp        13           ; to [33]
[20] getglobal  3   3        ; math
[21] gettable   3   3   256  ; "mod"
[22] move       4   0      
[23] loadk      5   7        ; 2
[24] call       3   3   2  
[25] eq         0   3   255  ; 1, to [27] if true
[26] jmp        2            ; to [29]
[27] settable   1   2   255  ; 1
[28] jmp        1            ; to [30]
[29] settable   1   2   250  ; 0
[30] sub        4   0   3  
[31] div        0   4   257  ; 2
[32] add        2   2   255  ; 1
[33] lt         1   250 0    ; 0, to [35] if false
[34] jmp        -15          ; to [20]
[35] return     1   2      
[36] return     0   1      
; end of function


; function [2] definition (level 3)
; 0 upvalues, 1 params, 8 stacks
.function  0 1 0 8
.local  "tbl"  ; 0
.local  "n"  ; 1
.local  "rslt"  ; 2
.local  "power"  ; 3
.local  "i"  ; 4
.local  "(for limit)"  ; 5
.local  "(for step)"  ; 6
.const  "table"  ; 0
.const  "getn"  ; 1
.const  0  ; 2
.const  1  ; 3
.const  2  ; 4
[01] getglobal  1   0        ; table
[02] gettable   1   1   251  ; "getn"
[03] move       2   0      
[04] call       1   2   2  
[05] loadk      2   2        ; 0
[06] loadk      3   3        ; 1
[07] loadk      4   3        ; 1
[08] move       5   1      
[09] loadk      6   3        ; 1
[10] sub        4   4   6  
[11] jmp        4            ; to [16]
[12] gettable   7   0   4  
[13] mul        7   7   3  
[14] add        2   2   7  
[15] mul        3   3   254  ; 2
[16] forloop    4   -5       ; to [12] if loop
[17] return     2   2      
[18] return     0   1      
; end of function


; function [3] definition (level 3)
; 0 upvalues, 2 params, 7 stacks
.function  0 2 0 7
.local  "tbl_m"  ; 0
.local  "tbl_n"  ; 1
.local  "big"  ; 2
.local  "small"  ; 3
.local  "i"  ; 4
.local  "(for limit)"  ; 5
.local  "(for step)"  ; 6
.const  "table"  ; 0
.const  "getn"  ; 1
.const  1  ; 2
.const  0  ; 3
[01] newtable   2   0   0    ; array=0, hash=0
[02] newtable   3   0   0    ; array=0, hash=0
[03] getglobal  4   0        ; table
[04] gettable   4   4   251  ; "getn"
[05] move       5   0      
[06] call       4   2   2  
[07] getglobal  5   0        ; table
[08] gettable   5   5   251  ; "getn"
[09] move       6   1      
[10] call       5   2   2  
[11] lt         0   5   4    ; to [13] if true
[12] jmp        3            ; to [16]
[13] move       2   0      
[14] move       3   1      
[15] jmp        2            ; to [18]
[16] move       2   1      
[17] move       3   0      
[18] getglobal  4   0        ; table
[19] gettable   4   4   251  ; "getn"
[20] move       5   3      
[21] call       4   2   2  
[22] add        4   4   252  ; 1
[23] getglobal  5   0        ; table
[24] gettable   5   5   251  ; "getn"
[25] move       6   2      
[26] call       5   2   2  
[27] loadk      6   2        ; 1
[28] sub        4   4   6  
[29] jmp        1            ; to [31]
[30] settable   3   4   253  ; 0
[31] forloop    4   -2       ; to [30] if loop
[32] return     0   1      
; end of function


; function [4] definition (level 3)
; 3 upvalues, 2 params, 10 stacks
.function  3 2 0 10
.local  "m"  ; 0
.local  "n"  ; 1
.local  "tbl_m"  ; 2
.local  "tbl_n"  ; 3
.local  "tbl"  ; 4
.local  "rslt"  ; 5
.local  "i"  ; 6
.local  "(for limit)"  ; 7
.local  "(for step)"  ; 8
.upvalue  "to_bits"  ; 0
.upvalue  "expand"  ; 1
.upvalue  "tbl_to_number"  ; 2
.const  "math"  ; 0
.const  "max"  ; 1
.const  "table"  ; 2
.const  "getn"  ; 3
.const  1  ; 4
.const  0  ; 5
[01] getupval   2   0        ; to_bits
[02] move       3   0      
[03] call       2   2   2  
[04] getupval   3   0        ; to_bits
[05] move       4   1      
[06] call       3   2   2  
[07] getupval   4   1        ; expand
[08] move       5   2      
[09] move       6   3      
[10] call       4   3   1  
[11] newtable   4   0   0    ; array=0, hash=0
[12] getglobal  5   0        ; math
[13] gettable   5   5   251  ; "max"
[14] getglobal  6   2        ; table
[15] gettable   6   6   253  ; "getn"
[16] move       7   2      
[17] call       6   2   2  
[18] getglobal  7   2        ; table
[19] gettable   7   7   253  ; "getn"
[20] move       8   3      
[21] call       7   2   0  
[22] call       5   0   2  
[23] loadk      6   4        ; 1
[24] move       7   5      
[25] loadk      8   4        ; 1
[26] sub        6   6   8  
[27] jmp        9            ; to [37]
[28] gettable   9   2   6  
[29] eq         0   9   255  ; 0, to [31] if true
[30] jmp        5            ; to [36]
[31] gettable   9   3   6  
[32] eq         0   9   255  ; 0, to [34] if true
[33] jmp        2            ; to [36]
[34] settable   4   6   255  ; 0
[35] jmp        1            ; to [37]
[36] settable   4   6   254  ; 1
[37] forloop    6   -10      ; to [28] if loop
[38] getupval   6   2        ; tbl_to_number
[39] move       7   4      
[40] tailcall   6   2   0  
[41] return     6   0      
[42] return     0   1      
; end of function


; function [5] definition (level 3)
; 3 upvalues, 2 params, 10 stacks
.function  3 2 0 10
.local  "m"  ; 0
.local  "n"  ; 1
.local  "tbl_m"  ; 2
.local  "tbl_n"  ; 3
.local  "tbl"  ; 4
.local  "rslt"  ; 5
.local  "i"  ; 6
.local  "(for limit)"  ; 7
.local  "(for step)"  ; 8
.upvalue  "to_bits"  ; 0
.upvalue  "expand"  ; 1
.upvalue  "tbl_to_number"  ; 2
.const  "math"  ; 0
.const  "max"  ; 1
.const  "table"  ; 2
.const  "getn"  ; 3
.const  1  ; 4
.const  0  ; 5
[01] getupval   2   0        ; to_bits
[02] move       3   0      
[03] call       2   2   2  
[04] getupval   3   0        ; to_bits
[05] move       4   1      
[06] call       3   2   2  
[07] getupval   4   1        ; expand
[08] move       5   2      
[09] move       6   3      
[10] call       4   3   1  
[11] newtable   4   0   0    ; array=0, hash=0
[12] getglobal  5   0        ; math
[13] gettable   5   5   251  ; "max"
[14] getglobal  6   2        ; table
[15] gettable   6   6   253  ; "getn"
[16] move       7   2      
[17] call       6   2   2  
[18] getglobal  7   2        ; table
[19] gettable   7   7   253  ; "getn"
[20] move       8   3      
[21] call       7   2   0  
[22] call       5   0   2  
[23] loadk      6   4        ; 1
[24] move       7   5      
[25] loadk      8   4        ; 1
[26] sub        6   6   8  
[27] jmp        9            ; to [37]
[28] gettable   9   2   6  
[29] eq         1   9   255  ; 0, to [31] if false
[30] jmp        3            ; to [34]
[31] gettable   9   3   6  
[32] eq         0   9   255  ; 0, to [34] if true
[33] jmp        2            ; to [36]
[34] settable   4   6   255  ; 0
[35] jmp        1            ; to [37]
[36] settable   4   6   254  ; 1
[37] forloop    6   -10      ; to [28] if loop
[38] getupval   6   2        ; tbl_to_number
[39] move       7   4      
[40] tailcall   6   2   0  
[41] return     6   0      
[42] return     0   1      
; end of function


; function [6] definition (level 3)
; 2 upvalues, 1 params, 7 stacks
.function  2 1 0 7
.local  "n"  ; 0
.local  "tbl"  ; 1
.local  "size"  ; 2
.local  "i"  ; 3
.local  "(for limit)"  ; 4
.local  "(for step)"  ; 5
.upvalue  "to_bits"  ; 0
.upvalue  "tbl_to_number"  ; 1
.const  "math"  ; 0
.const  "max"  ; 1
.const  "table"  ; 2
.const  "getn"  ; 3
.const  32  ; 4
.const  1  ; 5
.const  0  ; 6
[01] getupval   1   0        ; to_bits
[02] move       2   0      
[03] call       1   2   2  
[04] getglobal  2   0        ; math
[05] gettable   2   2   251  ; "max"
[06] getglobal  3   2        ; table
[07] gettable   3   3   253  ; "getn"
[08] move       4   1      
[09] call       3   2   2  
[10] loadk      4   4        ; 32
[11] call       2   3   2  
[12] loadk      3   5        ; 1
[13] move       4   2      
[14] loadk      5   5        ; 1
[15] sub        3   3   5  
[16] jmp        6            ; to [23]
[17] gettable   6   1   3  
[18] eq         0   6   255  ; 1, to [20] if true
[19] jmp        2            ; to [22]
[20] settable   1   3   256  ; 0
[21] jmp        1            ; to [23]
[22] settable   1   3   255  ; 1
[23] forloop    3   -7       ; to [17] if loop
[24] getupval   3   1        ; tbl_to_number
[25] move       4   1      
[26] tailcall   3   2   0  
[27] return     3   0      
[28] return     0   1      
; end of function


; function [7] definition (level 3)
; 3 upvalues, 2 params, 11 stacks
.function  3 2 0 11
.local  "m"  ; 0
.local  "n"  ; 1
.local  "tbl_m"  ; 2
.local  "tbl_n"  ; 3
.local  "tbl"  ; 4
.local  "rslt"  ; 5
.local  "i"  ; 6
.local  "(for limit)"  ; 7
.local  "(for step)"  ; 8
.upvalue  "to_bits"  ; 0
.upvalue  "expand"  ; 1
.upvalue  "tbl_to_number"  ; 2
.const  "math"  ; 0
.const  "max"  ; 1
.const  "table"  ; 2
.const  "getn"  ; 3
.const  1  ; 4
.const  0  ; 5
[01] getupval   2   0        ; to_bits
[02] move       3   0      
[03] call       2   2   2  
[04] getupval   3   0        ; to_bits
[05] move       4   1      
[06] call       3   2   2  
[07] getupval   4   1        ; expand
[08] move       5   2      
[09] move       6   3      
[10] call       4   3   1  
[11] newtable   4   0   0    ; array=0, hash=0
[12] getglobal  5   0        ; math
[13] gettable   5   5   251  ; "max"
[14] getglobal  6   2        ; table
[15] gettable   6   6   253  ; "getn"
[16] move       7   2      
[17] call       6   2   2  
[18] getglobal  7   2        ; table
[19] gettable   7   7   253  ; "getn"
[20] move       8   3      
[21] call       7   2   0  
[22] call       5   0   2  
[23] loadk      6   4        ; 1
[24] move       7   5      
[25] loadk      8   4        ; 1
[26] sub        6   6   8  
[27] jmp        7            ; to [35]
[28] gettable   9   2   6  
[29] gettable   10  3   6  
[30] eq         1   9   10   ; to [32] if false
[31] jmp        2            ; to [34]
[32] settable   4   6   254  ; 1
[33] jmp        1            ; to [35]
[34] settable   4   6   255  ; 0
[35] forloop    6   -8       ; to [28] if loop
[36] getupval   6   2        ; tbl_to_number
[37] move       7   4      
[38] tailcall   6   2   0  
[39] return     6   0      
[40] return     0   1      
; end of function


; function [8] definition (level 3)
; 3 upvalues, 2 params, 9 stacks
.function  3 2 0 9
.local  "n"  ; 0
.local  "bits"  ; 1
.local  "high_bit"  ; 2
.local  "i"  ; 3
.local  "(for limit)"  ; 4
.local  "(for step)"  ; 5
.upvalue  "check_int"  ; 0
.upvalue  "bit_not"  ; 1
.upvalue  "bit_or"  ; 2
.const  0  ; 0
.const  "math"  ; 1
.const  "abs"  ; 2
.const  1  ; 3
.const  2147483648  ; 4
.const  2  ; 5
.const  "floor"  ; 6
[01] getupval   2   0        ; check_int
[02] move       3   0      
[03] call       2   2   1  
[04] loadk      2   0        ; 0
[05] lt         0   0   250  ; 0, to [7] if true
[06] jmp        8            ; to [15]
[07] getupval   3   1        ; bit_not
[08] getglobal  4   1        ; math
[09] gettable   4   4   252  ; "abs"
[10] move       5   0      
[11] call       4   2   0  
[12] call       3   0   2  
[13] add        0   3   253  ; 1
[14] loadk      2   4        ; 2147483648
[15] loadk      3   3        ; 1
[16] move       4   1      
[17] loadk      5   3        ; 1
[18] sub        3   3   5  
[19] jmp        9            ; to [29]
[20] div        0   0   255  ; 2
[21] getupval   6   2        ; bit_or
[22] getglobal  7   1        ; math
[23] gettable   7   7   256  ; "floor"
[24] move       8   0      
[25] call       7   2   2  
[26] move       8   2      
[27] call       6   3   2  
[28] move       0   6      
[29] forloop    3   -10      ; to [20] if loop
[30] getglobal  3   1        ; math
[31] gettable   3   3   256  ; "floor"
[32] move       4   0      
[33] tailcall   3   2   0  
[34] return     3   0      
[35] return     0   1      
; end of function


; function [9] definition (level 3)
; 2 upvalues, 2 params, 5 stacks
.function  2 2 0 5
.local  "n"  ; 0
.local  "bits"  ; 1
.local  "i"  ; 2
.local  "(for limit)"  ; 3
.local  "(for step)"  ; 4
.upvalue  "check_int"  ; 0
.upvalue  "bit_not"  ; 1
.const  0  ; 0
.const  "math"  ; 1
.const  "abs"  ; 2
.const  1  ; 3
.const  2  ; 4
.const  "floor"  ; 5
[01] getupval   2   0        ; check_int
[02] move       3   0      
[03] call       2   2   1  
[04] lt         0   0   250  ; 0, to [6] if true
[05] jmp        7            ; to [13]
[06] getupval   2   1        ; bit_not
[07] getglobal  3   1        ; math
[08] gettable   3   3   252  ; "abs"
[09] move       4   0      
[10] call       3   2   0  
[11] call       2   0   2  
[12] add        0   2   253  ; 1
[13] loadk      2   3        ; 1
[14] move       3   1      
[15] loadk      4   3        ; 1
[16] sub        2   2   4  
[17] jmp        1            ; to [19]
[18] div        0   0   254  ; 2
[19] forloop    2   -2       ; to [18] if loop
[20] getglobal  2   1        ; math
[21] gettable   2   2   255  ; "floor"
[22] move       3   0      
[23] tailcall   2   2   0  
[24] return     2   0      
[25] return     0   1      
; end of function


; function [10] definition (level 3)
; 3 upvalues, 2 params, 5 stacks
.function  3 2 0 5
.local  "n"  ; 0
.local  "bits"  ; 1
.local  "i"  ; 2
.local  "(for limit)"  ; 3
.local  "(for step)"  ; 4
.upvalue  "check_int"  ; 0
.upvalue  "bit_not"  ; 1
.upvalue  "bit_and"  ; 2
.const  0  ; 0
.const  "math"  ; 1
.const  "abs"  ; 2
.const  1  ; 3
.const  2  ; 4
.const  4294967295  ; 5
[01] getupval   2   0        ; check_int
[02] move       3   0      
[03] call       2   2   1  
[04] lt         0   0   250  ; 0, to [6] if true
[05] jmp        7            ; to [13]
[06] getupval   2   1        ; bit_not
[07] getglobal  3   1        ; math
[08] gettable   3   3   252  ; "abs"
[09] move       4   0      
[10] call       3   2   0  
[11] call       2   0   2  
[12] add        0   2   253  ; 1
[13] loadk      2   3        ; 1
[14] move       3   1      
[15] loadk      4   3        ; 1
[16] sub        2   2   4  
[17] jmp        1            ; to [19]
[18] mul        0   0   254  ; 2
[19] forloop    2   -2       ; to [18] if loop
[20] getupval   2   2        ; bit_and
[21] move       3   0      
[22] loadk      4   5        ; 4294967295
[23] tailcall   2   3   0  
[24] return     2   0      
[25] return     0   1      
; end of function


; function [11] definition (level 3)
; 3 upvalues, 2 params, 7 stacks
.function  3 2 0 7
.local  "m"  ; 0
.local  "n"  ; 1
.local  "rhs"  ; 2
.local  "lhs"  ; 3
.local  "rslt"  ; 4
.upvalue  "bit_or"  ; 0
.upvalue  "bit_not"  ; 1
.upvalue  "bit_and"  ; 2
[01] getupval   2   0        ; bit_or
[02] getupval   3   1        ; bit_not
[03] move       4   0      
[04] call       3   2   2  
[05] getupval   4   1        ; bit_not
[06] move       5   1      
[07] call       4   2   0  
[08] call       2   0   2  
[09] getupval   3   0        ; bit_or
[10] move       4   0      
[11] move       5   1      
[12] call       3   3   2  
[13] getupval   4   2        ; bit_and
[14] move       5   3      
[15] move       6   2      
[16] call       4   3   2  
[17] return     4   2      
[18] return     0   1      
; end of function

[01] closure    0   0        ; 0 upvalues
[02] closure    1   1        ; 2 upvalues
[03] move       0   0      
[04] move       0   1      
[05] closure    2   2        ; 0 upvalues
[06] closure    3   3        ; 0 upvalues
[07] closure    4   4        ; 3 upvalues
[08] move       0   1      
[09] move       0   3      
[10] move       0   2      
[11] closure    5   5        ; 3 upvalues
[12] move       0   1      
[13] move       0   3      
[14] move       0   2      
[15] closure    6   6        ; 2 upvalues
[16] move       0   1      
[17] move       0   2      
[18] closure    7   7        ; 3 upvalues
[19] move       0   1      
[20] move       0   3      
[21] move       0   2      
[22] closure    8   8        ; 3 upvalues
[23] move       0   0      
[24] move       0   6      
[25] move       0   4      
[26] closure    9   9        ; 2 upvalues
[27] move       0   0      
[28] move       0   6      
[29] closure    10  10       ; 3 upvalues
[30] move       0   0      
[31] move       0   6      
[32] move       0   5      
[33] closure    11  11       ; 3 upvalues
[34] move       0   4      
[35] move       0   6      
[36] move       0   5      
[37] newtable   12  0   4    ; array=0, hash=16
[38] settable   12  251 6    ; "bnot"
[39] settable   12  252 5    ; "band"
[40] settable   12  253 4    ; "bor"
[41] settable   12  254 7    ; "bxor"
[42] settable   12  255 8    ; "brshift"
[43] settable   12  256 10   ; "blshift"
[44] settable   12  257 11   ; "bxor2"
[45] settable   12  258 9    ; "blogic_rshift"
[46] settable   12  259 1    ; "tobits"
[47] settable   12  260 2    ; "tonumb"
[48] setglobal  12  0        ; bit
[49] close      0  
[50] return     0   1      
; end of function


; function [4] definition (level 2)
; 0 upvalues, 0 params, 7 stacks
.function  0 0 0 7
.local  "reg"  ; 0
.local  "win32"  ; 1
.local  "srcFromCookie"  ; 2
.local  "tpsFromCookie"  ; 3
.local  "gameidFromCookie"  ; 4
.const  "luacom"  ; 0
.const  "CreateObject"  ; 1
.const  "StubbyUtil.RegAccess"  ; 2
.const  "Win32Interop"  ; 3
.const  "GetCookieItem"  ; 4
.const  "COOKIE_URL"  ; 5
.const  "src"  ; 6
.const  "\"\""  ; 7
.const  ""  ; 8
.const  "tps"  ; 9
.const  "gameid"  ; 10
.const  "g_storeFront"  ; 11
.const  "RealArcade"  ; 12
.const  "g_stampedgameid"  ; 13
.const  "CurrentVersion"  ; 14
.const  "RACConfigValue"  ; 15
.const  "RAConfigValue"  ; 16
.const  "RequestVersionParams"  ; 17
.const  "RequestURLParamsFromMemory"  ; 18
.const  "RequestURLParams"  ; 19
.const  "RACVerTps"  ; 20
.const  "V1MainApp"  ; 21
.const  "CheckOverInstall"  ; 22
.const  "CheckGameExists"  ; 23
.const  "IsMigration"  ; 24
.const  "ConvertToCmdLine"  ; 25

; function [0] definition (level 3)
; 2 upvalues, 1 params, 6 stacks
.function  2 1 0 6
.local  "root"  ; 0
.local  "val"  ; 1
.upvalue  "reg"  ; 0
.upvalue  "win32"  ; 1
.const  "assert"  ; 0
.const  "comError"  ; 1
.const  "GetRegKeyValue"  ; 2
.const  "HKEY_CLASSES_ROOT"  ; 3
.const  "g_constants"  ; 4
.const  "basekey"  ; 5
.const  "g_storeFront"  ; 6
.const  "\\CurrentVersion"  ; 7
.const  ""  ; 8
.const  "io"  ; 9
.const  "write"  ; 10
.const  "\n"  ; 11
.const  "os"  ; 12
.const  "date"  ; 13
.const  "%c "  ; 14
.const  "RACVerLocation: RAC installation not detected."  ; 15
[01] getglobal  1   0        ; assert
[02] getupval   2   0        ; reg
[03] loadk      3   1        ; "comError"
[04] call       1   3   1  
[05] getupval   1   1        ; win32
[06] gettable   1   1   252  ; "GetRegKeyValue"
[07] loadk      2   3        ; "HKEY_CLASSES_ROOT"
[08] test       3   0   1    ; to [10] if false
[09] jmp        5            ; to [15]
[10] getglobal  3   4        ; g_constants
[11] gettable   3   3   255  ; "basekey"
[12] getglobal  4   6        ; g_storeFront
[13] loadk      5   7        ; "\\CurrentVersion"
[14] concat     3   3   5  
[15] call       1   3   2  
[16] test       1   1   0    ; to [18] if true
[17] jmp        2            ; to [20]
[18] eq         0   1   258  ; "", to [20] if true
[19] jmp        10           ; to [30]
[20] getglobal  2   9        ; io
[21] gettable   2   2   260  ; "write"
[22] loadk      3   11       ; "\n"
[23] getglobal  4   12       ; os
[24] gettable   4   4   263  ; "date"
[25] loadk      5   14       ; "%c "
[26] call       4   2   2  
[27] loadk      5   15       ; "RACVerLocation: RAC installation not detected."
[28] call       2   4   1  
[29] loadnil    1   1      
[30] return     1   2      
[31] return     0   1      
; end of function


; function [1] definition (level 3)
; 1 upvalues, 1 params, 8 stacks
.function  1 1 0 8
.local  "name"  ; 0
.local  "m"  ; 1
.local  "currentVer"  ; 2
.local  "key"  ; 3
.upvalue  "win32"  ; 0
.const  "ConstTable"  ; 0
.const  "CurrentVersion"  ; 1
.const  "Read"  ; 2
.const  "Write"  ; 3
.const  "g_constants"  ; 4
.const  "basekey"  ; 5
.const  "g_storeFront"  ; 6
.const  "\\"  ; 7
.const  "\\Preferences"  ; 8

; function [0] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
.const  ""  ; 0
[1] loadk      0   0        ; ""
[2] return     0   2      
[3] return     0   1      
; end of function


; function [1] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "val"  ; 0
[1] return     0   1      
[2] return     0   1      
; end of function


; function [2] definition (level 4)
; 3 upvalues, 0 params, 4 stacks
.function  3 0 0 4
.upvalue  "win32"  ; 0
.upvalue  "key"  ; 1
.upvalue  "name"  ; 2
.const  "GetRegKeyValue"  ; 0
.const  "HKEY_CLASSES_ROOT"  ; 1
[1] getupval   0   0        ; win32
[2] gettable   0   0   250  ; "GetRegKeyValue"
[3] loadk      1   1        ; "HKEY_CLASSES_ROOT"
[4] getupval   2   1        ; key
[5] getupval   3   2        ; name
[6] tailcall   0   4   0  
[7] return     0   0      
[8] return     0   1      
; end of function


; function [3] definition (level 4)
; 3 upvalues, 1 params, 6 stacks
.function  3 1 0 6
.local  "val"  ; 0
.upvalue  "win32"  ; 0
.upvalue  "key"  ; 1
.upvalue  "name"  ; 2
.const  "CreateRegKey"  ; 0
.const  "HKEY_CLASSES_ROOT"  ; 1
[1] getupval   1   0        ; win32
[2] gettable   1   1   250  ; "CreateRegKey"
[3] loadk      2   1        ; "HKEY_CLASSES_ROOT"
[4] getupval   3   1        ; key
[5] getupval   4   2        ; name
[6] move       5   0      
[7] call       1   5   1  
[8] return     0   1      
; end of function

[01] getglobal  1   0        ; ConstTable
[02] call       1   1   2  
[03] getglobal  2   1        ; CurrentVersion
[04] call       2   1   2  
[05] test       2   2   1    ; to [7] if false
[06] jmp        5            ; to [12]
[07] closure    3   0        ; 0 upvalues
[08] settable   1   252 3    ; "Read"
[09] closure    3   1        ; 0 upvalues
[10] settable   1   253 3    ; "Write"
[11] return     1   2      
[12] getglobal  3   4        ; g_constants
[13] gettable   3   3   255  ; "basekey"
[14] getglobal  4   6        ; g_storeFront
[15] loadk      5   7        ; "\\"
[16] move       6   2      
[17] loadk      7   8        ; "\\Preferences"
[18] concat     3   3   7  
[19] closure    4   2        ; 3 upvalues
[20] getupval   0   0        ; win32
[21] move       0   3      
[22] move       0   0      
[23] settable   1   252 4    ; "Read"
[24] closure    4   3        ; 3 upvalues
[25] getupval   0   0        ; win32
[26] move       0   3      
[27] move       0   0      
[28] settable   1   253 4    ; "Write"
[29] return     1   2      
[30] return     0   1      
; end of function


; function [2] definition (level 3)
; 0 upvalues, 1 params, 5 stacks
.function  0 1 0 5
.local  "name"  ; 0
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Call to deprecated function RAConfigValue. Use RACConfigValue"  ; 6
.const  "RACConfigValue"  ; 7
.const  "Read"  ; 8
[01] getglobal  1   0        ; io
[02] gettable   1   1   251  ; "write"
[03] loadk      2   2        ; "\n"
[04] getglobal  3   3        ; os
[05] gettable   3   3   254  ; "date"
[06] loadk      4   5        ; "%c "
[07] call       3   2   2  
[08] loadk      4   6        ; "Call to deprecated function RAConfigValue. Use RACConfigValue"
[09] call       1   4   1  
[10] getglobal  1   7        ; RACConfigValue
[11] move       2   0      
[12] call       1   2   2  
[13] gettable   1   1   258  ; "Read"
[14] tailcall   1   1   0  
[15] return     1   0      
[16] return     0   1      
; end of function


; function [3] definition (level 3)
; 0 upvalues, 0 params, 9 stacks
.function  0 0 0 9
.local  "racver"  ; 0
.local  "htmlver"  ; 1
.local  "instver"  ; 2
.const  "RACConfigValue"  ; 0
.const  "ArcadeVersion"  ; 1
.const  "Read"  ; 2
.const  "HtmlVersion"  ; 3
.const  "INSTALLER_VER"  ; 4
.const  "racversion="  ; 5
.const  ""  ; 6
.const  "&installerversion="  ; 7
.const  "&htmlversion="  ; 8
[01] getglobal  0   0        ; RACConfigValue
[02] loadk      1   1        ; "ArcadeVersion"
[03] call       0   2   2  
[04] gettable   0   0   252  ; "Read"
[05] call       0   1   2  
[06] getglobal  1   0        ; RACConfigValue
[07] loadk      2   3        ; "HtmlVersion"
[08] call       1   2   2  
[09] gettable   1   1   252  ; "Read"
[10] call       1   1   2  
[11] getglobal  2   4        ; INSTALLER_VER
[12] loadk      3   5        ; "racversion="
[13] test       4   0   1    ; to [15] if false
[14] jmp        1            ; to [16]
[15] loadk      4   6        ; ""
[16] loadk      5   7        ; "&installerversion="
[17] test       6   2   1    ; to [19] if false
[18] jmp        1            ; to [20]
[19] loadk      6   6        ; ""
[20] loadk      7   8        ; "&htmlversion="
[21] test       8   1   1    ; to [23] if false
[22] jmp        1            ; to [24]
[23] loadk      8   6        ; ""
[24] concat     3   3   8  
[25] return     3   2      
[26] return     0   1      
; end of function


; function [4] definition (level 3)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
.const  "RequestURLParams"  ; 0
[1] getglobal  0   0        ; RequestURLParams
[2] tailcall   0   1   0  
[3] return     0   0      
[4] return     0   1      
; end of function


; function [5] definition (level 3)
; 1 upvalues, 0 params, 3 stacks
.function  1 0 0 3
.local  "RequestURLParamsInner"  ; 0
.local  "init"  ; 1
.upvalue  "win32"  ; 0
.const  "RequestURLParamsFromMemory"  ; 0
.const  "RequestURLParams"  ; 1

; function [0] definition (level 4)
; 1 upvalues, 1 params, 17 stacks
.function  1 1 0 17
.local  "recover"  ; 0
.local  "sfx"  ; 1
.local  "storefront"  ; 2
.local  "gameid"  ; 3
.local  "tps"  ; 4
.local  "ver"  ; 5
.local  "curtps"  ; 6
.local  "type"  ; 7
.local  "installed"  ; 8
.local  "catver"  ; 9
.local  "htmlver"  ; 10
.local  "src"  ; 11
.upvalue  "win32"  ; 0
.const  "os"  ; 0
.const  "getenv"  ; 1
.const  "sfxname"  ; 2
.const  "g_tableConfig"  ; 3
.const  "g_storeFront"  ; 4
.const  ".simplefilename"  ; 5
.const  "_"  ; 6
.const  "storeFront"  ; 7
.const  "string"  ; 8
.const  "find"  ; 9
.const  ""  ; 10
.const  "\\([%w]+)-[%w]?([%w-_]*)%s*[%[%(]?%d?[%]%)]?%.exe"  ; 11
.const  "main_env"  ; 12
.const  "contentid"  ; 13
.const  "g_env"  ; 14
.const  "curTps"  ; 15
.const  "io"  ; 16
.const  "write"  ; 17
.const  "\n"  ; 18
.const  "date"  ; 19
.const  "%c "  ; 20
.const  "Using g_env.curTps: "  ; 21
.const  "tostring"  ; 22
.const  "g_stampedgameid"  ; 23
.const  "Using stamped gamid: "  ; 24
.const  "\\([%w]+)-[%w]+_([%w-]+)_?([%w-_]*)%s*[%[%(]?%d?[%]%)]?%.exe"  ; 25
.const  "RACVerTps"  ; 26
.const  "SFX Environment: "  ; 27
.const  "Undefined"  ; 28
.const  "assert"  ; 29
.const  "badFilename"  ; 30
.const  "lower"  ; 31
.const  "payloadReq"  ; 32
.const  "tps="  ; 33
.const  "upgrade_"  ; 34
.const  "&installerversion="  ; 35
.const  "INSTALLER_VER"  ; 36
.const  "&gameid="  ; 37
.const  "curGameId"  ; 38
.const  "&machineid="  ; 39
.const  "getMachineID"  ; 40
.const  "g_strLocale"  ; 41
.const  "&li="  ; 42
.const  "&storefront="  ; 43
.const  "&racversion="  ; 44
.const  "&existingtps="  ; 45
.const  "&arcadeinstalled=1"  ; 46
.const  "&catalogversion="  ; 47
.const  "&htmlversion="  ; 48
.const  "&src="  ; 49
.const  "RequestURLParams: "  ; 50
[001] getglobal  1   0        ; os
[002] gettable   1   1   251  ; "getenv"
[003] loadk      2   2        ; "sfxname"
[004] call       1   2   2  
[005] loadnil    2   4      
[006] getglobal  5   3        ; g_tableConfig
[007] getglobal  6   4        ; g_storeFront
[008] loadk      7   5        ; ".simplefilename"
[009] concat     6   6   7  
[010] gettable   5   5   6  
[011] test       5   5   0    ; to [13] if true
[012] jmp        27           ; to [40]
[013] getglobal  5   8        ; string
[014] gettable   5   5   259  ; "find"
[015] test       6   1   1    ; to [17] if false
[016] jmp        1            ; to [18]
[017] loadk      6   10       ; ""
[018] loadk      7   11       ; "\\([%w]+)-[%w]?([%w-_]*)%s*[%[%(]?%d?[%]%)]?%.exe"
[019] call       5   3   4  
[020] setglobal  7   7        ; storeFront
[021] setglobal  6   6        ; _
[022] setglobal  5   6        ; _
[023] getglobal  5   12       ; main_env
[024] gettable   3   5   263  ; "contentid"
[025] getglobal  5   14       ; g_env
[026] gettable   4   5   265  ; "curTps"
[027] getglobal  5   16       ; io
[028] gettable   5   5   267  ; "write"
[029] loadk      6   18       ; "\n"
[030] getglobal  7   0        ; os
[031] gettable   7   7   269  ; "date"
[032] loadk      8   20       ; "%c "
[033] call       7   2   2  
[034] loadk      8   21       ; "Using g_env.curTps: "
[035] getglobal  9   22       ; tostring
[036] move       10  4      
[037] call       9   2   0  
[038] call       5   0   1  
[039] jmp        43           ; to [83]
[040] getglobal  5   23       ; g_stampedgameid
[041] test       5   5   0    ; to [43] if true
[042] jmp        28           ; to [71]
[043] getglobal  3   23       ; g_stampedgameid
[044] getglobal  5   16       ; io
[045] gettable   5   5   267  ; "write"
[046] loadk      6   18       ; "\n"
[047] getglobal  7   0        ; os
[048] gettable   7   7   269  ; "date"
[049] loadk      8   20       ; "%c "
[050] call       7   2   2  
[051] loadk      8   24       ; "Using stamped gamid: "
[052] getglobal  9   22       ; tostring
[053] move       10  3      
[054] call       9   2   0  
[055] call       5   0   1  
[056] getglobal  5   14       ; g_env
[057] gettable   4   5   265  ; "curTps"
[058] getglobal  5   16       ; io
[059] gettable   5   5   267  ; "write"
[060] loadk      6   18       ; "\n"
[061] getglobal  7   0        ; os
[062] gettable   7   7   269  ; "date"
[063] loadk      8   20       ; "%c "
[064] call       7   2   2  
[065] loadk      8   21       ; "Using g_env.curTps: "
[066] getglobal  9   22       ; tostring
[067] move       10  4      
[068] call       9   2   0  
[069] call       5   0   1  
[070] jmp        12           ; to [83]
[071] getglobal  5   8        ; string
[072] gettable   5   5   259  ; "find"
[073] test       6   1   1    ; to [75] if false
[074] jmp        1            ; to [76]
[075] loadk      6   10       ; ""
[076] loadk      7   25       ; "\\([%w]+)-[%w]+_([%w-]+)_?([%w-_]*)%s*[%[%(]?%d?[%]%)]?%.exe"
[077] call       5   3   6  
[078] move       4   9      
[079] move       3   8      
[080] move       2   7      
[081] setglobal  6   6        ; _
[082] setglobal  5   6        ; _
[083] test       2   2   0    ; to [85] if true
[084] jmp        1            ; to [86]
[085] setglobal  2   4        ; g_storeFront
[086] getglobal  5   26       ; RACVerTps
[087] call       5   1   8  
[088] getglobal  12  16       ; io
[089] gettable   12  12  267  ; "write"
[090] loadk      13  18       ; "\n"
[091] getglobal  14  0        ; os
[092] gettable   14  14  269  ; "date"
[093] loadk      15  20       ; "%c "
[094] call       14  2   2  
[095] loadk      15  27       ; "SFX Environment: "
[096] test       16  1   1    ; to [98] if false
[097] jmp        1            ; to [99]
[098] loadk      16  28       ; "Undefined"
[099] call       12  5   1  
[100] eq         0   4   260  ; "", to [102] if true
[101] jmp        1            ; to [103]
[102] loadnil    4   4      
[103] test       1   1   0    ; to [105] if true
[104] jmp        8            ; to [113]
[105] getglobal  12  29       ; assert
[106] test       4   4   1    ; to [108] if false
[107] jmp        2            ; to [110]
[108] test       13  6   0    ; to [110] if true
[109] jmp        1            ; to [111]
[110] move       13  3      
[111] loadk      14  30       ; "badFilename"
[112] call       12  3   1  
[113] test       4   4   0    ; to [115] if true
[114] jmp        23           ; to [138]
[115] getglobal  12  8        ; string
[116] gettable   12  12  281  ; "lower"
[117] move       13  4      
[118] call       12  2   2  
[119] move       4   12     
[120] getglobal  12  3        ; g_tableConfig
[121] getglobal  13  4        ; g_storeFront
[122] loadk      14  5        ; ".simplefilename"
[123] concat     13  13  14 
[124] gettable   12  12  13 
[125] test       12  12  0    ; to [127] if true
[126] jmp        1            ; to [128]
[127] jmp        10           ; to [138]
[128] getglobal  12  8        ; string
[129] gettable   12  12  259  ; "find"
[130] move       13  4      
[131] loadk      14  6        ; "_"
[132] call       12  3   2  
[133] test       12  12  1    ; to [135] if false
[134] jmp        3            ; to [138]
[135] move       12  4      
[136] loadk      13  6        ; "_"
[137] concat     4   12  13 
[138] test       3   3   0    ; to [140] if true
[139] jmp        5            ; to [145]
[140] getglobal  12  8        ; string
[141] gettable   12  12  281  ; "lower"
[142] move       13  3      
[143] call       12  2   2  
[144] move       3   12     
[145] loadk      12  33       ; "tps="
[146] test       13  4   1    ; to [148] if false
[147] jmp        3            ; to [151]
[148] test       13  6   1    ; to [150] if false
[149] jmp        1            ; to [151]
[150] loadk      13  34       ; "upgrade_"
[151] loadk      14  35       ; "&installerversion="
[152] getglobal  15  36       ; INSTALLER_VER
[153] concat     12  12  15 
[154] setglobal  12  32       ; payloadReq
[155] getglobal  12  32       ; payloadReq
[156] loadk      13  37       ; "&gameid="
[157] test       14  3   1    ; to [159] if false
[158] jmp        2            ; to [161]
[159] getglobal  14  14       ; g_env
[160] gettable   14  14  288  ; "curGameId"
[161] concat     12  12  14 
[162] setglobal  12  32       ; payloadReq
[163] getglobal  12  32       ; payloadReq
[164] loadk      13  39       ; "&machineid="
[165] getupval   14  0        ; win32
[166] gettable   14  14  290  ; "getMachineID"
[167] call       14  1   2  
[168] test       14  14  1    ; to [170] if false
[169] jmp        1            ; to [171]
[170] loadk      14  10       ; ""
[171] concat     12  12  14 
[172] setglobal  12  32       ; payloadReq
[173] getglobal  12  41       ; g_strLocale
[174] test       12  12  0    ; to [176] if true
[175] jmp        5            ; to [181]
[176] getglobal  12  32       ; payloadReq
[177] loadk      13  42       ; "&li="
[178] getglobal  14  41       ; g_strLocale
[179] concat     12  12  14 
[180] setglobal  12  32       ; payloadReq
[181] test       0   0   1    ; to [183] if false
[182] jmp        49           ; to [232]
[183] getglobal  12  4        ; g_storeFront
[184] test       12  12  0    ; to [186] if true
[185] jmp        5            ; to [191]
[186] getglobal  12  32       ; payloadReq
[187] loadk      13  43       ; "&storefront="
[188] getglobal  14  4        ; g_storeFront
[189] concat     12  12  14 
[190] setglobal  12  32       ; payloadReq
[191] test       5   5   0    ; to [193] if true
[192] jmp        5            ; to [198]
[193] getglobal  12  32       ; payloadReq
[194] loadk      13  44       ; "&racversion="
[195] move       14  5      
[196] concat     12  12  14 
[197] setglobal  12  32       ; payloadReq
[198] test       6   6   0    ; to [200] if true
[199] jmp        5            ; to [205]
[200] getglobal  12  32       ; payloadReq
[201] loadk      13  45       ; "&existingtps="
[202] move       14  6      
[203] concat     12  12  14 
[204] setglobal  12  32       ; payloadReq
[205] test       8   8   0    ; to [207] if true
[206] jmp        4            ; to [211]
[207] getglobal  12  32       ; payloadReq
[208] loadk      13  46       ; "&arcadeinstalled=1"
[209] concat     12  12  13 
[210] setglobal  12  32       ; payloadReq
[211] test       9   9   0    ; to [213] if true
[212] jmp        5            ; to [218]
[213] getglobal  12  32       ; payloadReq
[214] loadk      13  47       ; "&catalogversion="
[215] move       14  9      
[216] concat     12  12  14 
[217] setglobal  12  32       ; payloadReq
[218] test       10  10  0    ; to [220] if true
[219] jmp        5            ; to [225]
[220] getglobal  12  32       ; payloadReq
[221] loadk      13  48       ; "&htmlversion="
[222] move       14  10     
[223] concat     12  12  14 
[224] setglobal  12  32       ; payloadReq
[225] test       11  11  0    ; to [227] if true
[226] jmp        5            ; to [232]
[227] getglobal  12  32       ; payloadReq
[228] loadk      13  49       ; "&src="
[229] move       14  11     
[230] concat     12  12  14 
[231] setglobal  12  32       ; payloadReq
[232] getglobal  12  16       ; io
[233] gettable   12  12  267  ; "write"
[234] loadk      13  18       ; "\n"
[235] getglobal  14  0        ; os
[236] gettable   14  14  269  ; "date"
[237] loadk      15  20       ; "%c "
[238] call       14  2   2  
[239] loadk      15  50       ; "RequestURLParams: "
[240] getglobal  16  32       ; payloadReq
[241] call       12  5   1  
[242] getglobal  12  32       ; payloadReq
[243] return     12  2      
[244] return     0   1      
; end of function


; function [1] definition (level 4)
; 1 upvalues, 0 params, 2 stacks
.function  1 0 0 2
.upvalue  "init"  ; 0
[1] getupval   0   0        ; init
[2] return     0   2      
[3] return     0   1      
; end of function

[01] closure    0   0        ; 1 upvalues
[02] getupval   0   0        ; win32
[03] move       1   0      
[04] call       1   1   2  
[05] closure    2   1        ; 1 upvalues
[06] move       0   1      
[07] setglobal  2   0        ; RequestURLParamsFromMemory
[08] setglobal  0   1        ; RequestURLParams
[09] return     1   2      
[10] return     0   1      
; end of function


; function [6] definition (level 3)
; 3 upvalues, 0 params, 17 stacks
.function  3 0 0 17
.local  "ver"  ; 0
.local  "tps"  ; 1
.local  "type"  ; 2
.local  "catver"  ; 3
.local  "htmlver"  ; 4
.local  "installv1location"  ; 5
.local  "installed"  ; 6
.local  "V1"  ; 7
.local  "V2"  ; 8
.upvalue  "reg"  ; 0
.upvalue  "win32"  ; 1
.upvalue  "srcFromCookie"  ; 2
.const  "assert"  ; 0
.const  "comError"  ; 1
.const  "io"  ; 2
.const  "write"  ; 3
.const  "\n"  ; 4
.const  "os"  ; 5
.const  "date"  ; 6
.const  "%c "  ; 7
.const  "RAC Storefront: "  ; 8
.const  "g_storeFront"  ; 9
.const  "Not Found"  ; 10
.const  nil  ; 11
.const  "RealArcade"  ; 12
.const  "RAC Version: "  ; 13
.const  "RAC TPS: "  ; 14
.const  "RAC Client Type: "  ; 15
.const  "V1 location: "  ; 16
.const  ""  ; 17

; function [0] definition (level 4)
; 5 upvalues, 0 params, 12 stacks
.function  5 0 0 12
.local  "mainapp"  ; 0
.local  "version"  ; 1
.local  "installv1regloc"  ; 2
.local  "appLoc"  ; 3
.local  "val"  ; 4
.local  "shellCtl"  ; 5
.local  "path"  ; 6
.upvalue  "win32"  ; 0
.upvalue  "ver"  ; 1
.upvalue  "type"  ; 2
.upvalue  "tps"  ; 3
.upvalue  "installv1location"  ; 4
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Checking for V1 installation..."  ; 6
.const  "\\Preferences\\MainApp"  ; 7
.const  "\\Preferences\\ArcadeVersion"  ; 8
.const  "\\Preferences\\InstallPath"  ; 9
.const  "CurrentVersion"  ; 10
.const  "g_constants"  ; 11
.const  "v1contextkey"  ; 12
.const  "luacom"  ; 13
.const  "CreateObject"  ; 14
.const  "StubbyUtil.ShellCtl"  ; 15
.const  "assert"  ; 16
.const  "comError"  ; 17
.const  "GetRegKeyValue"  ; 18
.const  "HKEY_CLASSES_ROOT"  ; 19
.const  "v1basekey"  ; 20
.const  "fullclient"  ; 21
.const  ""  ; 22
.const  "string"  ; 23
.const  "sub"  ; 24
.const  0  ; 25
.const  "find"  ; 26
.const  "\\%w+%.%w%w%w"  ; 27
.const  "ExistingTPS"  ; 28
.const  "catalog\\CoreInfo.cfg"  ; 29
[01] getglobal  0   0        ; io
[02] gettable   0   0   251  ; "write"
[03] loadk      1   2        ; "\n"
[04] getglobal  2   3        ; os
[05] gettable   2   2   254  ; "date"
[06] loadk      3   5        ; "%c "
[07] call       2   2   2  
[08] loadk      3   6        ; "Checking for V1 installation..."
[09] call       0   4   1  
[10] loadk      0   7        ; "\\Preferences\\MainApp"
[11] loadk      1   8        ; "\\Preferences\\ArcadeVersion"
[12] loadk      2   9        ; "\\Preferences\\InstallPath"
[13] loadnil    3   3      
[14] getglobal  4   10       ; CurrentVersion
[15] getglobal  5   11       ; g_constants
[16] gettable   5   5   262  ; "v1contextkey"
[17] call       4   2   2  
[18] getglobal  5   13       ; luacom
[19] gettable   5   5   264  ; "CreateObject"
[20] loadk      6   15       ; "StubbyUtil.ShellCtl"
[21] call       5   2   2  
[22] getglobal  6   16       ; assert
[23] move       7   5      
[24] loadk      8   17       ; "comError"
[25] call       6   3   1  
[26] test       4   4   1    ; to [28] if false
[27] jmp        2            ; to [30]
[28] loadbool   6   0   0    ; false
[29] return     6   2      
[30] getupval   6   0        ; win32
[31] gettable   6   6   268  ; "GetRegKeyValue"
[32] loadk      7   19       ; "HKEY_CLASSES_ROOT"
[33] getglobal  8   11       ; g_constants
[34] gettable   8   8   270  ; "v1basekey"
[35] move       9   4      
[36] move       10  0      
[37] concat     8   8   10 
[38] call       6   3   2  
[39] move       3   6      
[40] getupval   6   0        ; win32
[41] gettable   6   6   268  ; "GetRegKeyValue"
[42] loadk      7   19       ; "HKEY_CLASSES_ROOT"
[43] getglobal  8   11       ; g_constants
[44] gettable   8   8   270  ; "v1basekey"
[45] move       9   4      
[46] move       10  1      
[47] concat     8   8   10 
[48] call       6   3   2  
[49] setupval   6   1        ; ver
[50] getglobal  6   11       ; g_constants
[51] gettable   6   6   271  ; "fullclient"
[52] setupval   6   2        ; type
[53] test       3   3   0    ; to [55] if true
[54] jmp        33           ; to [88]
[55] eq         1   3   272  ; "", to [57] if false
[56] jmp        31           ; to [88]
[57] getglobal  6   23       ; string
[58] gettable   6   6   274  ; "sub"
[59] move       7   3      
[60] loadk      8   25       ; 0
[61] getglobal  9   23       ; string
[62] gettable   9   9   276  ; "find"
[63] move       10  3      
[64] loadk      11  27       ; "\\%w+%.%w%w%w"
[65] call       9   3   0  
[66] call       6   0   2  
[67] self       7   5   278  ; "ExistingTPS"
[68] move       9   6      
[69] loadk      10  29       ; "catalog\\CoreInfo.cfg"
[70] concat     9   9   10 
[71] call       7   3   2  
[72] setupval   7   3        ; tps
[73] getupval   7   0        ; win32
[74] gettable   7   7   268  ; "GetRegKeyValue"
[75] loadk      8   19       ; "HKEY_CLASSES_ROOT"
[76] getglobal  9   11       ; g_constants
[77] gettable   9   9   270  ; "v1basekey"
[78] move       10  4      
[79] move       11  2      
[80] concat     9   9   11 
[81] call       7   3   2  
[82] setupval   7   4        ; installv1location
[83] getupval   7   4        ; installv1location
[84] test       7   7   1    ; to [86] if false
[85] jmp        2            ; to [88]
[86] loadk      7   22       ; ""
[87] setupval   7   4        ; installv1location
[88] loadbool   6   1   0    ; true
[89] return     6   2      
[90] return     0   1      
; end of function


; function [1] definition (level 4)
; 6 upvalues, 0 params, 9 stacks
.function  6 0 0 9
.local  "val"  ; 0
.local  "context"  ; 1
.local  "_"  ; 2
.local  "_"  ; 3
.local  "numVer"  ; 4
.upvalue  "ver"  ; 0
.upvalue  "win32"  ; 1
.upvalue  "tps"  ; 2
.upvalue  "type"  ; 3
.upvalue  "catver"  ; 4
.upvalue  "htmlver"  ; 5
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Checking for V2 installation..."  ; 6
.const  "CurrentVersion"  ; 7
.const  "g_constants"  ; 8
.const  "basekey"  ; 9
.const  "g_storeFront"  ; 10
.const  "\\"  ; 11
.const  "\\Preferences"  ; 12
.const  "GetRegKeyValue"  ; 13
.const  "HKEY_CLASSES_ROOT"  ; 14
.const  "versionkey"  ; 15
.const  ""  ; 16
.const  "string"  ; 17
.const  "find"  ; 18
.const  "(%d+%.%d+)%.%d+%.%d+"  ; 19
.const  "tonumber"  ; 20
.const  "RealArcade"  ; 21
.const  2.1  ; 22
.const  "tpskey"  ; 23
.const  "ractypekey"  ; 24
.const  "catverkey"  ; 25
.const  "htmlverkey"  ; 26
[001] getglobal  0   0        ; io
[002] gettable   0   0   251  ; "write"
[003] loadk      1   2        ; "\n"
[004] getglobal  2   3        ; os
[005] gettable   2   2   254  ; "date"
[006] loadk      3   5        ; "%c "
[007] call       2   2   2  
[008] loadk      3   6        ; "Checking for V2 installation..."
[009] call       0   4   1  
[010] getglobal  0   7        ; CurrentVersion
[011] call       0   1   2  
[012] test       0   0   1    ; to [14] if false
[013] jmp        2            ; to [16]
[014] loadbool   1   0   0    ; false
[015] return     1   2      
[016] getglobal  1   8        ; g_constants
[017] gettable   1   1   259  ; "basekey"
[018] getglobal  2   10       ; g_storeFront
[019] loadk      3   11       ; "\\"
[020] move       4   0      
[021] loadk      5   12       ; "\\Preferences"
[022] concat     1   1   5  
[023] getupval   2   1        ; win32
[024] gettable   2   2   263  ; "GetRegKeyValue"
[025] loadk      3   14       ; "HKEY_CLASSES_ROOT"
[026] move       4   1      
[027] getglobal  5   8        ; g_constants
[028] gettable   5   5   265  ; "versionkey"
[029] call       2   4   2  
[030] setupval   2   0        ; ver
[031] getupval   2   0        ; ver
[032] test       2   2   1    ; to [34] if false
[033] jmp        2            ; to [36]
[034] loadk      2   16       ; ""
[035] setupval   2   0        ; ver
[036] getglobal  2   17       ; string
[037] gettable   2   2   268  ; "find"
[038] getupval   3   0        ; ver
[039] loadk      4   19       ; "(%d+%.%d+)%.%d+%.%d+"
[040] call       2   3   4  
[041] getglobal  5   20       ; tonumber
[042] move       6   4      
[043] call       5   2   2  
[044] move       4   5      
[045] getglobal  5   10       ; g_storeFront
[046] eq         0   5   271  ; "RealArcade", to [48] if true
[047] jmp        6            ; to [54]
[048] test       4   4   0    ; to [50] if true
[049] jmp        2            ; to [52]
[050] lt         0   4   272  ; 2.1, to [52] if true
[051] jmp        2            ; to [54]
[052] loadbool   5   0   0    ; false
[053] return     5   2      
[054] getupval   5   1        ; win32
[055] gettable   5   5   263  ; "GetRegKeyValue"
[056] loadk      6   14       ; "HKEY_CLASSES_ROOT"
[057] move       7   1      
[058] getglobal  8   8        ; g_constants
[059] gettable   8   8   273  ; "tpskey"
[060] call       5   4   2  
[061] setupval   5   2        ; tps
[062] getupval   5   1        ; win32
[063] gettable   5   5   263  ; "GetRegKeyValue"
[064] loadk      6   14       ; "HKEY_CLASSES_ROOT"
[065] move       7   1      
[066] getglobal  8   8        ; g_constants
[067] gettable   8   8   274  ; "ractypekey"
[068] call       5   4   2  
[069] setupval   5   3        ; type
[070] getupval   5   1        ; win32
[071] gettable   5   5   263  ; "GetRegKeyValue"
[072] loadk      6   14       ; "HKEY_CLASSES_ROOT"
[073] move       7   1      
[074] getglobal  8   8        ; g_constants
[075] gettable   8   8   275  ; "catverkey"
[076] call       5   4   2  
[077] setupval   5   4        ; catver
[078] getupval   5   1        ; win32
[079] gettable   5   5   263  ; "GetRegKeyValue"
[080] loadk      6   14       ; "HKEY_CLASSES_ROOT"
[081] move       7   1      
[082] getglobal  8   8        ; g_constants
[083] gettable   8   8   276  ; "htmlverkey"
[084] call       5   4   2  
[085] setupval   5   5        ; htmlver
[086] getupval   5   2        ; tps
[087] test       5   5   1    ; to [89] if false
[088] jmp        2            ; to [91]
[089] loadk      5   16       ; ""
[090] setupval   5   2        ; tps
[091] getupval   5   3        ; type
[092] test       5   5   1    ; to [94] if false
[093] jmp        2            ; to [96]
[094] loadk      5   16       ; ""
[095] setupval   5   3        ; type
[096] getupval   5   4        ; catver
[097] test       5   5   1    ; to [99] if false
[098] jmp        2            ; to [101]
[099] loadk      5   16       ; ""
[100] setupval   5   4        ; catver
[101] getupval   5   5        ; htmlver
[102] test       5   5   1    ; to [104] if false
[103] jmp        2            ; to [106]
[104] loadk      5   16       ; ""
[105] setupval   5   5        ; htmlver
[106] loadbool   5   1   0    ; true
[107] return     5   2      
[108] return     0   1      
; end of function

[001] loadnil    0   6      
[002] getglobal  7   0        ; assert
[003] getupval   8   0        ; reg
[004] loadk      9   1        ; "comError"
[005] call       7   3   1  
[006] closure    7   0        ; 5 upvalues
[007] getupval   0   1        ; win32
[008] move       0   0      
[009] move       0   2      
[010] move       0   1      
[011] move       0   5      
[012] closure    8   1        ; 6 upvalues
[013] move       0   0      
[014] getupval   0   1        ; win32
[015] move       0   1      
[016] move       0   2      
[017] move       0   3      
[018] move       0   4      
[019] move       9   8      
[020] call       9   1   2  
[021] move       6   9      
[022] getglobal  9   2        ; io
[023] gettable   9   9   253  ; "write"
[024] loadk      10  4        ; "\n"
[025] getglobal  11  5        ; os
[026] gettable   11  11  256  ; "date"
[027] loadk      12  7        ; "%c "
[028] call       11  2   2  
[029] loadk      12  8        ; "RAC Storefront: "
[030] getglobal  13  9        ; g_storeFront
[031] test       13  13  1    ; to [33] if false
[032] jmp        1            ; to [34]
[033] loadk      13  10       ; "Not Found"
[034] call       9   5   1  
[035] test       6   6   1    ; to [37] if false
[036] jmp        9            ; to [46]
[037] getglobal  9   9        ; g_storeFront
[038] eq         1   9   261  ; nil, to [40] if false
[039] jmp        3            ; to [43]
[040] getglobal  9   9        ; g_storeFront
[041] eq         0   9   262  ; "RealArcade", to [43] if true
[042] jmp        3            ; to [46]
[043] move       9   7      
[044] call       9   1   2  
[045] move       6   9      
[046] getglobal  9   2        ; io
[047] gettable   9   9   253  ; "write"
[048] loadk      10  4        ; "\n"
[049] getglobal  11  5        ; os
[050] gettable   11  11  256  ; "date"
[051] loadk      12  7        ; "%c "
[052] call       11  2   2  
[053] loadk      12  13       ; "RAC Version: "
[054] test       13  0   1    ; to [56] if false
[055] jmp        1            ; to [57]
[056] loadk      13  10       ; "Not Found"
[057] call       9   5   1  
[058] getglobal  9   2        ; io
[059] gettable   9   9   253  ; "write"
[060] loadk      10  4        ; "\n"
[061] getglobal  11  5        ; os
[062] gettable   11  11  256  ; "date"
[063] loadk      12  7        ; "%c "
[064] call       11  2   2  
[065] loadk      12  14       ; "RAC TPS: "
[066] test       13  1   1    ; to [68] if false
[067] jmp        1            ; to [69]
[068] loadk      13  10       ; "Not Found"
[069] call       9   5   1  
[070] getglobal  9   2        ; io
[071] gettable   9   9   253  ; "write"
[072] loadk      10  4        ; "\n"
[073] getglobal  11  5        ; os
[074] gettable   11  11  256  ; "date"
[075] loadk      12  7        ; "%c "
[076] call       11  2   2  
[077] loadk      12  15       ; "RAC Client Type: "
[078] test       13  2   1    ; to [80] if false
[079] jmp        1            ; to [81]
[080] loadk      13  10       ; "Not Found"
[081] call       9   5   1  
[082] getglobal  9   2        ; io
[083] gettable   9   9   253  ; "write"
[084] loadk      10  4        ; "\n"
[085] getglobal  11  5        ; os
[086] gettable   11  11  256  ; "date"
[087] loadk      12  7        ; "%c "
[088] call       11  2   2  
[089] loadk      12  16       ; "V1 location: "
[090] test       13  5   1    ; to [92] if false
[091] jmp        1            ; to [93]
[092] loadk      13  10       ; "Not Found"
[093] call       9   5   1  
[094] eq         0   0   267  ; "", to [96] if true
[095] jmp        1            ; to [97]
[096] loadnil    0   0      
[097] eq         0   1   267  ; "", to [99] if true
[098] jmp        1            ; to [100]
[099] loadnil    1   1      
[100] eq         0   2   267  ; "", to [102] if true
[101] jmp        1            ; to [103]
[102] loadnil    2   2      
[103] eq         0   3   267  ; "", to [105] if true
[104] jmp        1            ; to [106]
[105] loadnil    3   3      
[106] eq         0   4   267  ; "", to [108] if true
[107] jmp        1            ; to [109]
[108] loadnil    4   4      
[109] move       9   0      
[110] move       10  1      
[111] move       11  2      
[112] move       12  6      
[113] move       13  3      
[114] move       14  4      
[115] getupval   15  2        ; srcFromCookie
[116] move       16  5      
[117] return     9   9      
[118] return     0   1      
; end of function


; function [7] definition (level 3)
; 1 upvalues, 0 params, 7 stacks
.function  1 0 0 7
.local  "mainapp"  ; 0
.local  "val"  ; 1
.upvalue  "win32"  ; 0
.const  "\\Preferences\\MainApp"  ; 0
.const  "CurrentVersion"  ; 1
.const  "g_constants"  ; 2
.const  "v1contextkey"  ; 3
.const  ""  ; 4
.const  "GetRegKeyValue"  ; 5
.const  "HKEY_CLASSES_ROOT"  ; 6
.const  "v1basekey"  ; 7
[01] loadk      0   0        ; "\\Preferences\\MainApp"
[02] getglobal  1   1        ; CurrentVersion
[03] getglobal  2   2        ; g_constants
[04] gettable   2   2   253  ; "v1contextkey"
[05] call       1   2   2  
[06] test       1   1   1    ; to [8] if false
[07] jmp        3            ; to [11]
[08] loadk      2   4        ; ""
[09] return     2   2      
[10] jmp        10           ; to [21]
[11] getupval   2   0        ; win32
[12] gettable   2   2   255  ; "GetRegKeyValue"
[13] loadk      3   6        ; "HKEY_CLASSES_ROOT"
[14] getglobal  4   2        ; g_constants
[15] gettable   4   4   257  ; "v1basekey"
[16] move       5   1      
[17] move       6   0      
[18] concat     4   4   6  
[19] tailcall   2   3   0  
[20] return     2   0      
[21] return     0   1      
; end of function


; function [8] definition (level 3)
; 0 upvalues, 1 params, 18 stacks
.function  0 1 0 18
.local  "strVersion"  ; 0
.local  "greater"  ; 1
.local  "equal"  ; 2
.local  "lessthan"  ; 3
.local  "result"  ; 4
.local  "tmp"  ; 5
.local  "dlg"  ; 6
.local  "strExisting"  ; 7
.local  "_"  ; 8
.local  "type"  ; 9
.local  "verItr"  ; 10
.local  "existingItr"  ; 11
.local  "(for generator)"  ; 12
.local  "(for state)"  ; 13
.local  "d"  ; 14
.local  "ver"  ; 15
.local  "exist"  ; 16
.const  1  ; 0
.const  2  ; 1
.const  3  ; 2
.const  "luacom"  ; 3
.const  "CreateObject"  ; 4
.const  "InstallerDlg.InstallDlgCtl"  ; 5
.const  "RACVerTps"  ; 6
.const  "assert"  ; 7
.const  "comError"  ; 8
.const  "io"  ; 9
.const  "write"  ; 10
.const  "\n"  ; 11
.const  "os"  ; 12
.const  "date"  ; 13
.const  "%c "  ; 14
.const  "Overinstall: No existing found"  ; 15
.const  "greaterVer"  ; 16
.const  "Existing version detected as: "  ; 17
.const  "Attempting to install version: "  ; 18
.const  "string"  ; 19
.const  "gfind"  ; 20
.const  "%d+"  ; 21
.const  nil  ; 22
.const  -1  ; 23
.const  "tonumber"  ; 24
.const  "Overinstall: EqualVersions found"  ; 25
.const  "equalVer"  ; 26
.const  "Overinstall: LesserVersion found"  ; 27
.const  "lesserVer"  ; 28
.const  "Overinstall: Greater found"  ; 29
[001] loadk      1   0        ; 1
[002] loadk      2   1        ; 2
[003] loadk      3   2        ; 3
[004] move       4   2      
[005] loadnil    5   5      
[006] getglobal  6   3        ; luacom
[007] gettable   6   6   254  ; "CreateObject"
[008] loadk      7   5        ; "InstallerDlg.InstallDlgCtl"
[009] call       6   2   2  
[010] getglobal  7   6        ; RACVerTps
[011] call       7   1   4  
[012] loadnil    10  11     
[013] getglobal  12  7        ; assert
[014] move       13  6      
[015] loadk      14  8        ; "comError"
[016] call       12  3   1  
[017] test       7   7   1    ; to [19] if false
[018] jmp        11           ; to [30]
[019] getglobal  12  9        ; io
[020] gettable   12  12  260  ; "write"
[021] loadk      13  11       ; "\n"
[022] getglobal  14  12       ; os
[023] gettable   14  14  263  ; "date"
[024] loadk      15  14       ; "%c "
[025] call       14  2   2  
[026] loadk      15  15       ; "Overinstall: No existing found"
[027] call       12  4   1  
[028] loadk      12  16       ; "greaterVer"
[029] return     12  2      
[030] getglobal  12  9        ; io
[031] gettable   12  12  260  ; "write"
[032] loadk      13  11       ; "\n"
[033] getglobal  14  12       ; os
[034] gettable   14  14  263  ; "date"
[035] loadk      15  14       ; "%c "
[036] call       14  2   2  
[037] loadk      15  17       ; "Existing version detected as: "
[038] move       16  7      
[039] call       12  5   1  
[040] getglobal  12  9        ; io
[041] gettable   12  12  260  ; "write"
[042] loadk      13  11       ; "\n"
[043] getglobal  14  12       ; os
[044] gettable   14  14  263  ; "date"
[045] loadk      15  14       ; "%c "
[046] call       14  2   2  
[047] loadk      15  18       ; "Attempting to install version: "
[048] move       16  0      
[049] call       12  5   1  
[050] getglobal  12  19       ; string
[051] gettable   12  12  270  ; "gfind"
[052] move       13  7      
[053] loadk      14  21       ; "%d+"
[054] call       12  3   2  
[055] move       11  12     
[056] getglobal  12  19       ; string
[057] gettable   12  12  270  ; "gfind"
[058] move       13  0      
[059] loadk      14  21       ; "%d+"
[060] call       12  3   2  
[061] move       10  12     
[062] move       12  10     
[063] loadnil    13  14     
[064] tforprep   12  23       ; to [88]
[065] move       15  11     
[066] call       15  1   2  
[067] move       5   15     
[068] eq         0   5   272  ; nil, to [70] if true
[069] jmp        1            ; to [71]
[070] loadk      5   23       ; -1
[071] getglobal  15  24       ; tonumber
[072] move       16  14     
[073] call       15  2   2  
[074] getglobal  16  24       ; tonumber
[075] move       17  5      
[076] call       16  2   2  
[077] lt         0   16  15   ; to [79] if true
[078] jmp        3            ; to [82]
[079] move       4   1      
[080] jmp        9            ; to [90]
[081] jmp        6            ; to [88]
[082] eq         0   15  16   ; to [84] if true
[083] jmp        2            ; to [86]
[084] move       4   2      
[085] jmp        2            ; to [88]
[086] move       4   3      
[087] jmp        2            ; to [90]
[088] tforloop   12      0    ; to [90] if exit
[089] jmp        -25          ; to [65]
[090] eq         0   4   2    ; to [92] if true
[091] jmp        11           ; to [103]
[092] getglobal  12  9        ; io
[093] gettable   12  12  260  ; "write"
[094] loadk      13  11       ; "\n"
[095] getglobal  14  12       ; os
[096] gettable   14  14  263  ; "date"
[097] loadk      15  14       ; "%c "
[098] call       14  2   2  
[099] loadk      15  25       ; "Overinstall: EqualVersions found"
[100] call       12  4   1  
[101] loadk      12  26       ; "equalVer"
[102] return     12  2      
[103] eq         0   4   3    ; to [105] if true
[104] jmp        11           ; to [116]
[105] getglobal  12  9        ; io
[106] gettable   12  12  260  ; "write"
[107] loadk      13  11       ; "\n"
[108] getglobal  14  12       ; os
[109] gettable   14  14  263  ; "date"
[110] loadk      15  14       ; "%c "
[111] call       14  2   2  
[112] loadk      15  27       ; "Overinstall: LesserVersion found"
[113] call       12  4   1  
[114] loadk      12  28       ; "lesserVer"
[115] return     12  2      
[116] eq         0   4   1    ; to [118] if true
[117] jmp        11           ; to [129]
[118] getglobal  12  9        ; io
[119] gettable   12  12  260  ; "write"
[120] loadk      13  11       ; "\n"
[121] getglobal  14  12       ; os
[122] gettable   14  14  263  ; "date"
[123] loadk      15  14       ; "%c "
[124] call       14  2   2  
[125] loadk      15  29       ; "Overinstall: Greater found"
[126] call       12  4   1  
[127] loadk      12  16       ; "greaterVer"
[128] return     12  2      
[129] return     0   1      
; end of function


; function [9] definition (level 3)
; 1 upvalues, 2 params, 9 stacks
.function  1 2 0 9
.local  "gameid"  ; 0
.local  "tps"  ; 1
.local  "existTps"  ; 2
.local  "ui"  ; 3
.upvalue  "win32"  ; 0
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Checking for prior install of "  ; 6
.const  "GetRegKeyValue"  ; 7
.const  "HKEY_CLASSES_ROOT"  ; 8
.const  "g_constants"  ; 9
.const  "basekey"  ; 10
.const  "g_storeFront"  ; 11
.const  "\\Games\\"  ; 12
.const  "\\1"  ; 13
.const  "Tps"  ; 14
.const  nil  ; 15
.const  ""  ; 16
.const  "InstallerUI"  ; 17
.const  "ErrorDialog"  ; 18
.const  1017  ; 19
.const  "assert"  ; 20
.const  "userAbort"  ; 21
[01] getglobal  2   0        ; io
[02] gettable   2   2   251  ; "write"
[03] loadk      3   2        ; "\n"
[04] getglobal  4   3        ; os
[05] gettable   4   4   254  ; "date"
[06] loadk      5   5        ; "%c "
[07] call       4   2   2  
[08] loadk      5   6        ; "Checking for prior install of "
[09] move       6   0      
[10] call       2   5   1  
[11] getupval   2   0        ; win32
[12] gettable   2   2   257  ; "GetRegKeyValue"
[13] loadk      3   8        ; "HKEY_CLASSES_ROOT"
[14] getglobal  4   9        ; g_constants
[15] gettable   4   4   260  ; "basekey"
[16] getglobal  5   11       ; g_storeFront
[17] loadk      6   12       ; "\\Games\\"
[18] move       7   0      
[19] loadk      8   13       ; "\\1"
[20] concat     4   4   8  
[21] loadk      5   14       ; "Tps"
[22] call       2   4   2  
[23] eq         1   2   265  ; nil, to [25] if false
[24] jmp        13           ; to [38]
[25] eq         1   2   266  ; "", to [27] if false
[26] jmp        11           ; to [38]
[27] eq         1   2   1    ; to [29] if false
[28] jmp        9            ; to [38]
[29] getglobal  3   17       ; InstallerUI
[30] call       3   1   2  
[31] gettable   4   3   268  ; "ErrorDialog"
[32] loadk      5   19       ; 1017
[33] call       4   2   1  
[34] getglobal  4   20       ; assert
[35] loadbool   5   0   0    ; false
[36] loadk      6   21       ; "userAbort"
[37] call       4   3   1  
[38] return     0   1      
; end of function


; function [10] definition (level 3)
; 0 upvalues, 0 params, 6 stacks
.function  0 0 0 6
.local  "migrating"  ; 0
.local  "racver"  ; 1
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Checking for migration"  ; 6
.const  "RACVerTps"  ; 7
.const  nil  ; 8
.const  ""  ; 9
.const  "string"  ; 10
.const  "find"  ; 11
.const  "1"  ; 12
.const  1  ; 13
.const  "2.0"  ; 14
.const  "We are migrating"  ; 15
.const  "We are not migrating"  ; 16
[01] getglobal  0   0        ; io
[02] gettable   0   0   251  ; "write"
[03] loadk      1   2        ; "\n"
[04] getglobal  2   3        ; os
[05] gettable   2   2   254  ; "date"
[06] loadk      3   5        ; "%c "
[07] call       2   2   2  
[08] loadk      3   6        ; "Checking for migration"
[09] call       0   4   1  
[10] loadbool   0   0   0    ; false
[11] getglobal  1   7        ; RACVerTps
[12] call       1   1   2  
[13] eq         1   1   258  ; nil, to [15] if false
[14] jmp        40           ; to [55]
[15] eq         1   1   259  ; "", to [17] if false
[16] jmp        38           ; to [55]
[17] getglobal  2   10       ; string
[18] gettable   2   2   261  ; "find"
[19] move       3   1      
[20] loadk      4   12       ; "1"
[21] call       2   3   2  
[22] eq         0   2   263  ; 1, to [24] if true
[23] jmp        2            ; to [26]
[24] loadbool   0   1   0    ; true
[25] jmp        8            ; to [34]
[26] getglobal  2   10       ; string
[27] gettable   2   2   261  ; "find"
[28] move       3   1      
[29] loadk      4   14       ; "2.0"
[30] call       2   3   2  
[31] eq         0   2   263  ; 1, to [33] if true
[32] jmp        1            ; to [34]
[33] loadbool   0   1   0    ; true
[34] test       0   0   0    ; to [36] if true
[35] jmp        10           ; to [46]
[36] getglobal  2   0        ; io
[37] gettable   2   2   251  ; "write"
[38] loadk      3   2        ; "\n"
[39] getglobal  4   3        ; os
[40] gettable   4   4   254  ; "date"
[41] loadk      5   5        ; "%c "
[42] call       4   2   2  
[43] loadk      5   15       ; "We are migrating"
[44] call       2   4   1  
[45] jmp        9            ; to [55]
[46] getglobal  2   0        ; io
[47] gettable   2   2   251  ; "write"
[48] loadk      3   2        ; "\n"
[49] getglobal  4   3        ; os
[50] gettable   4   4   254  ; "date"
[51] loadk      5   5        ; "%c "
[52] call       4   2   2  
[53] loadk      5   16       ; "We are not migrating"
[54] call       2   4   1  
[55] return     0   2      
[56] return     0   1      
; end of function


; function [11] definition (level 3)
; 0 upvalues, 1 params, 13 stacks
.function  0 1 0 13
.local  "cmd"  ; 0
.local  "path"  ; 1
.local  "pathLen"  ; 2
.local  "words"  ; 3
.local  "prevFolders"  ; 4
.local  "fixPath"  ; 5
.local  "(for generator)"  ; 6
.local  "(for state)"  ; 7
.local  "i"  ; 8
.local  "v"  ; 9
.local  "last"  ; 10
.const  ""  ; 0
.const  0  ; 1
.const  "string"  ; 2
.const  "gsub"  ; 3
.const  "(.-)\\"  ; 4
.const  "ipairs"  ; 5
.const  "sub"  ; 6
.const  2  ; 7
.const  "print"  ; 8

; function [0] definition (level 4)
; 3 upvalues, 1 params, 6 stacks
.function  3 1 0 6
.local  "folder"  ; 0
.local  "fCount"  ; 1
.upvalue  "pathLen"  ; 0
.upvalue  "prevFolders"  ; 1
.upvalue  "path"  ; 2
.const  0  ; 0
.const  "string"  ; 1
.const  "len"  ; 2
.const  1  ; 3
.const  "find"  ; 4
.const  " "  ; 5
.const  "sub"  ; 6
.const  6  ; 7
.const  "~"  ; 8
.const  "tostring"  ; 9
.const  "\\"  ; 10
[01] loadk      1   0        ; 0
[02] getupval   2   0        ; pathLen
[03] getglobal  3   1        ; string
[04] gettable   3   3   252  ; "len"
[05] move       4   0      
[06] call       3   2   2  
[07] add        2   2   3  
[08] add        2   2   253  ; 1
[09] setupval   2   0        ; pathLen
[10] getglobal  2   1        ; string
[11] gettable   2   2   254  ; "find"
[12] move       3   0      
[13] loadk      4   5        ; " "
[14] call       2   3   2  
[15] test       2   2   0    ; to [17] if true
[16] jmp        32           ; to [49]
[17] getglobal  2   1        ; string
[18] gettable   2   2   256  ; "sub"
[19] move       3   0      
[20] loadk      4   3        ; 1
[21] loadk      5   7        ; 6
[22] call       2   4   2  
[23] move       0   2      
[24] getupval   2   1        ; prevFolders
[25] gettable   2   2   0  
[26] test       2   2   0    ; to [28] if true
[27] jmp        6            ; to [34]
[28] getupval   2   1        ; prevFolders
[29] gettable   2   2   0  
[30] add        1   2   253  ; 1
[31] getupval   2   1        ; prevFolders
[32] settable   2   0   1  
[33] jmp        3            ; to [37]
[34] getupval   2   1        ; prevFolders
[35] settable   2   0   253  ; 1
[36] loadk      1   3        ; 1
[37] move       2   0      
[38] loadk      3   8        ; "~"
[39] getglobal  4   9        ; tostring
[40] move       5   1      
[41] call       4   2   2  
[42] concat     0   2   4  
[43] getupval   2   2        ; path
[44] loadk      3   10       ; "\\"
[45] move       4   0      
[46] concat     2   2   4  
[47] setupval   2   2        ; path
[48] jmp        5            ; to [54]
[49] getupval   2   2        ; path
[50] loadk      3   10       ; "\\"
[51] move       4   0      
[52] concat     2   2   4  
[53] setupval   2   2        ; path
[54] return     0   1      
; end of function


; function [1] definition (level 4)
; 1 upvalues, 1 params, 4 stacks
.function  1 1 0 4
.local  "w"  ; 0
.upvalue  "words"  ; 0
.const  "table"  ; 0
.const  "insert"  ; 1
[1] getglobal  1   0        ; table
[2] gettable   1   1   251  ; "insert"
[3] getupval   2   0        ; words
[4] move       3   0      
[5] call       1   3   1  
[6] return     0   1      
; end of function

[01] loadk      1   0        ; ""
[02] loadk      2   1        ; 0
[03] newtable   3   0   0    ; array=0, hash=0
[04] newtable   4   0   0    ; array=0, hash=0
[05] closure    5   0        ; 3 upvalues
[06] move       0   2      
[07] move       0   4      
[08] move       0   1      
[09] getglobal  6   2        ; string
[10] gettable   6   6   253  ; "gsub"
[11] move       7   0      
[12] loadk      8   4        ; "(.-)\\"
[13] closure    9   1        ; 1 upvalues
[14] move       0   3      
[15] call       6   4   1  
[16] getglobal  6   5        ; ipairs
[17] move       7   3      
[18] call       6   2   5  
[19] tforprep   6   3        ; to [23]
[20] move       10  5      
[21] move       11  9      
[22] call       10  2   1  
[23] tforloop   6       1    ; to [25] if exit
[24] jmp        -5           ; to [20]
[25] getglobal  6   2        ; string
[26] gettable   6   6   256  ; "sub"
[27] move       7   1      
[28] loadk      8   7        ; 2
[29] call       6   3   2  
[30] move       1   6      
[31] getglobal  6   2        ; string
[32] gettable   6   6   256  ; "sub"
[33] move       7   0      
[34] move       8   2      
[35] call       6   3   2  
[36] getglobal  7   2        ; string
[37] gettable   7   7   256  ; "sub"
[38] move       8   6      
[39] loadk      9   7        ; 2
[40] call       7   3   2  
[41] move       6   7      
[42] move       7   5      
[43] move       8   6      
[44] call       7   2   1  
[45] getglobal  7   8        ; print
[46] move       8   6      
[47] call       7   2   1  
[48] return     1   2      
[49] return     0   1      
; end of function

[01] getglobal  0   0        ; luacom
[02] gettable   0   0   251  ; "CreateObject"
[03] loadk      1   2        ; "StubbyUtil.RegAccess"
[04] call       0   2   2  
[05] getglobal  1   3        ; Win32Interop
[06] call       1   1   2  
[07] gettable   2   1   254  ; "GetCookieItem"
[08] getglobal  3   5        ; COOKIE_URL
[09] loadk      4   6        ; "src"
[10] call       2   3   2  
[11] eq         0   2   257  ; "\"\"", to [13] if true
[12] jmp        1            ; to [14]
[13] loadk      2   8        ; ""
[14] gettable   3   1   254  ; "GetCookieItem"
[15] getglobal  4   5        ; COOKIE_URL
[16] loadk      5   9        ; "tps"
[17] call       3   3   2  
[18] gettable   4   1   254  ; "GetCookieItem"
[19] getglobal  5   5        ; COOKIE_URL
[20] loadk      6   10       ; "gameid"
[21] call       4   3   2  
[22] loadk      5   12       ; "RealArcade"
[23] setglobal  5   11       ; g_storeFront
[24] loadnil    5   5      
[25] setglobal  5   13       ; g_stampedgameid
[26] closure    5   0        ; 2 upvalues
[27] move       0   0      
[28] move       0   1      
[29] setglobal  5   14       ; CurrentVersion
[30] closure    5   1        ; 1 upvalues
[31] move       0   1      
[32] setglobal  5   15       ; RACConfigValue
[33] closure    5   2        ; 0 upvalues
[34] setglobal  5   16       ; RAConfigValue
[35] closure    5   3        ; 0 upvalues
[36] setglobal  5   17       ; RequestVersionParams
[37] closure    5   4        ; 0 upvalues
[38] setglobal  5   18       ; RequestURLParamsFromMemory
[39] closure    5   5        ; 1 upvalues
[40] move       0   1      
[41] setglobal  5   19       ; RequestURLParams
[42] closure    5   6        ; 3 upvalues
[43] move       0   0      
[44] move       0   1      
[45] move       0   2      
[46] setglobal  5   20       ; RACVerTps
[47] closure    5   7        ; 1 upvalues
[48] move       0   1      
[49] setglobal  5   21       ; V1MainApp
[50] closure    5   8        ; 0 upvalues
[51] setglobal  5   22       ; CheckOverInstall
[52] closure    5   9        ; 1 upvalues
[53] move       0   1      
[54] setglobal  5   23       ; CheckGameExists
[55] closure    5   10       ; 0 upvalues
[56] setglobal  5   24       ; IsMigration
[57] closure    5   11       ; 0 upvalues
[58] setglobal  5   25       ; ConvertToCmdLine
[59] return     0   1      
; end of function


; function [5] definition (level 2)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
.const  "g_error"  ; 0
.const  "ConstTable"  ; 1
.const  "g_extraErrorInfo"  ; 2
.const  ""  ; 3
.const  "httpError"  ; 4
.const  "log"  ; 5
.const  "\nServer returned error code on last request"  ; 6
.const  "key"  ; 7
.const  "locale"  ; 8
.const  1001  ; 9
.const  "severity"  ; 10
.const  "warning"  ; 11
.const  "ExtraInfo"  ; 12
.const  "failedConnect"  ; 13
.const  "\nFailed to connect to remote host"  ; 14
.const  "fatalNetwork"  ; 15
.const  "\nFailed to connect to remote host. Can not retry."  ; 16
.const  "critical"  ; 17
.const  "badXml"  ; 18
.const  "\nInvalid XML Schema."  ; 19
.const  1002  ; 20
.const  "badRACInstall"  ; 21
.const  "\nRAC installation failed!"  ; 22
.const  "comError"  ; 23
.const  "\nFailed to create specified COM object. Is object registered?"  ; 24
.const  "userAbort"  ; 25
.const  "\nUser has aborted installation."  ; 26
.const  "diskFull"  ; 27
.const  "\nDisk Full!"  ; 28
.const  1004  ; 29
.const  "writeLocal"  ; 30
.const  "\nFailed to write local file to disk"  ; 31
.const  1005  ; 32
.const  "lesserVer"  ; 33
.const  "\nNewer RAC version already installed."  ; 34
.const  1006  ; 35
.const  "missingrgi"  ; 36
.const  "\nInstaller invoked with no rgi file argument."  ; 37
.const  "invalidpath"  ; 38
.const  "\nInvalid Path."  ; 39
.const  "unk"  ; 40
.const  "\nAn undefined error has occured."  ; 41
.const  1007  ; 42
.const  "instance"  ; 43
.const  "\nAnother game is currently being installed. Please complete that installation before downloading another game."  ; 44
.const  1013  ; 45
.const  "raConfigMgr"  ; 46
.const  "\nFailed to instaniate RAConfigureMgr."  ; 47
.const  "badFilename"  ; 48
.const  "\nInvalid stubby filename."  ; 49
.const  1015  ; 50
.const  "wndClose"  ; 51
.const  "\nMain window received close message."  ; 52
.const  "customExit"  ; 53
.const  "\nNormal custom exit."  ; 54
.const  "createProc"  ; 55
.const  "\nFailed to launch external process."  ; 56
.const  "diskStolen"  ; 57
.const  "\nChosen path cannot be accessed."  ; 58
.const  1039  ; 59
[001] getglobal  0   1        ; ConstTable
[002] call       0   1   2  
[003] setglobal  0   0        ; g_error
[004] loadk      0   3        ; ""
[005] setglobal  0   2        ; g_extraErrorInfo
[006] getglobal  0   0        ; g_error
[007] newtable   1   0   0    ; array=0, hash=0
[008] settable   0   254 1    ; "httpError"
[009] getglobal  0   0        ; g_error
[010] gettable   0   0   254  ; "httpError"
[011] settable   0   255 256  ; "log" "\nServer returned error code on last request"
[012] getglobal  0   0        ; g_error
[013] gettable   0   0   254  ; "httpError"
[014] settable   0   257 254  ; "key" "httpError"
[015] getglobal  0   0        ; g_error
[016] gettable   0   0   254  ; "httpError"
[017] settable   0   258 259  ; "locale" 1001
[018] getglobal  0   0        ; g_error
[019] gettable   0   0   254  ; "httpError"
[020] settable   0   260 261  ; "severity" "warning"
[021] getglobal  0   0        ; g_error
[022] gettable   0   0   254  ; "httpError"
[023] loadbool   1   1   0    ; true
[024] settable   0   262 1    ; "ExtraInfo"
[025] getglobal  0   0        ; g_error
[026] newtable   1   0   0    ; array=0, hash=0
[027] settable   0   263 1    ; "failedConnect"
[028] getglobal  0   0        ; g_error
[029] gettable   0   0   263  ; "failedConnect"
[030] settable   0   255 264  ; "log" "\nFailed to connect to remote host"
[031] getglobal  0   0        ; g_error
[032] gettable   0   0   263  ; "failedConnect"
[033] settable   0   257 263  ; "key" "failedConnect"
[034] getglobal  0   0        ; g_error
[035] gettable   0   0   263  ; "failedConnect"
[036] settable   0   258 259  ; "locale" 1001
[037] getglobal  0   0        ; g_error
[038] gettable   0   0   263  ; "failedConnect"
[039] settable   0   260 261  ; "severity" "warning"
[040] getglobal  0   0        ; g_error
[041] newtable   1   0   0    ; array=0, hash=0
[042] settable   0   265 1    ; "fatalNetwork"
[043] getglobal  0   0        ; g_error
[044] gettable   0   0   265  ; "fatalNetwork"
[045] settable   0   255 266  ; "log" "\nFailed to connect to remote host. Can not retry."
[046] getglobal  0   0        ; g_error
[047] gettable   0   0   265  ; "fatalNetwork"
[048] settable   0   257 265  ; "key" "fatalNetwork"
[049] getglobal  0   0        ; g_error
[050] gettable   0   0   265  ; "fatalNetwork"
[051] settable   0   258 259  ; "locale" 1001
[052] getglobal  0   0        ; g_error
[053] gettable   0   0   265  ; "fatalNetwork"
[054] settable   0   260 267  ; "severity" "critical"
[055] getglobal  0   0        ; g_error
[056] getglobal  1   1        ; ConstTable
[057] call       1   1   2  
[058] settable   0   268 1    ; "badXml"
[059] getglobal  0   0        ; g_error
[060] gettable   0   0   268  ; "badXml"
[061] settable   0   255 269  ; "log" "\nInvalid XML Schema."
[062] getglobal  0   0        ; g_error
[063] gettable   0   0   268  ; "badXml"
[064] settable   0   257 268  ; "key" "badXml"
[065] getglobal  0   0        ; g_error
[066] gettable   0   0   268  ; "badXml"
[067] settable   0   258 270  ; "locale" 1002
[068] getglobal  0   0        ; g_error
[069] gettable   0   0   268  ; "badXml"
[070] settable   0   260 267  ; "severity" "critical"
[071] getglobal  0   0        ; g_error
[072] getglobal  1   1        ; ConstTable
[073] call       1   1   2  
[074] settable   0   271 1    ; "badRACInstall"
[075] getglobal  0   0        ; g_error
[076] gettable   0   0   271  ; "badRACInstall"
[077] settable   0   255 272  ; "log" "\nRAC installation failed!"
[078] getglobal  0   0        ; g_error
[079] gettable   0   0   271  ; "badRACInstall"
[080] settable   0   258 270  ; "locale" 1002
[081] getglobal  0   0        ; g_error
[082] gettable   0   0   271  ; "badRACInstall"
[083] settable   0   257 271  ; "key" "badRACInstall"
[084] getglobal  0   0        ; g_error
[085] gettable   0   0   271  ; "badRACInstall"
[086] settable   0   260 267  ; "severity" "critical"
[087] getglobal  0   0        ; g_error
[088] getglobal  1   1        ; ConstTable
[089] call       1   1   2  
[090] settable   0   273 1    ; "comError"
[091] getglobal  0   0        ; g_error
[092] gettable   0   0   273  ; "comError"
[093] settable   0   255 274  ; "log" "\nFailed to create specified COM object. Is object registered?"
[094] getglobal  0   0        ; g_error
[095] gettable   0   0   273  ; "comError"
[096] settable   0   258 270  ; "locale" 1002
[097] getglobal  0   0        ; g_error
[098] gettable   0   0   273  ; "comError"
[099] settable   0   257 273  ; "key" "comError"
[100] getglobal  0   0        ; g_error
[101] gettable   0   0   273  ; "comError"
[102] settable   0   260 267  ; "severity" "critical"
[103] getglobal  0   0        ; g_error
[104] getglobal  1   1        ; ConstTable
[105] call       1   1   2  
[106] settable   0   275 1    ; "userAbort"
[107] getglobal  0   0        ; g_error
[108] gettable   0   0   275  ; "userAbort"
[109] settable   0   255 276  ; "log" "\nUser has aborted installation."
[110] getglobal  0   0        ; g_error
[111] gettable   0   0   275  ; "userAbort"
[112] settable   0   257 275  ; "key" "userAbort"
[113] getglobal  0   0        ; g_error
[114] gettable   0   0   275  ; "userAbort"
[115] settable   0   260 267  ; "severity" "critical"
[116] getglobal  0   0        ; g_error
[117] getglobal  1   1        ; ConstTable
[118] call       1   1   2  
[119] settable   0   277 1    ; "diskFull"
[120] getglobal  0   0        ; g_error
[121] gettable   0   0   277  ; "diskFull"
[122] settable   0   255 278  ; "log" "\nDisk Full!"
[123] getglobal  0   0        ; g_error
[124] gettable   0   0   277  ; "diskFull"
[125] settable   0   257 277  ; "key" "diskFull"
[126] getglobal  0   0        ; g_error
[127] gettable   0   0   277  ; "diskFull"
[128] settable   0   258 279  ; "locale" 1004
[129] getglobal  0   0        ; g_error
[130] gettable   0   0   277  ; "diskFull"
[131] settable   0   260 267  ; "severity" "critical"
[132] getglobal  0   0        ; g_error
[133] getglobal  1   1        ; ConstTable
[134] call       1   1   2  
[135] settable   0   280 1    ; "writeLocal"
[136] getglobal  0   0        ; g_error
[137] gettable   0   0   280  ; "writeLocal"
[138] settable   0   255 281  ; "log" "\nFailed to write local file to disk"
[139] getglobal  0   0        ; g_error
[140] gettable   0   0   280  ; "writeLocal"
[141] settable   0   257 280  ; "key" "writeLocal"
[142] getglobal  0   0        ; g_error
[143] gettable   0   0   280  ; "writeLocal"
[144] settable   0   258 282  ; "locale" 1005
[145] getglobal  0   0        ; g_error
[146] gettable   0   0   280  ; "writeLocal"
[147] settable   0   260 267  ; "severity" "critical"
[148] getglobal  0   0        ; g_error
[149] getglobal  1   1        ; ConstTable
[150] call       1   1   2  
[151] settable   0   283 1    ; "lesserVer"
[152] getglobal  0   0        ; g_error
[153] gettable   0   0   283  ; "lesserVer"
[154] settable   0   255 284  ; "log" "\nNewer RAC version already installed."
[155] getglobal  0   0        ; g_error
[156] gettable   0   0   283  ; "lesserVer"
[157] settable   0   258 285  ; "locale" 1006
[158] getglobal  0   0        ; g_error
[159] gettable   0   0   283  ; "lesserVer"
[160] settable   0   257 283  ; "key" "lesserVer"
[161] getglobal  0   0        ; g_error
[162] gettable   0   0   283  ; "lesserVer"
[163] settable   0   260 267  ; "severity" "critical"
[164] getglobal  0   0        ; g_error
[165] getglobal  1   1        ; ConstTable
[166] call       1   1   2  
[167] settable   0   286 1    ; "missingrgi"
[168] getglobal  0   0        ; g_error
[169] gettable   0   0   286  ; "missingrgi"
[170] settable   0   255 287  ; "log" "\nInstaller invoked with no rgi file argument."
[171] getglobal  0   0        ; g_error
[172] gettable   0   0   286  ; "missingrgi"
[173] settable   0   257 286  ; "key" "missingrgi"
[174] getglobal  0   0        ; g_error
[175] gettable   0   0   286  ; "missingrgi"
[176] settable   0   260 267  ; "severity" "critical"
[177] getglobal  0   0        ; g_error
[178] getglobal  1   1        ; ConstTable
[179] call       1   1   2  
[180] settable   0   288 1    ; "invalidpath"
[181] getglobal  0   0        ; g_error
[182] gettable   0   0   288  ; "invalidpath"
[183] settable   0   255 289  ; "log" "\nInvalid Path."
[184] getglobal  0   0        ; g_error
[185] gettable   0   0   288  ; "invalidpath"
[186] settable   0   257 288  ; "key" "invalidpath"
[187] getglobal  0   0        ; g_error
[188] gettable   0   0   288  ; "invalidpath"
[189] settable   0   260 267  ; "severity" "critical"
[190] getglobal  0   0        ; g_error
[191] getglobal  1   1        ; ConstTable
[192] call       1   1   2  
[193] settable   0   290 1    ; "unk"
[194] getglobal  0   0        ; g_error
[195] gettable   0   0   290  ; "unk"
[196] settable   0   255 291  ; "log" "\nAn undefined error has occured."
[197] getglobal  0   0        ; g_error
[198] gettable   0   0   290  ; "unk"
[199] settable   0   258 292  ; "locale" 1007
[200] getglobal  0   0        ; g_error
[201] gettable   0   0   290  ; "unk"
[202] settable   0   257 290  ; "key" "unk"
[203] getglobal  0   0        ; g_error
[204] gettable   0   0   290  ; "unk"
[205] settable   0   260 267  ; "severity" "critical"
[206] getglobal  0   0        ; g_error
[207] getglobal  1   1        ; ConstTable
[208] call       1   1   2  
[209] settable   0   293 1    ; "instance"
[210] getglobal  0   0        ; g_error
[211] gettable   0   0   293  ; "instance"
[212] settable   0   255 294  ; "log" "\nAnother game is currently being installed. Please complete that installation before downloading another game."
[213] getglobal  0   0        ; g_error
[214] gettable   0   0   293  ; "instance"
[215] settable   0   258 295  ; "locale" 1013
[216] getglobal  0   0        ; g_error
[217] gettable   0   0   293  ; "instance"
[218] settable   0   257 293  ; "key" "instance"
[219] getglobal  0   0        ; g_error
[220] gettable   0   0   293  ; "instance"
[221] settable   0   260 267  ; "severity" "critical"
[222] getglobal  0   0        ; g_error
[223] getglobal  1   1        ; ConstTable
[224] call       1   1   2  
[225] settable   0   296 1    ; "raConfigMgr"
[226] getglobal  0   0        ; g_error
[227] gettable   0   0   296  ; "raConfigMgr"
[228] settable   0   255 297  ; "log" "\nFailed to instaniate RAConfigureMgr."
[229] getglobal  0   0        ; g_error
[230] gettable   0   0   296  ; "raConfigMgr"
[231] settable   0   258 270  ; "locale" 1002
[232] getglobal  0   0        ; g_error
[233] gettable   0   0   296  ; "raConfigMgr"
[234] settable   0   257 296  ; "key" "raConfigMgr"
[235] getglobal  0   0        ; g_error
[236] gettable   0   0   296  ; "raConfigMgr"
[237] settable   0   260 267  ; "severity" "critical"
[238] getglobal  0   0        ; g_error
[239] getglobal  1   1        ; ConstTable
[240] call       1   1   2  
[241] settable   0   298 1    ; "badFilename"
[242] getglobal  0   0        ; g_error
[243] gettable   0   0   298  ; "badFilename"
[244] settable   0   255 299  ; "log" "\nInvalid stubby filename."
[245] getglobal  0   0        ; g_error
[246] gettable   0   0   298  ; "badFilename"
[247] settable   0   258 300  ; "locale" 1015
[248] getglobal  0   0        ; g_error
[249] gettable   0   0   298  ; "badFilename"
[250] settable   0   257 298  ; "key" "badFilename"
[251] getglobal  0   0        ; g_error
[252] gettable   0   0   298  ; "badFilename"
[253] settable   0   260 267  ; "severity" "critical"
[254] getglobal  0   0        ; g_error
[255] getglobal  1   1        ; ConstTable
[256] call       1   1   2  
[257] settable   0   301 1    ; "wndClose"
[258] getglobal  0   0        ; g_error
[259] gettable   0   0   301  ; "wndClose"
[260] settable   0   255 302  ; "log" "\nMain window received close message."
[261] getglobal  0   0        ; g_error
[262] gettable   0   0   301  ; "wndClose"
[263] settable   0   257 301  ; "key" "wndClose"
[264] getglobal  0   0        ; g_error
[265] gettable   0   0   301  ; "wndClose"
[266] settable   0   260 267  ; "severity" "critical"
[267] getglobal  0   0        ; g_error
[268] getglobal  1   1        ; ConstTable
[269] call       1   1   2  
[270] settable   0   303 1    ; "customExit"
[271] getglobal  0   0        ; g_error
[272] gettable   0   0   303  ; "customExit"
[273] settable   0   255 304  ; "log" "\nNormal custom exit."
[274] getglobal  0   0        ; g_error
[275] gettable   0   0   303  ; "customExit"
[276] settable   0   257 303  ; "key" "customExit"
[277] getglobal  0   0        ; g_error
[278] gettable   0   0   303  ; "customExit"
[279] settable   0   260 267  ; "severity" "critical"
[280] getglobal  0   0        ; g_error
[281] getglobal  1   1        ; ConstTable
[282] call       1   1   2  
[283] settable   0   305 1    ; "createProc"
[284] getglobal  0   0        ; g_error
[285] gettable   0   0   305  ; "createProc"
[286] settable   0   255 306  ; "log" "\nFailed to launch external process."
[287] getglobal  0   0        ; g_error
[288] gettable   0   0   305  ; "createProc"
[289] settable   0   258 270  ; "locale" 1002
[290] getglobal  0   0        ; g_error
[291] gettable   0   0   305  ; "createProc"
[292] settable   0   257 305  ; "key" "createProc"
[293] getglobal  0   0        ; g_error
[294] gettable   0   0   305  ; "createProc"
[295] settable   0   260 267  ; "severity" "critical"
[296] getglobal  0   0        ; g_error
[297] getglobal  1   1        ; ConstTable
[298] call       1   1   2  
[299] settable   0   307 1    ; "diskStolen"
[300] getglobal  0   0        ; g_error
[301] gettable   0   0   307  ; "diskStolen"
[302] settable   0   255 308  ; "log" "\nChosen path cannot be accessed."
[303] getglobal  0   0        ; g_error
[304] gettable   0   0   307  ; "diskStolen"
[305] settable   0   258 309  ; "locale" 1039
[306] getglobal  0   0        ; g_error
[307] gettable   0   0   307  ; "diskStolen"
[308] settable   0   257 307  ; "key" "diskStolen"
[309] getglobal  0   0        ; g_error
[310] gettable   0   0   307  ; "diskStolen"
[311] settable   0   260 267  ; "severity" "critical"
[312] return     0   1      
; end of function


; function [6] definition (level 2)
; 0 upvalues, 0 params, 9 stacks
.function  0 0 0 9
.local  "instState"  ; 0
.local  "procMgr"  ; 1
.local  "win32"  ; 2
.local  "uistate"  ; 3
.local  "errHandler"  ; 4
.local  "slideState"  ; 5
.local  "ProgressMessage"  ; 6
.const  "luacom"  ; 0
.const  "CreateObject"  ; 1
.const  "RACInstaller.StateCtrl"  ; 2
.const  "StubbyUtil.ProcessMgr"  ; 3
.const  "Win32Interop"  ; 4
.const  "Begin"  ; 5
.const  "assert"  ; 6
.const  "comError"  ; 7
.const  "KeepMinimized"  ; 8
.const  "data"  ; 9
.const  nil  ; 10
.const  "err"  ; 11
.const  "Sink"  ; 12
.const  "InstallerUI"  ; 13
.const  "NullUI"  ; 14

; function [0] definition (level 3)
; 0 upvalues, 1 params, 4 stacks
.function  0 1 0 4
.local  "val"  ; 0
.local  "reg"  ; 1
.const  "RACConfigValue"  ; 0
.const  "KeepMinimized"  ; 1
.const  "Write"  ; 2
[1] getglobal  1   0        ; RACConfigValue
[2] loadk      2   1        ; "KeepMinimized"
[3] call       1   2   2  
[4] gettable   2   1   252  ; "Write"
[5] move       3   0      
[6] call       2   2   1  
[7] return     0   1      
; end of function


; function [1] definition (level 3)
; 1 upvalues, 2 params, 5 stacks
.function  1 2 0 5
.local  "chunk"  ; 0
.local  "err"  ; 1
.upvalue  "ProgressMessage"  ; 0
.const  "err"  ; 0
.const  "data"  ; 1
.const  "io"  ; 2
.const  "write"  ; 3
.const  "\n"  ; 4
[01] getupval   2   0        ; ProgressMessage
[02] settable   2   250 1    ; "err"
[03] getupval   2   0        ; ProgressMessage
[04] settable   2   251 0    ; "data"
[05] getglobal  2   2        ; io
[06] gettable   2   2   253  ; "write"
[07] loadk      3   4        ; "\n"
[08] move       4   0      
[09] call       2   3   1  
[10] return     0   1      
; end of function


; function [2] definition (level 3)
; 6 upvalues, 0 params, 22 stacks
.function  6 0 0 22
.local  "prompt"  ; 0
.local  "pollmode"  ; 1
.local  "pollcount"  ; 2
.local  "PreClose"  ; 3
.local  "Slideshow"  ; 4
.local  "stepBuckets"  ; 5
.local  "StepBucket"  ; 6
.local  "SlideSet"  ; 7
.local  "OnMainWndClose"  ; 8
.local  "OnProcess"  ; 9
.local  "OnChooseFolder"  ; 10
.local  "OnJSLoadComplete"  ; 11
.local  "OnQueueDownload"  ; 12
.local  "OnQueueRemove"  ; 13
.local  "OnQueuePause"  ; 14
.local  "OnQueueTop"  ; 15
.local  "OnMessage"  ; 16
.local  "PollMonkey"  ; 17
.upvalue  "errHandler"  ; 0
.upvalue  "slideState"  ; 1
.upvalue  "instState"  ; 2
.upvalue  "win32"  ; 3
.upvalue  "uistate"  ; 4
.upvalue  "ProgressMessage"  ; 5
.const  1  ; 0
.const  "ErrorHandler"  ; 1
.const  "uiInstance"  ; 2
.const  "io"  ; 3
.const  "write"  ; 4
.const  "\n"  ; 5
.const  "os"  ; 6
.const  "date"  ; 7
.const  "%c "  ; 8
.const  "Creating instance of InstallerUI"  ; 9
.const  "ConstTable"  ; 10
.const  "mainDlg"  ; 11
.const  "luacom"  ; 12
.const  "CreateObject"  ; 13
.const  "InstallerDlg.InstallDlgCtl"  ; 14
.const  "assert"  ; 15
.const  "comError"  ; 16
.const  "ctlEvents"  ; 17
.const  "OnChooseFolder"  ; 18
.const  "OnProcess"  ; 19
.const  "res"  ; 20
.const  "Connect"  ; 21
.const  "data"  ; 22
.const  "pbarDisplayProgress"  ; 23
.const  "pbarPayloadTotalBytes"  ; 24
.const  0  ; 25
.const  "pbarPayloadBytes"  ; 26
.const  "progressGranularity"  ; 27
.const  "totalProgress"  ; 28
.const  "jsEnabled"  ; 29
.const  "statusText"  ; 30
.const  ""  ; 31
.const  "lastUpdateTime"  ; 32
.const  "currentPayload"  ; 33
.const  "totalPayloads"  ; 34
.const  "bytesDownloaded"  ; 35
.const  "totalBytes"  ; 36
.const  "oldStatusText"  ; 37
.const  "updateState"  ; 38
.const  "queueEnabled"  ; 39
.const  "slidesh"  ; 40
.const  "coroutine"  ; 41
.const  "create"  ; 42
.const  "pollthread"  ; 43
.const  "Create"  ; 44
.const  "SetCandyOptions"  ; 45
.const  "SetDialogOptions"  ; 46
.const  "EnableQueue"  ; 47
.const  "SetConditionEval"  ; 48
.const  "SetProcessAuxTags"  ; 49
.const  "YesNoDialog"  ; 50
.const  "RetryCancelDialog"  ; 51
.const  "ErrorDialog"  ; 52
.const  "WarningDialog"  ; 53
.const  "Navigate"  ; 54
.const  "CurrentUrl"  ; 55
.const  "ParsePairs"  ; 56
.const  "Process"  ; 57
.const  "InitializeProgress"  ; 58
.const  "UpdateProgress"  ; 59
.const  "NotifyActive"  ; 60
.const  "NotifyComplete"  ; 61
.const  "NotifyAddQueue"  ; 62
.const  "IncProgressBar"  ; 63
.const  "SetCurrentPayload"  ; 64
.const  "SetTotalPayloads"  ; 65
.const  "SetTotalBundleSize"  ; 66
.const  "SetProgressGranularity"  ; 67
.const  "ResetProgress"  ; 68
.const  "SetStatusText"  ; 69
.const  "ProgressToEnd"  ; 70
.const  "ShowSystemCloseButton"  ; 71
.const  "ShowSystemMinimizeButton"  ; 72
.const  "WaitOnClose"  ; 73
.const  "GetInstallPath"  ; 74
.const  "PutInstallPath"  ; 75
.const  "IsTagRemoved"  ; 76
.const  "SetComplete"  ; 77
.const  "InitialSlides"  ; 78
.const  "ExceptionSlides"  ; 79
.const  "Destroy"  ; 80
.const  "Show"  ; 81
.const  "Hide"  ; 82
.const  "PlayRASound"  ; 83
.const  "SendQDownloadMsg"  ; 84
.const  "RestartUIThread"  ; 85
.const  "sendProgressToOgm"  ; 86

; function [0] definition (level 4)
; 2 upvalues, 1 params, 4 stacks
.function  2 1 0 4
.local  "code"  ; 0
.upvalue  "slideState"  ; 0
.upvalue  "instState"  ; 1
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\nCode: "  ; 2
.const  "nil"  ; 3
.const  "uiInstance"  ; 4
.const  "mainDlg"  ; 5
.const  "AbortOfferInstall"  ; 6
.const  "DownloadQueue"  ; 7
.const  "OnWndClose"  ; 8
.const  "kill"  ; 9
.const  "ExitWithCode"  ; 10
.const  "Exit"  ; 11
[01] getglobal  1   0        ; io
[02] gettable   1   1   251  ; "write"
[03] loadk      2   2        ; "\nCode: "
[04] test       3   0   1    ; to [6] if false
[05] jmp        1            ; to [7]
[06] loadk      3   3        ; "nil"
[07] call       1   3   1  
[08] getglobal  1   4        ; uiInstance
[09] gettable   1   1   255  ; "mainDlg"
[10] self       1   1   256  ; "AbortOfferInstall"
[11] call       1   2   1  
[12] getglobal  1   7        ; DownloadQueue
[13] call       1   1   2  
[14] gettable   1   1   258  ; "OnWndClose"
[15] call       1   1   1  
[16] loadk      1   9        ; "kill"
[17] setupval   1   0        ; slideState
[18] test       0   0   0    ; to [20] if true
[19] jmp        5            ; to [25]
[20] getupval   1   1        ; instState
[21] self       1   1   260  ; "ExitWithCode"
[22] move       3   0      
[23] call       1   3   1  
[24] jmp        3            ; to [28]
[25] getupval   1   1        ; instState
[26] self       1   1   261  ; "Exit"
[27] call       1   2   1  
[28] return     0   1      
; end of function


; function [1] definition (level 4)
; 2 upvalues, 0 params, 6 stacks
.function  2 0 0 6
.local  "set"  ; 0
.local  "ret"  ; 1
.upvalue  "Slideshow"  ; 0
.upvalue  "slideState"  ; 1
.const  "uiInstance"  ; 0
.const  "slideSets"  ; 1
.const  "EventCache"  ; 2
.const  "GetObj"  ; 3
.const  "DoAll"  ; 4
.const  "coroutine"  ; 5
.const  "yield"  ; 6
.const  "Begin"  ; 7
.const  "OnBegin"  ; 8
.const  "Root"  ; 9
.const  "Complete"  ; 10
.const  "OnComplete"  ; 11
.const  "Installing"  ; 12
.const  "Exception"  ; 13
.const  "OnException"  ; 14
.const  "io"  ; 15
.const  "write"  ; 16
.const  "\n"  ; 17
.const  "os"  ; 18
.const  "date"  ; 19
.const  "%c "  ; 20
.const  "Warning: Invalid slide state or client kill request"  ; 21
.const  "Step"  ; 22
.const  "kill"  ; 23
.const  "wndClose"  ; 24
[001] loadnil    0   1      
[002] getglobal  2   0        ; uiInstance
[003] gettable   2   2   251  ; "slideSets"
[004] test       2   2   1    ; to [6] if false
[005] jmp        11           ; to [17]
[006] getglobal  2   2        ; EventCache
[007] self       2   2   253  ; "GetObj"
[008] call       2   2   2  
[009] self       2   2   254  ; "DoAll"
[010] call       2   2   1  
[011] getglobal  2   5        ; coroutine
[012] gettable   2   2   256  ; "yield"
[013] call       2   1   1  
[014] getupval   2   0        ; Slideshow
[015] tailcall   2   1   0  
[016] return     2   0      
[017] getupval   2   1        ; slideState
[018] eq         0   2   257  ; "Begin", to [20] if true
[019] jmp        9            ; to [29]
[020] getglobal  2   0        ; uiInstance
[021] gettable   2   2   251  ; "slideSets"
[022] gettable   2   2   258  ; "OnBegin"
[023] test       0   2   1    ; to [25] if false
[024] jmp        3            ; to [28]
[025] getglobal  2   0        ; uiInstance
[026] gettable   2   2   251  ; "slideSets"
[027] gettable   0   2   259  ; "Root"
[028] jmp        35           ; to [64]
[029] getupval   2   1        ; slideState
[030] eq         0   2   260  ; "Complete", to [32] if true
[031] jmp        9            ; to [41]
[032] getglobal  2   0        ; uiInstance
[033] gettable   2   2   251  ; "slideSets"
[034] gettable   2   2   261  ; "OnComplete"
[035] test       0   2   1    ; to [37] if false
[036] jmp        3            ; to [40]
[037] getglobal  2   0        ; uiInstance
[038] gettable   2   2   251  ; "slideSets"
[039] gettable   0   2   259  ; "Root"
[040] jmp        23           ; to [64]
[041] getupval   2   1        ; slideState
[042] eq         0   2   262  ; "Installing", to [44] if true
[043] jmp        4            ; to [48]
[044] getglobal  2   0        ; uiInstance
[045] gettable   2   2   251  ; "slideSets"
[046] gettable   0   2   259  ; "Root"
[047] jmp        16           ; to [64]
[048] getupval   2   1        ; slideState
[049] eq         0   2   263  ; "Exception", to [51] if true
[050] jmp        4            ; to [55]
[051] getglobal  2   0        ; uiInstance
[052] gettable   2   2   251  ; "slideSets"
[053] gettable   0   2   264  ; "OnException"
[054] jmp        9            ; to [64]
[055] getglobal  2   15       ; io
[056] gettable   2   2   266  ; "write"
[057] loadk      3   17       ; "\n"
[058] getglobal  4   18       ; os
[059] gettable   4   4   269  ; "date"
[060] loadk      5   20       ; "%c "
[061] call       4   2   2  
[062] loadk      5   21       ; "Warning: Invalid slide state or client kill request"
[063] call       2   4   1  
[064] test       0   0   0    ; to [66] if true
[065] jmp        4            ; to [70]
[066] gettable   2   0   272  ; "Step"
[067] call       2   1   2  
[068] move       1   2      
[069] jmp        1            ; to [71]
[070] loadbool   1   0   0    ; false
[071] loadbool   2   0   0    ; false
[072] eq         0   1   2    ; to [74] if true
[073] jmp        6            ; to [80]
[074] getupval   2   1        ; slideState
[075] eq         0   2   273  ; "kill", to [77] if true
[076] jmp        3            ; to [80]
[077] loadk      2   24       ; "wndClose"
[078] return     2   2      
[079] jmp        17           ; to [97]
[080] loadbool   2   0   0    ; false
[081] eq         0   1   2    ; to [83] if true
[082] jmp        14           ; to [97]
[083] getupval   2   1        ; slideState
[084] eq         1   2   260  ; "Complete", to [86] if false
[085] jmp        3            ; to [89]
[086] getupval   2   1        ; slideState
[087] eq         0   2   263  ; "Exception", to [89] if true
[088] jmp        3            ; to [92]
[089] loadbool   2   1   0    ; true
[090] return     2   2      
[091] jmp        5            ; to [97]
[092] getupval   2   1        ; slideState
[093] eq         0   2   257  ; "Begin", to [95] if true
[094] jmp        2            ; to [97]
[095] loadk      2   12       ; "Installing"
[096] setupval   2   1        ; slideState
[097] getglobal  2   5        ; coroutine
[098] gettable   2   2   256  ; "yield"
[099] call       2   1   1  
[100] getupval   2   0        ; Slideshow
[101] tailcall   2   1   0  
[102] return     2   0      
[103] return     0   1      
; end of function


; function [2] definition (level 4)
; 1 upvalues, 1 params, 4 stacks
.function  1 1 0 4
.local  "bucketId"  ; 0
.local  "CreateBucket"  ; 1
.upvalue  "stepBuckets"  ; 0
.const  "IncCount"  ; 0
.const  "IncStep"  ; 1
.const  "DecStep"  ; 2
.const  "Step"  ; 3
.const  "Count"  ; 4

; function [0] definition (level 5)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [1] definition (level 5)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [2] definition (level 5)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [3] definition (level 5)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
.const  0  ; 0
[1] loadk      0   0        ; 0
[2] return     0   2      
[3] return     0   1      
; end of function


; function [4] definition (level 5)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
.const  0  ; 0
[1] loadk      0   0        ; 0
[2] return     0   2      
[3] return     0   1      
; end of function


; function [5] definition (level 5)
; 0 upvalues, 0 params, 4 stacks
.function  0 0 0 4
.local  "count"  ; 0
.local  "step"  ; 1
.local  "methods"  ; 2
.const  0  ; 0
.const  1  ; 1
.const  "IncCount"  ; 2
.const  "IncStep"  ; 3
.const  "DecStep"  ; 4
.const  "Step"  ; 5
.const  "Count"  ; 6

; function [0] definition (level 6)
; 1 upvalues, 0 params, 2 stacks
.function  1 0 0 2
.upvalue  "count"  ; 0
.const  1  ; 0
[1] getupval   0   0        ; count
[2] add        0   0   250  ; 1
[3] setupval   0   0        ; count
[4] return     0   1      
; end of function


; function [1] definition (level 6)
; 2 upvalues, 0 params, 2 stacks
.function  2 0 0 2
.upvalue  "step"  ; 0
.upvalue  "count"  ; 1
.const  1  ; 0
[1] getupval   0   0        ; step
[2] getupval   1   1        ; count
[3] lt         0   0   1    ; to [5] if true
[4] jmp        3            ; to [8]
[5] getupval   0   0        ; step
[6] add        0   0   250  ; 1
[7] setupval   0   0        ; step
[8] return     0   1      
; end of function


; function [2] definition (level 6)
; 1 upvalues, 0 params, 2 stacks
.function  1 0 0 2
.upvalue  "step"  ; 0
.const  1  ; 0
[1] getupval   0   0        ; step
[2] sub        0   0   250  ; 1
[3] setupval   0   0        ; step
[4] return     0   1      
; end of function


; function [3] definition (level 6)
; 1 upvalues, 0 params, 2 stacks
.function  1 0 0 2
.upvalue  "step"  ; 0
[1] getupval   0   0        ; step
[2] return     0   2      
[3] return     0   1      
; end of function


; function [4] definition (level 6)
; 1 upvalues, 0 params, 2 stacks
.function  1 0 0 2
.upvalue  "count"  ; 0
[1] getupval   0   0        ; count
[2] return     0   2      
[3] return     0   1      
; end of function

[01] loadk      0   0        ; 0
[02] loadk      1   1        ; 1
[03] newtable   2   0   0    ; array=0, hash=0
[04] closure    3   0        ; 1 upvalues
[05] move       0   0      
[06] settable   2   252 3    ; "IncCount"
[07] closure    3   1        ; 2 upvalues
[08] move       0   1      
[09] move       0   0      
[10] settable   2   253 3    ; "IncStep"
[11] closure    3   2        ; 1 upvalues
[12] move       0   1      
[13] settable   2   254 3    ; "DecStep"
[14] closure    3   3        ; 1 upvalues
[15] move       0   1      
[16] settable   2   255 3    ; "Step"
[17] closure    3   4        ; 1 upvalues
[18] move       0   0      
[19] settable   2   256 3    ; "Count"
[20] return     2   2      
[21] return     0   1      
; end of function

[01] test       0   0   1    ; to [3] if false
[02] jmp        12           ; to [15]
[03] newtable   1   0   3    ; array=0, hash=8
[04] closure    2   0        ; 0 upvalues
[05] settable   1   250 2    ; "IncCount"
[06] closure    2   1        ; 0 upvalues
[07] settable   1   251 2    ; "IncStep"
[08] closure    2   2        ; 0 upvalues
[09] settable   1   252 2    ; "DecStep"
[10] closure    2   3        ; 0 upvalues
[11] settable   1   253 2    ; "Step"
[12] closure    2   4        ; 0 upvalues
[13] settable   1   254 2    ; "Count"
[14] return     1   2      
[15] closure    1   5        ; 0 upvalues
[16] getupval   2   0        ; stepBuckets
[17] gettable   2   2   0  
[18] test       2   2   1    ; to [20] if false
[19] jmp        4            ; to [24]
[20] getupval   2   0        ; stepBuckets
[21] move       3   1      
[22] call       3   1   2  
[23] settable   2   0   3  
[24] getupval   2   0        ; stepBuckets
[25] gettable   2   2   0  
[26] return     2   2      
[27] return     0   1      
; end of function


; function [3] definition (level 4)
; 7 upvalues, 1 params, 12 stacks
.function  7 1 0 12
.local  "slides"  ; 0
.local  "m"  ; 1
.local  "indx"  ; 2
.local  "sec"  ; 3
.local  "slide"  ; 4
.local  "conditionSat"  ; 5
.local  "action"  ; 6
.local  "SlidesInSet"  ; 7
.local  "OnNavigate"  ; 8
.local  "Blocking"  ; 9
.local  "Timed"  ; 10
.upvalue  "pollmode"  ; 0
.upvalue  "pollcount"  ; 1
.upvalue  "StepBucket"  ; 2
.upvalue  "instState"  ; 3
.upvalue  "prompt"  ; 4
.upvalue  "PreClose"  ; 5
.upvalue  "slideState"  ; 6
.const  "ConstTable"  ; 0
.const  1  ; 1
.const  ""  ; 2
.const  "Step"  ; 3
.const  "Reset"  ; 4

; function [0] definition (level 5)
; 2 upvalues, 0 params, 3 stacks
.function  2 0 0 3
.local  "index"  ; 0
.upvalue  "slides"  ; 0
.upvalue  "StepBucket"  ; 1
.const  1  ; 0
.const  "uiInstance"  ; 1
.const  "CheckConditions"  ; 2
.const  "ConditionCheck"  ; 3
.const  "StepBucket"  ; 4
.const  "IncCount"  ; 5
[01] loadk      0   0        ; 1
[02] jmp        16           ; to [19]
[03] getglobal  1   1        ; uiInstance
[04] gettable   1   1   252  ; "CheckConditions"
[05] getupval   2   0        ; slides
[06] gettable   2   2   0  
[07] gettable   2   2   253  ; "ConditionCheck"
[08] call       1   2   2  
[09] test       1   1   0    ; to [11] if true
[10] jmp        7            ; to [18]
[11] getupval   1   1        ; StepBucket
[12] getupval   2   0        ; slides
[13] gettable   2   2   0  
[14] gettable   2   2   254  ; "StepBucket"
[15] call       1   2   2  
[16] gettable   1   1   255  ; "IncCount"
[17] call       1   1   1  
[18] add        0   0   250  ; 1
[19] getupval   1   0        ; slides
[20] gettable   1   1   0  
[21] test       1   1   1    ; to [23] if false
[22] jmp        -20          ; to [3]
[23] return     0   1      
; end of function


; function [1] definition (level 5)
; 0 upvalues, 1 params, 3 stacks
.function  0 1 0 3
.local  "nav"  ; 0
.const  "uiInstance"  ; 0
.const  "ProcessAuxTags"  ; 1
.const  1  ; 2
[1] test       0   0   1    ; to [3] if false
[2] jmp        1            ; to [4]
[3] return     0   1      
[4] getglobal  1   0        ; uiInstance
[5] gettable   1   1   251  ; "ProcessAuxTags"
[6] gettable   2   0   252  ; 1
[7] call       1   2   1  
[8] return     0   1      
; end of function


; function [2] definition (level 5)
; 8 upvalues, 0 params, 5 stacks
.function  8 0 0 5
.upvalue  "slide"  ; 0
.upvalue  "StepBucket"  ; 1
.upvalue  "OnNavigate"  ; 2
.upvalue  "instState"  ; 3
.upvalue  "action"  ; 4
.upvalue  "prompt"  ; 5
.upvalue  "PreClose"  ; 6
.upvalue  "conditionSat"  ; 7
.const  "uiInstance"  ; 0
.const  "Navigate"  ; 1
.const  "Url"  ; 2
.const  "StepBucket"  ; 3
.const  "Step"  ; 4
.const  "Count"  ; 5
.const  "CloseBtn"  ; 6
.const  "OnNavigate"  ; 7
.const  "io"  ; 8
.const  "write"  ; 9
.const  "\n"  ; 10
.const  "os"  ; 11
.const  "date"  ; 12
.const  "%c "  ; 13
.const  "Blocking on slide..."  ; 14
.const  "assert"  ; 15
.const  "comError"  ; 16
.const  ""  ; 17
.const  "coroutine"  ; 18
.const  "resume"  ; 19
.const  "pollthread"  ; 20
.const  "EventCache"  ; 21
.const  "GetObj"  ; 22
.const  "DoAll"  ; 23
.const  "QueryAction"  ; 24
.const  "YesNoDialog"  ; 25
.const  1022  ; 26
.const  "111"  ; 27
[01] getglobal  0   0        ; uiInstance
[02] gettable   0   0   251  ; "Navigate"
[03] getupval   1   0        ; slide
[04] gettable   1   1   252  ; "Url"
[05] getupval   2   1        ; StepBucket
[06] getupval   3   0        ; slide
[07] gettable   3   3   253  ; "StepBucket"
[08] call       2   2   2  
[09] gettable   2   2   254  ; "Step"
[10] call       2   1   2  
[11] getupval   3   1        ; StepBucket
[12] getupval   4   0        ; slide
[13] gettable   4   4   253  ; "StepBucket"
[14] call       3   2   2  
[15] gettable   3   3   255  ; "Count"
[16] call       3   1   2  
[17] getupval   4   0        ; slide
[18] gettable   4   4   256  ; "CloseBtn"
[19] call       0   5   1  
[20] getupval   0   2        ; OnNavigate
[21] getupval   1   0        ; slide
[22] gettable   1   1   257  ; "OnNavigate"
[23] call       0   2   1  
[24] getglobal  0   8        ; io
[25] gettable   0   0   259  ; "write"
[26] loadk      1   10       ; "\n"
[27] getglobal  2   11       ; os
[28] gettable   2   2   262  ; "date"
[29] loadk      3   13       ; "%c "
[30] call       2   2   2  
[31] loadk      3   14       ; "Blocking on slide..."
[32] call       0   4   1  
[33] getglobal  0   15       ; assert
[34] getupval   1   3        ; instState
[35] loadk      2   16       ; "comError"
[36] call       0   3   1  
[37] loadk      0   17       ; ""
[38] setupval   0   4        ; action
[39] getglobal  0   18       ; coroutine
[40] gettable   0   0   269  ; "resume"
[41] getglobal  1   0        ; uiInstance
[42] gettable   1   1   270  ; "pollthread"
[43] call       0   2   1  
[44] getglobal  0   21       ; EventCache
[45] self       0   0   272  ; "GetObj"
[46] call       0   2   2  
[47] self       0   0   273  ; "DoAll"
[48] call       0   2   1  
[49] getupval   0   3        ; instState
[50] self       0   0   274  ; "QueryAction"
[51] call       0   2   2  
[52] setupval   0   4        ; action
[53] getupval   0   4        ; action
[54] test       0   0   0    ; to [56] if true
[55] jmp        16           ; to [72]
[56] getupval   0   5        ; prompt
[57] test       0   0   0    ; to [59] if true
[58] jmp        13           ; to [72]
[59] loadbool   0   0   0    ; false
[60] setupval   0   5        ; prompt
[61] getglobal  0   0        ; uiInstance
[62] gettable   0   0   275  ; "YesNoDialog"
[63] loadk      1   26       ; 1022
[64] call       0   2   2  
[65] test       0   0   0    ; to [67] if true
[66] jmp        3            ; to [70]
[67] getupval   0   6        ; PreClose
[68] loadk      1   27       ; "111"
[69] call       0   2   1  
[70] loadk      0   17       ; ""
[71] setupval   0   4        ; action
[72] getupval   0   4        ; action
[73] eq         1   0   267  ; "", to [75] if false
[74] jmp        -36          ; to [39]
[75] loadbool   0   0   0    ; false
[76] setupval   0   7        ; conditionSat
[77] return     0   1      
; end of function


; function [3] definition (level 5)
; 12 upvalues, 0 params, 7 stacks
.function  12 0 0 7
.local  "delta"  ; 0
.local  "dur"  ; 1
.upvalue  "slide"  ; 0
.upvalue  "action"  ; 1
.upvalue  "prompt"  ; 2
.upvalue  "PreClose"  ; 3
.upvalue  "sec"  ; 4
.upvalue  "pollmode"  ; 5
.upvalue  "pollcount"  ; 6
.upvalue  "StepBucket"  ; 7
.upvalue  "OnNavigate"  ; 8
.upvalue  "instState"  ; 9
.upvalue  "conditionSat"  ; 10
.upvalue  "indx"  ; 11
.const  "Duration"  ; 0
.const  "os"  ; 1
.const  "clock"  ; 2
.const  ""  ; 3
.const  "uiInstance"  ; 4
.const  "YesNoDialog"  ; 5
.const  1022  ; 6
.const  "111"  ; 7
.const  "polling"  ; 8
.const  "true"  ; 9
.const  1  ; 10
.const  "Navigate"  ; 11
.const  "Url"  ; 12
.const  "StepBucket"  ; 13
.const  "Step"  ; 14
.const  "Count"  ; 15
.const  "CloseBtn"  ; 16
.const  "OnNavigate"  ; 17
.const  "EventCache"  ; 18
.const  "GetObj"  ; 19
.const  "DoAll"  ; 20
.const  50  ; 21
.const  "coroutine"  ; 22
.const  "resume"  ; 23
.const  "pollthread"  ; 24
.const  "QueryAction"  ; 25
.const  "next"  ; 26
.const  "inf"  ; 27
.const  "tonumber"  ; 28
.const  nil  ; 29
.const  "IncStep"  ; 30
[001] loadnil    0   0      
[002] getupval   1   0        ; slide
[003] gettable   1   1   250  ; "Duration"
[004] getglobal  2   1        ; os
[005] gettable   2   2   252  ; "clock"
[006] call       2   1   2  
[007] move       0   2      
[008] loadk      2   3        ; ""
[009] setupval   2   1        ; action
[010] getupval   2   2        ; prompt
[011] test       2   2   0    ; to [13] if true
[012] jmp        11           ; to [24]
[013] loadbool   2   0   0    ; false
[014] setupval   2   2        ; prompt
[015] getglobal  2   4        ; uiInstance
[016] gettable   2   2   255  ; "YesNoDialog"
[017] loadk      3   6        ; 1022
[018] call       2   2   2  
[019] test       2   2   0    ; to [21] if true
[020] jmp        3            ; to [24]
[021] getupval   2   3        ; PreClose
[022] loadk      3   7        ; "111"
[023] call       2   2   1  
[024] getupval   2   4        ; sec
[025] test       2   2   1    ; to [27] if false
[026] jmp        33           ; to [60]
[027] eq         0   1   258  ; "polling", to [29] if true
[028] jmp        4            ; to [33]
[029] loadk      2   9        ; "true"
[030] setupval   2   5        ; pollmode
[031] loadk      2   10       ; 1
[032] setupval   2   6        ; pollcount
[033] getglobal  2   4        ; uiInstance
[034] gettable   2   2   261  ; "Navigate"
[035] getupval   3   0        ; slide
[036] gettable   3   3   262  ; "Url"
[037] getupval   4   7        ; StepBucket
[038] getupval   5   0        ; slide
[039] gettable   5   5   263  ; "StepBucket"
[040] call       4   2   2  
[041] gettable   4   4   264  ; "Step"
[042] call       4   1   2  
[043] getupval   5   7        ; StepBucket
[044] getupval   6   0        ; slide
[045] gettable   6   6   263  ; "StepBucket"
[046] call       5   2   2  
[047] gettable   5   5   265  ; "Count"
[048] call       5   1   2  
[049] getupval   6   0        ; slide
[050] gettable   6   6   266  ; "CloseBtn"
[051] call       2   5   1  
[052] getupval   2   8        ; OnNavigate
[053] getupval   3   0        ; slide
[054] gettable   3   3   267  ; "OnNavigate"
[055] call       2   2   1  
[056] getglobal  2   1        ; os
[057] gettable   2   2   252  ; "clock"
[058] call       2   1   2  
[059] setupval   2   4        ; sec
[060] getglobal  2   18       ; EventCache
[061] self       2   2   269  ; "GetObj"
[062] call       2   2   2  
[063] self       2   2   270  ; "DoAll"
[064] call       2   2   1  
[065] eq         0   1   258  ; "polling", to [67] if true
[066] jmp        36           ; to [103]
[067] getupval   2   5        ; pollmode
[068] eq         0   2   259  ; "true", to [70] if true
[069] jmp        33           ; to [103]
[070] getupval   2   6        ; pollcount
[071] lt         0   271 2    ; 50, to [73] if true
[072] jmp        26           ; to [99]
[073] loadk      2   10       ; 1
[074] setupval   2   6        ; pollcount
[075] getglobal  2   22       ; coroutine
[076] gettable   2   2   273  ; "resume"
[077] getglobal  3   4        ; uiInstance
[078] gettable   3   3   274  ; "pollthread"
[079] call       2   2   1  
[080] getupval   2   9        ; instState
[081] self       2   2   275  ; "QueryAction"
[082] call       2   2   2  
[083] setupval   2   1        ; action
[084] getupval   2   1        ; action
[085] eq         0   2   276  ; "next", to [87] if true
[086] jmp        10           ; to [97]
[087] loadnil    2   2      
[088] setupval   2   4        ; sec
[089] loadnil    2   2      
[090] setupval   2   5        ; pollmode
[091] loadk      2   10       ; 1
[092] setupval   2   6        ; pollcount
[093] loadbool   2   0   0    ; false
[094] setupval   2   10       ; conditionSat
[095] return     0   1      
[096] jmp        2            ; to [99]
[097] loadk      2   3        ; ""
[098] setupval   2   1        ; action
[099] getupval   2   6        ; pollcount
[100] add        2   2   260  ; 1
[101] setupval   2   6        ; pollcount
[102] jmp        29           ; to [132]
[103] eq         1   1   277  ; "inf", to [105] if false
[104] jmp        5            ; to [110]
[105] getglobal  2   28       ; tonumber
[106] move       3   1      
[107] call       2   2   2  
[108] eq         0   2   279  ; nil, to [110] if true
[109] jmp        2            ; to [112]
[110] return     0   1      
[111] jmp        20           ; to [132]
[112] getglobal  2   28       ; tonumber
[113] move       3   1      
[114] call       2   2   2  
[115] getupval   3   4        ; sec
[116] sub        3   0   3  
[117] lt         0   2   3    ; to [119] if true
[118] jmp        13           ; to [132]
[119] loadnil    2   2      
[120] setupval   2   4        ; sec
[121] getupval   2   11       ; indx
[122] add        2   2   260  ; 1
[123] setupval   2   11       ; indx
[124] getupval   2   7        ; StepBucket
[125] getupval   3   0        ; slide
[126] gettable   3   3   263  ; "StepBucket"
[127] call       2   2   2  
[128] gettable   2   2   280  ; "IncStep"
[129] call       2   1   1  
[130] loadbool   2   0   0    ; false
[131] setupval   2   10       ; conditionSat
[132] return     0   1      
; end of function


; function [4] definition (level 5)
; 14 upvalues, 0 params, 4 stacks
.function  14 0 0 4
.upvalue  "slides"  ; 0
.upvalue  "slide"  ; 1
.upvalue  "indx"  ; 2
.upvalue  "conditionSat"  ; 3
.upvalue  "action"  ; 4
.upvalue  "sec"  ; 5
.upvalue  "pollmode"  ; 6
.upvalue  "pollcount"  ; 7
.upvalue  "StepBucket"  ; 8
.upvalue  "Blocking"  ; 9
.upvalue  "Timed"  ; 10
.upvalue  "instState"  ; 11
.upvalue  "slideState"  ; 12
.upvalue  "PreClose"  ; 13
.const  "uiInstance"  ; 0
.const  "CheckConditions"  ; 1
.const  "ConditionCheck"  ; 2
.const  "io"  ; 3
.const  "write"  ; 4
.const  "\n"  ; 5
.const  "os"  ; 6
.const  "date"  ; 7
.const  "%c "  ; 8
.const  "ui.Step: ConditionCheck failed."  ; 9
.const  "previous"  ; 10
.const  "assert"  ; 11
.const  1  ; 12
.const  "Can't go back before first slide"  ; 13
.const  "StepBucket"  ; 14
.const  "DecStep"  ; 15
.const  "Duration"  ; 16
.const  "block"  ; 17
.const  "Quit"  ; 18
.const  "kill"  ; 19
.const  "Exception"  ; 20
.const  "g_installed"  ; 21
.const  "YesNoDialog"  ; 22
.const  1022  ; 23
.const  "111"  ; 24
.const  "next"  ; 25
.const  "IncStep"  ; 26
.const  "Reset"  ; 27
.const  "coroutine"  ; 28
.const  "yield"  ; 29
[001] getupval   0   0        ; slides
[002] test       0   0   1    ; to [4] if false
[003] jmp        2            ; to [6]
[004] loadbool   0   0   0    ; false
[005] return     0   2      
[006] getupval   0   0        ; slides
[007] getupval   1   2        ; indx
[008] gettable   0   0   1  
[009] setupval   0   1        ; slide
[010] getupval   0   1        ; slide
[011] test       0   0   1    ; to [13] if false
[012] jmp        2            ; to [15]
[013] loadbool   0   0   0    ; false
[014] return     0   2      
[015] getupval   0   3        ; conditionSat
[016] test       0   0   1    ; to [18] if false
[017] jmp        45           ; to [63]
[018] getglobal  0   0        ; uiInstance
[019] gettable   0   0   251  ; "CheckConditions"
[020] getupval   1   1        ; slide
[021] gettable   1   1   252  ; "ConditionCheck"
[022] call       0   2   2  
[023] test       0   0   1    ; to [25] if false
[024] jmp        38           ; to [63]
[025] getglobal  0   3        ; io
[026] gettable   0   0   254  ; "write"
[027] loadk      1   5        ; "\n"
[028] getglobal  2   6        ; os
[029] gettable   2   2   257  ; "date"
[030] loadk      3   8        ; "%c "
[031] call       2   2   2  
[032] loadk      3   9        ; "ui.Step: ConditionCheck failed."
[033] call       0   4   1  
[034] getupval   0   4        ; action
[035] eq         0   0   260  ; "previous", to [37] if true
[036] jmp        12           ; to [49]
[037] getglobal  0   11       ; assert
[038] getupval   1   2        ; indx
[039] lt         1   262 1    ; 1, to [41] if false
[040] jmp        1            ; to [42]
[041] loadbool   1   0   1    ; false, to [43]
[042] loadbool   1   1   0    ; true
[043] loadk      2   13       ; "Can't go back before first slide"
[044] call       0   3   1  
[045] getupval   0   2        ; indx
[046] sub        0   0   262  ; 1
[047] setupval   0   2        ; indx
[048] jmp        3            ; to [52]
[049] getupval   0   2        ; indx
[050] add        0   0   262  ; 1
[051] setupval   0   2        ; indx
[052] loadnil    0   0      
[053] setupval   0   5        ; sec
[054] loadnil    0   0      
[055] setupval   0   6        ; pollmode
[056] loadk      0   12       ; 1
[057] setupval   0   7        ; pollcount
[058] loadbool   0   0   0    ; false
[059] setupval   0   3        ; conditionSat
[060] loadbool   0   1   0    ; true
[061] return     0   2      
[062] jmp        11           ; to [74]
[063] loadbool   0   1   0    ; true
[064] setupval   0   3        ; conditionSat
[065] getupval   0   4        ; action
[066] eq         0   0   260  ; "previous", to [68] if true
[067] jmp        6            ; to [74]
[068] getupval   0   8        ; StepBucket
[069] getupval   1   1        ; slide
[070] gettable   1   1   264  ; "StepBucket"
[071] call       0   2   2  
[072] gettable   0   0   265  ; "DecStep"
[073] call       0   1   1  
[074] getupval   0   1        ; slide
[075] gettable   0   0   266  ; "Duration"
[076] eq         0   0   267  ; "block", to [78] if true
[077] jmp        3            ; to [81]
[078] getupval   0   9        ; Blocking
[079] call       0   1   1  
[080] jmp        2            ; to [83]
[081] getupval   0   10       ; Timed
[082] call       0   1   1  
[083] getupval   0   11       ; instState
[084] self       0   0   268  ; "Quit"
[085] call       0   2   2  
[086] test       0   0   0    ; to [88] if true
[087] jmp        27           ; to [115]
[088] getupval   0   12       ; slideState
[089] eq         1   0   269  ; "kill", to [91] if false
[090] jmp        24           ; to [115]
[091] getupval   0   12       ; slideState
[092] eq         1   0   270  ; "Exception", to [94] if false
[093] jmp        21           ; to [115]
[094] getglobal  0   21       ; g_installed
[095] test       0   0   1    ; to [97] if false
[096] jmp        6            ; to [103]
[097] getglobal  0   0        ; uiInstance
[098] gettable   0   0   272  ; "YesNoDialog"
[099] loadk      1   23       ; 1022
[100] call       0   2   2  
[101] test       0   0   0    ; to [103] if true
[102] jmp        31           ; to [134]
[103] getglobal  0   21       ; g_installed
[104] test       0   0   1    ; to [106] if false
[105] jmp        4            ; to [110]
[106] getupval   0   13       ; PreClose
[107] loadk      1   24       ; "111"
[108] call       0   2   1  
[109] jmp        2            ; to [112]
[110] getupval   0   13       ; PreClose
[111] call       0   1   1  
[112] loadbool   0   0   0    ; false
[113] return     0   2      
[114] jmp        19           ; to [134]
[115] getupval   0   4        ; action
[116] eq         0   0   260  ; "previous", to [118] if true
[117] jmp        4            ; to [122]
[118] getupval   0   2        ; indx
[119] sub        0   0   262  ; 1
[120] setupval   0   2        ; indx
[121] jmp        12           ; to [134]
[122] getupval   0   4        ; action
[123] eq         0   0   275  ; "next", to [125] if true
[124] jmp        9            ; to [134]
[125] getupval   0   2        ; indx
[126] add        0   0   262  ; 1
[127] setupval   0   2        ; indx
[128] getupval   0   8        ; StepBucket
[129] getupval   1   1        ; slide
[130] gettable   1   1   264  ; "StepBucket"
[131] call       0   2   2  
[132] gettable   0   0   276  ; "IncStep"
[133] call       0   1   1  
[134] getupval   0   6        ; pollmode
[135] test       0   0   1    ; to [137] if false
[136] jmp        4            ; to [141]
[137] getupval   0   11       ; instState
[138] self       0   0   277  ; "Reset"
[139] call       0   2   1  
[140] jmp        6            ; to [147]
[141] getupval   0   7        ; pollcount
[142] eq         0   0   262  ; 1, to [144] if true
[143] jmp        3            ; to [147]
[144] getglobal  0   28       ; coroutine
[145] gettable   0   0   279  ; "yield"
[146] call       0   1   1  
[147] loadbool   0   1   0    ; true
[148] return     0   2      
[149] return     0   1      
; end of function


; function [5] definition (level 5)
; 7 upvalues, 0 params, 2 stacks
.function  7 0 0 2
.upvalue  "indx"  ; 0
.upvalue  "sec"  ; 1
.upvalue  "pollmode"  ; 2
.upvalue  "pollcount"  ; 3
.upvalue  "conditionSat"  ; 4
.upvalue  "slide"  ; 5
.upvalue  "action"  ; 6
.const  1  ; 0
.const  ""  ; 1
[01] loadk      0   0        ; 1
[02] setupval   0   0        ; indx
[03] loadnil    0   0      
[04] setupval   0   1        ; sec
[05] loadnil    0   0      
[06] setupval   0   2        ; pollmode
[07] loadk      0   0        ; 1
[08] setupval   0   3        ; pollcount
[09] loadbool   0   0   0    ; false
[10] setupval   0   4        ; conditionSat
[11] loadnil    0   0      
[12] setupval   0   5        ; slide
[13] loadk      0   1        ; ""
[14] setupval   0   6        ; action
[15] return     0   1      
; end of function

[01] test       0   0   1    ; to [3] if false
[02] jmp        2            ; to [5]
[03] loadnil    1   1      
[04] return     1   2      
[05] getglobal  1   0        ; ConstTable
[06] call       1   1   2  
[07] loadk      2   1        ; 1
[08] loadnil    3   4      
[09] setupval   4   0        ; pollmode
[10] loadk      4   1        ; 1
[11] setupval   4   1        ; pollcount
[12] loadnil    4   4      
[13] loadbool   5   0   0    ; false
[14] loadk      6   2        ; ""
[15] closure    7   0        ; 2 upvalues
[16] move       0   0      
[17] getupval   0   2        ; StepBucket
[18] closure    8   1        ; 0 upvalues
[19] closure    9   2        ; 8 upvalues
[20] move       0   4      
[21] getupval   0   2        ; StepBucket
[22] move       0   8      
[23] getupval   0   3        ; instState
[24] move       0   6      
[25] getupval   0   4        ; prompt
[26] getupval   0   5        ; PreClose
[27] move       0   5      
[28] closure    10  3        ; 12 upvalues
[29] move       0   4      
[30] move       0   6      
[31] getupval   0   4        ; prompt
[32] getupval   0   5        ; PreClose
[33] move       0   3      
[34] getupval   0   0        ; pollmode
[35] getupval   0   1        ; pollcount
[36] getupval   0   2        ; StepBucket
[37] move       0   8      
[38] getupval   0   3        ; instState
[39] move       0   5      
[40] move       0   2      
[41] closure    11  4        ; 14 upvalues
[42] move       0   0      
[43] move       0   4      
[44] move       0   2      
[45] move       0   5      
[46] move       0   6      
[47] move       0   3      
[48] getupval   0   0        ; pollmode
[49] getupval   0   1        ; pollcount
[50] getupval   0   2        ; StepBucket
[51] move       0   9      
[52] move       0   10     
[53] getupval   0   3        ; instState
[54] getupval   0   6        ; slideState
[55] getupval   0   5        ; PreClose
[56] settable   1   253 11   ; "Step"
[57] closure    11  5        ; 7 upvalues
[58] move       0   2      
[59] move       0   3      
[60] getupval   0   0        ; pollmode
[61] getupval   0   1        ; pollcount
[62] move       0   5      
[63] move       0   4      
[64] move       0   6      
[65] settable   1   254 11   ; "Reset"
[66] move       11  7      
[67] call       11  1   1  
[68] return     1   2      
[69] return     0   1      
; end of function


; function [4] definition (level 4)
; 2 upvalues, 0 params, 3 stacks
.function  2 0 0 3
.upvalue  "prompt"  ; 0
.upvalue  "PreClose"  ; 1
.const  "EventCache"  ; 0
.const  "GetObj"  ; 1
.const  "Queue"  ; 2

; function [0] definition (level 5)
; 2 upvalues, 0 params, 2 stacks
.function  2 0 0 2
.upvalue  "prompt"  ; 0
.upvalue  "PreClose"  ; 1
.const  "g_installed"  ; 0
.const  "111"  ; 1
[01] getglobal  0   0        ; g_installed
[02] test       0   0   1    ; to [4] if false
[03] jmp        3            ; to [7]
[04] loadbool   0   1   0    ; true
[05] setupval   0   0        ; prompt
[06] jmp        3            ; to [10]
[07] getupval   0   1        ; PreClose
[08] loadk      1   1        ; "111"
[09] call       0   2   1  
[10] return     0   1      
; end of function

[1] getglobal  0   0        ; EventCache
[2] self       0   0   251  ; "GetObj"
[3] call       0   2   2  
[4] self       0   0   252  ; "Queue"
[5] closure    2   0        ; 2 upvalues
[6] getupval   0   0        ; prompt
[7] getupval   0   1        ; PreClose
[8] call       0   3   1  
[9] return     0   1      
; end of function


; function [5] definition (level 4)
; 1 upvalues, 0 params, 2 stacks
.function  1 0 0 2
.upvalue  "instState"  ; 0
.const  "var"  ; 0
.const  "PollProcess"  ; 1
.const  "uiInstance"  ; 2
.const  "Process"  ; 3
[1] getupval   0   0        ; instState
[2] self       0   0   251  ; "PollProcess"
[3] call       0   2   2  
[4] setglobal  0   0        ; var
[5] getglobal  0   2        ; uiInstance
[6] gettable   0   0   253  ; "Process"
[7] getglobal  1   0        ; var
[8] call       0   2   1  
[9] return     0   1      
; end of function


; function [6] definition (level 4)
; 1 upvalues, 0 params, 5 stacks
.function  1 0 0 5
.local  "path"  ; 0
.upvalue  "instState"  ; 0
.const  "InstallPath"  ; 0
.const  "string"  ; 1
.const  "gsub"  ; 2
.const  "\\"  ; 3
.const  "\\\\"  ; 4
.const  "EventCache"  ; 5
.const  "GetObj"  ; 6
.const  "Queue"  ; 7

; function [0] definition (level 5)
; 1 upvalues, 0 params, 6 stacks
.function  1 0 0 6
.upvalue  "path"  ; 0
.const  "uiInstance"  ; 0
.const  "mainDlg"  ; 1
.const  "CallJSFunction"  ; 2
.const  "RAINSTALLER.eula.updateInstallPath"  ; 3
.const  "\""  ; 4
.const  "main"  ; 5
[01] getglobal  0   0        ; uiInstance
[02] gettable   0   0   251  ; "mainDlg"
[03] self       0   0   252  ; "CallJSFunction"
[04] loadk      2   3        ; "RAINSTALLER.eula.updateInstallPath"
[05] loadk      3   4        ; "\""
[06] getupval   4   0        ; path
[07] loadk      5   4        ; "\""
[08] concat     3   3   5  
[09] loadk      4   5        ; "main"
[10] call       0   5   1  
[11] return     0   1      
; end of function

[01] getupval   0   0        ; instState
[02] gettable   0   0   250  ; "InstallPath"
[03] getglobal  1   1        ; string
[04] gettable   1   1   252  ; "gsub"
[05] move       2   0      
[06] loadk      3   3        ; "\\"
[07] loadk      4   4        ; "\\\\"
[08] call       1   4   2  
[09] move       0   1      
[10] getglobal  1   5        ; EventCache
[11] self       1   1   256  ; "GetObj"
[12] call       1   2   2  
[13] self       1   1   257  ; "Queue"
[14] closure    3   0        ; 1 upvalues
[15] move       0   0      
[16] call       1   3   1  
[17] return     0   1      
; end of function


; function [7] definition (level 4)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 0 3
.const  "EventCache"  ; 0
.const  "GetObj"  ; 1
.const  "Queue"  ; 2

; function [0] definition (level 5)
; 0 upvalues, 0 params, 5 stacks
.function  0 0 0 5
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Processing JSLoadComplete Event. clock="  ; 6
.const  "clock"  ; 7
.const  "uiInstance"  ; 8
.const  "InitializeProgress"  ; 9
[01] getglobal  0   0        ; io
[02] gettable   0   0   251  ; "write"
[03] loadk      1   2        ; "\n"
[04] getglobal  2   3        ; os
[05] gettable   2   2   254  ; "date"
[06] loadk      3   5        ; "%c "
[07] call       2   2   2  
[08] loadk      3   6        ; "Processing JSLoadComplete Event. clock="
[09] getglobal  4   3        ; os
[10] gettable   4   4   257  ; "clock"
[11] call       4   1   2  
[12] concat     3   3   4  
[13] call       0   4   1  
[14] getglobal  0   8        ; uiInstance
[15] gettable   0   0   259  ; "InitializeProgress"
[16] call       0   1   1  
[17] return     0   1      
; end of function

[1] getglobal  0   0        ; EventCache
[2] self       0   0   251  ; "GetObj"
[3] call       0   2   2  
[4] self       0   0   252  ; "Queue"
[5] closure    2   0        ; 0 upvalues
[6] call       0   3   1  
[7] return     0   1      
; end of function


; function [8] definition (level 4)
; 2 upvalues, 3 params, 7 stacks
.function  2 3 0 7
.local  "gameid"  ; 0
.local  "tps"  ; 1
.local  "gamename"  ; 2
.upvalue  "slideState"  ; 0
.upvalue  "instState"  ; 1
.const  "uiInstance"  ; 0
.const  "data"  ; 1
.const  "queueEnabled"  ; 2
.const  "g_env"  ; 3
.const  "onQueue"  ; 4
.const  "true"  ; 5
.const  "io"  ; 6
.const  "write"  ; 7
.const  "\n"  ; 8
.const  "os"  ; 9
.const  "date"  ; 10
.const  "%c "  ; 11
.const  "Adding QueueDownload Event"  ; 12
.const  "EventCache"  ; 13
.const  "GetObj"  ; 14
.const  "Queue"  ; 15

; function [0] definition (level 5)
; 5 upvalues, 0 params, 7 stacks
.function  5 0 0 7
.local  "interpreter"  ; 0
.local  "reg"  ; 1
.upvalue  "gameid"  ; 0
.upvalue  "tps"  ; 1
.upvalue  "gamename"  ; 2
.upvalue  "slideState"  ; 3
.upvalue  "instState"  ; 4
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\nQueuing Download: "  ; 2
.const  " "  ; 3
.const  "MetadataInterp"  ; 4
.const  "RequestRgi"  ; 5
.const  "DownloadQueue"  ; 6
.const  "CanAdd"  ; 7
.const  "uiInstance"  ; 8
.const  "NotifyAddQueue"  ; 9
.const  "Add"  ; 10
.const  "Complete"  ; 11
.const  "Installing"  ; 12
.const  "slideSets"  ; 13
.const  "Root"  ; 14
.const  "Reset"  ; 15
.const  "Next"  ; 16
.const  "RACConfigValue"  ; 17
.const  "KeepMinimized"  ; 18
.const  "Read"  ; 19
.const  "true"  ; 20
.const  "mainDlg"  ; 21
.const  "SetForeground"  ; 22
[01] getglobal  0   0        ; io
[02] gettable   0   0   251  ; "write"
[03] loadk      1   2        ; "\nQueuing Download: "
[04] getupval   2   0        ; gameid
[05] loadk      3   3        ; " "
[06] getupval   4   1        ; tps
[07] loadk      5   3        ; " "
[08] getupval   6   2        ; gamename
[09] call       0   7   1  
[10] getglobal  0   4        ; MetadataInterp
[11] call       0   1   2  
[12] gettable   1   0   255  ; "RequestRgi"
[13] getupval   2   0        ; gameid
[14] getupval   3   1        ; tps
[15] call       1   3   1  
[16] getglobal  1   6        ; DownloadQueue
[17] call       1   1   2  
[18] gettable   1   1   257  ; "CanAdd"
[19] getupval   2   0        ; gameid
[20] call       1   2   2  
[21] test       1   1   0    ; to [23] if true
[22] jmp        24           ; to [47]
[23] getglobal  1   8        ; uiInstance
[24] gettable   1   1   259  ; "NotifyAddQueue"
[25] getupval   2   0        ; gameid
[26] getupval   3   2        ; gamename
[27] call       1   3   1  
[28] getglobal  1   6        ; DownloadQueue
[29] call       1   1   2  
[30] gettable   1   1   260  ; "Add"
[31] getupval   2   0        ; gameid
[32] move       3   0      
[33] call       1   3   1  
[34] getupval   1   3        ; slideState
[35] eq         0   1   261  ; "Complete", to [37] if true
[36] jmp        10           ; to [47]
[37] loadk      1   12       ; "Installing"
[38] setupval   1   3        ; slideState
[39] getglobal  1   8        ; uiInstance
[40] gettable   1   1   263  ; "slideSets"
[41] gettable   1   1   264  ; "Root"
[42] gettable   1   1   265  ; "Reset"
[43] call       1   1   1  
[44] getupval   1   4        ; instState
[45] self       1   1   266  ; "Next"
[46] call       1   2   1  
[47] getglobal  1   17       ; RACConfigValue
[48] loadk      2   18       ; "KeepMinimized"
[49] call       1   2   2  
[50] gettable   2   1   269  ; "Read"
[51] call       2   1   2  
[52] eq         1   2   270  ; "true", to [54] if false
[53] jmp        4            ; to [58]
[54] getglobal  2   8        ; uiInstance
[55] gettable   2   2   271  ; "mainDlg"
[56] self       2   2   272  ; "SetForeground"
[57] call       2   2   1  
[58] return     0   1      
; end of function


; function [1] definition (level 5)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
.const  "InstallerUI"  ; 0
.const  "WarningDialog"  ; 1
.const  1013  ; 2
[1] getglobal  0   0        ; InstallerUI
[2] call       0   1   2  
[3] gettable   0   0   251  ; "WarningDialog"
[4] loadk      1   2        ; 1013
[5] call       0   2   1  
[6] return     0   1      
; end of function

[01] getglobal  3   0        ; uiInstance
[02] gettable   3   3   251  ; "data"
[03] gettable   3   3   252  ; "queueEnabled"
[04] test       3   3   0    ; to [6] if true
[05] jmp        25           ; to [31]
[06] getglobal  3   3        ; g_env
[07] gettable   3   3   254  ; "onQueue"
[08] eq         0   3   255  ; "true", to [10] if true
[09] jmp        21           ; to [31]
[10] getglobal  3   6        ; io
[11] gettable   3   3   257  ; "write"
[12] loadk      4   8        ; "\n"
[13] getglobal  5   9        ; os
[14] gettable   5   5   260  ; "date"
[15] loadk      6   11       ; "%c "
[16] call       5   2   2  
[17] loadk      6   12       ; "Adding QueueDownload Event"
[18] call       3   4   1  
[19] getglobal  3   13       ; EventCache
[20] self       3   3   264  ; "GetObj"
[21] call       3   2   2  
[22] self       3   3   265  ; "Queue"
[23] closure    5   0        ; 5 upvalues
[24] move       0   0      
[25] move       0   1      
[26] move       0   2      
[27] getupval   0   0        ; slideState
[28] getupval   0   1        ; instState
[29] call       3   3   1  
[30] jmp        6            ; to [37]
[31] getglobal  3   13       ; EventCache
[32] self       3   3   264  ; "GetObj"
[33] call       3   2   2  
[34] self       3   3   265  ; "Queue"
[35] closure    5   1        ; 0 upvalues
[36] call       3   3   1  
[37] return     0   1      
; end of function


; function [9] definition (level 4)
; 0 upvalues, 1 params, 4 stacks
.function  0 1 0 4
.local  "gameid"  ; 0
.const  "EventCache"  ; 0
.const  "GetObj"  ; 1
.const  "Queue"  ; 2

; function [0] definition (level 5)
; 1 upvalues, 0 params, 3 stacks
.function  1 0 0 3
.upvalue  "gameid"  ; 0
.const  "DownloadQueue"  ; 0
.const  "Remove"  ; 1
.const  "rollback"  ; 2
.const  "assert"  ; 3
.const  "queueAbort"  ; 4
[01] getglobal  0   0        ; DownloadQueue
[02] call       0   1   2  
[03] gettable   0   0   251  ; "Remove"
[04] getupval   1   0        ; gameid
[05] call       0   2   2  
[06] eq         0   0   252  ; "rollback", to [8] if true
[07] jmp        4            ; to [12]
[08] getglobal  0   3        ; assert
[09] loadbool   1   0   0    ; false
[10] loadk      2   4        ; "queueAbort"
[11] call       0   3   1  
[12] return     0   1      
; end of function

[1] getglobal  1   0        ; EventCache
[2] self       1   1   251  ; "GetObj"
[3] call       1   2   2  
[4] self       1   1   252  ; "Queue"
[5] closure    3   0        ; 1 upvalues
[6] move       0   0      
[7] call       1   3   1  
[8] return     0   1      
; end of function


; function [10] definition (level 4)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 0 3
.const  "EventCache"  ; 0
.const  "GetObj"  ; 1
.const  "Queue"  ; 2

; function [0] definition (level 5)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
.const  "g_pause"  ; 0
[1] getglobal  0   0        ; g_pause
[2] test       0   0   1    ; to [4] if false
[3] jmp        3            ; to [7]
[4] loadbool   0   1   0    ; true
[5] setglobal  0   0        ; g_pause
[6] jmp        2            ; to [9]
[7] loadbool   0   0   0    ; false
[8] setglobal  0   0        ; g_pause
[9] return     0   1      
; end of function

[1] getglobal  0   0        ; EventCache
[2] self       0   0   251  ; "GetObj"
[3] call       0   2   2  
[4] self       0   0   252  ; "Queue"
[5] closure    2   0        ; 0 upvalues
[6] call       0   3   1  
[7] return     0   1      
; end of function


; function [11] definition (level 4)
; 0 upvalues, 1 params, 4 stacks
.function  0 1 0 4
.local  "gameid"  ; 0
.const  "EventCache"  ; 0
.const  "GetObj"  ; 1
.const  "Queue"  ; 2

; function [0] definition (level 5)
; 1 upvalues, 0 params, 2 stacks
.function  1 0 0 2
.upvalue  "gameid"  ; 0
.const  "DownloadQueue"  ; 0
.const  "Move"  ; 1
[1] getglobal  0   0        ; DownloadQueue
[2] call       0   1   2  
[3] gettable   0   0   251  ; "Move"
[4] getupval   1   0        ; gameid
[5] call       0   2   1  
[6] return     0   1      
; end of function

[1] getglobal  1   0        ; EventCache
[2] self       1   1   251  ; "GetObj"
[3] call       1   2   2  
[4] self       1   1   252  ; "Queue"
[5] closure    3   0        ; 1 upvalues
[6] move       0   0      
[7] call       1   3   1  
[8] return     0   1      
; end of function


; function [12] definition (level 4)
; 0 upvalues, 1 params, 4 stacks
.function  0 1 0 4
.local  "msg"  ; 0
.const  "EventCache"  ; 0
.const  "GetObj"  ; 1
.const  "Queue"  ; 2

; function [0] definition (level 5)
; 1 upvalues, 0 params, 16 stacks
.function  1 0 0 16
.local  "l"  ; 0
.local  "h"  ; 1
.local  "fun"  ; 2
.local  "substr"  ; 3
.local  "i"  ; 4
.local  "args"  ; 5
.local  "(for generator)"  ; 6
.local  "(for state)"  ; 7
.local  "k"  ; 8
.local  "newEnv"  ; 9
.local  "s"  ; 10
.local  "ret"  ; 11
.upvalue  "msg"  ; 0
.const  "string"  ; 0
.const  "find"  ; 1
.const  "([^|]+)|?"  ; 2
.const  "("  ; 3
.const  "sub"  ; 4
.const  1  ; 5
.const  "gfind"  ; 6
.const  "\""  ; 7
.const  ","  ; 8
.const  "len"  ; 9
.const  ")"  ; 10
.const  "setmetatable"  ; 11
.const  "__index"  ; 12
.const  "_G"  ; 13
.const  "setfenv"  ; 14
.const  "pcall"  ; 15
.const  "loadstring"  ; 16
.const  "io"  ; 17
.const  "write"  ; 18
.const  "\n"  ; 19
.const  "os"  ; 20
.const  "date"  ; 21
.const  "%c "  ; 22
.const  "Error processing message: "  ; 23
.const  ""  ; 24
.const  "on "  ; 25
[01] getglobal  0   0        ; string
[02] gettable   0   0   251  ; "find"
[03] getupval   1   0        ; msg
[04] loadk      2   2        ; "([^|]+)|?"
[05] call       0   3   4  
[06] test       2   2   1    ; to [8] if false
[07] jmp        2            ; to [10]
[08] return     0   1      
[09] jmp        3            ; to [13]
[10] move       3   2      
[11] loadk      4   3        ; "("
[12] concat     2   3   4  
[13] getglobal  3   0        ; string
[14] gettable   3   3   254  ; "sub"
[15] getupval   4   0        ; msg
[16] add        5   1   255  ; 1
[17] call       3   3   2  
[18] loadk      4   5        ; 1
[19] newtable   5   0   0    ; array=0, hash=0
[20] getglobal  6   0        ; string
[21] gettable   6   6   256  ; "gfind"
[22] move       7   3      
[23] loadk      8   2        ; "([^|]+)|?"
[24] call       6   3   4  
[25] tforprep   6   7        ; to [33]
[26] move       9   2      
[27] loadk      10  7        ; "\""
[28] move       11  8      
[29] loadk      12  7        ; "\""
[30] loadk      13  8        ; ","
[31] concat     2   9   13 
[32] add        4   4   255  ; 1
[33] tforloop   6       0    ; to [35] if exit
[34] jmp        -9           ; to [26]
[35] getglobal  6   0        ; string
[36] gettable   6   6   251  ; "find"
[37] move       7   2      
[38] loadk      8   8        ; ","
[39] call       6   3   2  
[40] test       6   6   0    ; to [42] if true
[41] jmp        11           ; to [53]
[42] getglobal  6   0        ; string
[43] gettable   6   6   254  ; "sub"
[44] move       7   2      
[45] loadk      8   5        ; 1
[46] getglobal  9   0        ; string
[47] gettable   9   9   259  ; "len"
[48] move       10  2      
[49] call       9   2   2  
[50] sub        9   9   255  ; 1
[51] call       6   4   2  
[52] move       2   6      
[53] move       6   2      
[54] loadk      7   10       ; ")"
[55] concat     2   6   7  
[56] newtable   6   0   0    ; array=0, hash=0
[57] getglobal  7   11       ; setmetatable
[58] move       8   6      
[59] newtable   9   0   1    ; array=0, hash=2
[60] getglobal  10  13       ; _G
[61] settable   9   262 10   ; "__index"
[62] call       7   3   1  
[63] getglobal  7   14       ; setfenv
[64] loadk      8   5        ; 1
[65] move       9   6      
[66] call       7   3   1  
[67] getglobal  7   15       ; pcall
[68] getglobal  8   16       ; loadstring
[69] move       9   2      
[70] call       8   2   0  
[71] call       7   0   3  
[72] test       7   7   1    ; to [74] if false
[73] jmp        14           ; to [88]
[74] getglobal  9   17       ; io
[75] gettable   9   9   268  ; "write"
[76] loadk      10  19       ; "\n"
[77] getglobal  11  20       ; os
[78] gettable   11  11  271  ; "date"
[79] loadk      12  22       ; "%c "
[80] call       11  2   2  
[81] loadk      12  23       ; "Error processing message: "
[82] test       13  8   1    ; to [84] if false
[83] jmp        1            ; to [85]
[84] loadk      13  24       ; ""
[85] loadk      14  25       ; "on "
[86] getupval   15  0        ; msg
[87] call       9   7   1  
[88] return     0   1      
; end of function

[1] getglobal  1   0        ; EventCache
[2] self       1   1   251  ; "GetObj"
[3] call       1   2   2  
[4] self       1   1   252  ; "Queue"
[5] closure    3   0        ; 1 upvalues
[6] move       0   0      
[7] call       1   3   1  
[8] return     0   1      
; end of function


; function [13] definition (level 4)
; 8 upvalues, 0 params, 14 stacks
.function  8 0 0 14
.local  "msg"  ; 0
.local  "top"  ; 1
.local  "remove"  ; 2
.local  "jsc"  ; 3
.local  "pause"  ; 4
.local  "wndClose"  ; 5
.local  "addGame"  ; 6
.local  "gameid"  ; 7
.local  "tps"  ; 8
.local  "gamename"  ; 9
.upvalue  "instState"  ; 0
.upvalue  "OnJSLoadComplete"  ; 1
.upvalue  "OnQueueRemove"  ; 2
.upvalue  "OnQueueTop"  ; 3
.upvalue  "OnQueuePause"  ; 4
.upvalue  "OnMessage"  ; 5
.upvalue  "OnMainWndClose"  ; 6
.upvalue  "OnQueueDownload"  ; 7
.const  "PollMessage"  ; 0
.const  "PollQueueTop"  ; 1
.const  "PollQueueRemove"  ; 2
.const  "PollJSLoadComplete"  ; 3
.const  "PollQueuePause"  ; 4
.const  "uiInstance"  ; 5
.const  "mainDlg"  ; 6
.const  "PollMainWndClose"  ; 7
.const  "PollQueueDownload"  ; 8
.const  ""  ; 9
.const  "GetGameId"  ; 10
.const  "GetTPS"  ; 11
.const  "GetGameName"  ; 12
.const  "coroutine"  ; 13
.const  "yield"  ; 14
[01] loadnil    0   6      
[02] jmp        83           ; to [86]
[03] getupval   7   0        ; instState
[04] self       7   7   250  ; "PollMessage"
[05] call       7   2   2  
[06] move       0   7      
[07] getupval   7   0        ; instState
[08] self       7   7   251  ; "PollQueueTop"
[09] call       7   2   2  
[10] move       1   7      
[11] getupval   7   0        ; instState
[12] self       7   7   252  ; "PollQueueRemove"
[13] call       7   2   2  
[14] move       2   7      
[15] getupval   7   0        ; instState
[16] self       7   7   253  ; "PollJSLoadComplete"
[17] call       7   2   2  
[18] move       3   7      
[19] getupval   7   0        ; instState
[20] self       7   7   254  ; "PollQueuePause"
[21] call       7   2   2  
[22] move       4   7      
[23] getglobal  7   5        ; uiInstance
[24] gettable   7   7   256  ; "mainDlg"
[25] self       7   7   257  ; "PollMainWndClose"
[26] call       7   2   2  
[27] move       5   7      
[28] getglobal  7   5        ; uiInstance
[29] gettable   7   7   256  ; "mainDlg"
[30] self       7   7   258  ; "PollQueueDownload"
[31] call       7   2   2  
[32] move       6   7      
[33] loadbool   7   1   0    ; true
[34] eq         0   3   7    ; to [36] if true
[35] jmp        2            ; to [38]
[36] getupval   7   1        ; OnJSLoadComplete
[37] call       7   1   1  
[38] eq         1   2   259  ; "", to [40] if false
[39] jmp        3            ; to [43]
[40] getupval   7   2        ; OnQueueRemove
[41] move       8   2      
[42] call       7   2   1  
[43] eq         1   1   259  ; "", to [45] if false
[44] jmp        3            ; to [48]
[45] getupval   7   3        ; OnQueueTop
[46] move       8   1      
[47] call       7   2   1  
[48] loadbool   7   1   0    ; true
[49] eq         0   4   7    ; to [51] if true
[50] jmp        2            ; to [53]
[51] getupval   7   4        ; OnQueuePause
[52] call       7   1   1  
[53] eq         1   0   259  ; "", to [55] if false
[54] jmp        3            ; to [58]
[55] getupval   7   5        ; OnMessage
[56] move       8   0      
[57] call       7   2   1  
[58] loadbool   7   1   0    ; true
[59] eq         0   5   7    ; to [61] if true
[60] jmp        2            ; to [63]
[61] getupval   7   6        ; OnMainWndClose
[62] call       7   1   1  
[63] loadbool   7   1   0    ; true
[64] eq         0   6   7    ; to [66] if true
[65] jmp        17           ; to [83]
[66] getglobal  7   5        ; uiInstance
[67] gettable   7   7   256  ; "mainDlg"
[68] self       7   7   260  ; "GetGameId"
[69] call       7   2   2  
[70] getglobal  8   5        ; uiInstance
[71] gettable   8   8   256  ; "mainDlg"
[72] self       8   8   261  ; "GetTPS"
[73] call       8   2   2  
[74] getglobal  9   5        ; uiInstance
[75] gettable   9   9   256  ; "mainDlg"
[76] self       9   9   262  ; "GetGameName"
[77] call       9   2   2  
[78] getupval   10  7        ; OnQueueDownload
[79] move       11  7      
[80] move       12  8      
[81] move       13  9      
[82] call       10  4   1  
[83] getglobal  7   13       ; coroutine
[84] gettable   7   7   264  ; "yield"
[85] call       7   1   1  
[86] jmp        -84          ; to [3]
[87] return     0   1      
; end of function


; function [14] definition (level 4)
; 0 upvalues, 3 params, 11 stacks
.function  0 3 0 11
.local  "w"  ; 0
.local  "h"  ; 1
.local  "mode"  ; 2
.const  "uiInstance"  ; 0
.const  "mainDlg"  ; 1
.const  "Create"  ; 2
.const  440  ; 3
.const  280  ; 4
.const  0  ; 5
.const  "io"  ; 6
.const  "write"  ; 7
.const  "\n"  ; 8
.const  "os"  ; 9
.const  "date"  ; 10
.const  "%c "  ; 11
.const  "uiInstance.mainDlg:Create("  ; 12
.const  "tostring"  ; 13
.const  ")"  ; 14
[01] getglobal  3   0        ; uiInstance
[02] gettable   3   3   251  ; "mainDlg"
[03] self       3   3   252  ; "Create"
[04] test       5   0   1    ; to [6] if false
[05] jmp        1            ; to [7]
[06] loadk      5   3        ; 440
[07] test       6   1   1    ; to [9] if false
[08] jmp        1            ; to [10]
[09] loadk      6   4        ; 280
[10] test       7   2   1    ; to [12] if false
[11] jmp        1            ; to [13]
[12] loadk      7   5        ; 0
[13] call       3   5   1  
[14] getglobal  3   6        ; io
[15] gettable   3   3   257  ; "write"
[16] loadk      4   8        ; "\n"
[17] getglobal  5   9        ; os
[18] gettable   5   5   260  ; "date"
[19] loadk      6   11       ; "%c "
[20] call       5   2   2  
[21] loadk      6   12       ; "uiInstance.mainDlg:Create("
[22] getglobal  7   13       ; tostring
[23] test       8   0   1    ; to [25] if false
[24] jmp        1            ; to [26]
[25] loadk      8   3        ; 440
[26] call       7   2   2  
[27] getglobal  8   13       ; tostring
[28] test       9   1   1    ; to [30] if false
[29] jmp        1            ; to [31]
[30] loadk      9   4        ; 280
[31] call       8   2   2  
[32] getglobal  9   13       ; tostring
[33] move       10  2      
[34] call       9   2   2  
[35] loadk      10  14       ; ")"
[36] call       3   8   1  
[37] return     0   1      
; end of function


; function [15] definition (level 4)
; 0 upvalues, 5 params, 12 stacks
.function  0 5 0 12
.local  "publisherName"  ; 0
.local  "sdkKey"  ; 1
.local  "sdkSecret"  ; 2
.local  "lang"  ; 3
.local  "advancedOptions"  ; 4
.const  "uiInstance"  ; 0
.const  "mainDlg"  ; 1
.const  "SetCandyOptions"  ; 2
[01] getglobal  5   0        ; uiInstance
[02] gettable   5   5   251  ; "mainDlg"
[03] self       5   5   252  ; "SetCandyOptions"
[04] move       7   0      
[05] move       8   1      
[06] move       9   2      
[07] move       10  3      
[08] move       11  4      
[09] call       5   7   1  
[10] return     0   1      
; end of function


; function [16] definition (level 4)
; 2 upvalues, 11 params, 21 stacks
.function  2 11 0 21
.local  "width"  ; 0
.local  "height"  ; 1
.local  "minimize"  ; 2
.local  "close"  ; 3
.local  "root"  ; 4
.local  "begin"  ; 5
.local  "complete"  ; 6
.local  "exception"  ; 7
.local  "resRoot"  ; 8
.local  "progress"  ; 9
.local  "mode"  ; 10
.local  "workDir"  ; 11
.upvalue  "win32"  ; 0
.upvalue  "SlideSet"  ; 1
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "SetDialogOptions mode = "  ; 6
.const  "tostring"  ; 7
.const  "uiInstance"  ; 8
.const  "mainDlg"  ; 9
.const  "Create"  ; 10
.const  440  ; 11
.const  280  ; 12
.const  0  ; 13
.const  "uiInstance.mainDlg:Create("  ; 14
.const  " "  ; 15
.const  ")"  ; 16
.const  "g_env"  ; 17
.const  "curGameName"  ; 18
.const  "SetDialogOptions gameName = "  ; 19
.const  "nil"  ; 20
.const  "SetTitle"  ; 21
.const  "WorkingDir"  ; 22
.const  "Navigate"  ; 23
.const  "\\blank.html"  ; 24
.const  "SetSize"  ; 25
.const  "InitFrame"  ; 26
.const  "g_oldChrome"  ; 27
.const  "InitProgress"  ; 28
.const  "data"  ; 29
.const  "jsEnabled"  ; 30
.const  "ShowSystemCloseBtn"  ; 31
.const  "ShowMinimizeBtn"  ; 32
.const  "SetForeground"  ; 33
.const  "slideSets"  ; 34
.const  "ConstTable"  ; 35
.const  "Root"  ; 36
.const  "OnBegin"  ; 37
.const  "OnComplete"  ; 38
.const  "OnException"  ; 39
[001] getglobal  11  0        ; io
[002] gettable   11  11  251  ; "write"
[003] loadk      12  2        ; "\n"
[004] getglobal  13  3        ; os
[005] gettable   13  13  254  ; "date"
[006] loadk      14  5        ; "%c "
[007] call       13  2   2  
[008] loadk      14  6        ; "SetDialogOptions mode = "
[009] getglobal  15  7        ; tostring
[010] move       16  10     
[011] call       15  2   2  
[012] concat     14  14  15 
[013] call       11  4   1  
[014] getglobal  11  8        ; uiInstance
[015] gettable   11  11  259  ; "mainDlg"
[016] self       11  11  260  ; "Create"
[017] test       13  0   1    ; to [19] if false
[018] jmp        1            ; to [20]
[019] loadk      13  11       ; 440
[020] test       14  1   1    ; to [22] if false
[021] jmp        1            ; to [23]
[022] loadk      14  12       ; 280
[023] test       15  10  1    ; to [25] if false
[024] jmp        1            ; to [26]
[025] loadk      15  13       ; 0
[026] call       11  5   1  
[027] getglobal  11  0        ; io
[028] gettable   11  11  251  ; "write"
[029] loadk      12  2        ; "\n"
[030] getglobal  13  3        ; os
[031] gettable   13  13  254  ; "date"
[032] loadk      14  5        ; "%c "
[033] call       13  2   2  
[034] loadk      14  14       ; "uiInstance.mainDlg:Create("
[035] getglobal  15  7        ; tostring
[036] test       16  0   1    ; to [38] if false
[037] jmp        1            ; to [39]
[038] loadk      16  11       ; 440
[039] call       15  2   2  
[040] loadk      16  15       ; " "
[041] getglobal  17  7        ; tostring
[042] test       18  1   1    ; to [44] if false
[043] jmp        1            ; to [45]
[044] loadk      18  12       ; 280
[045] call       17  2   2  
[046] loadk      18  15       ; " "
[047] getglobal  19  7        ; tostring
[048] move       20  10     
[049] call       19  2   2  
[050] loadk      20  16       ; ")"
[051] call       11  10  1  
[052] getglobal  11  17       ; g_env
[053] gettable   11  11  268  ; "curGameName"
[054] test       11  11  0    ; to [56] if true
[055] jmp        21           ; to [77]
[056] getglobal  11  0        ; io
[057] gettable   11  11  251  ; "write"
[058] loadk      12  2        ; "\n"
[059] getglobal  13  3        ; os
[060] gettable   13  13  254  ; "date"
[061] loadk      14  5        ; "%c "
[062] call       13  2   2  
[063] loadk      14  19       ; "SetDialogOptions gameName = "
[064] getglobal  15  17       ; g_env
[065] gettable   15  15  268  ; "curGameName"
[066] concat     14  14  15 
[067] test       14  14  1    ; to [69] if false
[068] jmp        1            ; to [70]
[069] loadk      14  20       ; "nil"
[070] call       11  4   1  
[071] getglobal  11  8        ; uiInstance
[072] gettable   11  11  259  ; "mainDlg"
[073] self       11  11  271  ; "SetTitle"
[074] getglobal  13  17       ; g_env
[075] gettable   13  13  268  ; "curGameName"
[076] call       11  3   1  
[077] test       0   0   0    ; to [79] if true
[078] jmp        18           ; to [97]
[079] test       1   1   0    ; to [81] if true
[080] jmp        16           ; to [97]
[081] getupval   11  0        ; win32
[082] gettable   11  11  272  ; "WorkingDir"
[083] call       11  1   2  
[084] getglobal  12  8        ; uiInstance
[085] gettable   12  12  259  ; "mainDlg"
[086] self       12  12  273  ; "Navigate"
[087] move       14  11     
[088] loadk      15  24       ; "\\blank.html"
[089] concat     14  14  15 
[090] call       12  3   1  
[091] getglobal  12  8        ; uiInstance
[092] gettable   12  12  259  ; "mainDlg"
[093] self       12  12  275  ; "SetSize"
[094] move       14  0      
[095] move       15  1      
[096] call       12  4   1  
[097] getglobal  11  8        ; uiInstance
[098] gettable   11  11  259  ; "mainDlg"
[099] self       11  11  276  ; "InitFrame"
[100] move       13  8      
[101] call       11  3   1  
[102] test       9   9   0    ; to [104] if true
[103] jmp        10           ; to [114]
[104] loadbool   11  1   0    ; true
[105] setglobal  11  27       ; g_oldChrome
[106] getglobal  11  8        ; uiInstance
[107] gettable   11  11  259  ; "mainDlg"
[108] self       11  11  278  ; "InitProgress"
[109] call       11  2   1  
[110] getglobal  11  8        ; uiInstance
[111] gettable   11  11  279  ; "data"
[112] loadbool   12  0   0    ; false
[113] settable   11  280 12   ; "jsEnabled"
[114] test       3   3   0    ; to [116] if true
[115] jmp        5            ; to [121]
[116] getglobal  11  8        ; uiInstance
[117] gettable   11  11  259  ; "mainDlg"
[118] self       11  11  281  ; "ShowSystemCloseBtn"
[119] loadbool   13  1   0    ; true
[120] call       11  3   1  
[121] test       2   2   0    ; to [123] if true
[122] jmp        5            ; to [128]
[123] getglobal  11  8        ; uiInstance
[124] gettable   11  11  259  ; "mainDlg"
[125] self       11  11  282  ; "ShowMinimizeBtn"
[126] loadbool   13  1   0    ; true
[127] call       11  3   1  
[128] getglobal  11  8        ; uiInstance
[129] gettable   11  11  259  ; "mainDlg"
[130] self       11  11  283  ; "SetForeground"
[131] call       11  2   1  
[132] getglobal  11  8        ; uiInstance
[133] getglobal  12  35       ; ConstTable
[134] call       12  1   2  
[135] settable   11  284 12   ; "slideSets"
[136] getglobal  11  8        ; uiInstance
[137] gettable   11  11  284  ; "slideSets"
[138] getupval   12  1        ; SlideSet
[139] move       13  4      
[140] call       12  2   2  
[141] settable   11  286 12   ; "Root"
[142] getglobal  11  8        ; uiInstance
[143] gettable   11  11  284  ; "slideSets"
[144] getupval   12  1        ; SlideSet
[145] move       13  5      
[146] call       12  2   2  
[147] settable   11  287 12   ; "OnBegin"
[148] getglobal  11  8        ; uiInstance
[149] gettable   11  11  284  ; "slideSets"
[150] getupval   12  1        ; SlideSet
[151] move       13  6      
[152] call       12  2   2  
[153] settable   11  288 12   ; "OnComplete"
[154] getglobal  11  8        ; uiInstance
[155] gettable   11  11  284  ; "slideSets"
[156] getupval   12  1        ; SlideSet
[157] move       13  7      
[158] call       12  2   2  
[159] settable   11  289 12   ; "OnException"
[160] return     0   1      
; end of function


; function [17] definition (level 4)
; 0 upvalues, 1 params, 4 stacks
.function  0 1 0 4
.local  "url"  ; 0
.const  "true"  ; 0
.const  "uiInstance"  ; 1
.const  "data"  ; 2
.const  "queueEnabled"  ; 3
.const  "DownloadQueue"  ; 4
.const  "StickyQueue"  ; 5
.const  "queueTarget"  ; 6
.const  "main"  ; 7
.const  "mainDlg"  ; 8
.const  "EnableQueue"  ; 9
.const  "NavigateQ"  ; 10
.const  "queue"  ; 11
[01] test       0   0   1    ; to [3] if false
[02] jmp        2            ; to [5]
[03] return     0   1      
[04] jmp        30           ; to [35]
[05] eq         0   0   250  ; "true", to [7] if true
[06] jmp        12           ; to [19]
[07] getglobal  1   1        ; uiInstance
[08] gettable   1   1   252  ; "data"
[09] loadbool   2   1   0    ; true
[10] settable   1   253 2    ; "queueEnabled"
[11] getglobal  1   4        ; DownloadQueue
[12] call       1   1   2  
[13] gettable   1   1   255  ; "StickyQueue"
[14] call       1   1   1  
[15] getglobal  1   1        ; uiInstance
[16] gettable   1   1   252  ; "data"
[17] settable   1   256 257  ; "queueTarget" "main"
[18] jmp        16           ; to [35]
[19] getglobal  1   1        ; uiInstance
[20] gettable   1   1   258  ; "mainDlg"
[21] self       1   1   259  ; "EnableQueue"
[22] call       1   2   1  
[23] getglobal  1   1        ; uiInstance
[24] gettable   1   1   258  ; "mainDlg"
[25] self       1   1   260  ; "NavigateQ"
[26] move       3   0      
[27] call       1   3   1  
[28] getglobal  1   1        ; uiInstance
[29] gettable   1   1   252  ; "data"
[30] loadbool   2   1   0    ; true
[31] settable   1   253 2    ; "queueEnabled"
[32] getglobal  1   1        ; uiInstance
[33] gettable   1   1   252  ; "data"
[34] settable   1   256 261  ; "queueTarget" "queue"
[35] return     0   1      
; end of function


; function [18] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "fun"  ; 0
.const  "uiInstance"  ; 0
.const  "CheckConditions"  ; 1
[1] getglobal  1   0        ; uiInstance
[2] settable   1   251 0    ; "CheckConditions"
[3] return     0   1      
; end of function


; function [19] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "fun"  ; 0
.const  "uiInstance"  ; 0
.const  "ProcessAuxTags"  ; 1
[1] getglobal  1   0        ; uiInstance
[2] settable   1   251 0    ; "ProcessAuxTags"
[3] return     0   1      
; end of function


; function [20] definition (level 4)
; 0 upvalues, 1 params, 4 stacks
.function  0 1 0 4
.local  "resourceId"  ; 0
.const  "uiInstance"  ; 0
.const  "mainDlg"  ; 1
.const  "DisplayErrorYN"  ; 2
[1] getglobal  1   0        ; uiInstance
[2] gettable   1   1   251  ; "mainDlg"
[3] self       1   1   252  ; "DisplayErrorYN"
[4] move       3   0      
[5] tailcall   1   3   0  
[6] return     1   0      
[7] return     0   1      
; end of function


; function [21] definition (level 4)
; 0 upvalues, 1 params, 4 stacks
.function  0 1 0 4
.local  "resourceId"  ; 0
.const  "uiInstance"  ; 0
.const  "mainDlg"  ; 1
.const  "DisplayErrorRetryCancel"  ; 2
[1] getglobal  1   0        ; uiInstance
[2] gettable   1   1   251  ; "mainDlg"
[3] self       1   1   252  ; "DisplayErrorRetryCancel"
[4] move       3   0      
[5] tailcall   1   3   0  
[6] return     1   0      
[7] return     0   1      
; end of function


; function [22] definition (level 4)
; 0 upvalues, 1 params, 5 stacks
.function  0 1 0 5
.local  "resourceId"  ; 0
.const  "uiInstance"  ; 0
.const  "mainDlg"  ; 1
.const  "DisplayError"  ; 2
.const  ""  ; 3
[1] getglobal  1   0        ; uiInstance
[2] gettable   1   1   251  ; "mainDlg"
[3] self       1   1   252  ; "DisplayError"
[4] move       3   0      
[5] loadk      4   3        ; ""
[6] call       1   4   1  
[7] return     0   1      
; end of function


; function [23] definition (level 4)
; 0 upvalues, 1 params, 4 stacks
.function  0 1 0 4
.local  "resourceId"  ; 0
.const  "uiInstance"  ; 0
.const  "mainDlg"  ; 1
.const  "DisplayWarning"  ; 2
[1] getglobal  1   0        ; uiInstance
[2] gettable   1   1   251  ; "mainDlg"
[3] self       1   1   252  ; "DisplayWarning"
[4] move       3   0      
[5] call       1   3   1  
[6] return     0   1      
; end of function


; function [24] definition (level 4)
; 1 upvalues, 4 params, 12 stacks
.function  1 4 0 12
.local  "url"  ; 0
.local  "x"  ; 1
.local  "of_y"  ; 2
.local  "close"  ; 3
.local  "separator"  ; 4
.upvalue  "uistate"  ; 0
.const  "false"  ; 0
.const  "uiInstance"  ; 1
.const  "ShowSystemCloseButton"  ; 2
.const  "?"  ; 3
.const  "string"  ; 4
.const  "find"  ; 5
.const  "&"  ; 6
.const  "locale="  ; 7
.const  "g_strLocale"  ; 8
.const  "&curpage="  ; 9
.const  "tostring"  ; 10
.const  ""  ; 11
.const  "&maxpage="  ; 12
.const  "&locale="  ; 13
.const  "RequestVersionParams"  ; 14
.const  "io"  ; 15
.const  "write"  ; 16
.const  "\n"  ; 17
.const  "os"  ; 18
.const  "date"  ; 19
.const  "%c "  ; 20
.const  "Navigating to "  ; 21
.const  "flush"  ; 22
.const  "mainDlg"  ; 23
.const  "Navigate"  ; 24
.const  "current_url"  ; 25
[01] test       3   3   0    ; to [3] if true
[02] jmp        6            ; to [9]
[03] eq         0   3   250  ; "false", to [5] if true
[04] jmp        4            ; to [9]
[05] getglobal  4   1        ; uiInstance
[06] gettable   4   4   252  ; "ShowSystemCloseButton"
[07] loadbool   5   0   0    ; false
[08] call       4   2   1  
[09] loadk      4   3        ; "?"
[10] getglobal  5   4        ; string
[11] gettable   5   5   255  ; "find"
[12] move       6   0      
[13] move       7   4      
[14] call       5   3   2  
[15] test       5   5   0    ; to [17] if true
[16] jmp        1            ; to [18]
[17] loadk      4   6        ; "&"
[18] move       5   0      
[19] move       6   4      
[20] loadk      7   7        ; "locale="
[21] getglobal  8   8        ; g_strLocale
[22] concat     0   5   8  
[23] test       1   1   0    ; to [25] if true
[24] jmp        20           ; to [45]
[25] test       2   2   0    ; to [27] if true
[26] jmp        18           ; to [45]
[27] move       5   0      
[28] loadk      6   9        ; "&curpage="
[29] getglobal  7   10       ; tostring
[30] move       8   1      
[31] call       7   2   2  
[32] test       7   7   1    ; to [34] if false
[33] jmp        1            ; to [35]
[34] loadk      7   11       ; ""
[35] loadk      8   12       ; "&maxpage="
[36] getglobal  9   10       ; tostring
[37] move       10  2      
[38] call       9   2   2  
[39] test       9   9   1    ; to [41] if false
[40] jmp        1            ; to [42]
[41] loadk      9   11       ; ""
[42] loadk      10  13       ; "&locale="
[43] getglobal  11  8        ; g_strLocale
[44] concat     0   5   11 
[45] move       5   0      
[46] loadk      6   6        ; "&"
[47] getglobal  7   14       ; RequestVersionParams
[48] call       7   1   2  
[49] concat     0   5   7  
[50] getglobal  5   15       ; io
[51] gettable   5   5   266  ; "write"
[52] loadk      6   17       ; "\n"
[53] getglobal  7   18       ; os
[54] gettable   7   7   269  ; "date"
[55] loadk      8   20       ; "%c "
[56] call       7   2   2  
[57] loadk      8   21       ; "Navigating to "
[58] move       9   0      
[59] call       5   5   1  
[60] getglobal  5   15       ; io
[61] gettable   5   5   272  ; "flush"
[62] call       5   1   1  
[63] getglobal  5   1        ; uiInstance
[64] gettable   5   5   273  ; "mainDlg"
[65] self       5   5   274  ; "Navigate"
[66] move       7   0      
[67] call       5   3   1  
[68] getupval   5   0        ; uistate
[69] settable   5   275 0    ; "current_url"
[70] return     0   1      
; end of function


; function [25] definition (level 4)
; 1 upvalues, 0 params, 2 stacks
.function  1 0 0 2
.upvalue  "uistate"  ; 0
.const  "current_url"  ; 0
[1] getupval   0   0        ; uistate
[2] gettable   0   0   250  ; "current_url"
[3] return     0   2      
[4] return     0   1      
; end of function


; function [26] definition (level 4)
; 0 upvalues, 1 params, 12 stacks
.function  0 1 0 12
.local  "var"  ; 0
.local  "pairTab"  ; 1
.local  "nodeName"  ; 2
.local  "key"  ; 3
.local  "val"  ; 4
.const  "type"  ; 0
.const  "table"  ; 1
.const  "getn"  ; 2
.const  2  ; 3
.const  "remove"  ; 4
.const  1  ; 5
.const  "RESERVED_NODE_IDENTIFIER"  ; 6
.const  "io"  ; 7
.const  "write"  ; 8
.const  "\n"  ; 9
.const  "os"  ; 10
.const  "date"  ; 11
.const  "%c "  ; 12
.const  "tab["  ; 13
.const  "] = "  ; 14
.const  "ParsePairs returning node "  ; 15
.const  "tostring"  ; 16
.const  ". Still "  ; 17
.const  " items left"  ; 18
[01] newtable   1   0   0    ; array=0, hash=0
[02] loadnil    2   2      
[03] getglobal  3   0        ; type
[04] move       4   0      
[05] call       3   2   2  
[06] eq         0   3   251  ; "table", to [8] if true
[07] jmp        51           ; to [59]
[08] getglobal  3   1        ; table
[09] gettable   3   3   252  ; "getn"
[10] move       4   0      
[11] call       3   2   2  
[12] lt         0   253 3    ; 2, to [14] if true
[13] jmp        45           ; to [59]
[14] getglobal  3   1        ; table
[15] gettable   3   3   254  ; "remove"
[16] move       4   0      
[17] loadk      5   5        ; 1
[18] call       3   3   1  
[19] getglobal  3   1        ; table
[20] gettable   3   3   254  ; "remove"
[21] move       4   0      
[22] loadk      5   5        ; 1
[23] call       3   3   2  
[24] move       2   3      
[25] jmp        30           ; to [56]
[26] getglobal  3   1        ; table
[27] gettable   3   3   254  ; "remove"
[28] move       4   0      
[29] loadk      5   5        ; 1
[30] call       3   3   2  
[31] getglobal  4   1        ; table
[32] gettable   4   4   254  ; "remove"
[33] move       5   0      
[34] loadk      6   5        ; 1
[35] call       4   3   2  
[36] settable   1   3   4  
[37] getglobal  5   7        ; io
[38] gettable   5   5   258  ; "write"
[39] loadk      6   9        ; "\n"
[40] getglobal  7   10       ; os
[41] gettable   7   7   261  ; "date"
[42] loadk      8   12       ; "%c "
[43] call       7   2   2  
[44] loadk      8   13       ; "tab["
[45] move       9   3      
[46] loadk      10  14       ; "] = "
[47] gettable   11  1   3  
[48] call       5   7   1  
[49] getglobal  5   1        ; table
[50] gettable   5   5   252  ; "getn"
[51] move       6   0      
[52] call       5   2   2  
[53] lt         0   5   253  ; 2, to [55] if true
[54] jmp        1            ; to [56]
[55] jmp        3            ; to [59]
[56] gettable   3   0   255  ; 1
[57] eq         0   3   256  ; "RESERVED_NODE_IDENTIFIER", to [59] if true
[58] jmp        -33          ; to [26]
[59] getglobal  3   7        ; io
[60] gettable   3   3   258  ; "write"
[61] loadk      4   9        ; "\n"
[62] getglobal  5   10       ; os
[63] gettable   5   5   261  ; "date"
[64] loadk      6   12       ; "%c "
[65] call       5   2   2  
[66] loadk      6   15       ; "ParsePairs returning node "
[67] getglobal  7   16       ; tostring
[68] move       8   2      
[69] call       7   2   2  
[70] loadk      8   17       ; ". Still "
[71] getglobal  9   1        ; table
[72] gettable   9   9   252  ; "getn"
[73] move       10  0      
[74] call       9   2   2  
[75] loadk      10  18       ; " items left"
[76] call       3   8   1  
[77] move       3   2      
[78] move       4   1      
[79] move       5   0      
[80] return     3   4      
[81] return     0   1      
; end of function


; function [27] definition (level 4)
; 0 upvalues, 1 params, 17 stacks
.function  0 1 0 17
.local  "var"  ; 0
.local  "size"  ; 1
.local  "action"  ; 2
.local  "tab"  ; 3
.local  "tab1"  ; 4
.local  "tab2"  ; 5
.local  "name"  ; 6
.local  "value"  ; 7
.local  "tab3"  ; 8
.local  "idx1"  ; 9
.local  "dummy"  ; 10
.local  "idx2"  ; 11
.local  "(for generator)"  ; 12
.local  "(for state)"  ; 13
.local  "i"  ; 14
.local  "v"  ; 15
.const  "type"  ; 0
.const  "table"  ; 1
.const  "getn"  ; 2
.const  2  ; 3
.const  "remove"  ; 4
.const  1  ; 5
.const  "io"  ; 6
.const  "write"  ; 7
.const  "\n"  ; 8
.const  "os"  ; 9
.const  "date"  ; 10
.const  "%c "  ; 11
.const  "uiInstance.Process action: "  ; 12
.const  "tostring"  ; 13
.const  "flush"  ; 14
.const  "RESERVED_NODE_IDENTIFIER"  ; 15
.const  "pairsName"  ; 16
.const  "uiInstance"  ; 17
.const  "ParsePairs"  ; 18
.const  "nodeName"  ; 19
.const  "tab4"  ; 20
.const  "ipairs"  ; 21
.const  "bit"  ; 22
.const  "band"  ; 23
.const  " : "  ; 24
.const  " name, = "  ; 25
.const  "tab1"  ; 26
.const  "Calling uiInstance.ProcessAuxTags for action "  ; 27
.const  "ProcessAuxTags"  ; 28
.const  "uiInstance.ProcessAuxTags returned"  ; 29
.const  "!!!uiInstance.Process("  ; 30
.const  ") called with wrong type"  ; 31
[001] getglobal  1   0        ; type
[002] move       2   0      
[003] call       1   2   2  
[004] eq         0   1   251  ; "table", to [6] if true
[005] jmp        140          ; to [146]
[006] getglobal  1   1        ; table
[007] gettable   1   1   252  ; "getn"
[008] move       2   0      
[009] call       1   2   2  
[010] lt         0   253 1    ; 2, to [12] if true
[011] jmp        147          ; to [159]
[012] getglobal  2   1        ; table
[013] gettable   2   2   254  ; "remove"
[014] move       3   0      
[015] loadk      4   5        ; 1
[016] call       2   3   2  
[017] getglobal  3   6        ; io
[018] gettable   3   3   257  ; "write"
[019] loadk      4   8        ; "\n"
[020] getglobal  5   9        ; os
[021] gettable   5   5   260  ; "date"
[022] loadk      6   11       ; "%c "
[023] call       5   2   2  
[024] loadk      6   12       ; "uiInstance.Process action: "
[025] getglobal  7   13       ; tostring
[026] move       8   2      
[027] call       7   2   0  
[028] call       3   0   1  
[029] getglobal  3   6        ; io
[030] gettable   3   3   264  ; "flush"
[031] call       3   1   1  
[032] newtable   3   0   0    ; array=0, hash=0
[033] newtable   4   0   0    ; array=0, hash=0
[034] newtable   5   0   0    ; array=0, hash=0
[035] loadnil    6   7      
[036] gettable   8   0   255  ; 1
[037] eq         0   8   265  ; "RESERVED_NODE_IDENTIFIER", to [39] if true
[038] jmp        30           ; to [69]
[039] newtable   8   0   0    ; array=0, hash=0
[040] newtable   9   0   0    ; array=0, hash=0
[041] newtable   10  0   0    ; array=0, hash=0
[042] getglobal  11  17       ; uiInstance
[043] gettable   11  11  268  ; "ParsePairs"
[044] move       12  0      
[045] call       11  2   4  
[046] move       0   13     
[047] move       10  12     
[048] setglobal  11  16       ; pairsName
[049] jmp        12           ; to [62]
[050] newtable   11  0   0    ; array=0, hash=0
[051] getglobal  12  17       ; uiInstance
[052] gettable   12  12  268  ; "ParsePairs"
[053] move       13  0      
[054] call       12  2   4  
[055] move       0   14     
[056] setglobal  13  20       ; tab4
[057] setglobal  12  19       ; nodeName
[058] getglobal  12  20       ; tab4
[059] settable   11  255 12   ; 1
[060] getglobal  12  19       ; nodeName
[061] settable   8   12  11 
[062] gettable   11  0   255  ; 1
[063] eq         1   11  265  ; "RESERVED_NODE_IDENTIFIER", to [65] if false
[064] jmp        -15          ; to [50]
[065] settable   9   255 8    ; 1
[066] getglobal  11  16       ; pairsName
[067] settable   5   11  9  
[068] jmp        45           ; to [114]
[069] getglobal  8   21       ; ipairs
[070] move       9   0      
[071] call       8   2   5  
[072] tforprep   8   39       ; to [112]
[073] getglobal  12  22       ; bit
[074] gettable   12  12  273  ; "band"
[075] move       13  10     
[076] loadk      14  5        ; 1
[077] call       12  3   2  
[078] eq         0   255 12   ; 1, to [80] if true
[079] jmp        5            ; to [85]
[080] getglobal  12  13       ; tostring
[081] move       13  11     
[082] call       12  2   2  
[083] move       6   12     
[084] jmp        4            ; to [89]
[085] getglobal  12  13       ; tostring
[086] move       13  11     
[087] call       12  2   2  
[088] move       7   12     
[089] getglobal  12  6        ; io
[090] gettable   12  12  257  ; "write"
[091] loadk      13  24       ; " : "
[092] getglobal  14  13       ; tostring
[093] move       15  11     
[094] call       14  2   0  
[095] call       12  0   1  
[096] test       6   6   0    ; to [98] if true
[097] jmp        14           ; to [112]
[098] test       7   7   0    ; to [100] if true
[099] jmp        12           ; to [112]
[100] settable   5   6   7  
[101] getglobal  12  6        ; io
[102] gettable   12  12  257  ; "write"
[103] loadk      13  8        ; "\n"
[104] getglobal  14  9        ; os
[105] gettable   14  14  260  ; "date"
[106] loadk      15  11       ; "%c "
[107] call       14  2   2  
[108] loadk      15  25       ; " name, = "
[109] gettable   16  5   6  
[110] call       12  5   1  
[111] loadnil    6   7      
[112] tforloop   8       1    ; to [114] if exit
[113] jmp        -41          ; to [73]
[114] settable   4   276 5    ; "tab1"
[115] settable   3   2   4  
[116] getglobal  8   6        ; io
[117] gettable   8   8   257  ; "write"
[118] loadk      9   8        ; "\n"
[119] getglobal  10  9        ; os
[120] gettable   10  10  260  ; "date"
[121] loadk      11  11       ; "%c "
[122] call       10  2   2  
[123] loadk      11  27       ; "Calling uiInstance.ProcessAuxTags for action "
[124] move       12  2      
[125] call       8   5   1  
[126] getglobal  8   6        ; io
[127] gettable   8   8   264  ; "flush"
[128] call       8   1   1  
[129] getglobal  8   17       ; uiInstance
[130] gettable   8   8   278  ; "ProcessAuxTags"
[131] move       9   3      
[132] call       8   2   1  
[133] getglobal  8   6        ; io
[134] gettable   8   8   257  ; "write"
[135] loadk      9   8        ; "\n"
[136] getglobal  10  9        ; os
[137] gettable   10  10  260  ; "date"
[138] loadk      11  11       ; "%c "
[139] call       10  2   2  
[140] loadk      11  29       ; "uiInstance.ProcessAuxTags returned"
[141] call       8   4   1  
[142] getglobal  8   6        ; io
[143] gettable   8   8   264  ; "flush"
[144] call       8   1   1  
[145] jmp        13           ; to [159]
[146] getglobal  1   6        ; io
[147] gettable   1   1   257  ; "write"
[148] loadk      2   8        ; "\n"
[149] getglobal  3   9        ; os
[150] gettable   3   3   260  ; "date"
[151] loadk      4   11       ; "%c "
[152] call       3   2   2  
[153] loadk      4   30       ; "!!!uiInstance.Process("
[154] getglobal  5   13       ; tostring
[155] move       6   0      
[156] call       5   2   2  
[157] loadk      6   31       ; ") called with wrong type"
[158] call       1   6   1  
[159] return     0   1      
; end of function


; function [28] definition (level 4)
; 0 upvalues, 3 params, 10 stacks
.function  0 3 0 10
.local  "progressGranularity"  ; 0
.local  "totalPayloads"  ; 1
.local  "totalBytes"  ; 2
.local  "textData"  ; 3
.const  "uiInstance"  ; 0
.const  "data"  ; 1
.const  "progressGranularity"  ; 2
.const  "totalPayloads"  ; 3
.const  "totalBytes"  ; 4
.const  "jsEnabled"  ; 5
.const  "string"  ; 6
.const  "format"  ; 7
.const  "granularity=%d|numPackages=%d|totalMegs=%.1f"  ; 8
.const  1000000  ; 9
.const  "mainDlg"  ; 10
.const  "CallJSFunction"  ; 11
.const  "RAINSTALLER.install.InitializeProgressInfo"  ; 12
.const  "\""  ; 13
.const  "main"  ; 14
.const  "SetProgressGranularity"  ; 15
[01] test       0   0   1    ; to [3] if false
[02] jmp        3            ; to [6]
[03] getglobal  3   0        ; uiInstance
[04] gettable   3   3   251  ; "data"
[05] gettable   0   3   252  ; "progressGranularity"
[06] test       1   1   1    ; to [8] if false
[07] jmp        3            ; to [11]
[08] getglobal  3   0        ; uiInstance
[09] gettable   3   3   251  ; "data"
[10] gettable   1   3   253  ; "totalPayloads"
[11] test       2   2   1    ; to [13] if false
[12] jmp        3            ; to [16]
[13] getglobal  3   0        ; uiInstance
[14] gettable   3   3   251  ; "data"
[15] gettable   2   3   254  ; "totalBytes"
[16] getglobal  3   0        ; uiInstance
[17] gettable   3   3   251  ; "data"
[18] gettable   3   3   255  ; "jsEnabled"
[19] test       3   3   0    ; to [21] if true
[20] jmp        18           ; to [39]
[21] getglobal  3   6        ; string
[22] gettable   3   3   257  ; "format"
[23] loadk      4   8        ; "granularity=%d|numPackages=%d|totalMegs=%.1f"
[24] move       5   0      
[25] move       6   1      
[26] div        7   2   259  ; 1000000
[27] call       3   5   2  
[28] getglobal  4   0        ; uiInstance
[29] gettable   4   4   260  ; "mainDlg"
[30] self       4   4   261  ; "CallJSFunction"
[31] loadk      6   12       ; "RAINSTALLER.install.InitializeProgressInfo"
[32] loadk      7   13       ; "\""
[33] move       8   3      
[34] loadk      9   13       ; "\""
[35] concat     7   7   9  
[36] loadk      8   14       ; "main"
[37] call       4   5   1  
[38] jmp        7            ; to [46]
[39] getglobal  3   0        ; uiInstance
[40] gettable   3   3   260  ; "mainDlg"
[41] self       3   3   265  ; "SetProgressGranularity"
[42] getglobal  5   0        ; uiInstance
[43] gettable   5   5   251  ; "data"
[44] gettable   5   5   252  ; "progressGranularity"
[45] call       3   3   1  
[46] return     0   1      
; end of function


; function [29] definition (level 4)
; 0 upvalues, 0 params, 9 stacks
.function  0 0 0 9
.local  "textData"  ; 0
.const  "uiInstance"  ; 0
.const  "data"  ; 1
.const  "pbarDisplayProgress"  ; 2
.const  "g_ogmid"  ; 3
.const  "g_ogmport"  ; 4
.const  "sendProgressToOgm"  ; 5
.const  "jsEnabled"  ; 6
.const  "string"  ; 7
.const  "format"  ; 8
.const  "text=%s|progress=%d|currentPackage=%d|downloadedMegs=%.1f"  ; 9
.const  "|granularity=%d|numPackages=%d|totalMegs=%.1f"  ; 10
.const  "statusText"  ; 11
.const  "currentPayload"  ; 12
.const  "totalPayloads"  ; 13
.const  "pbarPayloadBytes"  ; 14
.const  "bytesDownloaded"  ; 15
.const  1000000  ; 16
.const  "pbarPayloadTotalBytes"  ; 17
.const  "totalBytes"  ; 18
.const  "mainDlg"  ; 19
.const  "CallJSFunction"  ; 20
.const  "RAINSTALLER.install.UpdateProgressInfo"  ; 21
.const  "\""  ; 22
.const  "main"  ; 23
.const  "SetProgress"  ; 24
.const  "totalProgress"  ; 25
[01] getglobal  0   0        ; uiInstance
[02] gettable   0   0   251  ; "data"
[03] gettable   0   0   252  ; "pbarDisplayProgress"
[04] test       0   0   0    ; to [6] if true
[05] jmp        74           ; to [80]
[06] getglobal  0   3        ; g_ogmid
[07] test       0   0   0    ; to [9] if true
[08] jmp        10           ; to [19]
[09] getglobal  0   4        ; g_ogmport
[10] test       0   0   0    ; to [12] if true
[11] jmp        7            ; to [19]
[12] getglobal  0   0        ; uiInstance
[13] gettable   0   0   255  ; "sendProgressToOgm"
[14] getglobal  1   3        ; g_ogmid
[15] getglobal  2   4        ; g_ogmport
[16] getglobal  3   0        ; uiInstance
[17] gettable   3   3   251  ; "data"
[18] call       0   4   1  
[19] getglobal  0   0        ; uiInstance
[20] gettable   0   0   251  ; "data"
[21] gettable   0   0   256  ; "jsEnabled"
[22] test       0   0   0    ; to [24] if true
[23] jmp        49           ; to [73]
[24] getglobal  0   7        ; string
[25] gettable   0   0   258  ; "format"
[26] loadk      1   9        ; "text=%s|progress=%d|currentPackage=%d|downloadedMegs=%.1f"
[27] loadk      2   10       ; "|granularity=%d|numPackages=%d|totalMegs=%.1f"
[28] concat     1   1   2  
[29] getglobal  2   7        ; string
[30] gettable   2   2   258  ; "format"
[31] getglobal  3   0        ; uiInstance
[32] gettable   3   3   251  ; "data"
[33] gettable   3   3   261  ; "statusText"
[34] getglobal  4   0        ; uiInstance
[35] gettable   4   4   251  ; "data"
[36] gettable   4   4   262  ; "currentPayload"
[37] getglobal  5   0        ; uiInstance
[38] gettable   5   5   251  ; "data"
[39] gettable   5   5   263  ; "totalPayloads"
[40] call       2   4   2  
[41] getglobal  3   0        ; uiInstance
[42] gettable   3   3   251  ; "data"
[43] gettable   3   3   264  ; "pbarPayloadBytes"
[44] getglobal  4   0        ; uiInstance
[45] gettable   4   4   251  ; "data"
[46] gettable   4   4   262  ; "currentPayload"
[47] getglobal  5   0        ; uiInstance
[48] gettable   5   5   251  ; "data"
[49] gettable   5   5   265  ; "bytesDownloaded"
[50] div        5   5   266  ; 1000000
[51] getglobal  6   0        ; uiInstance
[52] gettable   6   6   251  ; "data"
[53] gettable   6   6   267  ; "pbarPayloadTotalBytes"
[54] getglobal  7   0        ; uiInstance
[55] gettable   7   7   251  ; "data"
[56] gettable   7   7   263  ; "totalPayloads"
[57] getglobal  8   0        ; uiInstance
[58] gettable   8   8   251  ; "data"
[59] gettable   8   8   268  ; "totalBytes"
[60] div        8   8   266  ; 1000000
[61] call       0   9   2  
[62] getglobal  1   0        ; uiInstance
[63] gettable   1   1   269  ; "mainDlg"
[64] self       1   1   270  ; "CallJSFunction"
[65] loadk      3   21       ; "RAINSTALLER.install.UpdateProgressInfo"
[66] loadk      4   22       ; "\""
[67] move       5   0      
[68] loadk      6   22       ; "\""
[69] concat     4   4   6  
[70] loadk      5   23       ; "main"
[71] call       1   5   1  
[72] jmp        7            ; to [80]
[73] getglobal  0   0        ; uiInstance
[74] gettable   0   0   269  ; "mainDlg"
[75] self       0   0   274  ; "SetProgress"
[76] getglobal  2   0        ; uiInstance
[77] gettable   2   2   251  ; "data"
[78] gettable   2   2   275  ; "totalProgress"
[79] call       0   3   1  
[80] return     0   1      
; end of function


; function [30] definition (level 4)
; 0 upvalues, 1 params, 7 stacks
.function  0 1 0 7
.local  "gameid"  ; 0
.const  "uiInstance"  ; 0
.const  "data"  ; 1
.const  "queueEnabled"  ; 2
.const  "mainDlg"  ; 3
.const  "CallJSFunction"  ; 4
.const  "RAINSTALLER.downloadQueue.Active"  ; 5
.const  "'"  ; 6
.const  "queueTarget"  ; 7
[01] getglobal  1   0        ; uiInstance
[02] gettable   1   1   251  ; "data"
[03] gettable   1   1   252  ; "queueEnabled"
[04] test       1   1   0    ; to [6] if true
[05] jmp        12           ; to [18]
[06] getglobal  1   0        ; uiInstance
[07] gettable   1   1   253  ; "mainDlg"
[08] self       1   1   254  ; "CallJSFunction"
[09] loadk      3   5        ; "RAINSTALLER.downloadQueue.Active"
[10] loadk      4   6        ; "'"
[11] move       5   0      
[12] loadk      6   6        ; "'"
[13] concat     4   4   6  
[14] getglobal  5   0        ; uiInstance
[15] gettable   5   5   251  ; "data"
[16] gettable   5   5   257  ; "queueTarget"
[17] call       1   5   1  
[18] return     0   1      
; end of function


; function [31] definition (level 4)
; 0 upvalues, 1 params, 7 stacks
.function  0 1 0 7
.local  "gameid"  ; 0
.const  "uiInstance"  ; 0
.const  "data"  ; 1
.const  "queueEnabled"  ; 2
.const  "mainDlg"  ; 3
.const  "CallJSFunction"  ; 4
.const  "RAINSTALLER.downloadQueue.Complete"  ; 5
.const  "'"  ; 6
.const  "queueTarget"  ; 7
[01] getglobal  1   0        ; uiInstance
[02] gettable   1   1   251  ; "data"
[03] gettable   1   1   252  ; "queueEnabled"
[04] test       1   1   0    ; to [6] if true
[05] jmp        12           ; to [18]
[06] getglobal  1   0        ; uiInstance
[07] gettable   1   1   253  ; "mainDlg"
[08] self       1   1   254  ; "CallJSFunction"
[09] loadk      3   5        ; "RAINSTALLER.downloadQueue.Complete"
[10] loadk      4   6        ; "'"
[11] move       5   0      
[12] loadk      6   6        ; "'"
[13] concat     4   4   6  
[14] getglobal  5   0        ; uiInstance
[15] gettable   5   5   251  ; "data"
[16] gettable   5   5   257  ; "queueTarget"
[17] call       1   5   1  
[18] return     0   1      
; end of function


; function [32] definition (level 4)
; 0 upvalues, 2 params, 10 stacks
.function  0 2 0 10
.local  "gameid"  ; 0
.local  "gamename"  ; 1
.const  "uiInstance"  ; 0
.const  "data"  ; 1
.const  "queueEnabled"  ; 2
.const  "mainDlg"  ; 3
.const  "CallJSFunction"  ; 4
.const  "RAINSTALLER.downloadQueue.AddCell"  ; 5
.const  "\""  ; 6
.const  "|"  ; 7
.const  "queueTarget"  ; 8
[01] getglobal  2   0        ; uiInstance
[02] gettable   2   2   251  ; "data"
[03] gettable   2   2   252  ; "queueEnabled"
[04] test       2   2   0    ; to [6] if true
[05] jmp        14           ; to [20]
[06] getglobal  2   0        ; uiInstance
[07] gettable   2   2   253  ; "mainDlg"
[08] self       2   2   254  ; "CallJSFunction"
[09] loadk      4   5        ; "RAINSTALLER.downloadQueue.AddCell"
[10] loadk      5   6        ; "\""
[11] move       6   0      
[12] loadk      7   7        ; "|"
[13] move       8   1      
[14] loadk      9   6        ; "\""
[15] concat     5   5   9  
[16] getglobal  6   0        ; uiInstance
[17] gettable   6   6   251  ; "data"
[18] gettable   6   6   258  ; "queueTarget"
[19] call       2   5   1  
[20] return     0   1      
; end of function


; function [33] definition (level 4)
; 0 upvalues, 2 params, 5 stacks
.function  0 2 0 5
.local  "chunkSize"  ; 0
.local  "isDownload"  ; 1
.local  "interval"  ; 2
.const  "uiInstance"  ; 0
.const  "data"  ; 1
.const  "pbarPayloadBytes"  ; 2
.const  "totalProgress"  ; 3
.const  "progressGranularity"  ; 4
.const  "bytesDownloaded"  ; 5
.const  "totalBytes"  ; 6
.const  "os"  ; 7
.const  "clock"  ; 8
.const  "lastUpdateTime"  ; 9
.const  0  ; 10
.const  "g_constants"  ; 11
.const  "updateinterval"  ; 12
.const  "UpdateProgress"  ; 13
[01] getglobal  2   0        ; uiInstance
[02] gettable   2   2   251  ; "data"
[03] getglobal  3   0        ; uiInstance
[04] gettable   3   3   251  ; "data"
[05] gettable   3   3   252  ; "pbarPayloadBytes"
[06] add        3   3   0  
[07] settable   2   252 3    ; "pbarPayloadBytes"
[08] getglobal  2   0        ; uiInstance
[09] gettable   2   2   251  ; "data"
[10] getglobal  3   0        ; uiInstance
[11] gettable   3   3   251  ; "data"
[12] gettable   3   3   253  ; "totalProgress"
[13] add        3   3   0  
[14] settable   2   253 3    ; "totalProgress"
[15] getglobal  2   0        ; uiInstance
[16] gettable   2   2   251  ; "data"
[17] gettable   2   2   253  ; "totalProgress"
[18] getglobal  3   0        ; uiInstance
[19] gettable   3   3   251  ; "data"
[20] gettable   3   3   254  ; "progressGranularity"
[21] lt         0   3   2    ; to [23] if true
[22] jmp        6            ; to [29]
[23] getglobal  2   0        ; uiInstance
[24] gettable   2   2   251  ; "data"
[25] getglobal  3   0        ; uiInstance
[26] gettable   3   3   251  ; "data"
[27] gettable   3   3   254  ; "progressGranularity"
[28] settable   2   253 3    ; "totalProgress"
[29] test       1   1   0    ; to [31] if true
[30] jmp        21           ; to [52]
[31] getglobal  2   0        ; uiInstance
[32] gettable   2   2   251  ; "data"
[33] getglobal  3   0        ; uiInstance
[34] gettable   3   3   251  ; "data"
[35] gettable   3   3   255  ; "bytesDownloaded"
[36] add        3   3   0  
[37] settable   2   255 3    ; "bytesDownloaded"
[38] getglobal  2   0        ; uiInstance
[39] gettable   2   2   251  ; "data"
[40] gettable   2   2   255  ; "bytesDownloaded"
[41] getglobal  3   0        ; uiInstance
[42] gettable   3   3   251  ; "data"
[43] gettable   3   3   256  ; "totalBytes"
[44] lt         0   3   2    ; to [46] if true
[45] jmp        6            ; to [52]
[46] getglobal  2   0        ; uiInstance
[47] gettable   2   2   251  ; "data"
[48] getglobal  3   0        ; uiInstance
[49] gettable   3   3   251  ; "data"
[50] gettable   3   3   256  ; "totalBytes"
[51] settable   2   255 3    ; "bytesDownloaded"
[52] getglobal  2   7        ; os
[53] gettable   2   2   258  ; "clock"
[54] call       2   1   2  
[55] getglobal  3   0        ; uiInstance
[56] gettable   3   3   251  ; "data"
[57] gettable   3   3   259  ; "lastUpdateTime"
[58] sub        2   2   3  
[59] lt         1   2   260  ; 0, to [61] if false
[60] jmp        4            ; to [65]
[61] getglobal  3   11       ; g_constants
[62] gettable   3   3   262  ; "updateinterval"
[63] lt         0   3   2    ; to [65] if true
[64] jmp        9            ; to [74]
[65] getglobal  3   0        ; uiInstance
[66] gettable   3   3   263  ; "UpdateProgress"
[67] call       3   1   1  
[68] getglobal  3   0        ; uiInstance
[69] gettable   3   3   251  ; "data"
[70] getglobal  4   7        ; os
[71] gettable   4   4   258  ; "clock"
[72] call       4   1   2  
[73] settable   3   259 4    ; "lastUpdateTime"
[74] return     0   1      
; end of function


; function [34] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "n"  ; 0
.const  "uiInstance"  ; 0
.const  "data"  ; 1
.const  "currentPayload"  ; 2
[1] getglobal  1   0        ; uiInstance
[2] gettable   1   1   251  ; "data"
[3] settable   1   252 0    ; "currentPayload"
[4] return     0   1      
; end of function


; function [35] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "n"  ; 0
.const  "uiInstance"  ; 0
.const  "data"  ; 1
.const  "totalPayloads"  ; 2
[1] getglobal  1   0        ; uiInstance
[2] gettable   1   1   251  ; "data"
[3] settable   1   252 0    ; "totalPayloads"
[4] return     0   1      
; end of function


; function [36] definition (level 4)
; 0 upvalues, 1 params, 3 stacks
.function  0 1 0 3
.local  "p"  ; 0
.const  "type"  ; 0
.const  "number"  ; 1
.const  2147483647  ; 2
.const  "uiInstance"  ; 3
.const  "data"  ; 4
.const  "totalBytes"  ; 5
[01] getglobal  1   0        ; type
[02] move       2   0      
[03] call       1   2   2  
[04] eq         0   1   251  ; "number", to [6] if true
[05] jmp        6            ; to [12]
[06] lt         0   252 0    ; 2147483647, to [8] if true
[07] jmp        1            ; to [9]
[08] loadk      0   2        ; 2147483647
[09] getglobal  1   3        ; uiInstance
[10] gettable   1   1   254  ; "data"
[11] settable   1   255 0    ; "totalBytes"
[12] return     0   1      
; end of function


; function [37] definition (level 4)
; 0 upvalues, 1 params, 3 stacks
.function  0 1 0 3
.local  "p"  ; 0
.const  "type"  ; 0
.const  "number"  ; 1
.const  2147483647  ; 2
.const  "uiInstance"  ; 3
.const  "data"  ; 4
.const  "progressGranularity"  ; 5
[01] getglobal  1   0        ; type
[02] move       2   0      
[03] call       1   2   2  
[04] eq         0   1   251  ; "number", to [6] if true
[05] jmp        6            ; to [12]
[06] lt         0   252 0    ; 2147483647, to [8] if true
[07] jmp        1            ; to [9]
[08] loadk      0   2        ; 2147483647
[09] getglobal  1   3        ; uiInstance
[10] gettable   1   1   254  ; "data"
[11] settable   1   255 0    ; "progressGranularity"
[12] return     0   1      
; end of function


; function [38] definition (level 4)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 0 3
.const  "EventCache"  ; 0
.const  "GetObj"  ; 1
.const  "Queue"  ; 2

; function [0] definition (level 5)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
.const  "uiInstance"  ; 0
.const  "data"  ; 1
.const  "bytesDownloaded"  ; 2
.const  0  ; 3
.const  "totalProgress"  ; 4
[1] getglobal  0   0        ; uiInstance
[2] gettable   0   0   251  ; "data"
[3] settable   0   252 253  ; "bytesDownloaded" 0
[4] getglobal  0   0        ; uiInstance
[5] gettable   0   0   251  ; "data"
[6] settable   0   254 253  ; "totalProgress" 0
[7] return     0   1      
; end of function

[1] getglobal  0   0        ; EventCache
[2] self       0   0   251  ; "GetObj"
[3] call       0   2   2  
[4] self       0   0   252  ; "Queue"
[5] closure    2   0        ; 0 upvalues
[6] call       0   3   1  
[7] return     0   1      
; end of function


; function [39] definition (level 4)
; 0 upvalues, 1 params, 15 stacks
.function  0 1 0 15
.local  "id"  ; 0
.local  "locale"  ; 1
.local  "localeStr"  ; 2
.local  "offset"  ; 3
.local  "locale"  ; 4
.local  "s"  ; 5
.local  "text"  ; 6
.const  0  ; 0
.const  "tostring"  ; 1
.const  "g_env"  ; 2
.const  "MultilingualProgressText"  ; 3
.const  "true"  ; 4
.const  "uiInstance"  ; 5
.const  "mainDlg"  ; 6
.const  "GetUserLocale"  ; 7
.const  "bit"  ; 8
.const  "band"  ; 9
.const  1023  ; 10
.const  7  ; 11
.const  1000  ; 12
.const  10  ; 13
.const  2000  ; 14
.const  12  ; 15
.const  3000  ; 16
.const  16  ; 17
.const  4000  ; 18
.const  19  ; 19
.const  5000  ; 20
.const  22  ; 21
.const  6000  ; 22
.const  29  ; 23
.const  7000  ; 24
.const  " Primary language "  ; 25
.const  " offset = "  ; 26
.const  " id= "  ; 27
.const  "pcall"  ; 28
.const  "GetStringById"  ; 29
.const  "io"  ; 30
.const  "write"  ; 31
.const  "\n"  ; 32
.const  "os"  ; 33
.const  "date"  ; 34
.const  "%c "  ; 35
.const  "Failed to retrieve string ID="  ; 36
.const  " from resource."  ; 37
.const  ""  ; 38
.const  " "  ; 39
.const  "data"  ; 40
.const  "statusText"  ; 41
.const  "UpdateProgress"  ; 42
[001] test       0   0   1    ; to [3] if false
[002] jmp        1            ; to [4]
[003] return     0   1      
[004] loadnil    1   2      
[005] loadk      3   0        ; 0
[006] getglobal  4   1        ; tostring
[007] getglobal  5   2        ; g_env
[008] gettable   5   5   253  ; "MultilingualProgressText"
[009] call       4   2   2  
[010] eq         1   4   254  ; "true", to [12] if false
[011] jmp        51           ; to [63]
[012] getglobal  4   5        ; uiInstance
[013] gettable   4   4   256  ; "mainDlg"
[014] self       4   4   257  ; "GetUserLocale"
[015] call       4   2   2  
[016] getglobal  5   8        ; bit
[017] gettable   5   5   259  ; "band"
[018] move       6   4      
[019] loadk      7   10       ; 1023
[020] call       5   3   2  
[021] move       4   5      
[022] eq         0   261 4    ; 7, to [24] if true
[023] jmp        2            ; to [26]
[024] loadk      3   12       ; 1000
[025] jmp        23           ; to [49]
[026] eq         0   263 4    ; 10, to [28] if true
[027] jmp        2            ; to [30]
[028] loadk      3   14       ; 2000
[029] jmp        19           ; to [49]
[030] eq         0   265 4    ; 12, to [32] if true
[031] jmp        2            ; to [34]
[032] loadk      3   16       ; 3000
[033] jmp        15           ; to [49]
[034] eq         0   267 4    ; 16, to [36] if true
[035] jmp        2            ; to [38]
[036] loadk      3   18       ; 4000
[037] jmp        11           ; to [49]
[038] eq         0   269 4    ; 19, to [40] if true
[039] jmp        2            ; to [42]
[040] loadk      3   20       ; 5000
[041] jmp        7            ; to [49]
[042] eq         0   271 4    ; 22, to [44] if true
[043] jmp        2            ; to [46]
[044] loadk      3   22       ; 6000
[045] jmp        3            ; to [49]
[046] eq         0   273 4    ; 29, to [48] if true
[047] jmp        1            ; to [49]
[048] loadk      3   24       ; 7000
[049] sub        0   0   3  
[050] loadk      5   25       ; " Primary language "
[051] getglobal  6   1        ; tostring
[052] move       7   4      
[053] call       6   2   2  
[054] loadk      7   26       ; " offset = "
[055] getglobal  8   1        ; tostring
[056] move       9   3      
[057] call       8   2   2  
[058] loadk      9   27       ; " id= "
[059] getglobal  10  1        ; tostring
[060] move       11  0      
[061] call       10  2   2  
[062] concat     2   5   10 
[063] getglobal  4   28       ; pcall
[064] getglobal  5   5        ; uiInstance
[065] gettable   5   5   256  ; "mainDlg"
[066] gettable   5   5   279  ; "GetStringById"
[067] getglobal  6   5        ; uiInstance
[068] gettable   6   6   256  ; "mainDlg"
[069] move       7   0      
[070] call       4   4   3  
[071] test       4   4   1    ; to [73] if false
[072] jmp        21           ; to [94]
[073] getglobal  6   30       ; io
[074] gettable   6   6   281  ; "write"
[075] loadk      7   32       ; "\n"
[076] getglobal  8   33       ; os
[077] gettable   8   8   284  ; "date"
[078] loadk      9   35       ; "%c "
[079] call       8   2   2  
[080] loadk      9   36       ; "Failed to retrieve string ID="
[081] getglobal  10  1        ; tostring
[082] move       11  0      
[083] call       10  2   2  
[084] loadk      11  37       ; " from resource."
[085] test       12  2   1    ; to [87] if false
[086] jmp        1            ; to [88]
[087] loadk      12  38       ; ""
[088] loadk      13  39       ; " "
[089] test       14  5   1    ; to [91] if false
[090] jmp        1            ; to [92]
[091] loadk      14  38       ; ""
[092] call       6   9   1  
[093] return     0   1      
[094] getglobal  6   5        ; uiInstance
[095] gettable   6   6   290  ; "data"
[096] settable   6   291 5    ; "statusText"
[097] getglobal  6   5        ; uiInstance
[098] gettable   6   6   292  ; "UpdateProgress"
[099] call       6   1   1  
[100] return     0   1      
; end of function


; function [40] definition (level 4)
; 0 upvalues, 0 params, 5 stacks
.function  0 0 0 5
.const  "uiInstance"  ; 0
.const  "data"  ; 1
.const  "jsEnabled"  ; 2
.const  "mainDlg"  ; 3
.const  "CallJSFunction"  ; 4
.const  "RAINSTALLER.install.ProgressToEnd"  ; 5
.const  ""  ; 6
.const  "main"  ; 7
.const  "ProgressToEnd"  ; 8
[01] getglobal  0   0        ; uiInstance
[02] gettable   0   0   251  ; "data"
[03] gettable   0   0   252  ; "jsEnabled"
[04] test       0   0   0    ; to [6] if true
[05] jmp        8            ; to [14]
[06] getglobal  0   0        ; uiInstance
[07] gettable   0   0   253  ; "mainDlg"
[08] self       0   0   254  ; "CallJSFunction"
[09] loadk      2   5        ; "RAINSTALLER.install.ProgressToEnd"
[10] loadk      3   6        ; ""
[11] loadk      4   7        ; "main"
[12] call       0   5   1  
[13] jmp        4            ; to [18]
[14] getglobal  0   0        ; uiInstance
[15] gettable   0   0   253  ; "mainDlg"
[16] self       0   0   258  ; "ProgressToEnd"
[17] call       0   2   1  
[18] return     0   1      
; end of function


; function [41] definition (level 4)
; 0 upvalues, 1 params, 4 stacks
.function  0 1 0 4
.local  "show"  ; 0
.const  "uiInstance"  ; 0
.const  "mainDlg"  ; 1
.const  "ShowSystemCloseBtn"  ; 2
[1] getglobal  1   0        ; uiInstance
[2] gettable   1   1   251  ; "mainDlg"
[3] self       1   1   252  ; "ShowSystemCloseBtn"
[4] move       3   0      
[5] call       1   3   1  
[6] return     0   1      
; end of function


; function [42] definition (level 4)
; 0 upvalues, 1 params, 4 stacks
.function  0 1 0 4
.local  "show"  ; 0
.const  "uiInstance"  ; 0
.const  "mainDlg"  ; 1
.const  "ShowMinimizeBtn"  ; 2
[1] getglobal  1   0        ; uiInstance
[2] gettable   1   1   251  ; "mainDlg"
[3] self       1   1   252  ; "ShowMinimizeBtn"
[4] move       3   0      
[5] call       1   3   1  
[6] return     0   1      
; end of function


; function [43] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
.const  "uiInstance"  ; 0
.const  "mainDlg"  ; 1
.const  "WaitOnClose"  ; 2
[1] getglobal  0   0        ; uiInstance
[2] gettable   0   0   251  ; "mainDlg"
[3] self       0   0   252  ; "WaitOnClose"
[4] call       0   2   1  
[5] return     0   1      
; end of function


; function [44] definition (level 4)
; 1 upvalues, 1 params, 2 stacks
.function  1 1 0 2
.local  "gamesRoot"  ; 0
.upvalue  "instState"  ; 0
.const  "uiGamesRoot"  ; 0
.const  "InstallPathLuaCompatible"  ; 1
.const  ""  ; 2
[01] getupval   1   0        ; instState
[02] gettable   1   1   251  ; "InstallPathLuaCompatible"
[03] setglobal  1   0        ; uiGamesRoot
[04] getglobal  1   0        ; uiGamesRoot
[05] test       1   1   0    ; to [7] if true
[06] jmp        3            ; to [10]
[07] getglobal  1   0        ; uiGamesRoot
[08] eq         0   1   252  ; "", to [10] if true
[09] jmp        2            ; to [12]
[10] return     0   2      
[11] jmp        2            ; to [14]
[12] getglobal  1   0        ; uiGamesRoot
[13] return     1   2      
[14] return     0   1      
; end of function


; function [45] definition (level 4)
; 1 upvalues, 1 params, 6 stacks
.function  1 1 0 6
.local  "path"  ; 0
.upvalue  "instState"  ; 0
.const  ""  ; 0
.const  "io"  ; 1
.const  "write"  ; 2
.const  "\n"  ; 3
.const  "os"  ; 4
.const  "date"  ; 5
.const  "%c "  ; 6
.const  "Setting install path to "  ; 7
.const  "InstallPath"  ; 8
[01] test       0   0   1    ; to [3] if false
[02] jmp        1            ; to [4]
[03] loadk      0   0        ; ""
[04] getglobal  1   1        ; io
[05] gettable   1   1   252  ; "write"
[06] loadk      2   3        ; "\n"
[07] getglobal  3   4        ; os
[08] gettable   3   3   255  ; "date"
[09] loadk      4   6        ; "%c "
[10] call       3   2   2  
[11] loadk      4   7        ; "Setting install path to "
[12] move       5   0      
[13] concat     4   4   5  
[14] call       1   4   1  
[15] getupval   1   0        ; instState
[16] settable   1   258 0    ; "InstallPath"
[17] return     0   1      
; end of function


; function [46] definition (level 4)
; 1 upvalues, 1 params, 4 stacks
.function  1 1 0 4
.local  "tagId"  ; 0
.upvalue  "instState"  ; 0
.const  "TagRemoved"  ; 0
[1] getupval   1   0        ; instState
[2] self       1   1   250  ; "TagRemoved"
[3] move       3   0      
[4] tailcall   1   3   0  
[5] return     1   0      
[6] return     0   1      
; end of function


; function [47] definition (level 4)
; 2 upvalues, 0 params, 8 stacks
.function  2 0 0 8
.local  "compSet"  ; 0
.local  "s"  ; 1
.local  "err"  ; 2
.upvalue  "slideState"  ; 0
.upvalue  "instState"  ; 1
.const  "kill"  ; 0
.const  "ExitCode"  ; 1
.const  "Complete"  ; 2
.const  "uiInstance"  ; 3
.const  "data"  ; 4
.const  "slidesh"  ; 5
.const  "coroutine"  ; 6
.const  "status"  ; 7
.const  "dead"  ; 8
.const  "resume"  ; 9
.const  "pollthread"  ; 10
.const  "assert"  ; 11
.const  "io"  ; 12
.const  "write"  ; 13
.const  "\n"  ; 14
.const  "os"  ; 15
.const  "date"  ; 16
.const  "%c "  ; 17
.const  "Exit Code: "  ; 18
.const  "tostring"  ; 19
[01] getupval   0   0        ; slideState
[02] eq         0   0   250  ; "kill", to [4] if true
[03] jmp        4            ; to [8]
[04] getupval   0   1        ; instState
[05] self       0   0   251  ; "ExitCode"
[06] tailcall   0   2   0  
[07] return     0   0      
[08] loadk      0   2        ; "Complete"
[09] setupval   0   0        ; slideState
[10] getglobal  0   3        ; uiInstance
[11] gettable   0   0   254  ; "data"
[12] gettable   0   0   255  ; "slidesh"
[13] jmp        13           ; to [27]
[14] getglobal  1   6        ; coroutine
[15] gettable   1   1   259  ; "resume"
[16] getglobal  2   3        ; uiInstance
[17] gettable   2   2   260  ; "pollthread"
[18] call       1   2   1  
[19] getglobal  1   6        ; coroutine
[20] gettable   1   1   259  ; "resume"
[21] move       2   0      
[22] call       1   2   3  
[23] getglobal  3   11       ; assert
[24] move       4   1      
[25] move       5   2      
[26] call       3   3   1  
[27] getupval   1   0        ; slideState
[28] eq         0   1   252  ; "Complete", to [30] if true
[29] jmp        6            ; to [36]
[30] getglobal  1   6        ; coroutine
[31] gettable   1   1   257  ; "status"
[32] move       2   0      
[33] call       1   2   2  
[34] eq         0   1   258  ; "dead", to [36] if true
[35] jmp        -22          ; to [14]
[36] getglobal  1   12       ; io
[37] gettable   1   1   263  ; "write"
[38] loadk      2   14       ; "\n"
[39] getglobal  3   15       ; os
[40] gettable   3   3   266  ; "date"
[41] loadk      4   17       ; "%c "
[42] call       3   2   2  
[43] loadk      4   18       ; "Exit Code: "
[44] getglobal  5   19       ; tostring
[45] getupval   6   1        ; instState
[46] self       6   6   251  ; "ExitCode"
[47] call       6   2   0  
[48] call       5   0   0  
[49] call       1   0   1  
[50] getupval   1   1        ; instState
[51] self       1   1   251  ; "ExitCode"
[52] tailcall   1   2   0  
[53] return     1   0      
[54] return     0   1      
; end of function


; function [48] definition (level 4)
; 1 upvalues, 0 params, 6 stacks
.function  1 0 0 6
.local  "compSet"  ; 0
.local  "s"  ; 1
.local  "err"  ; 2
.upvalue  "slideState"  ; 0
.const  "kill"  ; 0
.const  "uiInstance"  ; 1
.const  "data"  ; 2
.const  "slidesh"  ; 3
.const  "Begin"  ; 4
.const  "coroutine"  ; 5
.const  "resume"  ; 6
.const  "pollthread"  ; 7
.const  "assert"  ; 8
.const  "wndClose"  ; 9
.const  "g_installed"  ; 10
[01] getupval   0   0        ; slideState
[02] eq         0   0   250  ; "kill", to [4] if true
[03] jmp        1            ; to [5]
[04] return     0   1      
[05] getglobal  0   1        ; uiInstance
[06] gettable   0   0   252  ; "data"
[07] gettable   0   0   253  ; "slidesh"
[08] jmp        19           ; to [28]
[09] getglobal  1   5        ; coroutine
[10] gettable   1   1   256  ; "resume"
[11] getglobal  2   1        ; uiInstance
[12] gettable   2   2   257  ; "pollthread"
[13] call       1   2   1  
[14] getglobal  1   5        ; coroutine
[15] gettable   1   1   256  ; "resume"
[16] move       2   0      
[17] call       1   2   3  
[18] getglobal  3   8        ; assert
[19] move       4   1      
[20] move       5   2      
[21] call       3   3   1  
[22] eq         0   2   259  ; "wndClose", to [24] if true
[23] jmp        4            ; to [28]
[24] getglobal  3   8        ; assert
[25] getglobal  4   10       ; g_installed
[26] move       5   2      
[27] call       3   3   1  
[28] getupval   1   0        ; slideState
[29] eq         1   1   254  ; "Begin", to [31] if false
[30] jmp        -22          ; to [9]
[31] return     0   1      
; end of function


; function [49] definition (level 4)
; 3 upvalues, 0 params, 6 stacks
.function  3 0 0 6
.local  "compSet"  ; 0
.local  "s"  ; 1
.local  "err"  ; 2
.upvalue  "instState"  ; 0
.upvalue  "slideState"  ; 1
.upvalue  "Slideshow"  ; 2
.const  "Reset"  ; 0
.const  "uiInstance"  ; 1
.const  "ShowSystemCloseButton"  ; 2
.const  "Exception"  ; 3
.const  "coroutine"  ; 4
.const  "create"  ; 5
.const  "resume"  ; 6
.const  "assert"  ; 7
[01] getupval   0   0        ; instState
[02] self       0   0   250  ; "Reset"
[03] call       0   2   1  
[04] getglobal  0   1        ; uiInstance
[05] gettable   0   0   252  ; "ShowSystemCloseButton"
[06] loadbool   1   0   0    ; false
[07] call       0   2   1  
[08] loadk      0   3        ; "Exception"
[09] setupval   0   1        ; slideState
[10] getglobal  0   4        ; coroutine
[11] gettable   0   0   255  ; "create"
[12] getupval   1   2        ; Slideshow
[13] call       0   2   2  
[14] jmp        8            ; to [23]
[15] getglobal  1   4        ; coroutine
[16] gettable   1   1   256  ; "resume"
[17] move       2   0      
[18] call       1   2   3  
[19] getglobal  3   7        ; assert
[20] move       4   1      
[21] move       5   2      
[22] call       3   3   1  
[23] getupval   1   1        ; slideState
[24] eq         1   1   253  ; "Exception", to [26] if false
[25] jmp        -11          ; to [15]
[26] return     0   1      
; end of function


; function [50] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
.const  "uiInstance"  ; 0
.const  "mainDlg"  ; 1
.const  "Quit"  ; 2
[1] getglobal  0   0        ; uiInstance
[2] gettable   0   0   251  ; "mainDlg"
[3] self       0   0   252  ; "Quit"
[4] call       0   2   1  
[5] return     0   1      
; end of function


; function [51] definition (level 4)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 0 3
.const  "uiInstance"  ; 0
.const  "mainDlg"  ; 1
.const  "Visible"  ; 2
[1] getglobal  0   0        ; uiInstance
[2] gettable   0   0   251  ; "mainDlg"
[3] self       0   0   252  ; "Visible"
[4] loadbool   2   1   0    ; true
[5] call       0   3   1  
[6] return     0   1      
; end of function


; function [52] definition (level 4)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 0 3
.const  "uiInstance"  ; 0
.const  "mainDlg"  ; 1
.const  "Visible"  ; 2
[1] getglobal  0   0        ; uiInstance
[2] gettable   0   0   251  ; "mainDlg"
[3] self       0   0   252  ; "Visible"
[4] loadbool   2   0   0    ; false
[5] call       0   3   1  
[6] return     0   1      
; end of function


; function [53] definition (level 4)
; 0 upvalues, 1 params, 9 stacks
.function  0 1 0 9
.local  "resourceId"  ; 0
.local  "play"  ; 1
.local  "s"  ; 2
.local  "err"  ; 3
.const  "pcall"  ; 0
.const  "io"  ; 1
.const  "write"  ; 2
.const  "\n"  ; 3
.const  "os"  ; 4
.const  "date"  ; 5
.const  "%c "  ; 6
.const  "PlayRASound: err = "  ; 7
.const  "nil"  ; 8

; function [0] definition (level 5)
; 1 upvalues, 0 params, 3 stacks
.function  1 0 0 3
.upvalue  "resourceId"  ; 0
.const  "uiInstance"  ; 0
.const  "mainDlg"  ; 1
.const  "PlayRASound"  ; 2
[1] getglobal  0   0        ; uiInstance
[2] gettable   0   0   251  ; "mainDlg"
[3] self       0   0   252  ; "PlayRASound"
[4] getupval   2   0        ; resourceId
[5] call       0   3   1  
[6] return     0   1      
; end of function

[01] closure    1   0        ; 1 upvalues
[02] move       0   0      
[03] getglobal  2   0        ; pcall
[04] move       3   1      
[05] call       2   2   3  
[06] test       2   2   1    ; to [8] if false
[07] jmp        13           ; to [21]
[08] getglobal  4   1        ; io
[09] gettable   4   4   252  ; "write"
[10] loadk      5   3        ; "\n"
[11] getglobal  6   4        ; os
[12] gettable   6   6   255  ; "date"
[13] loadk      7   6        ; "%c "
[14] call       6   2   2  
[15] loadk      7   7        ; "PlayRASound: err = "
[16] test       8   3   1    ; to [18] if false
[17] jmp        1            ; to [19]
[18] loadk      8   8        ; "nil"
[19] concat     7   7   8  
[20] call       4   4   1  
[21] return     0   1      
; end of function


; function [54] definition (level 4)
; 0 upvalues, 3 params, 8 stacks
.function  0 3 0 8
.local  "gameid"  ; 0
.local  "tps"  ; 1
.local  "gamename"  ; 2
.const  "uiInstance"  ; 0
.const  "mainDlg"  ; 1
.const  "SendQDownloadMsg"  ; 2
[1] getglobal  3   0        ; uiInstance
[2] gettable   3   3   251  ; "mainDlg"
[3] self       3   3   252  ; "SendQDownloadMsg"
[4] move       5   0      
[5] move       6   1      
[6] move       7   2      
[7] call       3   5   1  
[8] return     0   1      
; end of function


; function [55] definition (level 4)
; 1 upvalues, 0 params, 3 stacks
.function  1 0 0 3
.upvalue  "Slideshow"  ; 0
.const  "coroutine"  ; 0
.const  "status"  ; 1
.const  "uiInstance"  ; 2
.const  "data"  ; 3
.const  "slidesh"  ; 4
.const  "dead"  ; 5
.const  "create"  ; 6
[01] getglobal  0   0        ; coroutine
[02] gettable   0   0   251  ; "status"
[03] getglobal  1   2        ; uiInstance
[04] gettable   1   1   253  ; "data"
[05] gettable   1   1   254  ; "slidesh"
[06] call       0   2   2  
[07] eq         0   0   255  ; "dead", to [9] if true
[08] jmp        7            ; to [16]
[09] getglobal  0   2        ; uiInstance
[10] gettable   0   0   253  ; "data"
[11] getglobal  1   0        ; coroutine
[12] gettable   1   1   256  ; "create"
[13] getupval   2   0        ; Slideshow
[14] call       1   2   2  
[15] settable   0   254 1    ; "slidesh"
[16] return     0   1      
; end of function


; function [56] definition (level 4)
; 2 upvalues, 3 params, 17 stacks
.function  2 3 0 17
.local  "ogmid"  ; 0
.local  "ogmport"  ; 1
.local  "data"  ; 2
.local  "http"  ; 3
.local  "urlEncode"  ; 4
.local  "proxy"  ; 5
.local  "progress"  ; 6
.local  "message"  ; 7
.local  "src"  ; 8
.local  "requestParams"  ; 9
.local  "s"  ; 10
.local  "ret"  ; 11
.local  "code"  ; 12
.upvalue  "win32"  ; 0
.upvalue  "ProgressMessage"  ; 1
.const  "require"  ; 0
.const  "socket.http"  ; 1
.const  "socket.url"  ; 2
.const  "GetProxy"  ; 3
.const  "pbarPayloadBytes"  ; 4
.const  "pbarPayloadTotalBytes"  ; 5
.const  100  ; 6
.const  "/v1/postSharedMessage.json?public=1&queue="  ; 7
.const  "tostring"  ; 8
.const  "&data_progress="  ; 9
.const  "string"  ; 10
.const  "format"  ; 11
.const  "%.2f"  ; 12
.const  "&data_status="  ; 13
.const  "escape"  ; 14
.const  "statusText"  ; 15
.const  "currentPayload"  ; 16
.const  "totalPayloads"  ; 17
.const  "&data_component_count="  ; 18
.const  "&data_component_index="  ; 19
.const  "http://127.0.0.1:"  ; 20
.const  "url"  ; 21
.const  "sink"  ; 22
.const  "Sink"  ; 23
.const  "type"  ; 24
.const  ""  ; 25
.const  "io"  ; 26
.const  "write"  ; 27
.const  "\n"  ; 28
.const  "os"  ; 29
.const  "date"  ; 30
.const  "%c "  ; 31
.const  "Using proxy "  ; 32
.const  "proxy"  ; 33
.const  "\n ui.sendProgressToOgm:\n"  ; 34
.const  "pcall"  ; 35
.const  "request"  ; 36
[01] getglobal  3   0        ; require
[02] loadk      4   1        ; "socket.http"
[03] call       3   2   2  
[04] getglobal  4   0        ; require
[05] loadk      5   2        ; "socket.url"
[06] call       4   2   2  
[07] getupval   5   0        ; win32
[08] gettable   5   5   253  ; "GetProxy"
[09] call       5   1   2  
[10] gettable   6   2   254  ; "pbarPayloadBytes"
[11] gettable   7   2   255  ; "pbarPayloadTotalBytes"
[12] div        6   6   7  
[13] mul        6   6   256  ; 100
[14] loadk      7   7        ; "/v1/postSharedMessage.json?public=1&queue="
[15] getglobal  8   8        ; tostring
[16] move       9   0      
[17] call       8   2   2  
[18] loadk      9   9        ; "&data_progress="
[19] getglobal  10  10       ; string
[20] gettable   10  10  261  ; "format"
[21] loadk      11  12       ; "%.2f"
[22] move       12  6      
[23] call       10  3   2  
[24] loadk      11  13       ; "&data_status="
[25] gettable   12  4   264  ; "escape"
[26] getglobal  13  10       ; string
[27] gettable   13  13  261  ; "format"
[28] gettable   14  2   265  ; "statusText"
[29] gettable   15  2   266  ; "currentPayload"
[30] gettable   16  2   267  ; "totalPayloads"
[31] call       13  4   0  
[32] call       12  0   2  
[33] loadk      13  18       ; "&data_component_count="
[34] gettable   14  2   267  ; "totalPayloads"
[35] loadk      15  19       ; "&data_component_index="
[36] gettable   16  2   266  ; "currentPayload"
[37] concat     7   7   16 
[38] loadk      8   20       ; "http://127.0.0.1:"
[39] getglobal  9   8        ; tostring
[40] move       10  1      
[41] call       9   2   2  
[42] move       10  7      
[43] concat     8   8   10 
[44] newtable   9   0   2    ; array=0, hash=4
[45] settable   9   271 8    ; "url"
[46] getupval   10  1        ; ProgressMessage
[47] gettable   10  10  273  ; "Sink"
[48] settable   9   272 10   ; "sink"
[49] getglobal  10  24       ; type
[50] move       11  5      
[51] call       10  2   2  
[52] eq         0   260 10   ; "string", to [54] if true
[53] jmp        15           ; to [69]
[54] eq         1   5   275  ; "", to [56] if false
[55] jmp        13           ; to [69]
[56] getglobal  10  26       ; io
[57] gettable   10  10  277  ; "write"
[58] loadk      11  28       ; "\n"
[59] getglobal  12  29       ; os
[60] gettable   12  12  280  ; "date"
[61] loadk      13  31       ; "%c "
[62] call       12  2   2  
[63] loadk      13  32       ; "Using proxy "
[64] getglobal  14  8        ; tostring
[65] move       15  5      
[66] call       14  2   0  
[67] call       10  0   1  
[68] settable   9   283 5    ; "proxy"
[69] getglobal  10  26       ; io
[70] gettable   10  10  277  ; "write"
[71] loadk      11  34       ; "\n ui.sendProgressToOgm:\n"
[72] move       12  8      
[73] call       10  3   1  
[74] getglobal  10  35       ; pcall
[75] gettable   11  3   286  ; "request"
[76] move       12  9      
[77] call       10  3   4  
[78] return     0   1      
; end of function

[001] loadbool   0   0   0    ; false
[002] loadnil    1   1      
[003] loadk      2   0        ; 1
[004] getglobal  3   1        ; ErrorHandler
[005] call       3   1   2  
[006] setupval   3   0        ; errHandler
[007] closure    3   0        ; 2 upvalues
[008] getupval   0   1        ; slideState
[009] getupval   0   2        ; instState
[010] closure    4   1        ; 2 upvalues
[011] move       0   4      
[012] getupval   0   1        ; slideState
[013] newtable   5   0   0    ; array=0, hash=0
[014] closure    6   2        ; 1 upvalues
[015] move       0   5      
[016] closure    7   3        ; 7 upvalues
[017] move       0   1      
[018] move       0   2      
[019] move       0   6      
[020] getupval   0   2        ; instState
[021] move       0   0      
[022] move       0   3      
[023] getupval   0   1        ; slideState
[024] closure    8   4        ; 2 upvalues
[025] move       0   0      
[026] move       0   3      
[027] closure    9   5        ; 1 upvalues
[028] getupval   0   2        ; instState
[029] closure    10  6        ; 1 upvalues
[030] getupval   0   2        ; instState
[031] closure    11  7        ; 0 upvalues
[032] closure    12  8        ; 2 upvalues
[033] getupval   0   1        ; slideState
[034] getupval   0   2        ; instState
[035] closure    13  9        ; 0 upvalues
[036] closure    14  10       ; 0 upvalues
[037] closure    15  11       ; 0 upvalues
[038] closure    16  12       ; 0 upvalues
[039] closure    17  13       ; 8 upvalues
[040] getupval   0   2        ; instState
[041] move       0   11     
[042] move       0   13     
[043] move       0   15     
[044] move       0   14     
[045] move       0   16     
[046] move       0   8      
[047] move       0   12     
[048] getglobal  18  2        ; uiInstance
[049] test       18  18  1    ; to [51] if false
[050] jmp        252          ; to [303]
[051] getglobal  18  3        ; io
[052] gettable   18  18  254  ; "write"
[053] loadk      19  5        ; "\n"
[054] getglobal  20  6        ; os
[055] gettable   20  20  257  ; "date"
[056] loadk      21  8        ; "%c "
[057] call       20  2   2  
[058] loadk      21  9        ; "Creating instance of InstallerUI"
[059] call       18  4   1  
[060] getglobal  18  10       ; ConstTable
[061] call       18  1   2  
[062] setglobal  18  2        ; uiInstance
[063] getglobal  18  2        ; uiInstance
[064] getglobal  19  12       ; luacom
[065] gettable   19  19  263  ; "CreateObject"
[066] loadk      20  14       ; "InstallerDlg.InstallDlgCtl"
[067] call       19  2   2  
[068] settable   18  261 19   ; "mainDlg"
[069] getglobal  18  15       ; assert
[070] getglobal  19  2        ; uiInstance
[071] gettable   19  19  261  ; "mainDlg"
[072] loadk      20  16       ; "comError"
[073] call       18  3   1  
[074] getglobal  18  2        ; uiInstance
[075] newtable   19  0   0    ; array=0, hash=0
[076] settable   18  267 19   ; "ctlEvents"
[077] getglobal  18  2        ; uiInstance
[078] gettable   18  18  267  ; "ctlEvents"
[079] settable   18  268 10   ; "OnChooseFolder"
[080] getglobal  18  2        ; uiInstance
[081] gettable   18  18  267  ; "ctlEvents"
[082] settable   18  269 9    ; "OnProcess"
[083] getglobal  18  12       ; luacom
[084] gettable   18  18  271  ; "Connect"
[085] getupval   19  2        ; instState
[086] getglobal  20  2        ; uiInstance
[087] gettable   20  20  267  ; "ctlEvents"
[088] call       18  3   2  
[089] setglobal  18  20       ; res
[090] getglobal  18  15       ; assert
[091] getglobal  19  20       ; res
[092] loadk      20  16       ; "comError"
[093] call       18  3   1  
[094] getglobal  18  2        ; uiInstance
[095] newtable   19  0   0    ; array=0, hash=0
[096] settable   18  272 19   ; "data"
[097] getglobal  18  2        ; uiInstance
[098] gettable   18  18  272  ; "data"
[099] loadbool   19  0   0    ; false
[100] settable   18  273 19   ; "pbarDisplayProgress"
[101] getglobal  18  2        ; uiInstance
[102] gettable   18  18  272  ; "data"
[103] settable   18  274 275  ; "pbarPayloadTotalBytes" 0
[104] getglobal  18  2        ; uiInstance
[105] gettable   18  18  272  ; "data"
[106] settable   18  276 275  ; "pbarPayloadBytes" 0
[107] getglobal  18  2        ; uiInstance
[108] gettable   18  18  272  ; "data"
[109] settable   18  277 275  ; "progressGranularity" 0
[110] getglobal  18  2        ; uiInstance
[111] gettable   18  18  272  ; "data"
[112] settable   18  278 275  ; "totalProgress" 0
[113] getglobal  18  2        ; uiInstance
[114] gettable   18  18  272  ; "data"
[115] loadbool   19  1   0    ; true
[116] settable   18  279 19   ; "jsEnabled"
[117] getglobal  18  2        ; uiInstance
[118] gettable   18  18  272  ; "data"
[119] settable   18  280 281  ; "statusText" ""
[120] getglobal  18  2        ; uiInstance
[121] gettable   18  18  272  ; "data"
[122] settable   18  282 275  ; "lastUpdateTime" 0
[123] getglobal  18  2        ; uiInstance
[124] gettable   18  18  272  ; "data"
[125] settable   18  283 275  ; "currentPayload" 0
[126] getglobal  18  2        ; uiInstance
[127] gettable   18  18  272  ; "data"
[128] settable   18  284 275  ; "totalPayloads" 0
[129] getglobal  18  2        ; uiInstance
[130] gettable   18  18  272  ; "data"
[131] settable   18  285 275  ; "bytesDownloaded" 0
[132] getglobal  18  2        ; uiInstance
[133] gettable   18  18  272  ; "data"
[134] settable   18  286 275  ; "totalBytes" 0
[135] getglobal  18  2        ; uiInstance
[136] gettable   18  18  272  ; "data"
[137] settable   18  287 281  ; "oldStatusText" ""
[138] getglobal  18  2        ; uiInstance
[139] gettable   18  18  272  ; "data"
[140] settable   18  288 275  ; "updateState" 0
[141] getglobal  18  2        ; uiInstance
[142] gettable   18  18  272  ; "data"
[143] loadbool   19  0   0    ; false
[144] settable   18  289 19   ; "queueEnabled"
[145] getglobal  18  2        ; uiInstance
[146] gettable   18  18  272  ; "data"
[147] getglobal  19  41       ; coroutine
[148] gettable   19  19  292  ; "create"
[149] move       20  4      
[150] call       19  2   2  
[151] settable   18  290 19   ; "slidesh"
[152] getglobal  18  2        ; uiInstance
[153] getglobal  19  41       ; coroutine
[154] gettable   19  19  292  ; "create"
[155] move       20  17     
[156] call       19  2   2  
[157] settable   18  293 19   ; "pollthread"
[158] getglobal  18  2        ; uiInstance
[159] closure    19  14       ; 0 upvalues
[160] settable   18  294 19   ; "Create"
[161] getglobal  18  2        ; uiInstance
[162] closure    19  15       ; 0 upvalues
[163] settable   18  295 19   ; "SetCandyOptions"
[164] getglobal  18  2        ; uiInstance
[165] closure    19  16       ; 2 upvalues
[166] getupval   0   3        ; win32
[167] move       0   7      
[168] settable   18  296 19   ; "SetDialogOptions"
[169] getglobal  18  2        ; uiInstance
[170] closure    19  17       ; 0 upvalues
[171] settable   18  297 19   ; "EnableQueue"
[172] getglobal  18  2        ; uiInstance
[173] closure    19  18       ; 0 upvalues
[174] settable   18  298 19   ; "SetConditionEval"
[175] getglobal  18  2        ; uiInstance
[176] closure    19  19       ; 0 upvalues
[177] settable   18  299 19   ; "SetProcessAuxTags"
[178] getglobal  18  2        ; uiInstance
[179] closure    19  20       ; 0 upvalues
[180] settable   18  300 19   ; "YesNoDialog"
[181] getglobal  18  2        ; uiInstance
[182] closure    19  21       ; 0 upvalues
[183] settable   18  301 19   ; "RetryCancelDialog"
[184] getglobal  18  2        ; uiInstance
[185] closure    19  22       ; 0 upvalues
[186] settable   18  302 19   ; "ErrorDialog"
[187] getglobal  18  2        ; uiInstance
[188] closure    19  23       ; 0 upvalues
[189] settable   18  303 19   ; "WarningDialog"
[190] getglobal  18  2        ; uiInstance
[191] closure    19  24       ; 1 upvalues
[192] getupval   0   4        ; uistate
[193] settable   18  304 19   ; "Navigate"
[194] getglobal  18  2        ; uiInstance
[195] closure    19  25       ; 1 upvalues
[196] getupval   0   4        ; uistate
[197] settable   18  305 19   ; "CurrentUrl"
[198] getglobal  18  2        ; uiInstance
[199] closure    19  26       ; 0 upvalues
[200] settable   18  306 19   ; "ParsePairs"
[201] getglobal  18  2        ; uiInstance
[202] closure    19  27       ; 0 upvalues
[203] settable   18  307 19   ; "Process"
[204] getglobal  18  2        ; uiInstance
[205] closure    19  28       ; 0 upvalues
[206] settable   18  308 19   ; "InitializeProgress"
[207] getglobal  18  2        ; uiInstance
[208] closure    19  29       ; 0 upvalues
[209] settable   18  309 19   ; "UpdateProgress"
[210] getglobal  18  2        ; uiInstance
[211] closure    19  30       ; 0 upvalues
[212] settable   18  310 19   ; "NotifyActive"
[213] getglobal  18  2        ; uiInstance
[214] closure    19  31       ; 0 upvalues
[215] settable   18  311 19   ; "NotifyComplete"
[216] getglobal  18  2        ; uiInstance
[217] closure    19  32       ; 0 upvalues
[218] settable   18  312 19   ; "NotifyAddQueue"
[219] getglobal  18  2        ; uiInstance
[220] closure    19  33       ; 0 upvalues
[221] settable   18  313 19   ; "IncProgressBar"
[222] getglobal  18  2        ; uiInstance
[223] closure    19  34       ; 0 upvalues
[224] settable   18  314 19   ; "SetCurrentPayload"
[225] getglobal  18  2        ; uiInstance
[226] closure    19  35       ; 0 upvalues
[227] settable   18  315 19   ; "SetTotalPayloads"
[228] getglobal  18  2        ; uiInstance
[229] closure    19  36       ; 0 upvalues
[230] settable   18  316 19   ; "SetTotalBundleSize"
[231] getglobal  18  2        ; uiInstance
[232] closure    19  37       ; 0 upvalues
[233] settable   18  317 19   ; "SetProgressGranularity"
[234] getglobal  18  2        ; uiInstance
[235] closure    19  38       ; 0 upvalues
[236] settable   18  318 19   ; "ResetProgress"
[237] getglobal  18  2        ; uiInstance
[238] closure    19  39       ; 0 upvalues
[239] settable   18  319 19   ; "SetStatusText"
[240] getglobal  18  2        ; uiInstance
[241] closure    19  40       ; 0 upvalues
[242] settable   18  320 19   ; "ProgressToEnd"
[243] getglobal  18  2        ; uiInstance
[244] closure    19  41       ; 0 upvalues
[245] settable   18  321 19   ; "ShowSystemCloseButton"
[246] getglobal  18  2        ; uiInstance
[247] closure    19  42       ; 0 upvalues
[248] settable   18  322 19   ; "ShowSystemMinimizeButton"
[249] getglobal  18  2        ; uiInstance
[250] closure    19  43       ; 0 upvalues
[251] settable   18  323 19   ; "WaitOnClose"
[252] getglobal  18  2        ; uiInstance
[253] closure    19  44       ; 1 upvalues
[254] getupval   0   2        ; instState
[255] settable   18  324 19   ; "GetInstallPath"
[256] getglobal  18  2        ; uiInstance
[257] closure    19  45       ; 1 upvalues
[258] getupval   0   2        ; instState
[259] settable   18  325 19   ; "PutInstallPath"
[260] getglobal  18  2        ; uiInstance
[261] closure    19  46       ; 1 upvalues
[262] getupval   0   2        ; instState
[263] settable   18  326 19   ; "IsTagRemoved"
[264] getglobal  18  2        ; uiInstance
[265] closure    19  47       ; 2 upvalues
[266] getupval   0   1        ; slideState
[267] getupval   0   2        ; instState
[268] settable   18  327 19   ; "SetComplete"
[269] getglobal  18  2        ; uiInstance
[270] closure    19  48       ; 1 upvalues
[271] getupval   0   1        ; slideState
[272] settable   18  328 19   ; "InitialSlides"
[273] getglobal  18  2        ; uiInstance
[274] closure    19  49       ; 3 upvalues
[275] getupval   0   2        ; instState
[276] getupval   0   1        ; slideState
[277] move       0   4      
[278] settable   18  329 19   ; "ExceptionSlides"
[279] getglobal  18  2        ; uiInstance
[280] closure    19  50       ; 0 upvalues
[281] settable   18  330 19   ; "Destroy"
[282] getglobal  18  2        ; uiInstance
[283] closure    19  51       ; 0 upvalues
[284] settable   18  331 19   ; "Show"
[285] getglobal  18  2        ; uiInstance
[286] closure    19  52       ; 0 upvalues
[287] settable   18  332 19   ; "Hide"
[288] getglobal  18  2        ; uiInstance
[289] closure    19  53       ; 0 upvalues
[290] settable   18  333 19   ; "PlayRASound"
[291] getglobal  18  2        ; uiInstance
[292] closure    19  54       ; 0 upvalues
[293] settable   18  334 19   ; "SendQDownloadMsg"
[294] getglobal  18  2        ; uiInstance
[295] closure    19  55       ; 1 upvalues
[296] move       0   4      
[297] settable   18  335 19   ; "RestartUIThread"
[298] getglobal  18  2        ; uiInstance
[299] closure    19  56       ; 2 upvalues
[300] getupval   0   3        ; win32
[301] getupval   0   5        ; ProgressMessage
[302] settable   18  336 19   ; "sendProgressToOgm"
[303] getglobal  18  2        ; uiInstance
[304] return     18  2      
[305] return     0   1      
; end of function


; function [3] definition (level 3)
; 2 upvalues, 0 params, 4 stacks
.function  2 0 0 4
.local  "EmptyCoroutine"  ; 0
.upvalue  "slideState"  ; 0
.upvalue  "instState"  ; 1
.const  "uiInstance"  ; 0
.const  "ConstTable"  ; 1
.const  "data"  ; 2
.const  "events"  ; 3
.const  "slides"  ; 4
.const  "slidesh"  ; 5
.const  "coroutine"  ; 6
.const  "create"  ; 7
.const  "pollthread"  ; 8
.const  "RestartUIThread"  ; 9
.const  "Create"  ; 10
.const  "SetDialogOptions"  ; 11
.const  "EnableQueue"  ; 12
.const  "SetProcessAuxTags"  ; 13
.const  "SetConditionEval"  ; 14
.const  "SetEventEval"  ; 15
.const  "YesNoDialog"  ; 16
.const  "RetryCancelDialog"  ; 17
.const  "ErrorDialog"  ; 18
.const  "WarningDialog"  ; 19
.const  "Navigate"  ; 20
.const  "CurrentUrl"  ; 21
.const  "ParsePairs"  ; 22
.const  "Process"  ; 23
.const  "IncProgressBar"  ; 24
.const  "SetProgressGranularity"  ; 25
.const  "SetStatusText"  ; 26
.const  "ProgressToEnd"  ; 27
.const  "WaitOnClose"  ; 28
.const  "GetInstallPath"  ; 29
.const  "IsTagRemoved"  ; 30
.const  "SetBegin"  ; 31
.const  "SetComplete"  ; 32
.const  "ExceptionSlides"  ; 33
.const  "Destroy"  ; 34
.const  "Show"  ; 35
.const  "Hide"  ; 36
.const  "ShowSystemCloseButton"  ; 37
.const  "ShowSystemMinimizeButton"  ; 38
.const  "PlayRASound"  ; 39
.const  "InitialSlides"  ; 40
.const  "PutInstallPath"  ; 41
.const  "InitializeProgress"  ; 42
.const  "UpdateProgress"  ; 43
.const  "SetCurrentPayload"  ; 44
.const  "SetTotalPayloads"  ; 45
.const  "SetTotalBundleSize"  ; 46
.const  "NotifyActive"  ; 47
.const  "NotifyComplete"  ; 48
.const  "NotifyAddQueue"  ; 49
.const  "SendQDownloadMsg"  ; 50
.const  "ResetProgress"  ; 51
.const  "SetCandyOptions"  ; 52
.const  "sendProgressToOgm"  ; 53

; function [0] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
.const  1  ; 0
.const  "coroutine"  ; 1
.const  "yield"  ; 2
[1] jmp        3            ; to [5]
[2] getglobal  0   1        ; coroutine
[3] gettable   0   0   252  ; "yield"
[4] call       0   1   1  
[5] jmp        -4           ; to [2]
[6] return     0   1      
; end of function


; function [1] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [2] definition (level 4)
; 0 upvalues, 2 params, 2 stacks
.function  0 2 0 2
.local  "w"  ; 0
.local  "h"  ; 1
[1] return     0   1      
; end of function


; function [3] definition (level 4)
; 0 upvalues, 7 params, 7 stacks
.function  0 7 0 7
.local  "width"  ; 0
.local  "height"  ; 1
.local  "minimize"  ; 2
.local  "close"  ; 3
.local  "imgLeft"  ; 4
.local  "imgRight"  ; 5
.local  "url"  ; 6
[1] return     0   1      
; end of function


; function [4] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "url"  ; 0
[1] return     0   1      
; end of function


; function [5] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "fun"  ; 0
[1] return     0   1      
; end of function


; function [6] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "fun"  ; 0
[1] return     0   1      
; end of function


; function [7] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "fun"  ; 0
[1] return     0   1      
; end of function


; function [8] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "resourceId"  ; 0
[1] loadbool   1   1   0    ; true
[2] return     1   2      
[3] return     0   1      
; end of function


; function [9] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "resourceId"  ; 0
[1] return     0   1      
; end of function


; function [10] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "resourceId"  ; 0
[1] return     0   1      
; end of function


; function [11] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "resourceId"  ; 0
[1] return     0   1      
; end of function


; function [12] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "url"  ; 0
[1] return     0   1      
; end of function


; function [13] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] loadnil    0   0      
[2] return     0   2      
[3] return     0   1      
; end of function


; function [14] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "var"  ; 0
[1] return     0   1      
; end of function


; function [15] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "var"  ; 0
[1] return     0   1      
; end of function


; function [16] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "chunkSize"  ; 0
[1] return     0   1      
; end of function


; function [17] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "granularity"  ; 0
[1] return     0   1      
; end of function


; function [18] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "id"  ; 0
[1] return     0   1      
; end of function


; function [19] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [20] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [21] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "gamesRoot"  ; 0
[1] return     0   2      
[2] return     0   1      
; end of function


; function [22] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "tagId"  ; 0
[1] loadbool   1   0   0    ; false
[2] return     1   2      
[3] return     0   1      
; end of function


; function [23] definition (level 4)
; 1 upvalues, 0 params, 2 stacks
.function  1 0 0 2
.upvalue  "slideState"  ; 0
.const  "Installing"  ; 0
[1] loadk      0   0        ; "Installing"
[2] setupval   0   0        ; slideState
[3] return     0   1      
; end of function


; function [24] definition (level 4)
; 1 upvalues, 0 params, 2 stacks
.function  1 0 0 2
.upvalue  "slideState"  ; 0
.const  "Complete"  ; 0
[1] loadk      0   0        ; "Complete"
[2] setupval   0   0        ; slideState
[3] return     0   1      
; end of function


; function [25] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [26] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [27] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [28] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [29] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [30] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [31] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "resourceId"  ; 0
[1] return     0   1      
; end of function


; function [32] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [33] definition (level 4)
; 1 upvalues, 1 params, 4 stacks
.function  1 1 0 4
.local  "path"  ; 0
.upvalue  "instState"  ; 0
.const  ""  ; 0
.const  "io"  ; 1
.const  "write"  ; 2
.const  "\nSetting install path to "  ; 3
.const  "InstallPath"  ; 4
[01] test       0   0   1    ; to [3] if false
[02] jmp        1            ; to [4]
[03] loadk      0   0        ; ""
[04] getglobal  1   1        ; io
[05] gettable   1   1   252  ; "write"
[06] loadk      2   3        ; "\nSetting install path to "
[07] move       3   0      
[08] concat     2   2   3  
[09] call       1   2   1  
[10] getupval   1   0        ; instState
[11] settable   1   254 0    ; "InstallPath"
[12] return     0   1      
; end of function


; function [34] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [35] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [36] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [37] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [38] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [39] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [40] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [41] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [42] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [43] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [44] definition (level 4)
; 0 upvalues, 5 params, 5 stacks
.function  0 5 0 5
.local  "publisherName"  ; 0
.local  "sdkKey"  ; 1
.local  "sdkSecret"  ; 2
.local  "lang"  ; 3
.local  "advancedOptions"  ; 4
[1] return     0   1      
; end of function


; function [45] definition (level 4)
; 0 upvalues, 3 params, 3 stacks
.function  0 3 0 3
.local  "ogmid"  ; 0
.local  "ogmport"  ; 1
.local  "data"  ; 2
[1] return     0   1      
; end of function

[001] closure    0   0        ; 0 upvalues
[002] getglobal  1   1        ; ConstTable
[003] call       1   1   2  
[004] setglobal  1   0        ; uiInstance
[005] getglobal  1   0        ; uiInstance
[006] newtable   2   0   0    ; array=0, hash=0
[007] settable   1   252 2    ; "data"
[008] getglobal  1   0        ; uiInstance
[009] newtable   2   0   0    ; array=0, hash=0
[010] settable   1   253 2    ; "events"
[011] getglobal  1   0        ; uiInstance
[012] newtable   2   0   0    ; array=0, hash=0
[013] settable   1   254 2    ; "slides"
[014] getglobal  1   0        ; uiInstance
[015] gettable   1   1   252  ; "data"
[016] getglobal  2   6        ; coroutine
[017] gettable   2   2   257  ; "create"
[018] move       3   0      
[019] call       2   2   2  
[020] settable   1   255 2    ; "slidesh"
[021] getglobal  1   0        ; uiInstance
[022] getglobal  2   6        ; coroutine
[023] gettable   2   2   257  ; "create"
[024] move       3   0      
[025] call       2   2   2  
[026] settable   1   258 2    ; "pollthread"
[027] getglobal  1   0        ; uiInstance
[028] closure    2   1        ; 0 upvalues
[029] settable   1   259 2    ; "RestartUIThread"
[030] getglobal  1   0        ; uiInstance
[031] closure    2   2        ; 0 upvalues
[032] settable   1   260 2    ; "Create"
[033] getglobal  1   0        ; uiInstance
[034] closure    2   3        ; 0 upvalues
[035] settable   1   261 2    ; "SetDialogOptions"
[036] getglobal  1   0        ; uiInstance
[037] closure    2   4        ; 0 upvalues
[038] settable   1   262 2    ; "EnableQueue"
[039] getglobal  1   0        ; uiInstance
[040] closure    2   5        ; 0 upvalues
[041] settable   1   263 2    ; "SetProcessAuxTags"
[042] getglobal  1   0        ; uiInstance
[043] closure    2   6        ; 0 upvalues
[044] settable   1   264 2    ; "SetConditionEval"
[045] getglobal  1   0        ; uiInstance
[046] closure    2   7        ; 0 upvalues
[047] settable   1   265 2    ; "SetEventEval"
[048] getglobal  1   0        ; uiInstance
[049] closure    2   8        ; 0 upvalues
[050] settable   1   266 2    ; "YesNoDialog"
[051] getglobal  1   0        ; uiInstance
[052] closure    2   9        ; 0 upvalues
[053] settable   1   267 2    ; "RetryCancelDialog"
[054] getglobal  1   0        ; uiInstance
[055] closure    2   10       ; 0 upvalues
[056] settable   1   268 2    ; "ErrorDialog"
[057] getglobal  1   0        ; uiInstance
[058] closure    2   11       ; 0 upvalues
[059] settable   1   269 2    ; "WarningDialog"
[060] getglobal  1   0        ; uiInstance
[061] closure    2   12       ; 0 upvalues
[062] settable   1   270 2    ; "Navigate"
[063] getglobal  1   0        ; uiInstance
[064] closure    2   13       ; 0 upvalues
[065] settable   1   271 2    ; "CurrentUrl"
[066] getglobal  1   0        ; uiInstance
[067] closure    2   14       ; 0 upvalues
[068] settable   1   272 2    ; "ParsePairs"
[069] getglobal  1   0        ; uiInstance
[070] closure    2   15       ; 0 upvalues
[071] settable   1   273 2    ; "Process"
[072] getglobal  1   0        ; uiInstance
[073] closure    2   16       ; 0 upvalues
[074] settable   1   274 2    ; "IncProgressBar"
[075] getglobal  1   0        ; uiInstance
[076] closure    2   17       ; 0 upvalues
[077] settable   1   275 2    ; "SetProgressGranularity"
[078] getglobal  1   0        ; uiInstance
[079] closure    2   18       ; 0 upvalues
[080] settable   1   276 2    ; "SetStatusText"
[081] getglobal  1   0        ; uiInstance
[082] closure    2   19       ; 0 upvalues
[083] settable   1   277 2    ; "ProgressToEnd"
[084] getglobal  1   0        ; uiInstance
[085] closure    2   20       ; 0 upvalues
[086] settable   1   278 2    ; "WaitOnClose"
[087] getglobal  1   0        ; uiInstance
[088] closure    2   21       ; 0 upvalues
[089] settable   1   279 2    ; "GetInstallPath"
[090] getglobal  1   0        ; uiInstance
[091] closure    2   22       ; 0 upvalues
[092] settable   1   280 2    ; "IsTagRemoved"
[093] getglobal  1   0        ; uiInstance
[094] closure    2   23       ; 1 upvalues
[095] getupval   0   0        ; slideState
[096] settable   1   281 2    ; "SetBegin"
[097] getglobal  1   0        ; uiInstance
[098] closure    2   24       ; 1 upvalues
[099] getupval   0   0        ; slideState
[100] settable   1   282 2    ; "SetComplete"
[101] getglobal  1   0        ; uiInstance
[102] closure    2   25       ; 0 upvalues
[103] settable   1   283 2    ; "ExceptionSlides"
[104] getglobal  1   0        ; uiInstance
[105] closure    2   26       ; 0 upvalues
[106] settable   1   284 2    ; "Destroy"
[107] getglobal  1   0        ; uiInstance
[108] closure    2   27       ; 0 upvalues
[109] settable   1   285 2    ; "Show"
[110] getglobal  1   0        ; uiInstance
[111] closure    2   28       ; 0 upvalues
[112] settable   1   286 2    ; "Hide"
[113] getglobal  1   0        ; uiInstance
[114] closure    2   29       ; 0 upvalues
[115] settable   1   287 2    ; "ShowSystemCloseButton"
[116] getglobal  1   0        ; uiInstance
[117] closure    2   30       ; 0 upvalues
[118] settable   1   288 2    ; "ShowSystemMinimizeButton"
[119] getglobal  1   0        ; uiInstance
[120] closure    2   31       ; 0 upvalues
[121] settable   1   289 2    ; "PlayRASound"
[122] getglobal  1   0        ; uiInstance
[123] closure    2   32       ; 0 upvalues
[124] settable   1   290 2    ; "InitialSlides"
[125] getglobal  1   0        ; uiInstance
[126] closure    2   33       ; 1 upvalues
[127] getupval   0   1        ; instState
[128] settable   1   291 2    ; "PutInstallPath"
[129] getglobal  1   0        ; uiInstance
[130] closure    2   34       ; 0 upvalues
[131] settable   1   292 2    ; "InitializeProgress"
[132] getglobal  1   0        ; uiInstance
[133] closure    2   35       ; 0 upvalues
[134] settable   1   293 2    ; "UpdateProgress"
[135] getglobal  1   0        ; uiInstance
[136] closure    2   36       ; 0 upvalues
[137] settable   1   294 2    ; "SetCurrentPayload"
[138] getglobal  1   0        ; uiInstance
[139] closure    2   37       ; 0 upvalues
[140] settable   1   295 2    ; "SetTotalPayloads"
[141] getglobal  1   0        ; uiInstance
[142] closure    2   38       ; 0 upvalues
[143] settable   1   296 2    ; "SetTotalBundleSize"
[144] getglobal  1   0        ; uiInstance
[145] closure    2   39       ; 0 upvalues
[146] settable   1   297 2    ; "NotifyActive"
[147] getglobal  1   0        ; uiInstance
[148] closure    2   40       ; 0 upvalues
[149] settable   1   298 2    ; "NotifyComplete"
[150] getglobal  1   0        ; uiInstance
[151] closure    2   41       ; 0 upvalues
[152] settable   1   299 2    ; "NotifyAddQueue"
[153] getglobal  1   0        ; uiInstance
[154] closure    2   42       ; 0 upvalues
[155] settable   1   300 2    ; "SendQDownloadMsg"
[156] getglobal  1   0        ; uiInstance
[157] closure    2   43       ; 0 upvalues
[158] settable   1   301 2    ; "ResetProgress"
[159] getglobal  1   0        ; uiInstance
[160] closure    2   44       ; 0 upvalues
[161] settable   1   302 2    ; "SetCandyOptions"
[162] getglobal  1   0        ; uiInstance
[163] closure    2   45       ; 0 upvalues
[164] settable   1   303 2    ; "sendProgressToOgm"
[165] getglobal  1   0        ; uiInstance
[166] return     1   2      
[167] return     0   1      
; end of function

[01] getglobal  0   0        ; luacom
[02] gettable   0   0   251  ; "CreateObject"
[03] loadk      1   2        ; "RACInstaller.StateCtrl"
[04] call       0   2   2  
[05] getglobal  1   0        ; luacom
[06] gettable   1   1   251  ; "CreateObject"
[07] loadk      2   3        ; "StubbyUtil.ProcessMgr"
[08] call       1   2   2  
[09] getglobal  2   4        ; Win32Interop
[10] call       2   1   2  
[11] newtable   3   0   0    ; array=0, hash=0
[12] loadnil    4   4      
[13] loadk      5   5        ; "Begin"
[14] getglobal  6   6        ; assert
[15] test       7   0   0    ; to [17] if true
[16] jmp        1            ; to [18]
[17] move       7   1      
[18] loadk      8   7        ; "comError"
[19] call       6   3   1  
[20] closure    6   0        ; 0 upvalues
[21] setglobal  6   8        ; KeepMinimized
[22] newtable   6   0   2    ; array=0, hash=4
[23] settable   6   259 260  ; "data" nil
[24] settable   6   261 260  ; "err" nil
[25] closure    7   1        ; 1 upvalues
[26] move       0   6      
[27] settable   6   262 7    ; "Sink"
[28] closure    7   2        ; 6 upvalues
[29] move       0   4      
[30] move       0   5      
[31] move       0   0      
[32] move       0   2      
[33] move       0   3      
[34] move       0   6      
[35] setglobal  7   13       ; InstallerUI
[36] closure    7   3        ; 2 upvalues
[37] move       0   5      
[38] move       0   0      
[39] setglobal  7   14       ; NullUI
[40] return     0   1      
; end of function


; function [7] definition (level 2)
; 0 upvalues, 0 params, 4 stacks
.function  0 0 0 4
.local  "url"  ; 0
.local  "http"  ; 1
.local  "win32"  ; 2
.const  "require"  ; 0
.const  "socket"  ; 1
.const  "http"  ; 2
.const  "g_cbDownloaded"  ; 3
.const  0  ; 4
.const  "socket.url"  ; 5
.const  "socket.http"  ; 6
.const  "Win32Interop"  ; 7
.const  "DownloadMgr"  ; 8

; function [0] definition (level 3)
; 3 upvalues, 0 params, 6 stacks
.function  3 0 0 6
.local  "HEAD_BUF"  ; 0
.local  "DATA_BUF"  ; 1
.local  "MAX_LOW_LEVEL_TOS"  ; 2
.local  "members"  ; 3
.local  "Connect"  ; 4
.upvalue  "win32"  ; 0
.upvalue  "url"  ; 1
.upvalue  "http"  ; 2
.const  2048  ; 0
.const  8192  ; 1
.const  100  ; 2
.const  "ConstTable"  ; 3
.const  "TestConnection"  ; 4
.const  "PayloadSize"  ; 5
.const  "GetFile"  ; 6

; function [0] definition (level 4)
; 2 upvalues, 3 params, 9 stacks
.function  2 3 0 9
.local  "host"  ; 0
.local  "port"  ; 1
.local  "noretry"  ; 2
.local  "Recovery"  ; 3
.local  "sock"  ; 4
.local  "m"  ; 5
.upvalue  "Connect"  ; 0
.upvalue  "win32"  ; 1
.const  "assert"  ; 0
.const  "\n"  ; 1
.const  "os"  ; 2
.const  "date"  ; 3
.const  "%c "  ; 4
.const  "Nil host. Invalid Url?"  ; 5
.const  "g_error"  ; 6
.const  "failedConnect"  ; 7
.const  "recover"  ; 8
.const  "socket"  ; 9
.const  "connect"  ; 10
.const  80  ; 11
.const  "ErrorHandler"  ; 12
.const  "HandleError"  ; 13
.const  "Mutex"  ; 14
.const  "RACV2InstallerStopSplash"  ; 15
.const  "Lock"  ; 16
.const  "fatalNetwork"  ; 17

; function [0] definition (level 5)
; 4 upvalues, 0 params, 4 stacks
.function  4 0 0 4
.upvalue  "Connect"  ; 0
.upvalue  "host"  ; 1
.upvalue  "port"  ; 2
.upvalue  "noretry"  ; 3
[1] getupval   0   0        ; Connect
[2] getupval   1   1        ; host
[3] getupval   2   2        ; port
[4] getupval   3   3        ; noretry
[5] call       0   4   1  
[6] return     0   1      
; end of function

[01] getglobal  3   0        ; assert
[02] move       4   0      
[03] loadk      5   1        ; "\n"
[04] getglobal  6   2        ; os
[05] gettable   6   6   253  ; "date"
[06] loadk      7   4        ; "%c "
[07] call       6   2   2  
[08] loadk      7   5        ; "Nil host. Invalid Url?"
[09] concat     5   5   7  
[10] call       3   3   1  
[11] closure    3   0        ; 4 upvalues
[12] getupval   0   0        ; Connect
[13] move       0   0      
[14] move       0   1      
[15] move       0   2      
[16] getglobal  4   6        ; g_error
[17] gettable   4   4   257  ; "failedConnect"
[18] settable   4   258 3    ; "recover"
[19] getglobal  4   9        ; socket
[20] gettable   4   4   260  ; "connect"
[21] move       5   0      
[22] test       6   1   1    ; to [24] if false
[23] jmp        1            ; to [25]
[24] loadk      6   11       ; 80
[25] call       4   3   2  
[26] test       4   4   1    ; to [28] if false
[27] jmp        9            ; to [37]
[28] test       2   2   1    ; to [30] if false
[29] jmp        7            ; to [37]
[30] getglobal  5   12       ; ErrorHandler
[31] call       5   1   2  
[32] gettable   5   5   263  ; "HandleError"
[33] loadk      6   7        ; "failedConnect"
[34] tailcall   5   2   0  
[35] return     5   0      
[36] jmp        12           ; to [49]
[37] test       4   4   1    ; to [39] if false
[38] jmp        10           ; to [49]
[39] getupval   5   1        ; win32
[40] gettable   5   5   264  ; "Mutex"
[41] loadk      6   15       ; "RACV2InstallerStopSplash"
[42] call       5   2   2  
[43] gettable   6   5   266  ; "Lock"
[44] call       6   1   1  
[45] getglobal  6   0        ; assert
[46] loadbool   7   0   0    ; false
[47] loadk      8   17       ; "fatalNetwork"
[48] call       6   3   1  
[49] return     4   2      
[50] return     0   1      
; end of function


; function [1] definition (level 4)
; 0 upvalues, 0 params, 4 stacks
.function  0 0 0 4
.local  "s"  ; 0
.local  "err"  ; 1
.const  "pcall"  ; 0
.const  "socket"  ; 1
.const  "connect"  ; 2
.const  "logging.gameco.biz"  ; 3
.const  80  ; 4
[01] getglobal  0   0        ; pcall
[02] getglobal  1   1        ; socket
[03] gettable   1   1   252  ; "connect"
[04] loadk      2   3        ; "logging.gameco.biz"
[05] loadk      3   4        ; 80
[06] call       0   4   3  
[07] test       0   0   0    ; to [9] if true
[08] jmp        5            ; to [14]
[09] test       1   1   0    ; to [11] if true
[10] jmp        3            ; to [14]
[11] loadbool   2   1   0    ; true
[12] return     2   2      
[13] jmp        2            ; to [16]
[14] loadbool   2   0   0    ; false
[15] return     2   2      
[16] return     0   1      
; end of function


; function [2] definition (level 4)
; 4 upvalues, 2 params, 15 stacks
.function  4 2 0 15
.local  "src"  ; 0
.local  "noretry"  ; 1
.local  "status"  ; 2
.local  "size"  ; 3
.local  "parsed_url"  ; 4
.local  "sock"  ; 5
.local  "len"  ; 6
.local  "cmd"  ; 7
.local  "s"  ; 8
.local  "status"  ; 9
.local  "p"  ; 10
.local  "b"  ; 11
.local  "e"  ; 12
.upvalue  "win32"  ; 0
.upvalue  "url"  ; 1
.upvalue  "Connect"  ; 2
.upvalue  "HEAD_BUF"  ; 3
.const  "string"  ; 0
.const  "find"  ; 1
.const  "http"  ; 2
.const  "pcall"  ; 3
.const  "FileSize"  ; 4
.const  0  ; 5
.const  "parse"  ; 6
.const  "host"  ; 7
.const  "port"  ; 8
.const  "query"  ; 9
.const  "HEAD "  ; 10
.const  "path"  ; 11
.const  "?"  ; 12
.const  " HTTP/1.0\r\nHost: "  ; 13
.const  "\r\n\r\n"  ; 14
.const  "io"  ; 15
.const  "write"  ; 16
.const  "\n"  ; 17
.const  "os"  ; 18
.const  "date"  ; 19
.const  "%c "  ; 20
.const  "Sending: "  ; 21
.const  "send"  ; 22
.const  "receive"  ; 23
.const  "t-Length:"  ; 24
.const  "sub"  ; 25
.const  2  ; 26
.const  1  ; 27
.const  -1  ; 28
.const  "\r\n"  ; 29
.const  "close"  ; 30
[001] getglobal  2   0        ; string
[002] gettable   2   2   251  ; "find"
[003] move       3   0      
[004] loadk      4   2        ; "http"
[005] call       2   3   2  
[006] test       2   2   1    ; to [8] if false
[007] jmp        9            ; to [17]
[008] getglobal  2   3        ; pcall
[009] getupval   3   0        ; win32
[010] gettable   3   3   254  ; "FileSize"
[011] move       4   0      
[012] call       2   3   3  
[013] test       2   2   1    ; to [15] if false
[014] jmp        1            ; to [16]
[015] loadk      3   5        ; 0
[016] return     3   2      
[017] getupval   2   1        ; url
[018] gettable   2   2   256  ; "parse"
[019] move       3   0      
[020] call       2   2   2  
[021] getupval   3   2        ; Connect
[022] gettable   4   2   257  ; "host"
[023] gettable   5   2   258  ; "port"
[024] move       6   1      
[025] call       3   4   2  
[026] loadnil    4   5      
[027] gettable   6   2   259  ; "query"
[028] test       6   6   0    ; to [30] if true
[029] jmp        9            ; to [39]
[030] loadk      6   10       ; "HEAD "
[031] gettable   7   2   261  ; "path"
[032] loadk      8   12       ; "?"
[033] gettable   9   2   259  ; "query"
[034] loadk      10  13       ; " HTTP/1.0\r\nHost: "
[035] gettable   11  2   257  ; "host"
[036] loadk      12  14       ; "\r\n\r\n"
[037] concat     5   6   12 
[038] jmp        6            ; to [45]
[039] loadk      6   10       ; "HEAD "
[040] gettable   7   2   261  ; "path"
[041] loadk      8   13       ; " HTTP/1.0\r\nHost: "
[042] gettable   9   2   257  ; "host"
[043] loadk      10  14       ; "\r\n\r\n"
[044] concat     5   6   10 
[045] getglobal  6   15       ; io
[046] gettable   6   6   266  ; "write"
[047] loadk      7   17       ; "\n"
[048] getglobal  8   18       ; os
[049] gettable   8   8   269  ; "date"
[050] loadk      9   20       ; "%c "
[051] call       8   2   2  
[052] loadk      9   21       ; "Sending: "
[053] move       10  5      
[054] call       6   5   1  
[055] self       6   3   272  ; "send"
[056] move       8   5      
[057] call       6   3   1  
[058] self       6   3   273  ; "receive"
[059] getupval   8   3        ; HEAD_BUF
[060] call       6   3   4  
[061] test       6   6   1    ; to [63] if false
[062] jmp        2            ; to [65]
[063] test       8   8   0    ; to [65] if true
[064] jmp        34           ; to [99]
[065] getglobal  9   0        ; string
[066] gettable   9   9   251  ; "find"
[067] test       10  6   1    ; to [69] if false
[068] jmp        1            ; to [70]
[069] move       10  8      
[070] loadk      11  24       ; "t-Length:"
[071] call       9   3   3  
[072] test       10  10  1    ; to [74] if false
[073] jmp        2            ; to [76]
[074] loadk      11  5        ; 0
[075] return     11  2      
[076] getglobal  11  0        ; string
[077] gettable   11  11  275  ; "sub"
[078] test       12  6   1    ; to [80] if false
[079] jmp        1            ; to [81]
[080] move       12  8      
[081] add        13  10  276  ; 2
[082] loadk      14  28       ; -1
[083] call       11  4   2  
[084] move       4   11     
[085] getglobal  11  0        ; string
[086] gettable   11  11  251  ; "find"
[087] move       12  4      
[088] loadk      13  29       ; "\r\n"
[089] call       11  3   3  
[090] move       10  12     
[091] move       9   11     
[092] getglobal  11  0        ; string
[093] gettable   11  11  275  ; "sub"
[094] move       12  4      
[095] loadk      13  5        ; 0
[096] move       14  10     
[097] call       11  4   2  
[098] move       4   11     
[099] self       9   3   280  ; "close"
[100] call       9   2   1  
[101] test       9   4   1    ; to [103] if false
[102] jmp        1            ; to [104]
[103] loadk      9   5        ; 0
[104] return     9   2      
[105] return     0   1      
; end of function


; function [3] definition (level 4)
; 5 upvalues, 3 params, 16 stacks
.function  5 3 0 16
.local  "src"  ; 0
.local  "dest"  ; 1
.local  "callback"  ; 2
.local  "file"  ; 3
.local  "timeouts"  ; 4
.local  "Recovery"  ; 5
.local  "Step"  ; 6
.local  "Sink"  ; 7
.local  "s"  ; 8
.local  "ret"  ; 9
.local  "code"  ; 10
.upvalue  "members"  ; 0
.upvalue  "DATA_BUF"  ; 1
.upvalue  "MAX_LOW_LEVEL_TOS"  ; 2
.upvalue  "win32"  ; 3
.upvalue  "http"  ; 4
.const  0  ; 0
.const  "io"  ; 1
.const  "write"  ; 2
.const  "\n"  ; 3
.const  "os"  ; 4
.const  "date"  ; 5
.const  "%c "  ; 6
.const  "GetFile src = "  ; 7
.const  " dest = "  ; 8
.const  "g_error"  ; 9
.const  "httpError"  ; 10
.const  "recover"  ; 11
.const  "Downloading "  ; 12
.const  " TO "  ; 13
.const  "CreatePath"  ; 14
.const  "OpenDestFile"  ; 15
.const  "pcall"  ; 16
.const  "request"  ; 17
.const  "url"  ; 18
.const  "sink"  ; 19
.const  "close"  ; 20
.const  200  ; 21
.const  304  ; 22
.const  "g_extraErrorInfo"  ; 23
.const  "tostring"  ; 24
.const  ""  ; 25
.const  " "  ; 26
.const  "ErrorHandler"  ; 27
.const  "HandleError"  ; 28
.const  "assert"  ; 29
.const  "unknown"  ; 30
.const  "Completed download of "  ; 31

; function [0] definition (level 5)
; 4 upvalues, 0 params, 7 stacks
.function  4 0 0 7
.upvalue  "src"  ; 0
.upvalue  "dest"  ; 1
.upvalue  "members"  ; 2
.upvalue  "callback"  ; 3
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Recovery: "  ; 6
.const  " TO "  ; 7
.const  "GetFile"  ; 8
[01] getglobal  0   0        ; io
[02] gettable   0   0   251  ; "write"
[03] loadk      1   2        ; "\n"
[04] getglobal  2   3        ; os
[05] gettable   2   2   254  ; "date"
[06] loadk      3   5        ; "%c "
[07] call       2   2   2  
[08] loadk      3   6        ; "Recovery: "
[09] getupval   4   0        ; src
[10] loadk      5   7        ; " TO "
[11] getupval   6   1        ; dest
[12] call       0   7   1  
[13] getupval   0   2        ; members
[14] gettable   0   0   258  ; "GetFile"
[15] getupval   1   0        ; src
[16] getupval   2   1        ; dest
[17] getupval   3   3        ; callback
[18] call       0   4   1  
[19] return     0   1      
; end of function


; function [1] definition (level 5)
; 1 upvalues, 2 params, 9 stacks
.function  1 2 0 9
.local  "source"  ; 0
.local  "sink"  ; 1
.local  "chunk"  ; 2
.local  "src_err"  ; 3
.local  "bite"  ; 4
.local  "ret"  ; 5
.local  "snk_err"  ; 6
.upvalue  "DATA_BUF"  ; 0
.const  "string"  ; 0
.const  "len"  ; 1
.const  ""  ; 2
.const  "closed"  ; 3
.const  1  ; 4
[01] move       2   0      
[02] call       2   1   3  
[03] loadnil    4   4      
[04] jmp        9            ; to [14]
[05] move       5   0      
[06] call       5   1   3  
[07] move       3   6      
[08] move       4   5      
[09] move       5   2      
[10] test       6   4   1    ; to [12] if false
[11] jmp        1            ; to [13]
[12] loadk      6   2        ; ""
[13] concat     2   5   6  
[14] test       3   3   1    ; to [16] if false
[15] jmp        7            ; to [23]
[16] getglobal  5   0        ; string
[17] gettable   5   5   251  ; "len"
[18] move       6   2      
[19] call       5   2   2  
[20] getupval   6   0        ; DATA_BUF
[21] lt         1   5   6    ; to [23] if false
[22] jmp        -18          ; to [5]
[23] eq         0   3   253  ; "closed", to [25] if true
[24] jmp        1            ; to [26]
[25] loadnil    3   3      
[26] move       5   1      
[27] move       6   2      
[28] move       7   3      
[29] call       5   3   3  
[30] test       2   2   0    ; to [32] if true
[31] jmp        5            ; to [37]
[32] test       5   5   0    ; to [34] if true
[33] jmp        3            ; to [37]
[34] loadk      7   4        ; 1
[35] return     7   2      
[36] jmp        5            ; to [42]
[37] loadnil    7   7      
[38] test       8   3   1    ; to [40] if false
[39] jmp        1            ; to [41]
[40] move       8   6      
[41] return     7   3      
[42] return     0   1      
; end of function


; function [2] definition (level 5)
; 4 upvalues, 2 params, 6 stacks
.function  4 2 0 6
.local  "chunk"  ; 0
.local  "err"  ; 1
.upvalue  "timeouts"  ; 0
.upvalue  "file"  ; 1
.upvalue  "callback"  ; 2
.upvalue  "MAX_LOW_LEVEL_TOS"  ; 3
.const  "g_error"  ; 0
.const  "httpError"  ; 1
.const  "log"  ; 2
.const  "timeout"  ; 3
.const  "io"  ; 4
.const  "write"  ; 5
.const  "\n"  ; 6
.const  "os"  ; 7
.const  "date"  ; 8
.const  "%c "  ; 9
.const  "Warning, low level socket timeout"  ; 10
.const  1  ; 11
.const  "assert"  ; 12
.const  "closed"  ; 13
.const  "g_cbDownloaded"  ; 14
.const  "string"  ; 15
.const  "len"  ; 16
.const  0  ; 17
.const  2048  ; 18
[01] getglobal  2   0        ; g_error
[02] gettable   2   2   251  ; "httpError"
[03] settable   2   252 1    ; "log"
[04] eq         0   1   253  ; "timeout", to [6] if true
[05] jmp        13           ; to [19]
[06] getglobal  2   4        ; io
[07] gettable   2   2   255  ; "write"
[08] loadk      3   6        ; "\n"
[09] getglobal  4   7        ; os
[10] gettable   4   4   258  ; "date"
[11] loadk      5   9        ; "%c "
[12] call       4   2   2  
[13] loadk      5   10       ; "Warning, low level socket timeout"
[14] call       2   4   1  
[15] getupval   2   0        ; timeouts
[16] add        2   2   261  ; 1
[17] setupval   2   0        ; timeouts
[18] jmp        9            ; to [28]
[19] getglobal  2   12       ; assert
[20] test       1   1   0    ; to [22] if true
[21] jmp        3            ; to [25]
[22] eq         1   1   263  ; "closed", to [24] if false
[23] jmp        1            ; to [25]
[24] loadbool   3   0   1    ; false, to [26]
[25] loadbool   3   1   0    ; true
[26] move       4   1      
[27] call       2   3   1  
[28] test       0   0   0    ; to [30] if true
[29] jmp        19           ; to [49]
[30] getglobal  2   14       ; g_cbDownloaded
[31] getglobal  3   15       ; string
[32] gettable   3   3   266  ; "len"
[33] move       4   0      
[34] call       3   2   2  
[35] add        2   2   3  
[36] setglobal  2   14       ; g_cbDownloaded
[37] loadk      2   17       ; 0
[38] setupval   2   0        ; timeouts
[39] getupval   2   1        ; file
[40] self       2   2   255  ; "write"
[41] move       4   0      
[42] call       2   3   1  
[43] getupval   2   2        ; callback
[44] test       2   2   0    ; to [46] if true
[45] jmp        3            ; to [49]
[46] getupval   2   2        ; callback
[47] loadk      3   18       ; 2048
[48] call       2   2   1  
[49] getglobal  2   12       ; assert
[50] getupval   3   0        ; timeouts
[51] getupval   4   3        ; MAX_LOW_LEVEL_TOS
[52] lt         1   3   4    ; to [54] if false
[53] jmp        1            ; to [55]
[54] loadbool   3   0   1    ; false, to [56]
[55] loadbool   3   1   0    ; true
[56] move       4   1      
[57] call       2   3   1  
[58] loadk      2   11       ; 1
[59] return     2   2      
[60] return     0   1      
; end of function

[01] loadnil    3   3      
[02] loadk      4   0        ; 0
[03] closure    5   0        ; 4 upvalues
[04] move       0   0      
[05] move       0   1      
[06] getupval   0   0        ; members
[07] move       0   2      
[08] getglobal  6   1        ; io
[09] gettable   6   6   252  ; "write"
[10] loadk      7   3        ; "\n"
[11] getglobal  8   4        ; os
[12] gettable   8   8   255  ; "date"
[13] loadk      9   6        ; "%c "
[14] call       8   2   2  
[15] loadk      9   7        ; "GetFile src = "
[16] move       10  0      
[17] loadk      11  8        ; " dest = "
[18] move       12  1      
[19] call       6   7   1  
[20] getglobal  6   9        ; g_error
[21] gettable   6   6   260  ; "httpError"
[22] settable   6   261 5    ; "recover"
[23] closure    6   1        ; 1 upvalues
[24] getupval   0   1        ; DATA_BUF
[25] closure    7   2        ; 4 upvalues
[26] move       0   4      
[27] move       0   3      
[28] move       0   2      
[29] getupval   0   2        ; MAX_LOW_LEVEL_TOS
[30] getglobal  8   1        ; io
[31] gettable   8   8   252  ; "write"
[32] loadk      9   3        ; "\n"
[33] getglobal  10  4        ; os
[34] gettable   10  10  255  ; "date"
[35] loadk      11  6        ; "%c "
[36] call       10  2   2  
[37] loadk      11  12       ; "Downloading "
[38] move       12  0      
[39] loadk      13  13       ; " TO "
[40] move       14  1      
[41] call       8   7   1  
[42] getupval   8   3        ; win32
[43] gettable   8   8   264  ; "CreatePath"
[44] move       9   1      
[45] call       8   2   1  
[46] getglobal  8   15       ; OpenDestFile
[47] move       9   1      
[48] call       8   2   2  
[49] move       3   8      
[50] getglobal  8   16       ; pcall
[51] getupval   9   4        ; http
[52] gettable   9   9   267  ; "request"
[53] newtable   10  0   2    ; array=0, hash=4
[54] settable   10  268 0    ; "url"
[55] settable   10  269 7    ; "sink"
[56] call       8   3   4  
[57] self       11  3   270  ; "close"
[58] call       11  2   1  
[59] test       10  10  0    ; to [61] if true
[60] jmp        20           ; to [81]
[61] eq         1   10  271  ; 200, to [63] if false
[62] jmp        18           ; to [81]
[63] eq         1   10  272  ; 304, to [65] if false
[64] jmp        16           ; to [81]
[65] getglobal  11  24       ; tostring
[66] move       12  10     
[67] call       11  2   2  
[68] test       11  11  1    ; to [70] if false
[69] jmp        1            ; to [71]
[70] loadk      11  25       ; ""
[71] loadk      12  26       ; " "
[72] move       13  0      
[73] concat     11  11  13 
[74] setglobal  11  23       ; g_extraErrorInfo
[75] getglobal  11  27       ; ErrorHandler
[76] call       11  1   2  
[77] gettable   11  11  278  ; "HandleError"
[78] loadk      12  10       ; "httpError"
[79] tailcall   11  2   0  
[80] return     11  0      
[81] getglobal  11  29       ; assert
[82] move       12  8      
[83] test       13  9   1    ; to [85] if false
[84] jmp        1            ; to [86]
[85] loadk      13  30       ; "unknown"
[86] call       11  3   1  
[87] getglobal  11  1        ; io
[88] gettable   11  11  252  ; "write"
[89] loadk      12  3        ; "\n"
[90] getglobal  13  4        ; os
[91] gettable   13  13  255  ; "date"
[92] loadk      14  6        ; "%c "
[93] call       13  2   2  
[94] loadk      14  31       ; "Completed download of "
[95] move       15  1      
[96] call       11  5   1  
[97] return     0   1      
; end of function

[01] loadk      0   0        ; 2048
[02] loadk      1   1        ; 8192
[03] loadk      2   2        ; 100
[04] getglobal  3   3        ; ConstTable
[05] call       3   1   2  
[06] closure    4   0        ; 2 upvalues
[07] move       0   4      
[08] getupval   0   0        ; win32
[09] closure    5   1        ; 0 upvalues
[10] settable   3   254 5    ; "TestConnection"
[11] closure    5   2        ; 4 upvalues
[12] getupval   0   0        ; win32
[13] getupval   0   1        ; url
[14] move       0   4      
[15] move       0   0      
[16] settable   3   255 5    ; "PayloadSize"
[17] closure    5   3        ; 5 upvalues
[18] move       0   3      
[19] move       0   1      
[20] move       0   2      
[21] getupval   0   0        ; win32
[22] getupval   0   2        ; http
[23] settable   3   256 5    ; "GetFile"
[24] return     3   2      
[25] return     0   1      
; end of function

[01] getglobal  0   0        ; require
[02] loadk      1   1        ; "socket"
[03] call       0   2   1  
[04] getglobal  0   0        ; require
[05] loadk      1   2        ; "http"
[06] call       0   2   1  
[07] loadk      0   4        ; 0
[08] setglobal  0   3        ; g_cbDownloaded
[09] getglobal  0   0        ; require
[10] loadk      1   5        ; "socket.url"
[11] call       0   2   2  
[12] getglobal  1   0        ; require
[13] loadk      2   6        ; "socket.http"
[14] call       1   2   2  
[15] getglobal  2   7        ; Win32Interop
[16] call       2   1   2  
[17] closure    3   0        ; 3 upvalues
[18] move       0   2      
[19] move       0   0      
[20] move       0   1      
[21] setglobal  3   8        ; DownloadMgr
[22] return     0   1      
; end of function


; function [8] definition (level 2)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 0 3
.local  "win32"  ; 0
.local  "downloadMgr"  ; 1
.const  "Win32Interop"  ; 0
.const  "DownloadMgr"  ; 1
.const  "conditionSets"  ; 2
.const  "numSets"  ; 3
.const  0  ; 4
.const  "currentIndex"  ; 5
.const  1  ; 6
.const  -1  ; 7
.const  "CheckCondition"  ; 8
.const  "ConditionSet"  ; 9

; function [0] definition (level 3)
; 0 upvalues, 2 params, 7 stacks
.function  0 2 0 7
.local  "id"  ; 0
.local  "val"  ; 1
.const  "conditionSets"  ; 0
.const  "currentIndex"  ; 1
.const  0  ; 2
.const  "CheckCondition"  ; 3
.const  "io"  ; 4
.const  "write"  ; 5
.const  "\n"  ; 6
.const  "os"  ; 7
.const  "date"  ; 8
.const  "%c "  ; 9
.const  "CheckCondition: Invalid index "  ; 10
[01] getglobal  2   0        ; conditionSets
[02] gettable   2   2   251  ; "currentIndex"
[03] lt         0   252 2    ; 0, to [5] if true
[04] jmp        10           ; to [15]
[05] getglobal  2   0        ; conditionSets
[06] getglobal  3   0        ; conditionSets
[07] gettable   3   3   251  ; "currentIndex"
[08] gettable   2   2   3  
[09] gettable   2   2   253  ; "CheckCondition"
[10] move       3   0      
[11] move       4   1      
[12] tailcall   2   3   0  
[13] return     2   0      
[14] jmp        14           ; to [29]
[15] getglobal  2   4        ; io
[16] gettable   2   2   255  ; "write"
[17] loadk      3   6        ; "\n"
[18] getglobal  4   7        ; os
[19] gettable   4   4   258  ; "date"
[20] loadk      5   9        ; "%c "
[21] call       4   2   2  
[22] loadk      5   10       ; "CheckCondition: Invalid index "
[23] getglobal  6   0        ; conditionSets
[24] gettable   6   6   251  ; "currentIndex"
[25] concat     5   5   6  
[26] call       2   4   1  
[27] loadbool   2   0   0    ; false
[28] return     2   2      
[29] return     0   1      
; end of function


; function [1] definition (level 3)
; 2 upvalues, 1 params, 15 stacks
.function  2 1 0 15
.local  "envLookup"  ; 0
.local  "conditions"  ; 1
.local  "members"  ; 2
.local  "myConditionIndex"  ; 3
.local  "Mutex"  ; 4
.local  "FileLocked"  ; 5
.local  "FileExists"  ; 6
.local  "RegKeyExists"  ; 7
.local  "Online"  ; 8
.local  "RegKeyVal"  ; 9
.local  "OSVer"  ; 10
.local  "Environment"  ; 11
.local  "BlockEval"  ; 12
.upvalue  "win32"  ; 0
.upvalue  "downloadMgr"  ; 1
.const  "ConstTable"  ; 0
.const  2  ; 1
.const  -2  ; 2
.const  "AddCondition"  ; 3
.const  "CheckCondition"  ; 4
.const  "conditionSets"  ; 5
.const  "numSets"  ; 6
.const  1  ; 7

; function [0] definition (level 4)
; 1 upvalues, 1 params, 8 stacks
.function  1 1 0 8
.local  "var"  ; 0
.local  "m"  ; 1
.local  "s"  ; 2
.upvalue  "win32"  ; 0
.const  "Mutex"  ; 0
.const  "Lock"  ; 1
.const  "io"  ; 2
.const  "write"  ; 3
.const  "\n"  ; 4
.const  "os"  ; 5
.const  "date"  ; 6
.const  "%c "  ; 7
.const  "Did not get lock on "  ; 8
.const  "Release"  ; 9
.const  "Close"  ; 10
[01] getupval   1   0        ; win32
[02] gettable   1   1   250  ; "Mutex"
[03] move       2   0      
[04] call       1   2   2  
[05] gettable   2   1   251  ; "Lock"
[06] call       2   1   2  
[07] test       2   2   1    ; to [9] if false
[08] jmp        10           ; to [19]
[09] getglobal  3   2        ; io
[10] gettable   3   3   253  ; "write"
[11] loadk      4   4        ; "\n"
[12] getglobal  5   5        ; os
[13] gettable   5   5   256  ; "date"
[14] loadk      6   7        ; "%c "
[15] call       5   2   2  
[16] loadk      6   8        ; "Did not get lock on "
[17] move       7   0      
[18] call       3   5   1  
[19] gettable   3   1   259  ; "Release"
[20] call       3   1   1  
[21] gettable   3   1   260  ; "Close"
[22] call       3   1   1  
[23] return     2   2      
[24] return     0   1      
; end of function


; function [1] definition (level 4)
; 0 upvalues, 1 params, 7 stacks
.function  0 1 0 7
.local  "var"  ; 0
.local  "h"  ; 1
.const  "io"  ; 0
.const  "openW"  ; 1
.const  "r+"  ; 2
.const  "write"  ; 3
.const  "\n"  ; 4
.const  "os"  ; 5
.const  "date"  ; 6
.const  "%c "  ; 7
.const  " is not locked."  ; 8
[01] getglobal  1   0        ; io
[02] gettable   1   1   251  ; "openW"
[03] move       2   0      
[04] loadk      3   2        ; "r+"
[05] call       1   3   2  
[06] test       1   1   0    ; to [8] if true
[07] jmp        13           ; to [21]
[08] getglobal  2   0        ; io
[09] gettable   2   2   253  ; "write"
[10] loadk      3   4        ; "\n"
[11] getglobal  4   5        ; os
[12] gettable   4   4   256  ; "date"
[13] loadk      5   7        ; "%c "
[14] call       4   2   2  
[15] move       5   0      
[16] loadk      6   8        ; " is not locked."
[17] call       2   5   1  
[18] loadbool   2   0   0    ; false
[19] return     2   2      
[20] jmp        2            ; to [23]
[21] loadbool   2   1   0    ; true
[22] return     2   2      
[23] return     0   1      
; end of function


; function [2] definition (level 4)
; 0 upvalues, 1 params, 8 stacks
.function  0 1 0 8
.local  "var"  ; 0
.local  "h"  ; 1
.const  "io"  ; 0
.const  "openW"  ; 1
.const  "r"  ; 2
.const  "write"  ; 3
.const  "\n"  ; 4
.const  "os"  ; 5
.const  "date"  ; 6
.const  "%c "  ; 7
.const  " File "  ; 8
.const  " exists."  ; 9
.const  "close"  ; 10
[01] getglobal  1   0        ; io
[02] gettable   1   1   251  ; "openW"
[03] move       2   0      
[04] loadk      3   2        ; "r"
[05] call       1   3   2  
[06] test       1   1   0    ; to [8] if true
[07] jmp        16           ; to [24]
[08] getglobal  2   0        ; io
[09] gettable   2   2   253  ; "write"
[10] loadk      3   4        ; "\n"
[11] getglobal  4   5        ; os
[12] gettable   4   4   256  ; "date"
[13] loadk      5   7        ; "%c "
[14] call       4   2   2  
[15] loadk      5   8        ; " File "
[16] move       6   0      
[17] loadk      7   9        ; " exists."
[18] call       2   6   1  
[19] self       2   1   260  ; "close"
[20] call       2   2   1  
[21] loadbool   2   1   0    ; true
[22] return     2   2      
[23] jmp        2            ; to [26]
[24] loadbool   2   0   0    ; false
[25] return     2   2      
[26] return     0   1      
; end of function


; function [3] definition (level 4)
; 1 upvalues, 1 params, 8 stacks
.function  1 1 0 8
.local  "var"  ; 0
.local  "_"  ; 1
.local  "_"  ; 2
.local  "base"  ; 3
.local  "key"  ; 4
.upvalue  "win32"  ; 0
.const  "string"  ; 0
.const  "find"  ; 1
.const  "([%a_]+)\\(.+)"  ; 2
.const  "OpenBaseKey"  ; 3
[01] getglobal  1   0        ; string
[02] gettable   1   1   251  ; "find"
[03] move       2   0      
[04] loadk      3   2        ; "([%a_]+)\\(.+)"
[05] call       1   3   5  
[06] getupval   5   0        ; win32
[07] gettable   5   5   253  ; "OpenBaseKey"
[08] move       6   3      
[09] move       7   4      
[10] tailcall   5   3   0  
[11] return     5   0      
[12] return     0   1      
; end of function


; function [4] definition (level 4)
; 1 upvalues, 1 params, 2 stacks
.function  1 1 0 2
.local  "var"  ; 0
.upvalue  "downloadMgr"  ; 0
.const  "TestConnection"  ; 0
[1] getupval   1   0        ; downloadMgr
[2] gettable   1   1   250  ; "TestConnection"
[3] tailcall   1   1   0  
[4] return     1   0      
[5] return     0   1      
; end of function


; function [5] definition (level 4)
; 1 upvalues, 1 params, 10 stacks
.function  1 1 0 10
.local  "var"  ; 0
.local  "_"  ; 1
.local  "_"  ; 2
.local  "base"  ; 3
.local  "key"  ; 4
.local  "name"  ; 5
.local  "val"  ; 6
.upvalue  "win32"  ; 0
.const  "string"  ; 0
.const  "find"  ; 1
.const  "([%a_]+)\\(.+)\\([%w%s_-]+)"  ; 2
.const  "GetRegKeyValue"  ; 3
.const  ""  ; 4
[01] getglobal  1   0        ; string
[02] gettable   1   1   251  ; "find"
[03] move       2   0      
[04] loadk      3   2        ; "([%a_]+)\\(.+)\\([%w%s_-]+)"
[05] call       1   3   6  
[06] getupval   6   0        ; win32
[07] gettable   6   6   253  ; "GetRegKeyValue"
[08] move       7   3      
[09] move       8   4      
[10] move       9   5      
[11] call       6   4   2  
[12] eq         0   6   254  ; "", to [14] if true
[13] jmp        1            ; to [15]
[14] loadnil    6   6      
[15] return     6   2      
[16] return     0   1      
; end of function


; function [6] definition (level 4)
; 1 upvalues, 1 params, 2 stacks
.function  1 1 0 2
.local  "var"  ; 0
.upvalue  "win32"  ; 0
.const  "OSVersion"  ; 0
[1] getupval   1   0        ; win32
[2] gettable   1   1   250  ; "OSVersion"
[3] tailcall   1   1   0  
[4] return     1   0      
[5] return     0   1      
; end of function


; function [7] definition (level 4)
; 1 upvalues, 1 params, 3 stacks
.function  1 1 0 3
.local  "var"  ; 0
.upvalue  "envLookup"  ; 0
[1] getupval   1   0        ; envLookup
[2] move       2   0      
[3] tailcall   1   2   0  
[4] return     1   0      
[5] return     0   1      
; end of function


; function [8] definition (level 4)
; 1 upvalues, 1 params, 12 stacks
.function  1 1 0 12
.local  "var"  ; 0
.local  "code"  ; 1
.local  "err"  ; 2
.local  "newEnv"  ; 3
.local  "lastIndex"  ; 4
.local  "s"  ; 5
.local  "ret"  ; 6
.upvalue  "myConditionIndex"  ; 0
.const  "loadstring"  ; 0
.const  "io"  ; 1
.const  "write"  ; 2
.const  "\n"  ; 3
.const  "os"  ; 4
.const  "date"  ; 5
.const  "%c "  ; 6
.const  "Error compiling ConditionDef Lua block: "  ; 7
.const  "setmetatable"  ; 8
.const  "__index"  ; 9
.const  "_G"  ; 10
.const  "setfenv"  ; 11
.const  1  ; 12
.const  "conditionSets"  ; 13
.const  "currentIndex"  ; 14
.const  "pcall"  ; 15
.const  "string"  ; 16
.const  "find"  ; 17
.const  "userAbort"  ; 18
.const  "assert"  ; 19
.const  "Error evaluating ConditionDef Lua block: "  ; 20
[01] getglobal  1   0        ; loadstring
[02] move       2   0      
[03] call       1   2   3  
[04] test       1   1   1    ; to [6] if false
[05] jmp        12           ; to [18]
[06] getglobal  3   1        ; io
[07] gettable   3   3   252  ; "write"
[08] loadk      4   3        ; "\n"
[09] getglobal  5   4        ; os
[10] gettable   5   5   255  ; "date"
[11] loadk      6   6        ; "%c "
[12] call       5   2   2  
[13] loadk      6   7        ; "Error compiling ConditionDef Lua block: "
[14] move       7   2      
[15] call       3   5   1  
[16] loadnil    3   3      
[17] return     3   2      
[18] newtable   3   0   0    ; array=0, hash=0
[19] getglobal  4   8        ; setmetatable
[20] move       5   3      
[21] newtable   6   0   1    ; array=0, hash=2
[22] getglobal  7   10       ; _G
[23] settable   6   259 7    ; "__index"
[24] call       4   3   1  
[25] getglobal  4   11       ; setfenv
[26] loadk      5   12       ; 1
[27] move       6   3      
[28] call       4   3   1  
[29] getglobal  4   13       ; conditionSets
[30] gettable   4   4   264  ; "currentIndex"
[31] getglobal  5   13       ; conditionSets
[32] getupval   6   0        ; myConditionIndex
[33] settable   5   264 6    ; "currentIndex"
[34] getglobal  5   15       ; pcall
[35] move       6   1      
[36] call       5   2   3  
[37] getglobal  7   13       ; conditionSets
[38] settable   7   264 4    ; "currentIndex"
[39] test       5   5   1    ; to [41] if false
[40] jmp        24           ; to [65]
[41] getglobal  7   16       ; string
[42] gettable   7   7   267  ; "find"
[43] move       8   6      
[44] loadk      9   18       ; "userAbort"
[45] call       7   3   2  
[46] test       7   7   0    ; to [48] if true
[47] jmp        5            ; to [53]
[48] getglobal  7   19       ; assert
[49] loadbool   8   0   0    ; false
[50] move       9   6      
[51] call       7   3   1  
[52] jmp        10           ; to [63]
[53] getglobal  7   1        ; io
[54] gettable   7   7   252  ; "write"
[55] loadk      8   3        ; "\n"
[56] getglobal  9   4        ; os
[57] gettable   9   9   255  ; "date"
[58] loadk      10  6        ; "%c "
[59] call       9   2   2  
[60] loadk      10  20       ; "Error evaluating ConditionDef Lua block: "
[61] move       11  6      
[62] call       7   5   1  
[63] loadnil    7   7      
[64] return     7   2      
[65] return     6   2      
[66] return     0   1      
; end of function


; function [9] definition (level 4)
; 10 upvalues, 3 params, 9 stacks
.function  10 3 0 9
.local  "id"  ; 0
.local  "type"  ; 1
.local  "var"  ; 2
.local  "fun"  ; 3
.upvalue  "Mutex"  ; 0
.upvalue  "FileLocked"  ; 1
.upvalue  "RegKeyVal"  ; 2
.upvalue  "RegKeyExists"  ; 3
.upvalue  "OSVer"  ; 4
.upvalue  "Environment"  ; 5
.upvalue  "BlockEval"  ; 6
.upvalue  "FileExists"  ; 7
.upvalue  "Online"  ; 8
.upvalue  "conditions"  ; 9
.const  "Mutex"  ; 0
.const  "FileLocked"  ; 1
.const  "RegKeyVal"  ; 2
.const  "RegKeyExists"  ; 3
.const  "OSVer"  ; 4
.const  "Environment"  ; 5
.const  "LuaBlock"  ; 6
.const  "FileExists"  ; 7
.const  "Online"  ; 8
.const  "io"  ; 9
.const  "write"  ; 10
.const  "\n"  ; 11
.const  "os"  ; 12
.const  "date"  ; 13
.const  "%c "  ; 14
.const  "Warning: Unknown condition ignored. "  ; 15

; function [0] definition (level 5)
; 2 upvalues, 1 params, 9 stacks
.function  2 1 0 9
.local  "val"  ; 0
.local  "eval"  ; 1
.upvalue  "fun"  ; 0
.upvalue  "var"  ; 1
.const  "tostring"  ; 0
.const  "io"  ; 1
.const  "write"  ; 2
.const  "\n"  ; 3
.const  "os"  ; 4
.const  "date"  ; 5
.const  "%c "  ; 6
.const  "Testing "  ; 7
.const  " == "  ; 8
[01] getglobal  1   0        ; tostring
[02] getupval   2   0        ; fun
[03] getupval   3   1        ; var
[04] call       2   2   0  
[05] call       1   0   2  
[06] getglobal  2   1        ; io
[07] gettable   2   2   252  ; "write"
[08] loadk      3   3        ; "\n"
[09] getglobal  4   4        ; os
[10] gettable   4   4   255  ; "date"
[11] loadk      5   6        ; "%c "
[12] call       4   2   2  
[13] loadk      5   7        ; "Testing "
[14] move       6   1      
[15] loadk      7   8        ; " == "
[16] move       8   0      
[17] call       2   7   1  
[18] eq         1   1   0    ; to [20] if false
[19] jmp        1            ; to [21]
[20] loadbool   2   0   1    ; false, to [22]
[21] loadbool   2   1   0    ; true
[22] return     2   2      
[23] return     0   1      
; end of function

[01] loadnil    3   3      
[02] eq         0   1   250  ; "Mutex", to [4] if true
[03] jmp        2            ; to [6]
[04] getupval   3   0        ; Mutex
[05] jmp        43           ; to [49]
[06] eq         0   1   251  ; "FileLocked", to [8] if true
[07] jmp        2            ; to [10]
[08] getupval   3   1        ; FileLocked
[09] jmp        39           ; to [49]
[10] eq         0   1   252  ; "RegKeyVal", to [12] if true
[11] jmp        2            ; to [14]
[12] getupval   3   2        ; RegKeyVal
[13] jmp        35           ; to [49]
[14] eq         0   1   253  ; "RegKeyExists", to [16] if true
[15] jmp        2            ; to [18]
[16] getupval   3   3        ; RegKeyExists
[17] jmp        31           ; to [49]
[18] eq         0   1   254  ; "OSVer", to [20] if true
[19] jmp        2            ; to [22]
[20] getupval   3   4        ; OSVer
[21] jmp        27           ; to [49]
[22] eq         0   1   255  ; "Environment", to [24] if true
[23] jmp        2            ; to [26]
[24] getupval   3   5        ; Environment
[25] jmp        23           ; to [49]
[26] eq         0   1   256  ; "LuaBlock", to [28] if true
[27] jmp        2            ; to [30]
[28] getupval   3   6        ; BlockEval
[29] jmp        19           ; to [49]
[30] eq         0   1   257  ; "FileExists", to [32] if true
[31] jmp        2            ; to [34]
[32] getupval   3   7        ; FileExists
[33] jmp        15           ; to [49]
[34] eq         0   1   258  ; "Online", to [36] if true
[35] jmp        2            ; to [38]
[36] getupval   3   8        ; Online
[37] jmp        11           ; to [49]
[38] getglobal  4   9        ; io
[39] gettable   4   4   260  ; "write"
[40] loadk      5   11       ; "\n"
[41] getglobal  6   12       ; os
[42] gettable   6   6   263  ; "date"
[43] loadk      7   14       ; "%c "
[44] call       6   2   2  
[45] loadk      7   15       ; "Warning: Unknown condition ignored. "
[46] move       8   1      
[47] call       4   5   1  
[48] return     0   1      
[49] getupval   4   9        ; conditions
[50] closure    5   0        ; 2 upvalues
[51] move       0   3      
[52] move       0   2      
[53] settable   4   0   5  
[54] return     0   1      
; end of function


; function [10] definition (level 4)
; 1 upvalues, 2 params, 8 stacks
.function  1 2 0 8
.local  "id"  ; 0
.local  "val"  ; 1
.upvalue  "conditions"  ; 0
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Checking condition, "  ; 6
.const  ""  ; 7
.const  "Warning: Attempt to check undefined condition, id = "  ; 8
.const  "tostring"  ; 9
[01] getglobal  2   0        ; io
[02] gettable   2   2   251  ; "write"
[03] loadk      3   2        ; "\n"
[04] getglobal  4   3        ; os
[05] gettable   4   4   254  ; "date"
[06] loadk      5   5        ; "%c "
[07] call       4   2   2  
[08] loadk      5   6        ; "Checking condition, "
[09] test       6   0   1    ; to [11] if false
[10] jmp        1            ; to [12]
[11] loadk      6   7        ; ""
[12] call       2   5   1  
[13] getupval   2   0        ; conditions
[14] gettable   2   2   0  
[15] test       2   2   0    ; to [17] if true
[16] jmp        6            ; to [23]
[17] getupval   2   0        ; conditions
[18] gettable   2   2   0  
[19] move       3   1      
[20] tailcall   2   2   0  
[21] return     2   0      
[22] jmp        12           ; to [35]
[23] getglobal  2   0        ; io
[24] gettable   2   2   251  ; "write"
[25] loadk      3   2        ; "\n"
[26] getglobal  4   3        ; os
[27] gettable   4   4   254  ; "date"
[28] loadk      5   5        ; "%c "
[29] call       4   2   2  
[30] loadk      5   8        ; "Warning: Attempt to check undefined condition, id = "
[31] getglobal  6   9        ; tostring
[32] move       7   0      
[33] call       6   2   0  
[34] call       2   0   1  
[35] return     0   1      
; end of function

[01] getglobal  1   0        ; ConstTable
[02] call       1   1   2  
[03] getglobal  2   0        ; ConstTable
[04] call       2   1   2  
[05] loadk      3   2        ; -2
[06] closure    4   0        ; 1 upvalues
[07] getupval   0   0        ; win32
[08] closure    5   1        ; 0 upvalues
[09] closure    6   2        ; 0 upvalues
[10] closure    7   3        ; 1 upvalues
[11] getupval   0   0        ; win32
[12] closure    8   4        ; 1 upvalues
[13] getupval   0   1        ; downloadMgr
[14] closure    9   5        ; 1 upvalues
[15] getupval   0   0        ; win32
[16] closure    10  6        ; 1 upvalues
[17] getupval   0   0        ; win32
[18] closure    11  7        ; 1 upvalues
[19] move       0   0      
[20] closure    12  8        ; 1 upvalues
[21] move       0   3      
[22] closure    13  9        ; 10 upvalues
[23] move       0   4      
[24] move       0   5      
[25] move       0   9      
[26] move       0   7      
[27] move       0   10     
[28] move       0   11     
[29] move       0   12     
[30] move       0   6      
[31] move       0   8      
[32] move       0   1      
[33] settable   2   253 13   ; "AddCondition"
[34] closure    13  10       ; 1 upvalues
[35] move       0   1      
[36] settable   2   254 13   ; "CheckCondition"
[37] getglobal  13  5        ; conditionSets
[38] getglobal  14  5        ; conditionSets
[39] gettable   14  14  256  ; "numSets"
[40] add        14  14  257  ; 1
[41] settable   13  256 14   ; "numSets"
[42] getglobal  13  5        ; conditionSets
[43] gettable   3   13  256  ; "numSets"
[44] getglobal  13  5        ; conditionSets
[45] settable   13  3   2  
[46] return     2   2      
[47] return     0   1      
; end of function

[01] getglobal  0   0        ; Win32Interop
[02] call       0   1   2  
[03] getglobal  1   1        ; DownloadMgr
[04] call       1   1   2  
[05] newtable   2   0   0    ; array=0, hash=0
[06] setglobal  2   2        ; conditionSets
[07] getglobal  2   2        ; conditionSets
[08] settable   2   253 254  ; "numSets" 0
[09] getglobal  2   2        ; conditionSets
[10] settable   2   255 257  ; "currentIndex" -1
[11] closure    2   0        ; 0 upvalues
[12] setglobal  2   8        ; CheckCondition
[13] closure    2   1        ; 2 upvalues
[14] move       0   0      
[15] move       0   1      
[16] setglobal  2   9        ; ConditionSet
[17] return     0   1      
; end of function


; function [9] definition (level 2)
; 0 upvalues, 0 params, 4 stacks
.function  0 0 0 4
.local  "g_strURL"  ; 0
.local  "g_DownloadManager"  ; 1
.local  "g_Win32InterOp"  ; 2
.const  "g_strLocale"  ; 0
.const  "none"  ; 1
.const  "require"  ; 2
.const  "socket.url"  ; 3
.const  "DownloadMgr"  ; 4
.const  "Win32Interop"  ; 5
.const  "GetMatchingURLs"  ; 6
.const  "CreateErrorCodesTable"  ; 7
.const  "CreatePingPairsTable"  ; 8
.const  "ErrorHandler"  ; 9

; function [0] definition (level 3)
; 0 upvalues, 2 params, 14 stacks
.function  0 2 0 14
.local  "f_strStoreFront"  ; 0
.local  "f_strChannel"  ; 1
.local  "strURL_ITM"  ; 2
.local  "strURL_LogPing"  ; 3
.local  "itmpath"  ; 4
.local  "logpath"  ; 5
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "GetMatchingURLs parameters: storefront = '"  ; 6
.const  "nil"  ; 7
.const  "' and channel = '"  ; 8
.const  "'"  ; 9
.const  "string"  ; 10
.const  "len"  ; 11
.const  0  ; 12
.const  "."  ; 13
.const  "itmUrl"  ; 14
.const  "logUrl"  ; 15
.const  "Attempting to lookup "  ; 16
.const  " and "  ; 17
.const  " from config"  ; 18
.const  "g_tableConfig"  ; 19
.const  "DEFAULT_ITM_URL"  ; 20
.const  "using default ITM URL = '"  ; 21
.const  "DEFAULT_LOG_URL"  ; 22
.const  "using default LOG URL = '"  ; 23
.const  "GetMatchingURLs returning ITM URL = '"  ; 24
.const  "' and Ping URL = '"  ; 25
[01] loadnil    2   3      
[02] getglobal  4   0        ; io
[03] gettable   4   4   251  ; "write"
[04] loadk      5   2        ; "\n"
[05] getglobal  6   3        ; os
[06] gettable   6   6   254  ; "date"
[07] loadk      7   5        ; "%c "
[08] call       6   2   2  
[09] loadk      7   6        ; "GetMatchingURLs parameters: storefront = '"
[10] test       8   0   1    ; to [12] if false
[11] jmp        1            ; to [13]
[12] loadk      8   7        ; "nil"
[13] loadk      9   8        ; "' and channel = '"
[14] test       10  1   1    ; to [16] if false
[15] jmp        1            ; to [17]
[16] loadk      10  7        ; "nil"
[17] loadk      11  9        ; "'"
[18] concat     7   7   11 
[19] call       4   4   1  
[20] test       0   0   0    ; to [22] if true
[21] jmp        32           ; to [54]
[22] getglobal  4   10       ; string
[23] gettable   4   4   261  ; "len"
[24] move       5   0      
[25] call       4   2   2  
[26] lt         0   262 4    ; 0, to [28] if true
[27] jmp        26           ; to [54]
[28] move       4   0      
[29] loadk      5   13       ; "."
[30] loadk      6   14       ; "itmUrl"
[31] concat     4   4   6  
[32] move       5   0      
[33] loadk      6   13       ; "."
[34] loadk      7   15       ; "logUrl"
[35] concat     5   5   7  
[36] getglobal  6   0        ; io
[37] gettable   6   6   251  ; "write"
[38] loadk      7   2        ; "\n"
[39] getglobal  8   3        ; os
[40] gettable   8   8   254  ; "date"
[41] loadk      9   5        ; "%c "
[42] call       8   2   2  
[43] loadk      9   16       ; "Attempting to lookup "
[44] move       10  4      
[45] loadk      11  17       ; " and "
[46] move       12  5      
[47] loadk      13  18       ; " from config"
[48] concat     9   9   13 
[49] call       6   4   1  
[50] getglobal  6   19       ; g_tableConfig
[51] gettable   2   6   4  
[52] getglobal  6   19       ; g_tableConfig
[53] gettable   3   6   5  
[54] test       2   2   1    ; to [56] if false
[55] jmp        12           ; to [68]
[56] getglobal  2   20       ; DEFAULT_ITM_URL
[57] getglobal  4   0        ; io
[58] gettable   4   4   251  ; "write"
[59] loadk      5   2        ; "\n"
[60] getglobal  6   3        ; os
[61] gettable   6   6   254  ; "date"
[62] loadk      7   5        ; "%c "
[63] call       6   2   2  
[64] loadk      7   21       ; "using default ITM URL = '"
[65] move       8   2      
[66] concat     7   7   8  
[67] call       4   4   1  
[68] test       3   3   1    ; to [70] if false
[69] jmp        12           ; to [82]
[70] getglobal  3   22       ; DEFAULT_LOG_URL
[71] getglobal  4   0        ; io
[72] gettable   4   4   251  ; "write"
[73] loadk      5   2        ; "\n"
[74] getglobal  6   3        ; os
[75] gettable   6   6   254  ; "date"
[76] loadk      7   5        ; "%c "
[77] call       6   2   2  
[78] loadk      7   23       ; "using default LOG URL = '"
[79] move       8   3      
[80] concat     7   7   8  
[81] call       4   4   1  
[82] getglobal  4   0        ; io
[83] gettable   4   4   251  ; "write"
[84] loadk      5   2        ; "\n"
[85] getglobal  6   3        ; os
[86] gettable   6   6   254  ; "date"
[87] loadk      7   5        ; "%c "
[88] call       6   2   2  
[89] loadk      7   24       ; "GetMatchingURLs returning ITM URL = '"
[90] move       8   2      
[91] loadk      9   25       ; "' and Ping URL = '"
[92] move       10  3      
[93] loadk      11  9        ; "'"
[94] concat     7   7   11 
[95] call       4   4   1  
[96] move       4   2      
[97] move       5   3      
[98] return     4   3      
[99] return     0   1      
; end of function


; function [1] definition (level 3)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
.local  "errCodes"  ; 0
.const  0  ; 0
.const  "Ok"  ; 1
.const  1  ; 2
.const  "Unknown"  ; 3
.const  2  ; 4
.const  "NotPermitted"  ; 5
.const  3  ; 6
.const  "IENotDefault"  ; 7
.const  4  ; 8
.const  "AlreadyInstalled"  ; 9
.const  5  ; 10
.const  "BHOsDisabled"  ; 11
.const  6  ; 12
.const  "NotAdmin"  ; 13
.const  100  ; 14
.const  "CreateProcessFailed"  ; 15
[01] newtable   0   0   0    ; array=0, hash=0
[02] settable   0   250 251  ; 0 "Ok"
[03] settable   0   252 253  ; 1 "Unknown"
[04] settable   0   254 255  ; 2 "NotPermitted"
[05] settable   0   256 257  ; 3 "IENotDefault"
[06] settable   0   258 259  ; 4 "AlreadyInstalled"
[07] settable   0   260 261  ; 5 "BHOsDisabled"
[08] settable   0   262 263  ; 6 "NotAdmin"
[09] settable   0   264 265  ; 100 "CreateProcessFailed"
[10] return     0   2      
[11] return     0   1      
; end of function


; function [2] definition (level 3)
; 1 upvalues, 5 params, 16 stacks
.function  1 5 0 16
.local  "f_strProd"  ; 0
.local  "f_strAction"  ; 1
.local  "f_strValue"  ; 2
.local  "f_strLanguage"  ; 3
.local  "f_strAffiliate"  ; 4
.local  "tablePingPairs"  ; 5
.local  "strLanguage"  ; 6
.local  "strAffiliate"  ; 7
.upvalue  "g_Win32InterOp"  ; 0
.const  "g_strLocale"  ; 0
.const  "GetRegKeyValue"  ; 1
.const  "HKEY_CLASSES_ROOT"  ; 2
.const  "SOFTWARE\\RealArcade\\2.0\\Preferences"  ; 3
.const  "Language"  ; 4
.const  ""  ; 5
.const  "main_env"  ; 6
.const  "affiliate"  ; 7
.const  "prod"  ; 8
.const  "payload"  ; 9
.const  "g_env"  ; 10
.const  "curGameId"  ; 11
.const  "action"  ; 12
.const  "value"  ; 13
.const  "li"  ; 14
[01] loadnil    5   7      
[02] getglobal  8   0        ; g_strLocale
[03] test       8   8   0    ; to [5] if true
[04] jmp        2            ; to [7]
[05] getglobal  6   0        ; g_strLocale
[06] jmp        14           ; to [21]
[07] test       3   3   0    ; to [9] if true
[08] jmp        2            ; to [11]
[09] move       6   3      
[10] jmp        10           ; to [21]
[11] getupval   8   0        ; g_Win32InterOp
[12] gettable   8   8   251  ; "GetRegKeyValue"
[13] loadk      9   2        ; "HKEY_CLASSES_ROOT"
[14] loadk      10  3        ; "SOFTWARE\\RealArcade\\2.0\\Preferences"
[15] loadk      11  4        ; "Language"
[16] call       8   4   2  
[17] move       6   8      
[18] test       6   6   1    ; to [20] if false
[19] jmp        1            ; to [21]
[20] loadk      6   5        ; ""
[21] test       4   4   0    ; to [23] if true
[22] jmp        2            ; to [25]
[23] move       7   4      
[24] jmp        11           ; to [36]
[25] getglobal  8   6        ; main_env
[26] test       8   8   0    ; to [28] if true
[27] jmp        7            ; to [35]
[28] getglobal  8   6        ; main_env
[29] gettable   8   8   257  ; "affiliate"
[30] test       8   8   0    ; to [32] if true
[31] jmp        3            ; to [35]
[32] getglobal  8   6        ; main_env
[33] gettable   7   8   257  ; "affiliate"
[34] jmp        1            ; to [36]
[35] loadk      7   5        ; ""
[36] newtable   8   5   0    ; array=5, hash=0
[37] newtable   9   2   0    ; array=2, hash=0
[38] loadk      10  8        ; "prod"
[39] move       11  0      
[40] setlist    9   1        ; index 1 to 2
[41] newtable   10  2   0    ; array=2, hash=0
[42] loadk      11  9        ; "payload"
[43] getglobal  12  10       ; g_env
[44] gettable   12  12  261  ; "curGameId"
[45] setlist    10  1        ; index 1 to 2
[46] newtable   11  2   0    ; array=2, hash=0
[47] loadk      12  12       ; "action"
[48] move       13  1      
[49] setlist    11  1        ; index 1 to 2
[50] newtable   12  2   0    ; array=2, hash=0
[51] loadk      13  13       ; "value"
[52] move       14  2      
[53] setlist    12  1        ; index 1 to 2
[54] newtable   13  2   0    ; array=2, hash=0
[55] loadk      14  14       ; "li"
[56] move       15  6      
[57] setlist    13  1        ; index 1 to 2
[58] setlist    8   4        ; index 1 to 5
[59] move       5   8      
[60] return     5   2      
[61] return     0   1      
; end of function


; function [3] definition (level 3)
; 3 upvalues, 0 params, 11 stacks
.function  3 0 0 11
.local  "members"  ; 0
.local  "tableURLs"  ; 1
.local  "state"  ; 2
.local  "src"  ; 3
.local  "field"  ; 4
.upvalue  "g_strURL"  ; 0
.upvalue  "g_Win32InterOp"  ; 1
.upvalue  "g_DownloadManager"  ; 2
.const  "ConstTable"  ; 0
.const  "pingUrl"  ; 1
.const  "http://logging.gameco.biz/arcade/download.html?file=online/install/"  ; 2
.const  "g_env"  ; 3
.const  "logUrl"  ; 4
.const  "io"  ; 5
.const  "write"  ; 6
.const  "\n"  ; 7
.const  "os"  ; 8
.const  "date"  ; 9
.const  "%c "  ; 10
.const  "using template logging URL "  ; 11
.const  "itmUrl"  ; 12
.const  "GetMatchingURLs"  ; 13
.const  "g_storeFront"  ; 14
.const  "g_tps"  ; 15
.const  "using logging URL from config file '"  ; 16
.const  "'"  ; 17
.const  "src"  ; 18
.const  "component"  ; 19
.const  "state"  ; 20
.const  "error"  ; 21
.const  "dwnldevt"  ; 22
.const  "downloadevent"  ; 23
.const  "bndlevt"  ; 24
.const  "bundleevent"  ; 25
.const  "lastsld"  ; 26
.const  "lastslide"  ; 27
.const  "g_fGamesManager"  ; 28
.const  "games_manager"  ; 29
.const  "rac_installer"  ; 30
.const  "migrator"  ; 31
.const  "rac_migrator"  ; 32
.const  "cdinstaller"  ; 33
.const  "rac_cdinstaller"  ; 34
.const  "uninstaller"  ; 35
.const  "rac_uninstaller"  ; 36
.const  "wrapper"  ; 37
.const  "rac_gamewrapper"  ; 38
.const  "start"  ; 39
.const  "failed"  ; 40
.const  "fail"  ; 41
.const  "complete"  ; 42
.const  "upgrade"  ; 43
.const  "events"  ; 44
.const  "tableURLs"  ; 45
.const  "field"  ; 46
.const  "LastSlide"  ; 47
.const  "LogPing"  ; 48
.const  "EscapeTxt"  ; 49
.const  "HandleError"  ; 50
.const  "Creating instance of ErrorHandler"  ; 51

; function [0] definition (level 4)
; 1 upvalues, 0 params, 7 stacks
.function  1 0 0 7
.local  "ui"  ; 0
.local  "lastSlide"  ; 1
.upvalue  "members"  ; 0
.const  "InstallerUI"  ; 0
.const  "CurrentUrl"  ; 1
.const  nil  ; 2
.const  ""  ; 3
.const  "io"  ; 4
.const  "write"  ; 5
.const  "\n"  ; 6
.const  "os"  ; 7
.const  "date"  ; 8
.const  "%c "  ; 9
.const  "LastSlide = "  ; 10
.const  "EscapeTxt"  ; 11
[01] getglobal  0   0        ; InstallerUI
[02] call       0   1   2  
[03] gettable   1   0   251  ; "CurrentUrl"
[04] call       1   1   2  
[05] eq         0   252 1    ; nil, to [7] if true
[06] jmp        1            ; to [8]
[07] loadk      1   3        ; ""
[08] getglobal  2   4        ; io
[09] gettable   2   2   255  ; "write"
[10] loadk      3   6        ; "\n"
[11] getglobal  4   7        ; os
[12] gettable   4   4   258  ; "date"
[13] loadk      5   9        ; "%c "
[14] call       4   2   2  
[15] loadk      5   10       ; "LastSlide = "
[16] move       6   1      
[17] call       2   5   1  
[18] getupval   2   0        ; members
[19] gettable   2   2   261  ; "EscapeTxt"
[20] move       3   1      
[21] call       2   2   2  
[22] return     2   2      
[23] return     0   1      
; end of function


; function [1] definition (level 4)
; 5 upvalues, 2 params, 10 stacks
.function  5 2 0 10
.local  "f_tablePairs"  ; 0
.local  "f_fDLP"  ; 1
.local  "InnerLogPingPairs"  ; 2
.local  "s"  ; 3
.local  "err"  ; 4
.upvalue  "tableURLs"  ; 0
.upvalue  "g_strURL"  ; 1
.upvalue  "g_Win32InterOp"  ; 2
.upvalue  "members"  ; 3
.upvalue  "g_DownloadManager"  ; 4
.const  "pcall"  ; 0
.const  "io"  ; 1
.const  "write"  ; 2
.const  "\n"  ; 3
.const  "os"  ; 4
.const  "date"  ; 5
.const  "%c "  ; 6
.const  "Tried to send log ping but failed: "  ; 7
.const  "undefined"  ; 8

; function [0] definition (level 5)
; 7 upvalues, 0 params, 14 stacks
.function  7 0 0 14
.local  "strURLAndParameters"  ; 0
.local  "strRequestParameters"  ; 1
.local  "tableDynamicStampParameters"  ; 2
.local  "(for generator)"  ; 3
.local  "(for state)"  ; 4
.local  "pair"  ; 5
.local  "strPair"  ; 6
.local  "(for generator)"  ; 7
.local  "(for state)"  ; 8
.local  "pair"  ; 9
.local  "(for generator)"  ; 10
.local  "(for state)"  ; 11
.local  "name"  ; 12
.local  "value"  ; 13
.local  "strParameter"  ; 14
.local  "tableSubstitutions"  ; 15
.local  "(for generator)"  ; 16
.local  "(for state)"  ; 17
.local  "pair"  ; 18
.upvalue  "f_tablePairs"  ; 0
.upvalue  "tableURLs"  ; 1
.upvalue  "g_strURL"  ; 2
.upvalue  "g_Win32InterOp"  ; 3
.upvalue  "members"  ; 4
.upvalue  "f_fDLP"  ; 5
.upvalue  "g_DownloadManager"  ; 6
.const  "assert"  ; 0
.const  "\n"  ; 1
.const  "os"  ; 2
.const  "date"  ; 3
.const  "%c "  ; 4
.const  "Empty set passed to LogPing"  ; 5
.const  "logUrl"  ; 6
.const  "contentid"  ; 7
.const  "otp"  ; 8
.const  "tracking"  ; 9
.const  "affiliate"  ; 10
.const  "currency"  ; 11
.const  "price"  ; 12
.const  "timestamp"  ; 13
.const  "language"  ; 14
.const  1  ; 15
.const  2  ; 16
.const  ""  ; 17
.const  "string"  ; 18
.const  "sub"  ; 19
.const  -1  ; 20
.const  "?"  ; 21
.const  "&"  ; 22
.const  "="  ; 23
.const  "escape"  ; 24
.const  "main_env"  ; 25
.const  "find"  ; 26
.const  "io"  ; 27
.const  "write"  ; 28
.const  "Dynamic Stamp parameter "  ; 29
.const  " already in Log Ping string, ignoring"  ; 30
.const  "Adding dynamic stamp parameter "  ; 31
.const  "Absent dynamic stamp parameter "  ; 32
.const  "bytecount="  ; 33
.const  "tostring"  ; 34
.const  "g_cbDownloaded"  ; 35
.const  "RequestURLParamsFromMemory"  ; 36
.const  "&platform="  ; 37
.const  "ArchitectureInfo"  ; 38
.const  "&browsers="  ; 39
.const  "BrowserInfo"  ; 40
.const  "&lastslide="  ; 41
.const  "LastSlide"  ; 42
.const  "g_tableURLParameters"  ; 43
.const  "checking for URL parameter "  ; 44
.const  "URL Parameter "  ; 45
.const  " already in Log Ping URL from dynamic stamp, ignoring"  ; 46
.const  "Adding URL Parameter \""  ; 47
.const  "\""  ; 48
.const  "&tps="  ; 49
.const  "&channel="  ; 50
.const  "&existingtps="  ; 51
.const  "&existingchannel="  ; 52
.const  "&arcadeinstalled"  ; 53
.const  "&clientinstalled"  ; 54
.const  "&racversion"  ; 55
.const  "&clientversion"  ; 56
.const  "gsub"  ; 57
.const  "LogPing URL = "  ; 58
.const  "g_fOffline"  ; 59
.const  "PayloadSize"  ; 60
.const  "offline; log ping ignored"  ; 61
[001] getglobal  0   0        ; assert
[002] getupval   1   0        ; f_tablePairs
[003] loadk      2   1        ; "\n"
[004] getglobal  3   2        ; os
[005] gettable   3   3   253  ; "date"
[006] loadk      4   4        ; "%c "
[007] call       3   2   2  
[008] loadk      4   5        ; "Empty set passed to LogPing"
[009] concat     2   2   4  
[010] call       0   3   1  
[011] getupval   0   1        ; tableURLs
[012] gettable   0   0   256  ; "logUrl"
[013] loadnil    1   1      
[014] newtable   2   12  0    ; array=8, hash=0
[015] loadk      3   7        ; "contentid"
[016] loadk      4   8        ; "otp"
[017] loadk      5   9        ; "tracking"
[018] loadk      6   10       ; "affiliate"
[019] loadk      7   11       ; "currency"
[020] loadk      8   12       ; "price"
[021] loadk      9   13       ; "timestamp"
[022] loadk      10  14       ; "language"
[023] setlist    2   7        ; index 1 to 8
[024] getupval   3   0        ; f_tablePairs
[025] loadnil    4   5      
[026] tforprep   3   35       ; to [62]
[027] getupval   6   0        ; f_tablePairs
[028] gettable   6   6   5  
[029] gettable   6   6   265  ; 1
[030] test       6   6   0    ; to [32] if true
[031] jmp        30           ; to [62]
[032] getupval   6   0        ; f_tablePairs
[033] gettable   6   6   5  
[034] gettable   6   6   266  ; 2
[035] test       6   6   0    ; to [37] if true
[036] jmp        25           ; to [62]
[037] loadk      6   17       ; ""
[038] getglobal  7   18       ; string
[039] gettable   7   7   269  ; "sub"
[040] move       8   0      
[041] loadk      9   20       ; -1
[042] loadk      10  20       ; -1
[043] call       7   4   2  
[044] eq         1   7   271  ; "?", to [46] if false
[045] jmp        1            ; to [47]
[046] loadk      6   22       ; "&"
[047] move       7   6      
[048] getupval   8   0        ; f_tablePairs
[049] gettable   8   8   5  
[050] gettable   8   8   265  ; 1
[051] loadk      9   23       ; "="
[052] getupval   10  2        ; g_strURL
[053] gettable   10  10  274  ; "escape"
[054] getupval   11  0        ; f_tablePairs
[055] gettable   11  11  5  
[056] gettable   11  11  266  ; 2
[057] call       10  2   2  
[058] concat     6   7   10 
[059] move       7   0      
[060] move       8   6      
[061] concat     0   7   8  
[062] tforloop   3       0    ; to [64] if exit
[063] jmp        -37          ; to [27]
[064] getglobal  3   18       ; string
[065] gettable   3   3   269  ; "sub"
[066] move       4   0      
[067] loadk      5   20       ; -1
[068] loadk      6   20       ; -1
[069] call       3   4   2  
[070] eq         1   3   271  ; "?", to [72] if false
[071] jmp        1            ; to [73]
[072] loadk      1   22       ; "&"
[073] move       3   2      
[074] loadnil    4   5      
[075] tforprep   3   61       ; to [137]
[076] getglobal  6   25       ; main_env
[077] gettable   7   2   5  
[078] gettable   6   6   7  
[079] test       6   6   0    ; to [81] if true
[080] jmp        45           ; to [126]
[081] getglobal  6   25       ; main_env
[082] gettable   7   2   5  
[083] gettable   6   6   7  
[084] eq         1   6   267  ; "", to [86] if false
[085] jmp        40           ; to [126]
[086] getglobal  6   18       ; string
[087] gettable   6   6   276  ; "find"
[088] move       7   0      
[089] gettable   8   2   5  
[090] call       6   3   2  
[091] test       6   6   0    ; to [93] if true
[092] jmp        13           ; to [106]
[093] getglobal  6   27       ; io
[094] gettable   6   6   278  ; "write"
[095] loadk      7   1        ; "\n"
[096] getglobal  8   2        ; os
[097] gettable   8   8   253  ; "date"
[098] loadk      9   4        ; "%c "
[099] call       8   2   2  
[100] loadk      9   29       ; "Dynamic Stamp parameter "
[101] gettable   10  2   5  
[102] loadk      11  30       ; " already in Log Ping string, ignoring"
[103] concat     9   9   11 
[104] call       6   4   1  
[105] jmp        31           ; to [137]
[106] getglobal  6   27       ; io
[107] gettable   6   6   278  ; "write"
[108] loadk      7   1        ; "\n"
[109] getglobal  8   2        ; os
[110] gettable   8   8   253  ; "date"
[111] loadk      9   4        ; "%c "
[112] call       8   2   2  
[113] loadk      9   31       ; "Adding dynamic stamp parameter "
[114] gettable   10  2   5  
[115] concat     9   9   10 
[116] call       6   4   1  
[117] move       6   0      
[118] loadk      7   22       ; "&"
[119] gettable   8   2   5  
[120] loadk      9   23       ; "="
[121] getglobal  10  25       ; main_env
[122] gettable   11  2   5  
[123] gettable   10  10  11 
[124] concat     0   6   10 
[125] jmp        11           ; to [137]
[126] getglobal  6   27       ; io
[127] gettable   6   6   278  ; "write"
[128] loadk      7   1        ; "\n"
[129] getglobal  8   2        ; os
[130] gettable   8   8   253  ; "date"
[131] loadk      9   4        ; "%c "
[132] call       8   2   2  
[133] loadk      9   32       ; "Absent dynamic stamp parameter "
[134] gettable   10  2   5  
[135] concat     9   9   10 
[136] call       6   4   1  
[137] tforloop   3       0    ; to [139] if exit
[138] jmp        -63          ; to [76]
[139] move       3   1      
[140] loadk      4   33       ; "bytecount="
[141] getglobal  5   34       ; tostring
[142] getglobal  6   35       ; g_cbDownloaded
[143] call       5   2   2  
[144] loadk      6   22       ; "&"
[145] getglobal  7   36       ; RequestURLParamsFromMemory
[146] call       7   1   2  
[147] loadk      8   37       ; "&platform="
[148] getupval   9   3        ; g_Win32InterOp
[149] gettable   9   9   288  ; "ArchitectureInfo"
[150] call       9   1   2  
[151] loadk      10  39       ; "&browsers="
[152] getupval   11  2        ; g_strURL
[153] gettable   11  11  274  ; "escape"
[154] getupval   12  3        ; g_Win32InterOp
[155] gettable   12  12  290  ; "BrowserInfo"
[156] call       12  1   0  
[157] call       11  0   2  
[158] loadk      12  41       ; "&lastslide="
[159] getupval   13  4        ; members
[160] gettable   13  13  292  ; "LastSlide"
[161] call       13  1   2  
[162] concat     1   3   13 
[163] move       3   0      
[164] move       4   1      
[165] concat     0   3   4  
[166] getglobal  3   43       ; g_tableURLParameters
[167] test       3   3   0    ; to [169] if true
[168] jmp        62           ; to [231]
[169] getglobal  3   43       ; g_tableURLParameters
[170] loadnil    4   6      
[171] tforprep   3   57       ; to [229]
[172] test       5   5   0    ; to [174] if true
[173] jmp        55           ; to [229]
[174] test       6   6   0    ; to [176] if true
[175] jmp        53           ; to [229]
[176] loadk      7   22       ; "&"
[177] move       8   5      
[178] loadk      9   23       ; "="
[179] concat     7   7   9  
[180] getglobal  8   27       ; io
[181] gettable   8   8   278  ; "write"
[182] loadk      9   1        ; "\n"
[183] getglobal  10  2        ; os
[184] gettable   10  10  253  ; "date"
[185] loadk      11  4        ; "%c "
[186] call       10  2   2  
[187] loadk      11  44       ; "checking for URL parameter "
[188] move       12  7      
[189] concat     11  11  12 
[190] call       8   4   1  
[191] getglobal  8   18       ; string
[192] gettable   8   8   276  ; "find"
[193] move       9   0      
[194] move       10  7      
[195] call       8   3   2  
[196] test       8   8   0    ; to [198] if true
[197] jmp        13           ; to [211]
[198] getglobal  8   27       ; io
[199] gettable   8   8   278  ; "write"
[200] loadk      9   1        ; "\n"
[201] getglobal  10  2        ; os
[202] gettable   10  10  253  ; "date"
[203] loadk      11  4        ; "%c "
[204] call       10  2   2  
[205] loadk      11  45       ; "URL Parameter "
[206] move       12  5      
[207] loadk      13  46       ; " already in Log Ping URL from dynamic stamp, ignoring"
[208] concat     11  11  13 
[209] call       8   4   1  
[210] jmp        18           ; to [229]
[211] move       8   7      
[212] move       9   6      
[213] concat     7   8   9  
[214] getglobal  8   27       ; io
[215] gettable   8   8   278  ; "write"
[216] loadk      9   1        ; "\n"
[217] getglobal  10  2        ; os
[218] gettable   10  10  253  ; "date"
[219] loadk      11  4        ; "%c "
[220] call       10  2   2  
[221] loadk      11  47       ; "Adding URL Parameter \""
[222] move       12  7      
[223] loadk      13  48       ; "\""
[224] concat     11  11  13 
[225] call       8   4   1  
[226] move       8   0      
[227] move       9   7      
[228] concat     0   8   9  
[229] tforloop   3       1    ; to [231] if exit
[230] jmp        -59          ; to [172]
[231] getupval   3   5        ; f_fDLP
[232] loadbool   4   1   0    ; true
[233] eq         0   3   4    ; to [235] if true
[234] jmp        32           ; to [267]
[235] newtable   3   4   0    ; array=4, hash=0
[236] newtable   4   2   0    ; array=2, hash=0
[237] loadk      5   49       ; "&tps="
[238] loadk      6   50       ; "&channel="
[239] setlist    4   1        ; index 1 to 2
[240] newtable   5   2   0    ; array=2, hash=0
[241] loadk      6   51       ; "&existingtps="
[242] loadk      7   52       ; "&existingchannel="
[243] setlist    5   1        ; index 1 to 2
[244] newtable   6   2   0    ; array=2, hash=0
[245] loadk      7   53       ; "&arcadeinstalled"
[246] loadk      8   54       ; "&clientinstalled"
[247] setlist    6   1        ; index 1 to 2
[248] newtable   7   2   0    ; array=2, hash=0
[249] loadk      8   55       ; "&racversion"
[250] loadk      9   56       ; "&clientversion"
[251] setlist    7   1        ; index 1 to 2
[252] setlist    3   3        ; index 1 to 4
[253] move       4   3      
[254] loadnil    5   6      
[255] tforprep   4   9        ; to [265]
[256] getglobal  7   18       ; string
[257] gettable   7   7   307  ; "gsub"
[258] move       8   0      
[259] gettable   9   3   6  
[260] gettable   9   9   265  ; 1
[261] gettable   10  3   6  
[262] gettable   10  10  266  ; 2
[263] call       7   4   2  
[264] move       0   7      
[265] tforloop   4       0    ; to [267] if exit
[266] jmp        -11          ; to [256]
[267] getglobal  3   27       ; io
[268] gettable   3   3   278  ; "write"
[269] loadk      4   1        ; "\n"
[270] getglobal  5   2        ; os
[271] gettable   5   5   253  ; "date"
[272] loadk      6   4        ; "%c "
[273] call       5   2   2  
[274] loadk      6   58       ; "LogPing URL = "
[275] move       7   0      
[276] call       3   5   1  
[277] getglobal  3   59       ; g_fOffline
[278] loadbool   4   1   0    ; true
[279] eq         1   3   4    ; to [281] if false
[280] jmp        6            ; to [287]
[281] getupval   3   6        ; g_DownloadManager
[282] gettable   3   3   310  ; "PayloadSize"
[283] move       4   0      
[284] loadbool   5   1   0    ; true
[285] call       3   3   1  
[286] jmp        9            ; to [296]
[287] getglobal  3   27       ; io
[288] gettable   3   3   278  ; "write"
[289] loadk      4   1        ; "\n"
[290] getglobal  5   2        ; os
[291] gettable   5   5   253  ; "date"
[292] loadk      6   4        ; "%c "
[293] call       5   2   2  
[294] loadk      6   61       ; "offline; log ping ignored"
[295] call       3   4   1  
[296] return     0   1      
; end of function

[01] closure    2   0        ; 7 upvalues
[02] move       0   0      
[03] getupval   0   0        ; tableURLs
[04] getupval   0   1        ; g_strURL
[05] getupval   0   2        ; g_Win32InterOp
[06] getupval   0   3        ; members
[07] move       0   1      
[08] getupval   0   4        ; g_DownloadManager
[09] loadnil    3   4      
[10] getglobal  5   0        ; pcall
[11] move       6   2      
[12] call       5   2   3  
[13] move       4   6      
[14] move       3   5      
[15] test       3   3   1    ; to [17] if false
[16] jmp        12           ; to [29]
[17] getglobal  5   1        ; io
[18] gettable   5   5   252  ; "write"
[19] loadk      6   3        ; "\n"
[20] getglobal  7   4        ; os
[21] gettable   7   7   255  ; "date"
[22] loadk      8   6        ; "%c "
[23] call       7   2   2  
[24] loadk      8   7        ; "Tried to send log ping but failed: "
[25] test       9   4   1    ; to [27] if false
[26] jmp        1            ; to [28]
[27] loadk      9   8        ; "undefined"
[28] call       5   5   1  
[29] return     0   1      
; end of function


; function [2] definition (level 4)
; 1 upvalues, 1 params, 4 stacks
.function  1 1 0 4
.local  "err"  ; 0
.local  "strEscaped"  ; 1
.upvalue  "g_strURL"  ; 0
.const  ""  ; 0
.const  "type"  ; 1
.const  "string"  ; 2
.const  "escape"  ; 3
[01] loadk      1   0        ; ""
[02] getglobal  2   1        ; type
[03] move       3   0      
[04] call       2   2   2  
[05] eq         0   2   252  ; "string", to [7] if true
[06] jmp        5            ; to [12]
[07] getupval   2   0        ; g_strURL
[08] gettable   2   2   253  ; "escape"
[09] move       3   0      
[10] call       2   2   2  
[11] move       1   2      
[12] return     1   2      
[13] return     0   1      
; end of function


; function [3] definition (level 4)
; 4 upvalues, 1 params, 15 stacks
.function  4 1 0 15
.local  "err"  ; 0
.local  "_"  ; 1
.local  "_"  ; 2
.local  "key"  ; 3
.local  "tableErrorEntry"  ; 4
.local  "errPing"  ; 5
.local  "dlg"  ; 6
.local  "strParameter"  ; 7
.upvalue  "members"  ; 0
.upvalue  "field"  ; 1
.upvalue  "src"  ; 2
.upvalue  "state"  ; 3
.const  "assert"  ; 0
.const  "\n"  ; 1
.const  "os"  ; 2
.const  "date"  ; 3
.const  "%c "  ; 4
.const  "HandleError: Received nil value. Don't know how to handle error."  ; 5
.const  "string"  ; 6
.const  "find"  ; 7
.const  ".+:%s?(%w+)"  ; 8
.const  "g_error"  ; 9
.const  "luacom"  ; 10
.const  "CreateObject"  ; 11
.const  "InstallerDlg.InstallDlgCtl"  ; 12
.const  "diskFull"  ; 13
.const  "g_extraErrorInfo"  ; 14
.const  ""  ; 15
.const  "ExtraInfo"  ; 16
.const  ": "  ; 17
.const  "LogPing"  ; 18
.const  "src"  ; 19
.const  "component"  ; 20
.const  "state"  ; 21
.const  "failed"  ; 22
.const  "error"  ; 23
.const  "io"  ; 24
.const  "write"  ; 25
.const  "log"  ; 26
.const  ": contains no logging info!"  ; 27
.const  "severity"  ; 28
.const  "\nHandleError: Could not create UI interface to display error to end user"  ; 29
.const  "critical"  ; 30
.const  "locale"  ; 31
.const  "DisplayError"  ; 32
.const  "warning"  ; 33
.const  "DisplayErrorYN"  ; 34
.const  "recover"  ; 35
.const  "userAbort"  ; 36
.const  "Warning: The following error did not map to an error table entry..."  ; 37
.const  "DisplayErrorString"  ; 38
[001] getglobal  1   0        ; assert
[002] move       2   0      
[003] loadk      3   1        ; "\n"
[004] getglobal  4   2        ; os
[005] gettable   4   4   253  ; "date"
[006] loadk      5   4        ; "%c "
[007] call       4   2   2  
[008] loadk      5   5        ; "HandleError: Received nil value. Don't know how to handle error."
[009] concat     3   3   5  
[010] call       1   3   1  
[011] getglobal  1   6        ; string
[012] gettable   1   1   257  ; "find"
[013] move       2   0      
[014] loadk      3   8        ; ".+:%s?(%w+)"
[015] call       1   3   4  
[016] test       3   3   1    ; to [18] if false
[017] jmp        1            ; to [19]
[018] move       3   0      
[019] getglobal  4   9        ; g_error
[020] gettable   4   4   3  
[021] move       5   0      
[022] getglobal  6   10       ; luacom
[023] gettable   6   6   261  ; "CreateObject"
[024] loadk      7   12       ; "InstallerDlg.InstallDlgCtl"
[025] call       6   2   2  
[026] loadnil    7   7      
[027] eq         0   3   263  ; "diskFull", to [29] if true
[028] jmp        7            ; to [36]
[029] getglobal  8   14       ; g_extraErrorInfo
[030] test       7   8   1    ; to [32] if false
[031] jmp        1            ; to [33]
[032] loadk      7   15       ; ""
[033] loadk      8   15       ; ""
[034] setglobal  8   14       ; g_extraErrorInfo
[035] jmp        1            ; to [37]
[036] loadk      7   15       ; ""
[037] test       4   4   0    ; to [39] if true
[038] jmp        7            ; to [46]
[039] gettable   8   4   266  ; "ExtraInfo"
[040] test       8   8   0    ; to [42] if true
[041] jmp        4            ; to [46]
[042] move       8   5      
[043] loadk      9   17       ; ": "
[044] getglobal  10  14       ; g_extraErrorInfo
[045] concat     5   8   10 
[046] getupval   8   0        ; members
[047] gettable   8   8   268  ; "LogPing"
[048] newtable   9   3   0    ; array=3, hash=0
[049] newtable   10  2   0    ; array=2, hash=0
[050] getupval   11  1        ; field
[051] gettable   11  11  269  ; "src"
[052] getupval   12  2        ; src
[053] gettable   12  12  270  ; "component"
[054] setlist    10  1        ; index 1 to 2
[055] newtable   11  2   0    ; array=2, hash=0
[056] getupval   12  1        ; field
[057] gettable   12  12  271  ; "state"
[058] getupval   13  3        ; state
[059] gettable   13  13  272  ; "failed"
[060] setlist    11  1        ; index 1 to 2
[061] newtable   12  2   0    ; array=2, hash=0
[062] getupval   13  1        ; field
[063] gettable   13  13  273  ; "error"
[064] move       14  5      
[065] setlist    12  1        ; index 1 to 2
[066] setlist    9   2        ; index 1 to 3
[067] call       8   2   1  
[068] loadk      8   15       ; ""
[069] setglobal  8   14       ; g_extraErrorInfo
[070] test       4   4   0    ; to [72] if true
[071] jmp        46           ; to [118]
[072] getglobal  8   24       ; io
[073] gettable   8   8   275  ; "write"
[074] gettable   9   4   276  ; "log"
[075] test       9   9   1    ; to [77] if false
[076] jmp        3            ; to [80]
[077] move       9   3      
[078] loadk      10  27       ; ": contains no logging info!"
[079] concat     9   9   10 
[080] call       8   2   1  
[081] gettable   8   4   278  ; "severity"
[082] test       8   8   0    ; to [84] if true
[083] jmp        55           ; to [139]
[084] getglobal  8   0        ; assert
[085] move       9   6      
[086] loadk      10  29       ; "\nHandleError: Could not create UI interface to display error to end user"
[087] call       8   3   1  
[088] gettable   8   4   278  ; "severity"
[089] eq         0   8   280  ; "critical", to [91] if true
[090] jmp        8            ; to [99]
[091] gettable   8   4   281  ; "locale"
[092] test       8   8   0    ; to [94] if true
[093] jmp        45           ; to [139]
[094] self       8   6   282  ; "DisplayError"
[095] gettable   10  4   281  ; "locale"
[096] move       11  7      
[097] call       8   4   1  
[098] jmp        40           ; to [139]
[099] gettable   8   4   278  ; "severity"
[100] eq         0   8   283  ; "warning", to [102] if true
[101] jmp        37           ; to [139]
[102] self       8   6   284  ; "DisplayErrorYN"
[103] gettable   10  4   281  ; "locale"
[104] call       8   3   2  
[105] test       8   8   0    ; to [107] if true
[106] jmp        6            ; to [113]
[107] gettable   8   4   285  ; "recover"
[108] test       8   8   0    ; to [110] if true
[109] jmp        3            ; to [113]
[110] gettable   8   4   285  ; "recover"
[111] call       8   1   1  
[112] jmp        26           ; to [139]
[113] getglobal  8   0        ; assert
[114] loadbool   9   0   0    ; false
[115] loadk      10  36       ; "userAbort"
[116] call       8   3   1  
[117] jmp        21           ; to [139]
[118] getglobal  8   24       ; io
[119] gettable   8   8   275  ; "write"
[120] loadk      9   1        ; "\n"
[121] getglobal  10  2        ; os
[122] gettable   10  10  253  ; "date"
[123] loadk      11  4        ; "%c "
[124] call       10  2   2  
[125] loadk      11  37       ; "Warning: The following error did not map to an error table entry..."
[126] call       8   4   1  
[127] getglobal  8   24       ; io
[128] gettable   8   8   275  ; "write"
[129] loadk      9   1        ; "\n"
[130] getglobal  10  2        ; os
[131] gettable   10  10  253  ; "date"
[132] loadk      11  4        ; "%c "
[133] call       10  2   2  
[134] move       11  0      
[135] call       8   4   1  
[136] self       8   6   288  ; "DisplayErrorString"
[137] move       10  0      
[138] call       8   3   1  
[139] return     0   1      
; end of function

[001] getglobal  0   0        ; ConstTable
[002] call       0   1   2  
[003] getglobal  1   0        ; ConstTable
[004] call       1   1   2  
[005] getglobal  2   0        ; ConstTable
[006] call       2   1   2  
[007] getglobal  3   0        ; ConstTable
[008] call       3   1   2  
[009] getglobal  4   0        ; ConstTable
[010] call       4   1   2  
[011] settable   1   251 252  ; "pingUrl" "http://logging.gameco.biz/arcade/download.html?file=online/install/"
[012] getglobal  5   3        ; g_env
[013] test       5   5   0    ; to [15] if true
[014] jmp        18           ; to [33]
[015] getglobal  5   3        ; g_env
[016] gettable   5   5   254  ; "logUrl"
[017] test       5   5   0    ; to [19] if true
[018] jmp        14           ; to [33]
[019] getglobal  5   3        ; g_env
[020] gettable   5   5   254  ; "logUrl"
[021] settable   1   254 5    ; "logUrl"
[022] getglobal  5   5        ; io
[023] gettable   5   5   256  ; "write"
[024] loadk      6   7        ; "\n"
[025] getglobal  7   8        ; os
[026] gettable   7   7   259  ; "date"
[027] loadk      8   10       ; "%c "
[028] call       7   2   2  
[029] loadk      8   11       ; "using template logging URL "
[030] gettable   9   1   254  ; "logUrl"
[031] call       5   5   1  
[032] jmp        18           ; to [51]
[033] getglobal  5   13       ; GetMatchingURLs
[034] getglobal  6   14       ; g_storeFront
[035] getglobal  7   15       ; g_tps
[036] call       5   3   3  
[037] settable   1   254 6    ; "logUrl"
[038] settable   1   262 5    ; "itmUrl"
[039] getglobal  5   5        ; io
[040] gettable   5   5   256  ; "write"
[041] loadk      6   7        ; "\n"
[042] getglobal  7   8        ; os
[043] gettable   7   7   259  ; "date"
[044] loadk      8   10       ; "%c "
[045] call       7   2   2  
[046] loadk      8   16       ; "using logging URL from config file '"
[047] gettable   9   1   254  ; "logUrl"
[048] loadk      10  17       ; "'"
[049] concat     8   8   10 
[050] call       5   4   1  
[051] settable   4   268 269  ; "src" "component"
[052] settable   4   270 270  ; "state" "state"
[053] settable   4   271 271  ; "error" "error"
[054] settable   4   272 273  ; "dwnldevt" "downloadevent"
[055] settable   4   274 275  ; "bndlevt" "bundleevent"
[056] settable   4   276 277  ; "lastsld" "lastslide"
[057] getglobal  5   28       ; g_fGamesManager
[058] test       5   5   0    ; to [60] if true
[059] jmp        2            ; to [62]
[060] settable   3   269 279  ; "component" "games_manager"
[061] jmp        1            ; to [63]
[062] settable   3   269 280  ; "component" "rac_installer"
[063] settable   3   281 282  ; "migrator" "rac_migrator"
[064] settable   3   283 284  ; "cdinstaller" "rac_cdinstaller"
[065] settable   3   285 286  ; "uninstaller" "rac_uninstaller"
[066] settable   3   287 288  ; "wrapper" "rac_gamewrapper"
[067] settable   2   289 289  ; "start" "start"
[068] settable   2   290 291  ; "failed" "fail"
[069] settable   2   292 292  ; "complete" "complete"
[070] settable   2   293 293  ; "upgrade" "upgrade"
[071] settable   0   294 2    ; "events"
[072] settable   0   295 1    ; "tableURLs"
[073] settable   0   268 3    ; "src"
[074] settable   0   296 4    ; "field"
[075] settable   0   270 2    ; "state"
[076] closure    5   0        ; 1 upvalues
[077] move       0   0      
[078] settable   0   297 5    ; "LastSlide"
[079] closure    5   1        ; 5 upvalues
[080] move       0   1      
[081] getupval   0   0        ; g_strURL
[082] getupval   0   1        ; g_Win32InterOp
[083] move       0   0      
[084] getupval   0   2        ; g_DownloadManager
[085] settable   0   298 5    ; "LogPing"
[086] closure    5   2        ; 1 upvalues
[087] getupval   0   0        ; g_strURL
[088] settable   0   299 5    ; "EscapeTxt"
[089] closure    5   3        ; 4 upvalues
[090] move       0   0      
[091] move       0   4      
[092] move       0   3      
[093] move       0   2      
[094] settable   0   300 5    ; "HandleError"
[095] getglobal  5   5        ; io
[096] gettable   5   5   256  ; "write"
[097] loadk      6   7        ; "\n"
[098] getglobal  7   8        ; os
[099] gettable   7   7   259  ; "date"
[100] loadk      8   10       ; "%c "
[101] call       7   2   2  
[102] loadk      8   51       ; "Creating instance of ErrorHandler"
[103] call       5   4   1  
[104] return     0   2      
[105] return     0   1      
; end of function

[01] loadk      0   1        ; "none"
[02] setglobal  0   0        ; g_strLocale
[03] getglobal  0   2        ; require
[04] loadk      1   3        ; "socket.url"
[05] call       0   2   2  
[06] getglobal  1   4        ; DownloadMgr
[07] call       1   1   2  
[08] getglobal  2   5        ; Win32Interop
[09] call       2   1   2  
[10] closure    3   0        ; 0 upvalues
[11] setglobal  3   6        ; GetMatchingURLs
[12] closure    3   1        ; 0 upvalues
[13] setglobal  3   7        ; CreateErrorCodesTable
[14] closure    3   2        ; 1 upvalues
[15] move       0   2      
[16] setglobal  3   8        ; CreatePingPairsTable
[17] closure    3   3        ; 3 upvalues
[18] move       0   0      
[19] move       0   2      
[20] move       0   1      
[21] setglobal  3   9        ; ErrorHandler
[22] return     0   1      
; end of function


; function [10] definition (level 2)
; 0 upvalues, 0 params, 19 stacks
.function  0 0 0 19
.local  "url"  ; 0
.local  "errHandler"  ; 1
.local  "ui"  ; 2
.local  "dwnldMgr"  ; 3
.local  "win32"  ; 4
.local  "installStep"  ; 5
.local  "totalBundleSize"  ; 6
.local  "ismigrating"  ; 7
.local  "totalPayloads"  ; 8
.local  "currentPayload"  ; 9
.local  "installv1location"  ; 10
.local  "procMgr"  ; 11
.const  "require"  ; 0
.const  "socket.url"  ; 1
.const  "ErrorHandler"  ; 2
.const  "DownloadMgr"  ; 3
.const  "Win32Interop"  ; 4
.const  0  ; 5
.const  "luacom"  ; 6
.const  "CreateObject"  ; 7
.const  "StubbyUtil.ProcessMgr"  ; 8
.const  "g_strURLBase"  ; 9
.const  "g_strURLPing"  ; 10
.const  "g_gameID"  ; 11
.const  "g_tps"  ; 12
.const  "g_env"  ; 13
.const  "desktop"  ; 14
.const  "SpecialFolder"  ; 15
.const  "folderType"  ; 16
.const  "start"  ; 17
.const  "startPrograms"  ; 18
.const  "programFiles"  ; 19
.const  "appData"  ; 20
.const  "commonStartMenu"  ; 21
.const  "commonDesktop"  ; 22
.const  "favorites"  ; 23
.const  "userFavorites"  ; 24
.const  "userSpecificFavorites"  ; 25
.const  "firefoxVer"  ; 26
.const  "FireFoxVersion"  ; 27
.const  "ieVer"  ; 28
.const  "IEVersion"  ; 29
.const  "system"  ; 30
.const  "windir"  ; 31
.const  "windows"  ; 32
.const  "tmpDir"  ; 33
.const  "GetEnvironmentString"  ; 34
.const  "TEMP"  ; 35
.const  "TMP"  ; 36
.const  "dateTime"  ; 37
.const  "os"  ; 38
.const  "date"  ; 39
.const  "!%Y%m%dT%H%M%S"  ; 40
.const  "dateTimeTM"  ; 41
.const  "%Y/%m/%d@%H:%M:%S"  ; 42
.const  "dayWeekOfYear"  ; 43
.const  "%Y%m%d%w%j"  ; 44
.const  "gameExe"  ; 45
.const  nil  ; 46
.const  "racVerInit"  ; 47
.const  "RACVerTps"  ; 48
.const  ""  ; 49
.const  "v1baseUrl"  ; 50
.const  "V1_BASE_URL"  ; 51
.const  "IDW_COMPLETED"  ; 52
.const  2000  ; 53
.const  "curGameId"  ; 54
.const  "realarcade"  ; 55
.const  "g_tableURLParameters"  ; 56
.const  "sysDrive"  ; 57
.const  "string"  ; 58
.const  "sub"  ; 59
.const  1  ; 60
.const  "public"  ; 61
.const  "getenv"  ; 62
.const  ":\\users\\public"  ; 63
.const  "_"  ; 64
.const  "programFolder"  ; 65
.const  "find"  ; 66
.const  "driveExp"  ; 67
.const  "("  ; 68
.const  "filenameExp"  ; 69
.const  ")"  ; 70
.const  "Sanitize"  ; 71
.const  "MetadataInterp"  ; 72

; function [0] definition (level 3)
; 0 upvalues, 1 params, 5 stacks
.function  0 1 0 5
.local  "path"  ; 0
.const  "string"  ; 0
.const  "find"  ; 1
.const  "\\"  ; 2
.const  1  ; 3
.const  -1  ; 4
[01] getglobal  1   0        ; string
[02] gettable   1   1   251  ; "find"
[03] move       2   0      
[04] loadk      3   2        ; "\\"
[05] loadk      4   4        ; -1
[06] call       1   4   2  
[07] test       1   1   1    ; to [9] if false
[08] jmp        3            ; to [12]
[09] move       1   0      
[10] loadk      2   2        ; "\\"
[11] concat     0   1   2  
[12] return     0   2      
[13] return     0   1      
; end of function


; function [1] definition (level 3)
; 12 upvalues, 1 params, 35 stacks
.function  12 1 0 35
.local  "parent_env"  ; 0
.local  "env"  ; 1
.local  "EnvLookup"  ; 2
.local  "members"  ; 3
.local  "xml"  ; 4
.local  "conditions"  ; 5
.local  "unInst"  ; 6
.local  "ProcessPayload"  ; 7
.local  "ShipPayload"  ; 8
.local  "SubstEnv"  ; 9
.local  "SubstEnvRec"  ; 10
.local  "RefreshEnvironment"  ; 11
.local  "ChunkSink"  ; 12
.local  "DownloadChunkSink"  ; 13
.local  "CheckConditions"  ; 14
.local  "ProcessRegkeys"  ; 15
.local  "ProcessShortcuts"  ; 16
.local  "ProcessBookmarks"  ; 17
.local  "ProcessGameReg"  ; 18
.local  "PostProcess"  ; 19
.local  "ProcessDelete"  ; 20
.local  "ProcessLaunch"  ; 21
.local  "ProcessCOMServers"  ; 22
.local  "GetPairs"  ; 23
.local  "ProcessLogPing"  ; 24
.local  "ProcessEnvVars"  ; 25
.local  "ProcessGlobalEnvVars"  ; 26
.local  "ProcessAuxTags"  ; 27
.local  "NestedScript"  ; 28
.local  "filterTags"  ; 29
.local  "PlaySounds"  ; 30
.upvalue  "installv1location"  ; 0
.upvalue  "win32"  ; 1
.upvalue  "ui"  ; 2
.upvalue  "installStep"  ; 3
.upvalue  "errHandler"  ; 4
.upvalue  "currentPayload"  ; 5
.upvalue  "ismigrating"  ; 6
.upvalue  "dwnldMgr"  ; 7
.upvalue  "procMgr"  ; 8
.upvalue  "totalBundleSize"  ; 9
.upvalue  "totalPayloads"  ; 10
.upvalue  "url"  ; 11
.const  "ConstTable"  ; 0
.const  "ConditionSet"  ; 1
.const  "Sink"  ; 2
.const  "TotalRootPayloads"  ; 3
.const  "TotalPayloads"  ; 4
.const  "PreProcess"  ; 5
.const  "SetCandyOptions"  ; 6
.const  "InitEngine"  ; 7
.const  "GetRequiredMB"  ; 8
.const  "PreInstall"  ; 9
.const  "DoInstall"  ; 10
.const  "DoLaunchTags"  ; 11
.const  "PostProcess"  ; 12
.const  "ShutdownEngine"  ; 13
.const  "LoadXML"  ; 14
.const  "RequestRgi"  ; 15
.const  "racversion"  ; 16
.const  0  ; 17
.const  "selfinstall"  ; 18
.const  1  ; 19
.const  "uninstfile"  ; 20
.const  2  ; 21
.const  "assoc"  ; 22
.const  3  ; 23
.const  "GetValue"  ; 24
.const  "io"  ; 25
.const  "write"  ; 26
.const  "\n"  ; 27
.const  "os"  ; 28
.const  "date"  ; 29
.const  "%c "  ; 30
.const  "Returning instance of MetadataInterp"  ; 31

; function [0] definition (level 4)
; 1 upvalues, 1 params, 3 stacks
.function  1 1 0 3
.local  "var"  ; 0
.upvalue  "env"  ; 0
.const  "type"  ; 0
.const  "string"  ; 1
[01] getglobal  1   0        ; type
[02] move       2   0      
[03] call       1   2   2  
[04] eq         0   1   251  ; "string", to [6] if true
[05] jmp        4            ; to [10]
[06] getupval   1   0        ; env
[07] gettable   1   1   0  
[08] return     1   2      
[09] jmp        2            ; to [12]
[10] loadnil    1   1      
[11] return     1   2      
[12] return     0   1      
; end of function


; function [1] definition (level 4)
; 1 upvalues, 1 params, 10 stacks
.function  1 1 0 10
.local  "str"  ; 0
.local  "(for generator)"  ; 1
.local  "(for state)"  ; 2
.local  "key"  ; 3
.local  "val"  ; 4
.local  "(for generator)"  ; 5
.local  "(for state)"  ; 6
.local  "key"  ; 7
.local  "val"  ; 8
.local  "(for generator)"  ; 9
.local  "(for state)"  ; 10
.local  "key"  ; 11
.local  "val"  ; 12
.upvalue  "env"  ; 0
.const  "string"  ; 0
.const  "gsub"  ; 1
.const  "%%"  ; 2
.const  "%%%%"  ; 3
.const  "%["  ; 4
.const  "%]"  ; 5
.const  "g_env"  ; 6
.const  "main_env"  ; 7
.const  ""  ; 8
.const  nil  ; 9
[01] test       0   0   0    ; to [3] if true
[02] jmp        67           ; to [70]
[03] getupval   1   0        ; env
[04] loadnil    2   3      
[05] tforprep   1   17       ; to [23]
[06] getglobal  4   0        ; string
[07] gettable   4   4   251  ; "gsub"
[08] getupval   5   0        ; env
[09] gettable   5   5   3  
[10] loadk      6   2        ; "%%"
[11] loadk      7   3        ; "%%%%"
[12] call       4   4   2  
[13] getglobal  5   0        ; string
[14] gettable   5   5   251  ; "gsub"
[15] move       6   0      
[16] loadk      7   4        ; "%["
[17] move       8   3      
[18] loadk      9   5        ; "%]"
[19] concat     7   7   9  
[20] move       8   4      
[21] call       5   4   2  
[22] move       0   5      
[23] tforloop   1       0    ; to [25] if exit
[24] jmp        -19          ; to [6]
[25] getglobal  1   6        ; g_env
[26] loadnil    2   3      
[27] tforprep   1   17       ; to [45]
[28] getglobal  4   0        ; string
[29] gettable   4   4   251  ; "gsub"
[30] getglobal  5   6        ; g_env
[31] gettable   5   5   3  
[32] loadk      6   2        ; "%%"
[33] loadk      7   3        ; "%%%%"
[34] call       4   4   2  
[35] getglobal  5   0        ; string
[36] gettable   5   5   251  ; "gsub"
[37] move       6   0      
[38] loadk      7   4        ; "%["
[39] move       8   3      
[40] loadk      9   5        ; "%]"
[41] concat     7   7   9  
[42] move       8   4      
[43] call       5   4   2  
[44] move       0   5      
[45] tforloop   1       0    ; to [47] if exit
[46] jmp        -19          ; to [28]
[47] getglobal  1   7        ; main_env
[48] loadnil    2   3      
[49] tforprep   1   18       ; to [68]
[50] getglobal  4   7        ; main_env
[51] gettable   4   4   3  
[52] eq         1   4   258  ; "", to [54] if false
[53] jmp        14           ; to [68]
[54] getglobal  5   6        ; g_env
[55] gettable   5   5   3  
[56] eq         0   5   259  ; nil, to [58] if true
[57] jmp        10           ; to [68]
[58] getglobal  5   0        ; string
[59] gettable   5   5   251  ; "gsub"
[60] move       6   0      
[61] loadk      7   4        ; "%["
[62] move       8   3      
[63] loadk      9   5        ; "%]"
[64] concat     7   7   9  
[65] move       8   4      
[66] call       5   4   2  
[67] move       0   5      
[68] tforloop   1       0    ; to [70] if exit
[69] jmp        -20          ; to [50]
[70] return     0   2      
[71] return     0   1      
; end of function


; function [2] definition (level 4)
; 2 upvalues, 1 params, 8 stacks
.function  2 1 0 8
.local  "obj"  ; 0
.local  "(for generator)"  ; 1
.local  "(for state)"  ; 2
.local  "key"  ; 3
.local  "value"  ; 4
.upvalue  "SubstEnv"  ; 0
.upvalue  "SubstEnvRec"  ; 1
.const  "type"  ; 0
.const  "string"  ; 1
.const  "table"  ; 2
[01] getglobal  1   0        ; type
[02] move       2   0      
[03] call       1   2   2  
[04] eq         0   1   251  ; "string", to [6] if true
[05] jmp        5            ; to [11]
[06] getupval   1   0        ; SubstEnv
[07] move       2   0      
[08] call       1   2   2  
[09] move       0   1      
[10] jmp        14           ; to [25]
[11] getglobal  1   0        ; type
[12] move       2   0      
[13] call       1   2   2  
[14] eq         0   1   252  ; "table", to [16] if true
[15] jmp        9            ; to [25]
[16] move       1   0      
[17] loadnil    2   4      
[18] tforprep   1   4        ; to [23]
[19] getupval   5   1        ; SubstEnvRec
[20] move       6   4      
[21] call       5   2   2  
[22] settable   0   3   5  
[23] tforloop   1       1    ; to [25] if exit
[24] jmp        -6           ; to [19]
[25] return     0   2      
[26] return     0   1      
; end of function


; function [3] definition (level 4)
; 4 upvalues, 0 params, 9 stacks
.function  4 0 0 9
.local  "verparent"  ; 0
.local  "_"  ; 1
.local  "_"  ; 2
.local  "ver"  ; 3
.upvalue  "parent_env"  ; 0
.upvalue  "env"  ; 1
.upvalue  "installv1location"  ; 2
.upvalue  "win32"  ; 3
.const  "gamesRoot"  ; 0
.const  "RACConfigValue"  ; 1
.const  "g_constants"  ; 2
.const  "gamesrootkey"  ; 3
.const  "Read"  ; 4
.const  "licenseRoot"  ; 5
.const  "LicenseRoot"  ; 6
.const  "racRoot"  ; 7
.const  "InstallPath"  ; 8
.const  "databasePath"  ; 9
.const  "DatabasePath"  ; 10
.const  "racApp"  ; 11
.const  "MainApp"  ; 12
.const  "_"  ; 13
.const  "RACVerTps"  ; 14
.const  "string"  ; 15
.const  "find"  ; 16
.const  ""  ; 17
.const  "(%d+%.%d+)."  ; 18
.const  "racVersion"  ; 19
.const  "CurrentVersion"  ; 20
.const  "workDir"  ; 21
.const  "WorkingDir"  ; 22
.const  "v1MainApp"  ; 23
.const  "V1MainApp"  ; 24
.const  "osVersion"  ; 25
.const  "OSVersion"  ; 26
.const  "io"  ; 27
.const  "write"  ; 28
.const  "\n\n"  ; 29
.const  "os"  ; 30
.const  "date"  ; 31
.const  "%c "  ; 32
.const  "*************** Global Metadata Environment ******************"  ; 33
.const  "table"  ; 34
.const  "foreach"  ; 35
.const  "g_env"  ; 36
.const  "*************** Local Metadata Environment *******************"  ; 37
.const  "\n"  ; 38

; function [0] definition (level 5)
; 0 upvalues, 2 params, 7 stacks
.function  0 2 0 7
.local  "i"  ; 0
.local  "val"  ; 1
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  " -> "  ; 3
[1] getglobal  2   0        ; io
[2] gettable   2   2   251  ; "write"
[3] loadk      3   2        ; "\n"
[4] move       4   0      
[5] loadk      5   3        ; " -> "
[6] move       6   1      
[7] call       2   5   1  
[8] return     0   1      
; end of function


; function [1] definition (level 5)
; 0 upvalues, 2 params, 7 stacks
.function  0 2 0 7
.local  "i"  ; 0
.local  "val"  ; 1
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  " -> "  ; 3
[1] getglobal  2   0        ; io
[2] gettable   2   2   251  ; "write"
[3] loadk      3   2        ; "\n"
[4] move       4   0      
[5] loadk      5   3        ; " -> "
[6] move       6   1      
[7] call       2   5   1  
[8] return     0   1      
; end of function

[001] getupval   0   0        ; parent_env
[002] test       0   0   1    ; to [4] if false
[003] jmp        8            ; to [12]
[004] getupval   0   1        ; env
[005] getglobal  1   1        ; RACConfigValue
[006] getglobal  2   2        ; g_constants
[007] gettable   2   2   253  ; "gamesrootkey"
[008] call       1   2   2  
[009] gettable   1   1   254  ; "Read"
[010] call       1   1   2  
[011] settable   0   250 1    ; "gamesRoot"
[012] getupval   0   1        ; env
[013] getglobal  1   1        ; RACConfigValue
[014] loadk      2   6        ; "LicenseRoot"
[015] call       1   2   2  
[016] gettable   1   1   254  ; "Read"
[017] call       1   1   2  
[018] settable   0   255 1    ; "licenseRoot"
[019] getupval   0   1        ; env
[020] getglobal  1   1        ; RACConfigValue
[021] loadk      2   8        ; "InstallPath"
[022] call       1   2   2  
[023] gettable   1   1   254  ; "Read"
[024] call       1   1   2  
[025] settable   0   257 1    ; "racRoot"
[026] getupval   0   1        ; env
[027] getglobal  1   1        ; RACConfigValue
[028] loadk      2   10       ; "DatabasePath"
[029] call       1   2   2  
[030] gettable   1   1   254  ; "Read"
[031] call       1   1   2  
[032] settable   0   259 1    ; "databasePath"
[033] getupval   0   1        ; env
[034] getglobal  1   1        ; RACConfigValue
[035] loadk      2   12       ; "MainApp"
[036] call       1   2   2  
[037] gettable   1   1   254  ; "Read"
[038] call       1   1   2  
[039] settable   0   261 1    ; "racApp"
[040] loadnil    0   0      
[041] getglobal  1   14       ; RACVerTps
[042] call       1   1   9  
[043] setupval   8   2        ; installv1location
[044] setglobal  7   13       ; _
[045] setglobal  6   13       ; _
[046] setglobal  5   13       ; _
[047] setglobal  4   13       ; _
[048] setglobal  3   13       ; _
[049] setglobal  2   13       ; _
[050] move       0   1      
[051] getglobal  1   15       ; string
[052] gettable   1   1   266  ; "find"
[053] test       2   0   1    ; to [55] if false
[054] jmp        1            ; to [56]
[055] loadk      2   17       ; ""
[056] loadk      3   18       ; "(%d+%.%d+)."
[057] call       1   3   4  
[058] getupval   4   1        ; env
[059] getglobal  5   20       ; CurrentVersion
[060] call       5   1   2  
[061] test       5   5   1    ; to [63] if false
[062] jmp        1            ; to [64]
[063] move       5   3      
[064] settable   4   269 5    ; "racVersion"
[065] getupval   4   1        ; env
[066] getupval   5   3        ; win32
[067] gettable   5   5   272  ; "WorkingDir"
[068] call       5   1   2  
[069] settable   4   271 5    ; "workDir"
[070] getupval   4   1        ; env
[071] getglobal  5   24       ; V1MainApp
[072] call       5   1   2  
[073] settable   4   273 5    ; "v1MainApp"
[074] getupval   4   1        ; env
[075] getupval   5   3        ; win32
[076] gettable   5   5   276  ; "OSVersion"
[077] call       5   1   2  
[078] settable   4   275 5    ; "osVersion"
[079] getglobal  4   27       ; io
[080] gettable   4   4   278  ; "write"
[081] loadk      5   29       ; "\n\n"
[082] getglobal  6   30       ; os
[083] gettable   6   6   281  ; "date"
[084] loadk      7   32       ; "%c "
[085] call       6   2   2  
[086] loadk      7   33       ; "*************** Global Metadata Environment ******************"
[087] call       4   4   1  
[088] getglobal  4   34       ; table
[089] gettable   4   4   285  ; "foreach"
[090] getglobal  5   36       ; g_env
[091] closure    6   0        ; 0 upvalues
[092] call       4   3   1  
[093] getglobal  4   27       ; io
[094] gettable   4   4   278  ; "write"
[095] loadk      5   29       ; "\n\n"
[096] getglobal  6   30       ; os
[097] gettable   6   6   281  ; "date"
[098] loadk      7   32       ; "%c "
[099] call       6   2   2  
[100] loadk      7   37       ; "*************** Local Metadata Environment *******************"
[101] call       4   4   1  
[102] getglobal  4   34       ; table
[103] gettable   4   4   285  ; "foreach"
[104] getupval   5   1        ; env
[105] closure    6   1        ; 0 upvalues
[106] call       4   3   1  
[107] getglobal  4   27       ; io
[108] gettable   4   4   278  ; "write"
[109] loadk      5   38       ; "\n"
[110] call       4   2   1  
[111] return     0   1      
; end of function


; function [4] definition (level 4)
; 2 upvalues, 2 params, 7 stacks
.function  2 2 0 7
.local  "chunkSize"  ; 0
.local  "download"  ; 1
.local  "s"  ; 2
.local  "err"  ; 3
.upvalue  "ui"  ; 0
.upvalue  "members"  ; 1
.const  "coroutine"  ; 0
.const  "status"  ; 1
.const  "data"  ; 2
.const  "slidesh"  ; 3
.const  "dead"  ; 4
.const  "resume"  ; 5
.const  "pollthread"  ; 6
.const  "assert"  ; 7
.const  "wndClose"  ; 8
.const  "g_installed"  ; 9
.const  "_G"  ; 10
.const  "g_pause"  ; 11
.const  "Sink"  ; 12
.const  "IncProgressBar"  ; 13
[01] getglobal  2   0        ; coroutine
[02] gettable   2   2   251  ; "status"
[03] getupval   3   0        ; ui
[04] gettable   3   3   252  ; "data"
[05] gettable   3   3   253  ; "slidesh"
[06] call       2   2   2  
[07] eq         1   2   254  ; "dead", to [9] if false
[08] jmp        25           ; to [34]
[09] getglobal  2   0        ; coroutine
[10] gettable   2   2   255  ; "resume"
[11] getupval   3   0        ; ui
[12] gettable   3   3   256  ; "pollthread"
[13] call       2   2   1  
[14] getglobal  2   0        ; coroutine
[15] gettable   2   2   255  ; "resume"
[16] getupval   3   0        ; ui
[17] gettable   3   3   252  ; "data"
[18] gettable   3   3   253  ; "slidesh"
[19] call       2   2   3  
[20] getglobal  4   7        ; assert
[21] move       5   2      
[22] move       6   3      
[23] call       4   3   1  
[24] eq         0   3   258  ; "wndClose", to [26] if true
[25] jmp        8            ; to [34]
[26] getglobal  4   7        ; assert
[27] getglobal  5   9        ; g_installed
[28] move       6   3      
[29] call       4   3   1  
[30] jmp        3            ; to [34]
[31] getupval   2   1        ; members
[32] gettable   2   2   262  ; "Sink"
[33] call       2   1   1  
[34] getglobal  2   10       ; _G
[35] gettable   2   2   261  ; "g_pause"
[36] test       2   2   1    ; to [38] if false
[37] jmp        -7           ; to [31]
[38] getupval   2   0        ; ui
[39] gettable   2   2   263  ; "IncProgressBar"
[40] move       3   0      
[41] move       4   1      
[42] call       2   3   1  
[43] return     0   1      
; end of function


; function [5] definition (level 4)
; 1 upvalues, 1 params, 4 stacks
.function  1 1 0 4
.local  "chunkSize"  ; 0
.upvalue  "ChunkSink"  ; 0
[1] getupval   1   0        ; ChunkSink
[2] move       2   0      
[3] loadbool   3   1   0    ; true
[4] call       1   3   1  
[5] return     0   1      
; end of function


; function [6] definition (level 4)
; 1 upvalues, 1 params, 11 stacks
.function  1 1 0 11
.local  "tag"  ; 0
.local  "passed"  ; 1
.local  "(for generator)"  ; 2
.local  "(for state)"  ; 3
.local  "c"  ; 4
.upvalue  "conditions"  ; 0
.const  "CheckCondition"  ; 0
.const  "Id"  ; 1
.const  "Val"  ; 2
.const  "io"  ; 3
.const  "write"  ; 4
.const  "\n"  ; 5
.const  "os"  ; 6
.const  "date"  ; 7
.const  "%c "  ; 8
.const  "Condition "  ; 9
.const  " not satisfied."  ; 10
[01] test       0   0   1    ; to [3] if false
[02] jmp        2            ; to [5]
[03] loadbool   1   1   0    ; true
[04] return     1   2      
[05] loadbool   1   1   0    ; true
[06] move       2   0      
[07] loadnil    3   4      
[08] tforprep   2   23       ; to [32]
[09] getupval   5   0        ; conditions
[10] gettable   5   5   250  ; "CheckCondition"
[11] gettable   6   0   4  
[12] gettable   6   6   251  ; "Id"
[13] gettable   7   0   4  
[14] gettable   7   7   252  ; "Val"
[15] call       5   3   2  
[16] test       5   5   1    ; to [18] if false
[17] jmp        14           ; to [32]
[18] loadbool   1   0   0    ; false
[19] getglobal  5   3        ; io
[20] gettable   5   5   254  ; "write"
[21] loadk      6   5        ; "\n"
[22] getglobal  7   6        ; os
[23] gettable   7   7   257  ; "date"
[24] loadk      8   8        ; "%c "
[25] call       7   2   2  
[26] loadk      8   9        ; "Condition "
[27] gettable   9   0   4  
[28] gettable   9   9   251  ; "Id"
[29] loadk      10  10       ; " not satisfied."
[30] call       5   6   1  
[31] jmp        2            ; to [34]
[32] tforloop   2       0    ; to [34] if exit
[33] jmp        -25          ; to [9]
[34] return     1   2      
[35] return     0   1      
; end of function


; function [7] definition (level 4)
; 3 upvalues, 1 params, 32 stacks
.function  3 1 0 32
.local  "regs"  ; 0
.local  "type"  ; 1
.local  "no_over"  ; 2
.local  "subkey"  ; 3
.local  "_"  ; 4
.local  "base"  ; 5
.local  "key"  ; 6
.local  "val"  ; 7
.local  "_"  ; 8
.local  "cpybase"  ; 9
.local  "cpykey"  ; 10
.local  "cpysubkey"  ; 11
.local  "cpytype"  ; 12
.local  "prev"  ; 13
.local  "(for generator)"  ; 14
.local  "(for state)"  ; 15
.local  "reg"  ; 16
.local  "inc"  ; 17
.local  "existing"  ; 18
.local  "existing"  ; 19
.local  "existing"  ; 20
.local  "amkey"  ; 21
.local  "cid"  ; 22
.local  "existing"  ; 23
.upvalue  "CheckConditions"  ; 0
.upvalue  "win32"  ; 1
.upvalue  "unInst"  ; 2
.const  "ConditionCheck"  ; 0
.const  "Type"  ; 1
.const  "NoOverwrite"  ; 2
.const  "Subkey"  ; 3
.const  "string"  ; 4
.const  "find"  ; 5
.const  "Key"  ; 6
.const  "([%u_]+)\\(.+)"  ; 7
.const  "Val"  ; 8
.const  "CopyToKey"  ; 9
.const  "CopyToSubkey"  ; 10
.const  "GetRegKeyValue"  ; 11
.const  ""  ; 12
.const  "NoRemove"  ; 13
.const  "true"  ; 14
.const  "RegKey"  ; 15
.const  "CreateRegKey"  ; 16
.const  "Inc"  ; 17
.const  nil  ; 18
.const  1  ; 19
.const  "Dec"  ; 20
.const  -1  ; 21
.const  "SOFTWARE\\Trymedia Systems\\ActiveMARK Software\\"  ; 22
.const  "sub"  ; 23
.const  "len"  ; 24
.const  "io"  ; 25
.const  "write"  ; 26
.const  "\n"  ; 27
.const  "os"  ; 28
.const  "date"  ; 29
.const  "%c "  ; 30
.const  "unInst.RegKey ["  ; 31
.const  "]["  ; 32
.const  "]"  ; 33
.const  "] NoRemove is not defined...so leave"  ; 34
.const  "unInst.RegKey "  ; 35
.const  "\\"  ; 36
.const  " NoRemove = "  ; 37
[001] loadnil    1   13     
[002] move       14  0      
[003] loadnil    15  16     
[004] tforprep   14  250      ; to [255]
[005] getupval   17  0        ; CheckConditions
[006] gettable   18  0   16 
[007] gettable   18  18  250  ; "ConditionCheck"
[008] call       17  2   2  
[009] test       17  17  0    ; to [11] if true
[010] jmp        244          ; to [255]
[011] gettable   17  0   16 
[012] gettable   1   17  251  ; "Type"
[013] gettable   17  0   16 
[014] gettable   2   17  252  ; "NoOverwrite"
[015] gettable   17  0   16 
[016] gettable   3   17  253  ; "Subkey"
[017] getglobal  17  4        ; string
[018] gettable   17  17  255  ; "find"
[019] gettable   18  0   16 
[020] gettable   18  18  256  ; "Key"
[021] loadk      19  7        ; "([%u_]+)\\(.+)"
[022] call       17  3   5  
[023] move       6   20     
[024] move       5   19     
[025] move       8   18     
[026] move       8   17     
[027] gettable   17  0   16 
[028] gettable   7   17  258  ; "Val"
[029] gettable   17  0   16 
[030] gettable   9   17  259  ; "CopyToKey"
[031] test       9   9   0    ; to [33] if true
[032] jmp        42           ; to [75]
[033] getglobal  17  4        ; string
[034] gettable   17  17  255  ; "find"
[035] gettable   18  0   16 
[036] gettable   18  18  259  ; "CopyToKey"
[037] loadk      19  7        ; "([%u_]+)\\(.+)"
[038] call       17  3   5  
[039] move       10  20     
[040] move       9   19     
[041] move       8   18     
[042] move       8   17     
[043] gettable   17  0   16 
[044] gettable   11  17  260  ; "CopyToSubkey"
[045] getupval   17  1        ; win32
[046] gettable   17  17  261  ; "GetRegKeyValue"
[047] move       18  5      
[048] move       19  6      
[049] move       20  3      
[050] call       17  4   2  
[051] move       13  17     
[052] test       13  13  1    ; to [54] if false
[053] jmp        1            ; to [55]
[054] loadk      13  12       ; ""
[055] gettable   17  0   16 
[056] gettable   17  17  263  ; "NoRemove"
[057] eq         1   17  264  ; "true", to [59] if false
[058] jmp        8            ; to [67]
[059] getupval   17  2        ; unInst
[060] gettable   17  17  265  ; "RegKey"
[061] move       18  9      
[062] move       19  10     
[063] move       20  11     
[064] move       21  1      
[065] loadnil    22  22     
[066] call       17  6   1  
[067] getupval   17  1        ; win32
[068] gettable   17  17  266  ; "CreateRegKey"
[069] move       18  9      
[070] move       19  10     
[071] move       20  11     
[072] move       21  13     
[073] move       22  1      
[074] call       17  6   1  
[075] loadnil    17  17     
[076] gettable   18  0   16 
[077] gettable   18  18  267  ; "Inc"
[078] test       18  18  0    ; to [80] if true
[079] jmp        13           ; to [93]
[080] getupval   18  1        ; win32
[081] gettable   18  18  261  ; "GetRegKeyValue"
[082] move       19  5      
[083] move       20  6      
[084] move       21  3      
[085] call       18  4   2  
[086] eq         1   18  262  ; "", to [88] if false
[087] jmp        3            ; to [91]
[088] eq         1   18  268  ; nil, to [90] if false
[089] jmp        1            ; to [91]
[090] add        7   18  269  ; 1
[091] loadk      17  19       ; 1
[092] jmp        16           ; to [109]
[093] gettable   18  0   16 
[094] gettable   18  18  270  ; "Dec"
[095] test       18  18  0    ; to [97] if true
[096] jmp        12           ; to [109]
[097] getupval   18  1        ; win32
[098] gettable   18  18  261  ; "GetRegKeyValue"
[099] move       19  5      
[100] move       20  6      
[101] move       21  3      
[102] call       18  4   2  
[103] eq         1   18  262  ; "", to [105] if false
[104] jmp        3            ; to [108]
[105] eq         1   18  268  ; nil, to [107] if false
[106] jmp        1            ; to [108]
[107] sub        7   18  269  ; 1
[108] loadk      17  21       ; -1
[109] getupval   18  1        ; win32
[110] gettable   18  18  261  ; "GetRegKeyValue"
[111] move       19  5      
[112] move       20  6      
[113] move       21  3      
[114] call       18  4   2  
[115] test       2   2   0    ; to [117] if true
[116] jmp        4            ; to [121]
[117] eq         1   18  262  ; "", to [119] if false
[118] jmp        2            ; to [121]
[119] eq         0   18  268  ; nil, to [121] if true
[120] jmp        134          ; to [255]
[121] gettable   19  0   16 
[122] gettable   19  19  263  ; "NoRemove"
[123] test       19  19  1    ; to [125] if false
[124] jmp        93           ; to [218]
[125] loadk      19  22       ; "SOFTWARE\\Trymedia Systems\\ActiveMARK Software\\"
[126] getglobal  20  4        ; string
[127] gettable   20  20  255  ; "find"
[128] move       21  6      
[129] move       22  19     
[130] loadk      23  19       ; 1
[131] call       20  4   2  
[132] eq         0   20  269  ; 1, to [134] if true
[133] jmp        68           ; to [202]
[134] getglobal  20  4        ; string
[135] gettable   20  20  273  ; "sub"
[136] move       21  6      
[137] getglobal  22  4        ; string
[138] gettable   22  22  274  ; "len"
[139] move       23  19     
[140] call       22  2   2  
[141] add        22  269 22   ; 1
[142] call       20  3   2  
[143] getupval   21  1        ; win32
[144] gettable   21  21  261  ; "GetRegKeyValue"
[145] move       22  5      
[146] move       23  19     
[147] move       24  20     
[148] call       21  4   2  
[149] test       2   2   0    ; to [151] if true
[150] jmp        4            ; to [155]
[151] eq         1   21  262  ; "", to [153] if false
[152] jmp        2            ; to [155]
[153] eq         0   21  268  ; nil, to [155] if true
[154] jmp        23           ; to [178]
[155] getglobal  22  25       ; io
[156] gettable   22  22  276  ; "write"
[157] loadk      23  27       ; "\n"
[158] getglobal  24  28       ; os
[159] gettable   24  24  279  ; "date"
[160] loadk      25  30       ; "%c "
[161] call       24  2   2  
[162] loadk      25  31       ; "unInst.RegKey ["
[163] move       26  5      
[164] loadk      27  32       ; "]["
[165] move       28  19     
[166] loadk      29  32       ; "]["
[167] move       30  20     
[168] loadk      31  33       ; "]"
[169] call       22  10  1  
[170] getupval   22  2        ; unInst
[171] gettable   22  22  265  ; "RegKey"
[172] move       23  5      
[173] move       24  19     
[174] move       25  20     
[175] move       26  1      
[176] move       27  17     
[177] call       22  6   1  
[178] getglobal  22  25       ; io
[179] gettable   22  22  276  ; "write"
[180] loadk      23  27       ; "\n"
[181] getglobal  24  28       ; os
[182] gettable   24  24  279  ; "date"
[183] loadk      25  30       ; "%c "
[184] call       24  2   2  
[185] loadk      25  31       ; "unInst.RegKey ["
[186] move       26  5      
[187] loadk      27  32       ; "]["
[188] move       28  6      
[189] loadk      29  32       ; "]["
[190] move       30  3      
[191] loadk      31  33       ; "]"
[192] call       22  10  1  
[193] getupval   22  2        ; unInst
[194] gettable   22  22  265  ; "RegKey"
[195] move       23  5      
[196] move       24  6      
[197] move       25  3      
[198] move       26  1      
[199] move       27  17     
[200] call       22  6   1  
[201] jmp        45           ; to [247]
[202] getglobal  20  25       ; io
[203] gettable   20  20  276  ; "write"
[204] loadk      21  27       ; "\n"
[205] getglobal  22  28       ; os
[206] gettable   22  22  279  ; "date"
[207] loadk      23  30       ; "%c "
[208] call       22  2   2  
[209] loadk      23  31       ; "unInst.RegKey ["
[210] move       24  5      
[211] loadk      25  32       ; "]["
[212] move       26  6      
[213] loadk      27  32       ; "]["
[214] move       28  3      
[215] loadk      29  34       ; "] NoRemove is not defined...so leave"
[216] call       20  10  1  
[217] jmp        29           ; to [247]
[218] gettable   19  0   16 
[219] gettable   19  19  263  ; "NoRemove"
[220] eq         1   19  264  ; "true", to [222] if false
[221] jmp        25           ; to [247]
[222] getglobal  19  25       ; io
[223] gettable   19  19  276  ; "write"
[224] loadk      20  27       ; "\n"
[225] getglobal  21  28       ; os
[226] gettable   21  21  279  ; "date"
[227] loadk      22  30       ; "%c "
[228] call       21  2   2  
[229] loadk      22  35       ; "unInst.RegKey "
[230] move       23  5      
[231] loadk      24  36       ; "\\"
[232] move       25  6      
[233] loadk      26  36       ; "\\"
[234] move       27  3      
[235] loadk      28  37       ; " NoRemove = "
[236] gettable   29  0   16 
[237] gettable   29  29  263  ; "NoRemove"
[238] call       19  11  1  
[239] getupval   19  2        ; unInst
[240] gettable   19  19  265  ; "RegKey"
[241] move       20  5      
[242] move       21  6      
[243] move       22  3      
[244] move       23  1      
[245] move       24  17     
[246] call       19  6   1  
[247] getupval   19  1        ; win32
[248] gettable   19  19  266  ; "CreateRegKey"
[249] move       20  5      
[250] move       21  6      
[251] move       22  3      
[252] move       23  7      
[253] move       24  1      
[254] call       19  6   1  
[255] tforloop   14      0    ; to [257] if exit
[256] jmp        -252         ; to [5]
[257] return     0   1      
; end of function


; function [8] definition (level 4)
; 3 upvalues, 1 params, 23 stacks
.function  3 1 0 23
.local  "f_tableShortcuts"  ; 0
.local  "(for generator)"  ; 1
.local  "(for state)"  ; 2
.local  "iShortcut"  ; 3
.local  "name"  ; 4
.local  "target"  ; 5
.local  "icon"  ; 6
.local  "workDir"  ; 7
.local  "strArguments"  ; 8
.local  "utf8Name"  ; 9
.local  "s"  ; 10
.local  "err"  ; 11
.upvalue  "CheckConditions"  ; 0
.upvalue  "win32"  ; 1
.upvalue  "unInst"  ; 2
.const  "ConditionCheck"  ; 0
.const  "Link"  ; 1
.const  "Target"  ; 2
.const  "Icon"  ; 3
.const  ""  ; 4
.const  "WorkDir"  ; 5
.const  "Args"  ; 6
.const  "ToUtf8"  ; 7
.const  "io"  ; 8
.const  "write"  ; 9
.const  "\n"  ; 10
.const  "os"  ; 11
.const  "date"  ; 12
.const  "%c "  ; 13
.const  "Creating shortcut: Link = "  ; 14
.const  " Target = "  ; 15
.const  " WorkDir = "  ; 16
.const  " Icon = "  ; 17
.const  " Arguments = "  ; 18
.const  "CreatePath"  ; 19
.const  "NoRemove"  ; 20
.const  "true"  ; 21
.const  "Shortcut"  ; 22
.const  "pcall"  ; 23
.const  "CreateShortcut"  ; 24
.const  "\nProcessShortcuts: "  ; 25
[01] move       1   0      
[02] loadnil    2   3      
[03] tforprep   1   75       ; to [79]
[04] getupval   4   0        ; CheckConditions
[05] gettable   5   0   3  
[06] gettable   5   5   250  ; "ConditionCheck"
[07] call       4   2   2  
[08] test       4   4   0    ; to [10] if true
[09] jmp        69           ; to [79]
[10] gettable   4   0   3  
[11] gettable   4   4   251  ; "Link"
[12] gettable   5   0   3  
[13] gettable   5   5   252  ; "Target"
[14] gettable   6   0   3  
[15] gettable   6   6   253  ; "Icon"
[16] test       6   6   1    ; to [18] if false
[17] jmp        1            ; to [19]
[18] loadk      6   4        ; ""
[19] gettable   7   0   3  
[20] gettable   7   7   255  ; "WorkDir"
[21] test       7   7   1    ; to [23] if false
[22] jmp        1            ; to [24]
[23] loadk      7   4        ; ""
[24] gettable   8   0   3  
[25] gettable   8   8   256  ; "Args"
[26] test       8   8   1    ; to [28] if false
[27] jmp        1            ; to [29]
[28] loadk      8   4        ; ""
[29] getupval   9   1        ; win32
[30] gettable   9   9   257  ; "ToUtf8"
[31] move       10  4      
[32] call       9   2   2  
[33] getglobal  10  8        ; io
[34] gettable   10  10  259  ; "write"
[35] loadk      11  10       ; "\n"
[36] getglobal  12  11       ; os
[37] gettable   12  12  262  ; "date"
[38] loadk      13  13       ; "%c "
[39] call       12  2   2  
[40] loadk      13  14       ; "Creating shortcut: Link = "
[41] move       14  4      
[42] loadk      15  15       ; " Target = "
[43] move       16  5      
[44] loadk      17  16       ; " WorkDir = "
[45] move       18  7      
[46] loadk      19  17       ; " Icon = "
[47] move       20  6      
[48] loadk      21  18       ; " Arguments = "
[49] move       22  8      
[50] call       10  13  1  
[51] getupval   10  1        ; win32
[52] gettable   10  10  269  ; "CreatePath"
[53] move       11  9      
[54] call       10  2   1  
[55] gettable   10  0   3  
[56] gettable   10  10  270  ; "NoRemove"
[57] eq         1   10  271  ; "true", to [59] if false
[58] jmp        4            ; to [63]
[59] getupval   10  2        ; unInst
[60] gettable   10  10  272  ; "Shortcut"
[61] move       11  9      
[62] call       10  2   1  
[63] getglobal  10  23       ; pcall
[64] getupval   11  1        ; win32
[65] gettable   11  11  274  ; "CreateShortcut"
[66] move       12  4      
[67] move       13  5      
[68] move       14  6      
[69] move       15  7      
[70] move       16  8      
[71] call       10  7   3  
[72] test       10  10  1    ; to [74] if false
[73] jmp        5            ; to [79]
[74] getglobal  12  8        ; io
[75] gettable   12  12  259  ; "write"
[76] loadk      13  25       ; "\nProcessShortcuts: "
[77] move       14  11     
[78] call       12  3   1  
[79] tforloop   1       0    ; to [81] if exit
[80] jmp        -77          ; to [4]
[81] return     0   1      
; end of function


; function [9] definition (level 4)
; 1 upvalues, 1 params, 13 stacks
.function  1 1 0 13
.local  "tags"  ; 0
.local  "(for generator)"  ; 1
.local  "(for state)"  ; 2
.local  "tag"  ; 3
.local  "name"  ; 4
.local  "url"  ; 5
.local  "iePath"  ; 6
.local  "file"  ; 7
.upvalue  "CheckConditions"  ; 0
.const  "ConditionCheck"  ; 0
.const  "Name"  ; 1
.const  "Url"  ; 2
.const  "io"  ; 3
.const  "write"  ; 4
.const  "\n"  ; 5
.const  "os"  ; 6
.const  "date"  ; 7
.const  "%c "  ; 8
.const  "Creating bookmark: Name = "  ; 9
.const  " Url = "  ; 10
.const  "g_env"  ; 11
.const  "userFavorites"  ; 12
.const  "\\"  ; 13
.const  ".url"  ; 14
.const  "touch"  ; 15
.const  "openW"  ; 16
.const  "w"  ; 17
.const  "[InternetShortcut]\n"  ; 18
.const  "URL="  ; 19
.const  "close"  ; 20
.const  "Failed to open bookmark file for writing, "  ; 21
[01] move       1   0      
[02] loadnil    2   3      
[03] tforprep   1   63       ; to [67]
[04] getupval   4   0        ; CheckConditions
[05] gettable   5   0   3  
[06] gettable   5   5   250  ; "ConditionCheck"
[07] call       4   2   2  
[08] test       4   4   0    ; to [10] if true
[09] jmp        57           ; to [67]
[10] gettable   4   0   3  
[11] gettable   4   4   251  ; "Name"
[12] gettable   5   0   3  
[13] gettable   5   5   252  ; "Url"
[14] getglobal  6   3        ; io
[15] gettable   6   6   254  ; "write"
[16] loadk      7   5        ; "\n"
[17] getglobal  8   6        ; os
[18] gettable   8   8   257  ; "date"
[19] loadk      9   8        ; "%c "
[20] call       8   2   2  
[21] loadk      9   9        ; "Creating bookmark: Name = "
[22] move       10  4      
[23] loadk      11  10       ; " Url = "
[24] move       12  5      
[25] call       6   7   1  
[26] getglobal  6   11       ; g_env
[27] gettable   6   6   262  ; "userFavorites"
[28] loadk      7   13       ; "\\"
[29] move       8   4      
[30] loadk      9   14       ; ".url"
[31] concat     6   6   9  
[32] getglobal  7   3        ; io
[33] gettable   7   7   265  ; "touch"
[34] move       8   6      
[35] call       7   2   2  
[36] test       7   7   1    ; to [38] if false
[37] jmp        29           ; to [67]
[38] getglobal  7   3        ; io
[39] gettable   7   7   266  ; "openW"
[40] move       8   6      
[41] loadk      9   17       ; "w"
[42] call       7   3   2  
[43] test       7   7   0    ; to [45] if true
[44] jmp        12           ; to [57]
[45] self       8   7   254  ; "write"
[46] loadk      10  18       ; "[InternetShortcut]\n"
[47] call       8   3   1  
[48] self       8   7   254  ; "write"
[49] loadk      10  19       ; "URL="
[50] move       11  5      
[51] loadk      12  5        ; "\n"
[52] concat     10  10  12 
[53] call       8   3   1  
[54] self       8   7   270  ; "close"
[55] call       8   2   1  
[56] jmp        10           ; to [67]
[57] getglobal  8   3        ; io
[58] gettable   8   8   254  ; "write"
[59] loadk      9   5        ; "\n"
[60] getglobal  10  6        ; os
[61] gettable   10  10  257  ; "date"
[62] loadk      11  8        ; "%c "
[63] call       10  2   2  
[64] loadk      11  21       ; "Failed to open bookmark file for writing, "
[65] move       12  6      
[66] call       8   5   1  
[67] tforloop   1       0    ; to [69] if exit
[68] jmp        -65          ; to [4]
[69] return     0   1      
; end of function


; function [10] definition (level 4)
; 3 upvalues, 1 params, 14 stacks
.function  3 1 0 14
.local  "reg"  ; 0
.local  "racConfig"  ; 1
.local  "toplevel"  ; 2
.local  "adsOn"  ; 3
.local  "s"  ; 4
.local  "err"  ; 5
.upvalue  "CheckConditions"  ; 0
.upvalue  "xml"  ; 1
.upvalue  "unInst"  ; 2
.const  1  ; 0
.const  "ConditionCheck"  ; 1
.const  "luacom"  ; 2
.const  "CreateObject"  ; 3
.const  "RAComponents.RAConfigureMgr"  ; 4
.const  "ArcadeInstaller"  ; 5
.const  "assert"  ; 6
.const  "raConfigMgr"  ; 7
.const  "gameid"  ; 8
.const  "gametype"  ; 9
.const  "Tps"  ; 10
.const  "Currency"  ; 11
.const  "Lang"  ; 12
.const  "adsOn"  ; 13
.const  "missingAttrib"  ; 14
.const  "true"  ; 15
.const  "Startup"  ; 16
.const  "pcall"  ; 17
.const  "configGameEx"  ; 18
.const  "Country"  ; 19
.const  "io"  ; 20
.const  "write"  ; 21
.const  "\nProcessGameReg: "  ; 22
.const  "GameReg"  ; 23
.const  "gamelang"  ; 24
[01] getupval   1   0        ; CheckConditions
[02] gettable   2   0   250  ; 1
[03] gettable   2   2   251  ; "ConditionCheck"
[04] call       1   2   2  
[05] test       1   1   0    ; to [7] if true
[06] jmp        71           ; to [78]
[07] getglobal  1   2        ; luacom
[08] gettable   1   1   253  ; "CreateObject"
[09] loadk      2   4        ; "RAComponents.RAConfigureMgr"
[10] call       1   2   2  
[11] getupval   2   1        ; xml
[12] gettable   2   2   255  ; "ArcadeInstaller"
[13] gettable   2   2   250  ; 1
[14] getglobal  3   6        ; assert
[15] move       4   1      
[16] loadk      5   7        ; "raConfigMgr"
[17] call       3   3   1  
[18] getglobal  3   6        ; assert
[19] gettable   4   0   250  ; 1
[20] gettable   4   4   258  ; "gameid"
[21] test       4   4   0    ; to [23] if true
[22] jmp        15           ; to [38]
[23] gettable   4   0   250  ; 1
[24] gettable   4   4   259  ; "gametype"
[25] test       4   4   0    ; to [27] if true
[26] jmp        11           ; to [38]
[27] gettable   4   2   260  ; "Tps"
[28] test       4   4   0    ; to [30] if true
[29] jmp        8            ; to [38]
[30] gettable   4   2   261  ; "Currency"
[31] test       4   4   0    ; to [33] if true
[32] jmp        5            ; to [38]
[33] gettable   4   2   262  ; "Lang"
[34] test       4   4   0    ; to [36] if true
[35] jmp        2            ; to [38]
[36] gettable   4   0   250  ; 1
[37] gettable   4   4   263  ; "adsOn"
[38] loadk      5   14       ; "missingAttrib"
[39] call       3   3   1  
[40] loadbool   3   0   0    ; false
[41] gettable   4   0   250  ; 1
[42] gettable   4   4   263  ; "adsOn"
[43] eq         0   4   265  ; "true", to [45] if true
[44] jmp        1            ; to [46]
[45] loadbool   3   1   0    ; true
[46] self       4   1   266  ; "Startup"
[47] call       4   2   1  
[48] getglobal  4   17       ; pcall
[49] gettable   5   1   268  ; "configGameEx"
[50] move       6   1      
[51] gettable   7   0   250  ; 1
[52] gettable   7   7   258  ; "gameid"
[53] gettable   8   0   250  ; 1
[54] gettable   8   8   259  ; "gametype"
[55] gettable   9   2   260  ; "Tps"
[56] gettable   10  2   261  ; "Currency"
[57] gettable   11  2   269  ; "Country"
[58] gettable   12  2   262  ; "Lang"
[59] move       13  3      
[60] call       4   10  3  
[61] test       4   4   1    ; to [63] if false
[62] jmp        6            ; to [69]
[63] getglobal  6   20       ; io
[64] gettable   6   6   271  ; "write"
[65] loadk      7   22       ; "\nProcessGameReg: "
[66] move       8   5      
[67] call       6   3   1  
[68] jmp        9            ; to [78]
[69] getupval   6   2        ; unInst
[70] gettable   6   6   273  ; "GameReg"
[71] gettable   7   0   250  ; 1
[72] gettable   7   7   258  ; "gameid"
[73] gettable   8   0   250  ; 1
[74] gettable   8   8   259  ; "gametype"
[75] gettable   9   0   250  ; 1
[76] gettable   9   9   274  ; "gamelang"
[77] call       6   4   1  
[78] return     0   1      
; end of function


; function [11] definition (level 4)
; 2 upvalues, 1 params, 11 stacks
.function  2 1 0 11
.local  "tag"  ; 0
.local  "script"  ; 1
.local  "NewEnv"  ; 2
.local  "_"  ; 3
.local  "_"  ; 4
.local  "prot"  ; 5
.local  "spec"  ; 6
.upvalue  "env"  ; 0
.upvalue  "ui"  ; 1
.const  "assert"  ; 0
.const  "Script"  ; 1
.const  "badXml"  ; 2
.const  "string"  ; 3
.const  "find"  ; 4
.const  "(%a+):///?(.+)"  ; 5
.const  "file"  ; 6
.const  "gsub"  ; 7
.const  "/"  ; 8
.const  "\\"  ; 9
.const  "io"  ; 10
.const  "write"  ; 11
.const  "\n"  ; 12
.const  "os"  ; 13
.const  "date"  ; 14
.const  "%c "  ; 15
.const  "Error, Pre/Post Process script must be local, ignoring."  ; 16
.const  "_G"  ; 17
.const  "env"  ; 18
.const  "ui"  ; 19
.const  nil  ; 20

; function [0] definition (level 5)
; 1 upvalues, 0 params, 8 stacks
.function  1 0 0 8
.local  "newEnv"  ; 0
.local  "s"  ; 1
.local  "err"  ; 2
.upvalue  "script"  ; 0
.const  "setmetatable"  ; 0
.const  "__index"  ; 1
.const  "_G"  ; 2
.const  "setfenv"  ; 3
.const  1  ; 4
.const  "pcall"  ; 5
.const  "dofile"  ; 6
.const  "io"  ; 7
.const  "write"  ; 8
.const  "\n"  ; 9
.const  "os"  ; 10
.const  "date"  ; 11
.const  "%c "  ; 12
.const  "Error, Pre/Post Process script failed at: "  ; 13
[01] newtable   0   0   0    ; array=0, hash=0
[02] getglobal  1   0        ; setmetatable
[03] move       2   0      
[04] newtable   3   0   1    ; array=0, hash=2
[05] getglobal  4   2        ; _G
[06] settable   3   251 4    ; "__index"
[07] call       1   3   1  
[08] getglobal  1   3        ; setfenv
[09] loadk      2   4        ; 1
[10] move       3   0      
[11] call       1   3   1  
[12] getglobal  1   5        ; pcall
[13] getglobal  2   6        ; dofile
[14] getupval   3   0        ; script
[15] call       1   3   3  
[16] test       1   1   1    ; to [18] if false
[17] jmp        10           ; to [28]
[18] getglobal  3   7        ; io
[19] gettable   3   3   258  ; "write"
[20] loadk      4   9        ; "\n"
[21] getglobal  5   10       ; os
[22] gettable   5   5   261  ; "date"
[23] loadk      6   12       ; "%c "
[24] call       5   2   2  
[25] loadk      6   13       ; "Error, Pre/Post Process script failed at: "
[26] move       7   2      
[27] call       3   5   1  
[28] return     0   1      
; end of function

[01] test       0   0   1    ; to [3] if false
[02] jmp        1            ; to [4]
[03] return     0   1      
[04] getglobal  1   0        ; assert
[05] gettable   2   0   251  ; "Script"
[06] loadk      3   2        ; "badXml"
[07] call       1   3   1  
[08] gettable   1   0   251  ; "Script"
[09] closure    2   0        ; 1 upvalues
[10] move       0   1      
[11] getglobal  3   3        ; string
[12] gettable   3   3   254  ; "find"
[13] move       4   1      
[14] loadk      5   5        ; "(%a+):///?(.+)"
[15] call       3   3   5  
[16] eq         0   5   256  ; "file", to [18] if true
[17] jmp        8            ; to [26]
[18] getglobal  7   3        ; string
[19] gettable   7   7   257  ; "gsub"
[20] move       8   6      
[21] loadk      9   8        ; "/"
[22] loadk      10  9        ; "\\"
[23] call       7   4   2  
[24] move       1   7      
[25] jmp        12           ; to [38]
[26] test       5   5   0    ; to [28] if true
[27] jmp        10           ; to [38]
[28] getglobal  7   10       ; io
[29] gettable   7   7   261  ; "write"
[30] loadk      8   12       ; "\n"
[31] getglobal  9   13       ; os
[32] gettable   9   9   264  ; "date"
[33] loadk      10  15       ; "%c "
[34] call       9   2   2  
[35] loadk      10  16       ; "Error, Pre/Post Process script must be local, ignoring."
[36] call       7   4   1  
[37] return     0   1      
[38] getglobal  7   17       ; _G
[39] getupval   8   0        ; env
[40] settable   7   268 8    ; "env"
[41] getglobal  7   17       ; _G
[42] getupval   8   1        ; ui
[43] settable   7   269 8    ; "ui"
[44] move       7   2      
[45] call       7   1   1  
[46] getglobal  7   17       ; _G
[47] settable   7   268 270  ; "env" nil
[48] getglobal  7   17       ; _G
[49] settable   7   269 270  ; "ui" nil
[50] return     0   1      
; end of function


; function [12] definition (level 4)
; 2 upvalues, 2 params, 6 stacks
.function  2 2 0 6
.local  "i"  ; 0
.local  "tag"  ; 1
.local  "file"  ; 2
.upvalue  "CheckConditions"  ; 0
.upvalue  "win32"  ; 1
.const  "ConditionCheck"  ; 0
.const  "File"  ; 1
.const  "io"  ; 2
.const  "write"  ; 3
.const  "\nDeleting File: "  ; 4
.const  "DeleteFile"  ; 5
[01] getupval   2   0        ; CheckConditions
[02] gettable   3   1   250  ; "ConditionCheck"
[03] call       2   2   2  
[04] test       2   2   0    ; to [6] if true
[05] jmp        10           ; to [16]
[06] gettable   2   1   251  ; "File"
[07] getglobal  3   2        ; io
[08] gettable   3   3   253  ; "write"
[09] loadk      4   4        ; "\nDeleting File: "
[10] move       5   2      
[11] call       3   3   1  
[12] getupval   3   1        ; win32
[13] gettable   3   3   255  ; "DeleteFile"
[14] move       4   2      
[15] call       3   2   1  
[16] return     0   1      
; end of function


; function [13] definition (level 4)
; 1 upvalues, 2 params, 15 stacks
.function  1 2 0 15
.local  "i"  ; 0
.local  "launchtag"  ; 1
.local  "procMgr"  ; 2
.local  "exe"  ; 3
.local  "arg"  ; 4
.local  "workdir"  ; 5
.local  "block"  ; 6
.local  "silent"  ; 7
.upvalue  "CheckConditions"  ; 0
.const  "ConditionCheck"  ; 0
.const  "luacom"  ; 1
.const  "CreateObject"  ; 2
.const  "StubbyUtil.ProcessMgr"  ; 3
.const  "assert"  ; 4
.const  "comError"  ; 5
.const  "Program"  ; 6
.const  "RAConfigValue"  ; 7
.const  "MainApp"  ; 8
.const  "BadRACInstall"  ; 9
.const  "WorkDir"  ; 10
.const  "Block"  ; 11
.const  "true"  ; 12
.const  "Silent"  ; 13
.const  "io"  ; 14
.const  "write"  ; 15
.const  "\n"  ; 16
.const  "os"  ; 17
.const  "date"  ; 18
.const  "%c "  ; 19
.const  "Launching: "  ; 20
.const  "Arg"  ; 21
.const  ""  ; 22
.const  "Exec"  ; 23
.const  "IsFinished"  ; 24
[01] getupval   2   0        ; CheckConditions
[02] gettable   3   1   250  ; "ConditionCheck"
[03] call       2   2   2  
[04] test       2   2   0    ; to [6] if true
[05] jmp        66           ; to [72]
[06] getglobal  2   1        ; luacom
[07] gettable   2   2   252  ; "CreateObject"
[08] loadk      3   3        ; "StubbyUtil.ProcessMgr"
[09] call       2   2   2  
[10] getglobal  3   4        ; assert
[11] move       4   2      
[12] loadk      5   5        ; "comError"
[13] call       3   3   1  
[14] loadnil    3   4      
[15] gettable   5   1   256  ; "Program"
[16] test       5   5   0    ; to [18] if true
[17] jmp        2            ; to [20]
[18] gettable   3   1   256  ; "Program"
[19] jmp        8            ; to [28]
[20] getglobal  5   7        ; RAConfigValue
[21] loadk      6   8        ; "MainApp"
[22] call       5   2   2  
[23] move       3   5      
[24] getglobal  5   4        ; assert
[25] move       6   3      
[26] loadk      7   9        ; "BadRACInstall"
[27] call       5   3   1  
[28] gettable   5   1   260  ; "WorkDir"
[29] loadbool   6   0   0    ; false
[30] loadbool   7   0   0    ; false
[31] gettable   8   1   261  ; "Block"
[32] eq         0   8   262  ; "true", to [34] if true
[33] jmp        1            ; to [35]
[34] loadbool   6   1   0    ; true
[35] gettable   8   1   263  ; "Silent"
[36] eq         0   8   262  ; "true", to [38] if true
[37] jmp        1            ; to [39]
[38] loadbool   7   1   0    ; true
[39] getglobal  8   14       ; io
[40] gettable   8   8   265  ; "write"
[41] loadk      9   16       ; "\n"
[42] getglobal  10  17       ; os
[43] gettable   10  10  268  ; "date"
[44] loadk      11  19       ; "%c "
[45] call       10  2   2  
[46] loadk      11  20       ; "Launching: "
[47] move       12  3      
[48] gettable   13  1   271  ; "Arg"
[49] test       13  13  1    ; to [51] if false
[50] jmp        1            ; to [52]
[51] loadk      13  22       ; ""
[52] call       8   6   1  
[53] self       8   2   273  ; "Exec"
[54] move       10  3      
[55] gettable   11  1   271  ; "Arg"
[56] test       11  11  1    ; to [58] if false
[57] jmp        1            ; to [59]
[58] loadk      11  22       ; ""
[59] move       12  7      
[60] move       13  6      
[61] move       14  5      
[62] call       8   7   1  
[63] loadbool   8   1   0    ; true
[64] eq         0   6   8    ; to [66] if true
[65] jmp        6            ; to [72]
[66] jmp        0            ; to [67]
[67] self       8   2   274  ; "IsFinished"
[68] call       8   2   2  
[69] loadbool   9   0   0    ; false
[70] eq         1   8   9    ; to [72] if false
[71] jmp        -5           ; to [67]
[72] return     0   1      
; end of function


; function [14] definition (level 4)
; 5 upvalues, 1 params, 12 stacks
.function  5 1 0 12
.local  "modules"  ; 0
.local  "regPath"  ; 1
.local  "(for generator)"  ; 2
.local  "(for state)"  ; 3
.local  "module"  ; 4
.local  "file"  ; 5
.upvalue  "win32"  ; 0
.upvalue  "CheckConditions"  ; 1
.upvalue  "unInst"  ; 2
.upvalue  "installStep"  ; 3
.upvalue  "ChunkSink"  ; 4
.const  "COMRegPath"  ; 0
.const  "ConditionCheck"  ; 1
.const  "File"  ; 2
.const  "io"  ; 3
.const  "write"  ; 4
.const  "\nRegistering: "  ; 5
.const  "COMReg"  ; 6
.const  "LaunchProcess"  ; 7
.const  " /s \""  ; 8
.const  "\""  ; 9
[01] getupval   1   0        ; win32
[02] gettable   1   1   250  ; "COMRegPath"
[03] call       1   1   2  
[04] move       2   0      
[05] loadnil    3   4      
[06] tforprep   2   28       ; to [35]
[07] getupval   5   1        ; CheckConditions
[08] gettable   6   0   4  
[09] gettable   6   6   251  ; "ConditionCheck"
[10] call       5   2   2  
[11] test       5   5   0    ; to [13] if true
[12] jmp        22           ; to [35]
[13] gettable   5   0   4  
[14] gettable   5   5   252  ; "File"
[15] getglobal  6   3        ; io
[16] gettable   6   6   254  ; "write"
[17] loadk      7   5        ; "\nRegistering: "
[18] move       8   5      
[19] call       6   3   1  
[20] getupval   6   2        ; unInst
[21] gettable   6   6   256  ; "COMReg"
[22] move       7   5      
[23] call       6   2   1  
[24] getupval   6   0        ; win32
[25] gettable   6   6   257  ; "LaunchProcess"
[26] move       7   1      
[27] loadk      8   8        ; " /s \""
[28] move       9   5      
[29] loadk      10  9        ; "\""
[30] concat     8   8   10 
[31] loadbool   9   1   0    ; true
[32] getupval   10  3        ; installStep
[33] getupval   11  4        ; ChunkSink
[34] call       6   6   1  
[35] tforloop   2       0    ; to [37] if exit
[36] jmp        -30          ; to [7]
[37] return     0   1      
; end of function


; function [15] definition (level 4)
; 0 upvalues, 1 params, 20 stacks
.function  0 1 0 20
.local  "tag"  ; 0
.local  "tablePairs"  ; 1
.local  "PairsNode"  ; 2
.local  "count"  ; 3
.local  "(for generator)"  ; 4
.local  "(for state)"  ; 5
.local  "Pair"  ; 6
.local  "PairNode"  ; 7
.local  "(for generator)"  ; 8
.local  "(for state)"  ; 9
.local  "c"  ; 10
.const  1  ; 0
.const  0  ; 1
.const  "io"  ; 2
.const  "write"  ; 3
.const  "\n"  ; 4
.const  "os"  ; 5
.const  "date"  ; 6
.const  "%c "  ; 7
.const  "Pair:"  ; 8
.const  "tostring"  ; 9
.const  " Key:"  ; 10
.const  "Key"  ; 11
.const  " Val:"  ; 12
.const  "Val"  ; 13
.const  "tablePair"  ; 14
.const  2  ; 15
[01] newtable   1   0   0    ; array=0, hash=0
[02] test       0   0   1    ; to [4] if false
[03] jmp        1            ; to [5]
[04] return     1   2      
[05] gettable   2   0   250  ; 1
[06] loadk      3   1        ; 0
[07] move       4   2      
[08] loadnil    5   6      
[09] tforprep   4   42       ; to [52]
[10] gettable   7   2   6  
[11] move       8   7      
[12] loadnil    9   10     
[13] tforprep   8   36       ; to [50]
[14] getglobal  11  2        ; io
[15] gettable   11  11  253  ; "write"
[16] loadk      12  4        ; "\n"
[17] getglobal  13  5        ; os
[18] gettable   13  13  256  ; "date"
[19] loadk      14  7        ; "%c "
[20] call       13  2   2  
[21] loadk      14  8        ; "Pair:"
[22] getglobal  15  9        ; tostring
[23] move       16  6      
[24] call       15  2   2  
[25] concat     14  14  15 
[26] loadk      15  10       ; " Key:"
[27] getglobal  16  9        ; tostring
[28] gettable   17  7   10 
[29] gettable   17  17  261  ; "Key"
[30] call       16  2   2  
[31] loadk      17  12       ; " Val:"
[32] getglobal  18  9        ; tostring
[33] gettable   19  7   10 
[34] gettable   19  19  263  ; "Val"
[35] call       18  2   0  
[36] call       11  0   1  
[37] add        3   3   250  ; 1
[38] newtable   11  0   0    ; array=0, hash=0
[39] setglobal  11  14       ; tablePair
[40] getglobal  11  14       ; tablePair
[41] gettable   12  7   10 
[42] gettable   12  12  261  ; "Key"
[43] settable   11  250 12   ; 1
[44] getglobal  11  14       ; tablePair
[45] gettable   12  7   10 
[46] gettable   12  12  263  ; "Val"
[47] settable   11  265 12   ; 2
[48] getglobal  11  14       ; tablePair
[49] settable   1   3   11 
[50] tforloop   8       0    ; to [52] if exit
[51] jmp        -38          ; to [14]
[52] tforloop   4       0    ; to [54] if exit
[53] jmp        -44          ; to [10]
[54] return     1   2      
[55] return     0   1      
; end of function


; function [16] definition (level 4)
; 3 upvalues, 1 params, 8 stacks
.function  3 1 0 8
.local  "vars"  ; 0
.local  "(for generator)"  ; 1
.local  "(for state)"  ; 2
.local  "var"  ; 3
.upvalue  "CheckConditions"  ; 0
.upvalue  "GetPairs"  ; 1
.upvalue  "errHandler"  ; 2
.const  "ConditionCheck"  ; 0
.const  "io"  ; 1
.const  "write"  ; 2
.const  "\n"  ; 3
.const  "os"  ; 4
.const  "date"  ; 5
.const  "%c "  ; 6
.const  "ProcessLogPing ConditionCheck OK"  ; 7
.const  "tablePairs"  ; 8
.const  "Pairs"  ; 9
.const  "LogPing"  ; 10
[01] move       1   0      
[02] loadnil    2   3      
[03] tforprep   1   25       ; to [29]
[04] getupval   4   0        ; CheckConditions
[05] gettable   5   0   3  
[06] gettable   5   5   250  ; "ConditionCheck"
[07] call       4   2   2  
[08] test       4   4   0    ; to [10] if true
[09] jmp        19           ; to [29]
[10] getglobal  4   1        ; io
[11] gettable   4   4   252  ; "write"
[12] loadk      5   3        ; "\n"
[13] getglobal  6   4        ; os
[14] gettable   6   6   255  ; "date"
[15] loadk      7   6        ; "%c "
[16] call       6   2   2  
[17] loadk      7   7        ; "ProcessLogPing ConditionCheck OK"
[18] call       4   4   1  
[19] getupval   4   1        ; GetPairs
[20] gettable   5   0   3  
[21] gettable   5   5   259  ; "Pairs"
[22] call       4   2   2  
[23] setglobal  4   8        ; tablePairs
[24] getupval   4   2        ; errHandler
[25] gettable   4   4   260  ; "LogPing"
[26] getglobal  5   8        ; tablePairs
[27] loadbool   6   0   0    ; false
[28] call       4   3   1  
[29] tforloop   1       0    ; to [31] if exit
[30] jmp        -27          ; to [4]
[31] return     0   1      
; end of function


; function [17] definition (level 4)
; 2 upvalues, 1 params, 11 stacks
.function  2 1 0 11
.local  "vars"  ; 0
.local  "(for generator)"  ; 1
.local  "(for state)"  ; 2
.local  "var"  ; 3
.local  "key"  ; 4
.local  "val"  ; 5
.upvalue  "CheckConditions"  ; 0
.upvalue  "env"  ; 1
.const  "ConditionCheck"  ; 0
.const  "Key"  ; 1
.const  "Val"  ; 2
.const  "assert"  ; 3
.const  "missing_attrib"  ; 4
.const  "io"  ; 5
.const  "write"  ; 6
.const  "\nDefining env: "  ; 7
.const  " -> "  ; 8
[01] move       1   0      
[02] loadnil    2   3      
[03] tforprep   1   23       ; to [27]
[04] getupval   4   0        ; CheckConditions
[05] gettable   5   0   3  
[06] gettable   5   5   250  ; "ConditionCheck"
[07] call       4   2   2  
[08] test       4   4   0    ; to [10] if true
[09] jmp        17           ; to [27]
[10] gettable   4   0   3  
[11] gettable   4   4   251  ; "Key"
[12] gettable   5   0   3  
[13] gettable   5   5   252  ; "Val"
[14] getglobal  6   3        ; assert
[15] move       7   4      
[16] loadk      8   4        ; "missing_attrib"
[17] call       6   3   1  
[18] getupval   6   1        ; env
[19] settable   6   4   5  
[20] getglobal  6   5        ; io
[21] gettable   6   6   256  ; "write"
[22] loadk      7   7        ; "\nDefining env: "
[23] move       8   4      
[24] loadk      9   8        ; " -> "
[25] move       10  5      
[26] call       6   5   1  
[27] tforloop   1       0    ; to [29] if exit
[28] jmp        -25          ; to [4]
[29] return     0   1      
; end of function


; function [18] definition (level 4)
; 1 upvalues, 1 params, 11 stacks
.function  1 1 0 11
.local  "vars"  ; 0
.local  "(for generator)"  ; 1
.local  "(for state)"  ; 2
.local  "var"  ; 3
.local  "key"  ; 4
.local  "val"  ; 5
.upvalue  "CheckConditions"  ; 0
.const  "ConditionCheck"  ; 0
.const  "Key"  ; 1
.const  "Val"  ; 2
.const  "assert"  ; 3
.const  "missing_attrib"  ; 4
.const  "g_env"  ; 5
.const  "io"  ; 6
.const  "write"  ; 7
.const  "\nDefining g_env: "  ; 8
.const  " -> "  ; 9
[01] move       1   0      
[02] loadnil    2   3      
[03] tforprep   1   23       ; to [27]
[04] getupval   4   0        ; CheckConditions
[05] gettable   5   0   3  
[06] gettable   5   5   250  ; "ConditionCheck"
[07] call       4   2   2  
[08] test       4   4   0    ; to [10] if true
[09] jmp        17           ; to [27]
[10] gettable   4   0   3  
[11] gettable   4   4   251  ; "Key"
[12] gettable   5   0   3  
[13] gettable   5   5   252  ; "Val"
[14] getglobal  6   3        ; assert
[15] move       7   4      
[16] loadk      8   4        ; "missing_attrib"
[17] call       6   3   1  
[18] getglobal  6   5        ; g_env
[19] settable   6   4   5  
[20] getglobal  6   6        ; io
[21] gettable   6   6   257  ; "write"
[22] loadk      7   8        ; "\nDefining g_env: "
[23] move       8   4      
[24] loadk      9   9        ; " -> "
[25] move       10  5      
[26] call       6   5   1  
[27] tforloop   1       0    ; to [29] if exit
[28] jmp        -25          ; to [4]
[29] return     0   1      
; end of function


; function [19] definition (level 4)
; 11 upvalues, 1 params, 7 stacks
.function  11 1 0 7
.local  "tag"  ; 0
.local  "(for generator)"  ; 1
.local  "(for state)"  ; 2
.local  "p"  ; 3
.upvalue  "ProcessRegkeys"  ; 0
.upvalue  "ProcessShortcuts"  ; 1
.upvalue  "ProcessBookmarks"  ; 2
.upvalue  "ProcessCOMServers"  ; 3
.upvalue  "ProcessEnvVars"  ; 4
.upvalue  "ProcessGlobalEnvVars"  ; 5
.upvalue  "CheckConditions"  ; 6
.upvalue  "PostProcess"  ; 7
.upvalue  "ProcessGameReg"  ; 8
.upvalue  "ProcessDelete"  ; 9
.upvalue  "ProcessLogPing"  ; 10
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\nNo Aux tags to process."  ; 2
.const  "Regkey"  ; 3
.const  "Shortcut"  ; 4
.const  "Bookmark"  ; 5
.const  "RegSrvr"  ; 6
.const  "SetEnv"  ; 7
.const  "SetGlobalEnv"  ; 8
.const  "GameAttribs"  ; 9
.const  "g_env"  ; 10
.const  "gameExe"  ; 11
.const  1  ; 12
.const  "Exe"  ; 13
.const  "PostProcess"  ; 14
.const  "ConditionCheck"  ; 15
.const  "GameReg"  ; 16
.const  "Delete"  ; 17
.const  "table"  ; 18
.const  "foreach"  ; 19
.const  "LogPing"  ; 20
[01] test       0   0   1    ; to [3] if false
[02] jmp        5            ; to [8]
[03] getglobal  1   0        ; io
[04] gettable   1   1   251  ; "write"
[05] loadk      2   2        ; "\nNo Aux tags to process."
[06] call       1   2   1  
[07] return     0   1      
[08] gettable   1   0   253  ; "Regkey"
[09] test       1   1   0    ; to [11] if true
[10] jmp        3            ; to [14]
[11] getupval   1   0        ; ProcessRegkeys
[12] gettable   2   0   253  ; "Regkey"
[13] call       1   2   1  
[14] gettable   1   0   254  ; "Shortcut"
[15] test       1   1   0    ; to [17] if true
[16] jmp        3            ; to [20]
[17] getupval   1   1        ; ProcessShortcuts
[18] gettable   2   0   254  ; "Shortcut"
[19] call       1   2   1  
[20] gettable   1   0   255  ; "Bookmark"
[21] test       1   1   0    ; to [23] if true
[22] jmp        3            ; to [26]
[23] getupval   1   2        ; ProcessBookmarks
[24] gettable   2   0   255  ; "Bookmark"
[25] call       1   2   1  
[26] gettable   1   0   256  ; "RegSrvr"
[27] test       1   1   0    ; to [29] if true
[28] jmp        3            ; to [32]
[29] getupval   1   3        ; ProcessCOMServers
[30] gettable   2   0   256  ; "RegSrvr"
[31] call       1   2   1  
[32] gettable   1   0   257  ; "SetEnv"
[33] test       1   1   0    ; to [35] if true
[34] jmp        3            ; to [38]
[35] getupval   1   4        ; ProcessEnvVars
[36] gettable   2   0   257  ; "SetEnv"
[37] call       1   2   1  
[38] gettable   1   0   258  ; "SetGlobalEnv"
[39] test       1   1   0    ; to [41] if true
[40] jmp        3            ; to [44]
[41] getupval   1   5        ; ProcessGlobalEnvVars
[42] gettable   2   0   258  ; "SetGlobalEnv"
[43] call       1   2   1  
[44] gettable   1   0   259  ; "GameAttribs"
[45] test       1   1   0    ; to [47] if true
[46] jmp        5            ; to [52]
[47] getglobal  1   10       ; g_env
[48] gettable   2   0   259  ; "GameAttribs"
[49] gettable   2   2   262  ; 1
[50] gettable   2   2   263  ; "Exe"
[51] settable   1   261 2    ; "gameExe"
[52] gettable   1   0   264  ; "PostProcess"
[53] test       1   1   0    ; to [55] if true
[54] jmp        16           ; to [71]
[55] gettable   1   0   264  ; "PostProcess"
[56] loadnil    2   3      
[57] tforprep   1   11       ; to [69]
[58] getupval   4   6        ; CheckConditions
[59] gettable   5   0   264  ; "PostProcess"
[60] gettable   5   5   3  
[61] gettable   5   5   265  ; "ConditionCheck"
[62] call       4   2   2  
[63] test       4   4   0    ; to [65] if true
[64] jmp        4            ; to [69]
[65] getupval   4   7        ; PostProcess
[66] gettable   5   0   264  ; "PostProcess"
[67] gettable   5   5   3  
[68] call       4   2   1  
[69] tforloop   1       0    ; to [71] if exit
[70] jmp        -13          ; to [58]
[71] gettable   1   0   266  ; "GameReg"
[72] test       1   1   0    ; to [74] if true
[73] jmp        3            ; to [77]
[74] getupval   1   8        ; ProcessGameReg
[75] gettable   2   0   266  ; "GameReg"
[76] call       1   2   1  
[77] gettable   1   0   267  ; "Delete"
[78] test       1   1   0    ; to [80] if true
[79] jmp        5            ; to [85]
[80] getglobal  1   18       ; table
[81] gettable   1   1   269  ; "foreach"
[82] gettable   2   0   267  ; "Delete"
[83] getupval   3   9        ; ProcessDelete
[84] call       1   3   1  
[85] gettable   1   0   270  ; "LogPing"
[86] test       1   1   0    ; to [88] if true
[87] jmp        3            ; to [91]
[88] getupval   1   10       ; ProcessLogPing
[89] gettable   2   0   270  ; "LogPing"
[90] call       1   2   1  
[91] return     0   1      
; end of function


; function [20] definition (level 4)
; 3 upvalues, 1 params, 9 stacks
.function  3 1 0 9
.local  "script"  ; 0
.local  "interp"  ; 1
.local  "filename"  ; 2
.local  "assoc"  ; 3
.upvalue  "env"  ; 0
.upvalue  "members"  ; 1
.upvalue  "unInst"  ; 2
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Begining NestedScript: "  ; 6
.const  "xmlNestLevel"  ; 7
.const  1  ; 8
.const  "MetadataInterp"  ; 9
.const  "LoadXML"  ; 10
.const  "GetValue"  ; 11
.const  "uninstfile"  ; 12
.const  "assoc"  ; 13
.const  "false"  ; 14
.const  "Child"  ; 15
.const  "PreProcess"  ; 16
.const  "DoInstall"  ; 17
.const  "DoLaunchTags"  ; 18
.const  "Finished NestedScript: "  ; 19
[01] getglobal  1   0        ; io
[02] gettable   1   1   251  ; "write"
[03] loadk      2   2        ; "\n"
[04] getglobal  3   3        ; os
[05] gettable   3   3   254  ; "date"
[06] loadk      4   5        ; "%c "
[07] call       3   2   2  
[08] loadk      4   6        ; "Begining NestedScript: "
[09] move       5   0      
[10] call       1   5   1  
[11] getupval   1   0        ; env
[12] getupval   2   0        ; env
[13] gettable   2   2   257  ; "xmlNestLevel"
[14] add        2   2   258  ; 1
[15] settable   1   257 2    ; "xmlNestLevel"
[16] getglobal  1   9        ; MetadataInterp
[17] getupval   2   0        ; env
[18] call       1   2   2  
[19] gettable   2   1   260  ; "LoadXML"
[20] move       3   0      
[21] call       2   2   1  
[22] gettable   2   1   261  ; "GetValue"
[23] getupval   3   1        ; members
[24] gettable   3   3   262  ; "uninstfile"
[25] call       2   2   2  
[26] gettable   3   1   261  ; "GetValue"
[27] getupval   4   1        ; members
[28] gettable   4   4   263  ; "assoc"
[29] call       3   2   2  
[30] test       2   2   0    ; to [32] if true
[31] jmp        6            ; to [38]
[32] eq         1   3   264  ; "false", to [34] if false
[33] jmp        4            ; to [38]
[34] getupval   4   2        ; unInst
[35] gettable   4   4   265  ; "Child"
[36] move       5   2      
[37] call       4   2   1  
[38] gettable   4   1   266  ; "PreProcess"
[39] call       4   1   1  
[40] gettable   4   1   267  ; "DoInstall"
[41] call       4   1   1  
[42] gettable   4   1   268  ; "DoLaunchTags"
[43] call       4   1   1  
[44] getupval   4   0        ; env
[45] getupval   5   0        ; env
[46] gettable   5   5   257  ; "xmlNestLevel"
[47] sub        5   5   258  ; 1
[48] settable   4   257 5    ; "xmlNestLevel"
[49] getglobal  4   0        ; io
[50] gettable   4   4   251  ; "write"
[51] loadk      5   2        ; "\n"
[52] getglobal  6   3        ; os
[53] gettable   6   6   254  ; "date"
[54] loadk      7   5        ; "%c "
[55] call       6   2   2  
[56] loadk      7   19       ; "Finished NestedScript: "
[57] move       8   0      
[58] call       4   5   1  
[59] return     0   1      
; end of function


; function [21] definition (level 4)
; 1 upvalues, 1 params, 5 stacks
.function  1 1 0 5
.local  "xml"  ; 0
.local  "filterTag"  ; 1
.upvalue  "ui"  ; 0
.const  "filterRec"  ; 0

; function [0] definition (level 5)
; 1 upvalues, 1 params, 6 stacks
.function  1 1 0 6
.local  "tag"  ; 0
.upvalue  "ui"  ; 0
.const  "type"  ; 0
.const  "table"  ; 1
.const  "Id"  ; 2
.const  "string"  ; 3
.const  "IsTagRemoved"  ; 4
.const  "io"  ; 5
.const  "write"  ; 6
.const  "\n"  ; 7
.const  "os"  ; 8
.const  "date"  ; 9
.const  "%c "  ; 10
.const  "Removing tag ID: "  ; 11
[01] test       0   0   0    ; to [3] if true
[02] jmp        31           ; to [34]
[03] getglobal  1   0        ; type
[04] move       2   0      
[05] call       1   2   2  
[06] eq         0   1   251  ; "table", to [8] if true
[07] jmp        26           ; to [34]
[08] gettable   1   0   252  ; "Id"
[09] test       1   1   0    ; to [11] if true
[10] jmp        23           ; to [34]
[11] getglobal  1   0        ; type
[12] gettable   2   0   252  ; "Id"
[13] call       1   2   2  
[14] eq         0   1   253  ; "string", to [16] if true
[15] jmp        18           ; to [34]
[16] getupval   1   0        ; ui
[17] gettable   1   1   254  ; "IsTagRemoved"
[18] gettable   2   0   252  ; "Id"
[19] call       1   2   2  
[20] test       1   1   0    ; to [22] if true
[21] jmp        12           ; to [34]
[22] getglobal  1   5        ; io
[23] gettable   1   1   256  ; "write"
[24] loadk      2   7        ; "\n"
[25] getglobal  3   8        ; os
[26] gettable   3   3   259  ; "date"
[27] loadk      4   10       ; "%c "
[28] call       3   2   2  
[29] loadk      4   11       ; "Removing tag ID: "
[30] gettable   5   0   252  ; "Id"
[31] call       1   5   1  
[32] loadbool   1   0   0    ; false
[33] return     1   2      
[34] loadbool   1   1   0    ; true
[35] return     1   2      
[36] return     0   1      
; end of function

[1] closure    1   0        ; 1 upvalues
[2] getupval   0   0        ; ui
[3] getglobal  2   0        ; filterRec
[4] move       3   1      
[5] move       4   0      
[6] tailcall   2   3   0  
[7] return     2   0      
[8] return     0   1      
; end of function


; function [22] definition (level 4)
; 2 upvalues, 1 params, 10 stacks
.function  2 1 0 10
.local  "tags"  ; 0
.local  "(for generator)"  ; 1
.local  "(for state)"  ; 2
.local  "tag"  ; 3
.local  "resourceId"  ; 4
.local  "nResourceId"  ; 5
.upvalue  "CheckConditions"  ; 0
.upvalue  "ui"  ; 1
.const  "ConditionCheck"  ; 0
.const  "ResourceId"  ; 1
.const  "io"  ; 2
.const  "write"  ; 3
.const  "\n"  ; 4
.const  "os"  ; 5
.const  "date"  ; 6
.const  "%c "  ; 7
.const  "Playing sound: ResourceId = "  ; 8
.const  "tonumber"  ; 9
.const  "PlayRASound"  ; 10
[01] move       1   0      
[02] loadnil    2   3      
[03] tforprep   1   25       ; to [29]
[04] getupval   4   0        ; CheckConditions
[05] gettable   5   0   3  
[06] gettable   5   5   250  ; "ConditionCheck"
[07] call       4   2   2  
[08] test       4   4   0    ; to [10] if true
[09] jmp        19           ; to [29]
[10] gettable   4   0   3  
[11] gettable   4   4   251  ; "ResourceId"
[12] getglobal  5   2        ; io
[13] gettable   5   5   253  ; "write"
[14] loadk      6   4        ; "\n"
[15] getglobal  7   5        ; os
[16] gettable   7   7   256  ; "date"
[17] loadk      8   7        ; "%c "
[18] call       7   2   2  
[19] loadk      8   8        ; "Playing sound: ResourceId = "
[20] move       9   4      
[21] call       5   5   1  
[22] getglobal  5   9        ; tonumber
[23] move       6   4      
[24] call       5   2   2  
[25] getupval   6   1        ; ui
[26] gettable   6   6   260  ; "PlayRASound"
[27] move       7   5      
[28] call       6   2   1  
[29] tforloop   1       0    ; to [31] if exit
[30] jmp        -27          ; to [4]
[31] return     0   1      
; end of function


; function [23] definition (level 4)
; 9 upvalues, 1 params, 11 stacks
.function  9 1 0 11
.local  "payloadTag"  ; 0
.local  "src"  ; 1
.local  "dest"  ; 2
.local  "ProcessFile"  ; 3
.local  "pre"  ; 4
.local  "(for generator)"  ; 5
.local  "(for state)"  ; 6
.local  "p"  ; 7
.upvalue  "ui"  ; 0
.upvalue  "currentPayload"  ; 1
.upvalue  "ismigrating"  ; 2
.upvalue  "dwnldMgr"  ; 3
.upvalue  "DownloadChunkSink"  ; 4
.upvalue  "win32"  ; 5
.upvalue  "ChunkSink"  ; 6
.upvalue  "PostProcess"  ; 7
.upvalue  "unInst"  ; 8
.const  "Src"  ; 0
.const  "Target"  ; 1
.const  "PreProcess"  ; 2
.const  "FileSystem"  ; 3
.const  "NoOverwrite"  ; 4
.const  "true"  ; 5
.const  "io"  ; 6
.const  "touch"  ; 7

; function [0] definition (level 5)
; 10 upvalues, 0 params, 13 stacks
.function  10 0 0 13
.local  "_"  ; 0
.local  "_"  ; 1
.local  "srcProt"  ; 2
.local  "srcSpec"  ; 3
.local  "_"  ; 4
.local  "_"  ; 5
.local  "destProt"  ; 6
.local  "destSpec"  ; 7
.local  "s"  ; 8
.local  "err"  ; 9
.upvalue  "src"  ; 0
.upvalue  "dest"  ; 1
.upvalue  "payloadTag"  ; 2
.upvalue  "ui"  ; 3
.upvalue  "currentPayload"  ; 4
.upvalue  "ismigrating"  ; 5
.upvalue  "dwnldMgr"  ; 6
.upvalue  "DownloadChunkSink"  ; 7
.upvalue  "win32"  ; 8
.upvalue  "ChunkSink"  ; 9
.const  "string"  ; 0
.const  "find"  ; 1
.const  "(%a+):///?(.+)"  ; 2
.const  "http"  ; 3
.const  "DisplayProgress"  ; 4
.const  "true"  ; 5
.const  "Target"  ; 6
.const  "%.rga"  ; 7
.const  "data"  ; 8
.const  "pbarDisplayProgress"  ; 9
.const  1  ; 10
.const  "SetCurrentPayload"  ; 11
.const  "g_env"  ; 12
.const  "curGameId"  ; 13
.const  nil  ; 14
.const  "SetStatusText"  ; 15
.const  "g_resources"  ; 16
.const  "dwnupgrading"  ; 17
.const  "pbarPayloadBytes"  ; 18
.const  0  ; 19
.const  "pbarPayloadTotalBytes"  ; 20
.const  "FileSize"  ; 21
.const  "r"  ; 22
.const  "s"  ; 23
.const  "pcall"  ; 24
.const  "PayloadSize"  ; 25
.const  "io"  ; 26
.const  "write"  ; 27
.const  "\n"  ; 28
.const  "os"  ; 29
.const  "date"  ; 30
.const  "%c "  ; 31
.const  "Failed to get payload size"  ; 32
.const  "totalPayloads"  ; 33
.const  "downloadingMultiple"  ; 34
.const  "downloading"  ; 35
.const  "GetFile"  ; 36
.const  "upgrading"  ; 37
.const  "installing"  ; 38
.const  "LocalCopy"  ; 39
.const  "assert"  ; 40
.const  "lesserVer"  ; 41
[001] getglobal  0   0        ; string
[002] gettable   0   0   251  ; "find"
[003] getupval   1   0        ; src
[004] loadk      2   2        ; "(%a+):///?(.+)"
[005] call       0   3   5  
[006] getglobal  4   0        ; string
[007] gettable   4   4   251  ; "find"
[008] getupval   5   1        ; dest
[009] loadk      6   2        ; "(%a+):///?(.+)"
[010] call       4   3   5  
[011] eq         0   2   253  ; "http", to [13] if true
[012] jmp        143          ; to [156]
[013] getupval   8   2        ; payloadTag
[014] gettable   8   8   254  ; "DisplayProgress"
[015] eq         1   8   255  ; "true", to [17] if false
[016] jmp        8            ; to [25]
[017] getglobal  8   0        ; string
[018] gettable   8   8   251  ; "find"
[019] getupval   9   2        ; payloadTag
[020] gettable   9   9   256  ; "Target"
[021] loadk      10  7        ; "%.rga"
[022] call       8   3   2  
[023] test       8   8   0    ; to [25] if true
[024] jmp        5            ; to [30]
[025] getupval   8   3        ; ui
[026] gettable   8   8   258  ; "data"
[027] loadbool   9   1   0    ; true
[028] settable   8   259 9    ; "pbarDisplayProgress"
[029] jmp        4            ; to [34]
[030] getupval   8   3        ; ui
[031] gettable   8   8   258  ; "data"
[032] loadbool   9   0   0    ; false
[033] settable   8   259 9    ; "pbarDisplayProgress"
[034] getupval   8   3        ; ui
[035] gettable   8   8   258  ; "data"
[036] gettable   8   8   259  ; "pbarDisplayProgress"
[037] loadbool   9   1   0    ; true
[038] eq         0   8   9    ; to [40] if true
[039] jmp        7            ; to [47]
[040] getupval   8   4        ; currentPayload
[041] add        8   8   260  ; 1
[042] setupval   8   4        ; currentPayload
[043] getupval   8   3        ; ui
[044] gettable   8   8   261  ; "SetCurrentPayload"
[045] getupval   9   4        ; currentPayload
[046] call       8   2   1  
[047] getupval   8   5        ; ismigrating
[048] loadbool   9   1   0    ; true
[049] eq         0   8   9    ; to [51] if true
[050] jmp        10           ; to [61]
[051] getglobal  8   12       ; g_env
[052] gettable   8   8   263  ; "curGameId"
[053] eq         0   8   264  ; nil, to [55] if true
[054] jmp        6            ; to [61]
[055] getupval   8   3        ; ui
[056] gettable   8   8   265  ; "SetStatusText"
[057] getglobal  9   16       ; g_resources
[058] gettable   9   9   267  ; "dwnupgrading"
[059] call       8   2   1  
[060] jmp        67           ; to [128]
[061] getupval   8   3        ; ui
[062] gettable   8   8   258  ; "data"
[063] gettable   8   8   259  ; "pbarDisplayProgress"
[064] loadbool   9   1   0    ; true
[065] eq         0   8   9    ; to [67] if true
[066] jmp        61           ; to [128]
[067] getupval   8   3        ; ui
[068] gettable   8   8   258  ; "data"
[069] settable   8   268 269  ; "pbarPayloadBytes" 0
[070] getupval   8   3        ; ui
[071] gettable   8   8   258  ; "data"
[072] getupval   9   2        ; payloadTag
[073] gettable   9   9   271  ; "FileSize"
[074] settable   8   270 9    ; "pbarPayloadTotalBytes"
[075] getupval   8   3        ; ui
[076] gettable   8   8   258  ; "data"
[077] gettable   8   8   270  ; "pbarPayloadTotalBytes"
[078] test       8   8   1    ; to [80] if false
[079] jmp        27           ; to [107]
[080] getglobal  8   24       ; pcall
[081] getupval   9   6        ; dwnldMgr
[082] gettable   9   9   275  ; "PayloadSize"
[083] getupval   10  0        ; src
[084] call       8   3   3  
[085] setglobal  9   23       ; s
[086] setglobal  8   22       ; r
[087] getglobal  8   22       ; r
[088] test       8   8   0    ; to [90] if true
[089] jmp        5            ; to [95]
[090] getupval   8   3        ; ui
[091] gettable   8   8   258  ; "data"
[092] getglobal  9   23       ; s
[093] settable   8   270 9    ; "pbarPayloadTotalBytes"
[094] jmp        12           ; to [107]
[095] getupval   8   3        ; ui
[096] gettable   8   8   258  ; "data"
[097] settable   8   270 269  ; "pbarPayloadTotalBytes" 0
[098] getglobal  8   26       ; io
[099] gettable   8   8   277  ; "write"
[100] loadk      9   28       ; "\n"
[101] getglobal  10  29       ; os
[102] gettable   10  10  280  ; "date"
[103] loadk      11  31       ; "%c "
[104] call       10  2   2  
[105] loadk      11  32       ; "Failed to get payload size"
[106] call       8   4   1  
[107] getupval   8   3        ; ui
[108] gettable   8   8   258  ; "data"
[109] gettable   8   8   283  ; "totalPayloads"
[110] test       8   8   0    ; to [112] if true
[111] jmp        11           ; to [123]
[112] getupval   8   3        ; ui
[113] gettable   8   8   258  ; "data"
[114] gettable   8   8   283  ; "totalPayloads"
[115] lt         0   260 8    ; 1, to [117] if true
[116] jmp        6            ; to [123]
[117] getupval   8   3        ; ui
[118] gettable   8   8   265  ; "SetStatusText"
[119] getglobal  9   16       ; g_resources
[120] gettable   9   9   284  ; "downloadingMultiple"
[121] call       8   2   1  
[122] jmp        5            ; to [128]
[123] getupval   8   3        ; ui
[124] gettable   8   8   265  ; "SetStatusText"
[125] getglobal  9   16       ; g_resources
[126] gettable   9   9   285  ; "downloading"
[127] call       8   2   1  
[128] getupval   8   6        ; dwnldMgr
[129] gettable   8   8   286  ; "GetFile"
[130] getupval   9   0        ; src
[131] test       10  7   1    ; to [133] if false
[132] jmp        1            ; to [134]
[133] getupval   10  1        ; dest
[134] getupval   11  7        ; DownloadChunkSink
[135] call       8   4   1  
[136] getupval   8   5        ; ismigrating
[137] loadbool   9   1   0    ; true
[138] eq         0   8   9    ; to [140] if true
[139] jmp        10           ; to [150]
[140] getglobal  8   12       ; g_env
[141] gettable   8   8   263  ; "curGameId"
[142] eq         0   8   264  ; nil, to [144] if true
[143] jmp        6            ; to [150]
[144] getupval   8   3        ; ui
[145] gettable   8   8   265  ; "SetStatusText"
[146] getglobal  9   16       ; g_resources
[147] gettable   9   9   287  ; "upgrading"
[148] call       8   2   1  
[149] jmp        40           ; to [190]
[150] getupval   8   3        ; ui
[151] gettable   8   8   265  ; "SetStatusText"
[152] getglobal  9   16       ; g_resources
[153] gettable   9   9   288  ; "installing"
[154] call       8   2   1  
[155] jmp        34           ; to [190]
[156] getupval   8   5        ; ismigrating
[157] loadbool   9   1   0    ; true
[158] eq         0   8   9    ; to [160] if true
[159] jmp        10           ; to [170]
[160] getglobal  8   12       ; g_env
[161] gettable   8   8   263  ; "curGameId"
[162] eq         0   8   264  ; nil, to [164] if true
[163] jmp        6            ; to [170]
[164] getupval   8   3        ; ui
[165] gettable   8   8   265  ; "SetStatusText"
[166] getglobal  9   16       ; g_resources
[167] gettable   9   9   287  ; "upgrading"
[168] call       8   2   1  
[169] jmp        5            ; to [175]
[170] getupval   8   3        ; ui
[171] gettable   8   8   265  ; "SetStatusText"
[172] getglobal  9   16       ; g_resources
[173] gettable   9   9   288  ; "installing"
[174] call       8   2   1  
[175] getupval   8   8        ; win32
[176] gettable   8   8   289  ; "LocalCopy"
[177] test       9   3   1    ; to [179] if false
[178] jmp        1            ; to [180]
[179] getupval   9   0        ; src
[180] test       10  7   1    ; to [182] if false
[181] jmp        1            ; to [183]
[182] getupval   10  1        ; dest
[183] getupval   11  9        ; ChunkSink
[184] loadbool   12  1   0    ; true
[185] call       8   5   3  
[186] getglobal  10  40       ; assert
[187] move       11  8      
[188] loadk      12  41       ; "lesserVer"
[189] call       10  3   1  
[190] return     0   1      
; end of function

[01] gettable   1   0   250  ; "Src"
[02] gettable   2   0   251  ; "Target"
[03] closure    3   0        ; 10 upvalues
[04] move       0   1      
[05] move       0   2      
[06] move       0   0      
[07] getupval   0   0        ; ui
[08] getupval   0   1        ; currentPayload
[09] getupval   0   2        ; ismigrating
[10] getupval   0   3        ; dwnldMgr
[11] getupval   0   4        ; DownloadChunkSink
[12] getupval   0   5        ; win32
[13] getupval   0   6        ; ChunkSink
[14] gettable   4   0   252  ; "PreProcess"
[15] test       4   4   0    ; to [17] if true
[16] jmp        8            ; to [25]
[17] move       5   4      
[18] loadnil    6   7      
[19] tforprep   5   3        ; to [23]
[20] getupval   8   7        ; PostProcess
[21] gettable   9   4   7  
[22] call       8   2   1  
[23] tforloop   5       0    ; to [25] if exit
[24] jmp        -5           ; to [20]
[25] getupval   5   8        ; unInst
[26] gettable   5   5   253  ; "FileSystem"
[27] move       6   2      
[28] call       5   2   1  
[29] gettable   5   0   254  ; "NoOverwrite"
[30] eq         0   5   255  ; "true", to [32] if true
[31] jmp        7            ; to [39]
[32] getglobal  5   6        ; io
[33] gettable   5   5   257  ; "touch"
[34] move       6   2      
[35] call       5   2   2  
[36] test       5   5   0    ; to [38] if true
[37] jmp        1            ; to [39]
[38] return     0   1      
[39] move       5   3      
[40] call       5   1   1  
[41] return     0   1      
; end of function


; function [24] definition (level 4)
; 8 upvalues, 1 params, 7 stacks
.function  8 1 0 7
.local  "payload"  ; 0
.local  "GamePayload"  ; 1
.local  "RarPayload"  ; 2
.local  "ExePayload"  ; 3
.upvalue  "env"  ; 0
.upvalue  "win32"  ; 1
.upvalue  "unInst"  ; 2
.upvalue  "ui"  ; 3
.upvalue  "NestedScript"  ; 4
.upvalue  "installStep"  ; 5
.upvalue  "ChunkSink"  ; 6
.upvalue  "members"  ; 7
.const  "Target"  ; 0
.const  "string"  ; 1
.const  "gsub"  ; 2
.const  "/"  ; 3
.const  "\\"  ; 4
.const  "io"  ; 5
.const  "touch"  ; 6
.const  "find"  ; 7
.const  "%.rga"  ; 8
.const  "%.exe"  ; 9
.const  "%.rgi"  ; 10
.const  "%.rar"  ; 11
.const  "Persist"  ; 12
.const  "false"  ; 13
.const  "DeleteFile"  ; 14
.const  "DoInstall"  ; 15

; function [0] definition (level 5)
; 6 upvalues, 0 params, 5 stacks
.function  6 0 0 5
.upvalue  "env"  ; 0
.upvalue  "win32"  ; 1
.upvalue  "payload"  ; 2
.upvalue  "unInst"  ; 3
.upvalue  "ui"  ; 4
.upvalue  "NestedScript"  ; 5
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Processing Game Payload"  ; 6
.const  "installDir"  ; 7
.const  "StripFilename"  ; 8
.const  "Target"  ; 9
.const  "."  ; 10
.const  "Payload Path: "  ; 11
.const  "FileSystem"  ; 12
.const  "data"  ; 13
.const  "totalPayloads"  ; 14
.const  1  ; 15
.const  "SetStatusText"  ; 16
.const  "g_resources"  ; 17
.const  "unpackingMultiple"  ; 18
.const  "unpacking"  ; 19
.const  "unpack"  ; 20
.const  "installing"  ; 21
.const  "\\gameinst.xml"  ; 22
[01] getglobal  0   0        ; io
[02] gettable   0   0   251  ; "write"
[03] loadk      1   2        ; "\n"
[04] getglobal  2   3        ; os
[05] gettable   2   2   254  ; "date"
[06] loadk      3   5        ; "%c "
[07] call       2   2   2  
[08] loadk      3   6        ; "Processing Game Payload"
[09] call       0   4   1  
[10] getupval   0   0        ; env
[11] getupval   1   1        ; win32
[12] gettable   1   1   258  ; "StripFilename"
[13] getupval   2   2        ; payload
[14] gettable   2   2   259  ; "Target"
[15] call       1   2   2  
[16] test       1   1   1    ; to [18] if false
[17] jmp        1            ; to [19]
[18] loadk      1   10       ; "."
[19] settable   0   257 1    ; "installDir"
[20] getglobal  0   0        ; io
[21] gettable   0   0   251  ; "write"
[22] loadk      1   2        ; "\n"
[23] getglobal  2   3        ; os
[24] gettable   2   2   254  ; "date"
[25] loadk      3   5        ; "%c "
[26] call       2   2   2  
[27] loadk      3   11       ; "Payload Path: "
[28] getupval   4   0        ; env
[29] gettable   4   4   257  ; "installDir"
[30] call       0   5   1  
[31] getupval   0   3        ; unInst
[32] gettable   0   0   262  ; "FileSystem"
[33] getupval   1   0        ; env
[34] gettable   1   1   257  ; "installDir"
[35] call       0   2   1  
[36] getupval   0   4        ; ui
[37] gettable   0   0   263  ; "data"
[38] gettable   0   0   264  ; "totalPayloads"
[39] test       0   0   0    ; to [41] if true
[40] jmp        11           ; to [52]
[41] getupval   0   4        ; ui
[42] gettable   0   0   263  ; "data"
[43] gettable   0   0   264  ; "totalPayloads"
[44] lt         0   265 0    ; 1, to [46] if true
[45] jmp        6            ; to [52]
[46] getupval   0   4        ; ui
[47] gettable   0   0   266  ; "SetStatusText"
[48] getglobal  1   17       ; g_resources
[49] gettable   1   1   268  ; "unpackingMultiple"
[50] call       0   2   1  
[51] jmp        5            ; to [57]
[52] getupval   0   4        ; ui
[53] gettable   0   0   266  ; "SetStatusText"
[54] getglobal  1   17       ; g_resources
[55] gettable   1   1   269  ; "unpacking"
[56] call       0   2   1  
[57] getupval   0   1        ; win32
[58] gettable   0   0   270  ; "unpack"
[59] getupval   1   2        ; payload
[60] gettable   1   1   259  ; "Target"
[61] getupval   2   0        ; env
[62] gettable   2   2   257  ; "installDir"
[63] call       0   3   1  
[64] getupval   0   4        ; ui
[65] gettable   0   0   266  ; "SetStatusText"
[66] getglobal  1   17       ; g_resources
[67] gettable   1   1   271  ; "installing"
[68] call       0   2   1  
[69] getupval   0   5        ; NestedScript
[70] getupval   1   0        ; env
[71] gettable   1   1   257  ; "installDir"
[72] loadk      2   22       ; "\\gameinst.xml"
[73] concat     1   1   2  
[74] call       0   2   1  
[75] return     0   1      
; end of function


; function [1] definition (level 5)
; 6 upvalues, 0 params, 7 stacks
.function  6 0 0 7
.local  "script"  ; 0
.upvalue  "env"  ; 0
.upvalue  "win32"  ; 1
.upvalue  "payload"  ; 2
.upvalue  "installStep"  ; 3
.upvalue  "ChunkSink"  ; 4
.upvalue  "NestedScript"  ; 5
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Processing RAR Payload"  ; 6
.const  "installDir"  ; 7
.const  "StripFilename"  ; 8
.const  "Target"  ; 9
.const  "."  ; 10
.const  "Payload Path: "  ; 11
.const  "LaunchProcess"  ; 12
.const  ".\\bin\\UnRAR.exe"  ; 13
.const  " x -ai -o+ -inul \""  ; 14
.const  "\" \""  ; 15
.const  "\""  ; 16
.const  "\\gameinst.xml"  ; 17
.const  "touch"  ; 18
[01] getglobal  0   0        ; io
[02] gettable   0   0   251  ; "write"
[03] loadk      1   2        ; "\n"
[04] getglobal  2   3        ; os
[05] gettable   2   2   254  ; "date"
[06] loadk      3   5        ; "%c "
[07] call       2   2   2  
[08] loadk      3   6        ; "Processing RAR Payload"
[09] call       0   4   1  
[10] getupval   0   0        ; env
[11] getupval   1   1        ; win32
[12] gettable   1   1   258  ; "StripFilename"
[13] getupval   2   2        ; payload
[14] gettable   2   2   259  ; "Target"
[15] call       1   2   2  
[16] test       1   1   1    ; to [18] if false
[17] jmp        1            ; to [19]
[18] loadk      1   10       ; "."
[19] settable   0   257 1    ; "installDir"
[20] getglobal  0   0        ; io
[21] gettable   0   0   251  ; "write"
[22] loadk      1   2        ; "\n"
[23] getglobal  2   3        ; os
[24] gettable   2   2   254  ; "date"
[25] loadk      3   5        ; "%c "
[26] call       2   2   2  
[27] loadk      3   11       ; "Payload Path: "
[28] getupval   4   0        ; env
[29] gettable   4   4   257  ; "installDir"
[30] call       0   5   1  
[31] getupval   0   1        ; win32
[32] gettable   0   0   262  ; "LaunchProcess"
[33] loadk      1   13       ; ".\\bin\\UnRAR.exe"
[34] loadk      2   14       ; " x -ai -o+ -inul \""
[35] getupval   3   2        ; payload
[36] gettable   3   3   259  ; "Target"
[37] loadk      4   15       ; "\" \""
[38] getupval   5   0        ; env
[39] gettable   5   5   257  ; "installDir"
[40] loadk      6   16       ; "\""
[41] concat     2   2   6  
[42] loadbool   3   1   0    ; true
[43] getupval   4   3        ; installStep
[44] getupval   5   4        ; ChunkSink
[45] call       0   6   1  
[46] getupval   0   0        ; env
[47] gettable   0   0   257  ; "installDir"
[48] loadk      1   17       ; "\\gameinst.xml"
[49] concat     0   0   1  
[50] getglobal  1   0        ; io
[51] gettable   1   1   268  ; "touch"
[52] move       2   0      
[53] call       1   2   2  
[54] test       1   1   0    ; to [56] if true
[55] jmp        3            ; to [59]
[56] getupval   1   5        ; NestedScript
[57] move       2   0      
[58] call       1   2   1  
[59] return     0   1      
; end of function


; function [2] definition (level 5)
; 4 upvalues, 0 params, 6 stacks
.function  4 0 0 6
.upvalue  "payload"  ; 0
.upvalue  "win32"  ; 1
.upvalue  "installStep"  ; 2
.upvalue  "ChunkSink"  ; 3
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Processing Exe Payload"  ; 6
.const  "Run"  ; 7
.const  "true"  ; 8
.const  "Hide"  ; 9
.const  "false"  ; 10
.const  "LaunchProcess"  ; 11
.const  "Target"  ; 12
.const  "Params"  ; 13
[01] getglobal  0   0        ; io
[02] gettable   0   0   251  ; "write"
[03] loadk      1   2        ; "\n"
[04] getglobal  2   3        ; os
[05] gettable   2   2   254  ; "date"
[06] loadk      3   5        ; "%c "
[07] call       2   2   2  
[08] loadk      3   6        ; "Processing Exe Payload"
[09] call       0   4   1  
[10] getupval   0   0        ; payload
[11] gettable   0   0   257  ; "Run"
[12] eq         0   0   258  ; "true", to [14] if true
[13] jmp        25           ; to [39]
[14] getupval   0   0        ; payload
[15] gettable   0   0   259  ; "Hide"
[16] eq         0   0   260  ; "false", to [18] if true
[17] jmp        11           ; to [29]
[18] getupval   0   1        ; win32
[19] gettable   0   0   261  ; "LaunchProcess"
[20] getupval   1   0        ; payload
[21] gettable   1   1   262  ; "Target"
[22] getupval   2   0        ; payload
[23] gettable   2   2   263  ; "Params"
[24] loadbool   3   0   0    ; false
[25] getupval   4   2        ; installStep
[26] getupval   5   3        ; ChunkSink
[27] call       0   6   1  
[28] jmp        10           ; to [39]
[29] getupval   0   1        ; win32
[30] gettable   0   0   261  ; "LaunchProcess"
[31] getupval   1   0        ; payload
[32] gettable   1   1   262  ; "Target"
[33] getupval   2   0        ; payload
[34] gettable   2   2   263  ; "Params"
[35] loadbool   3   1   0    ; true
[36] getupval   4   2        ; installStep
[37] getupval   5   3        ; ChunkSink
[38] call       0   6   1  
[39] return     0   1      
; end of function

[01] gettable   1   0   250  ; "Target"
[02] settable   0   250 1    ; "Target"
[03] getglobal  1   1        ; string
[04] gettable   1   1   252  ; "gsub"
[05] gettable   2   0   250  ; "Target"
[06] loadk      3   3        ; "/"
[07] loadk      4   4        ; "\\"
[08] call       1   4   2  
[09] settable   0   250 1    ; "Target"
[10] getglobal  1   5        ; io
[11] gettable   1   1   256  ; "touch"
[12] gettable   2   0   250  ; "Target"
[13] call       1   2   2  
[14] test       1   1   1    ; to [16] if false
[15] jmp        1            ; to [17]
[16] return     0   1      
[17] closure    1   0        ; 6 upvalues
[18] getupval   0   0        ; env
[19] getupval   0   1        ; win32
[20] move       0   0      
[21] getupval   0   2        ; unInst
[22] getupval   0   3        ; ui
[23] getupval   0   4        ; NestedScript
[24] closure    2   1        ; 6 upvalues
[25] getupval   0   0        ; env
[26] getupval   0   1        ; win32
[27] move       0   0      
[28] getupval   0   5        ; installStep
[29] getupval   0   6        ; ChunkSink
[30] getupval   0   4        ; NestedScript
[31] closure    3   2        ; 4 upvalues
[32] move       0   0      
[33] getupval   0   1        ; win32
[34] getupval   0   5        ; installStep
[35] getupval   0   6        ; ChunkSink
[36] getglobal  4   1        ; string
[37] gettable   4   4   257  ; "find"
[38] gettable   5   0   250  ; "Target"
[39] loadk      6   8        ; "%.rga"
[40] call       4   3   2  
[41] test       4   4   0    ; to [43] if true
[42] jmp        4            ; to [47]
[43] move       4   1      
[44] move       5   0      
[45] call       4   2   1  
[46] jmp        30           ; to [77]
[47] getglobal  4   1        ; string
[48] gettable   4   4   257  ; "find"
[49] gettable   5   0   250  ; "Target"
[50] loadk      6   9        ; "%.exe"
[51] call       4   3   2  
[52] test       4   4   0    ; to [54] if true
[53] jmp        3            ; to [57]
[54] move       4   3      
[55] call       4   1   1  
[56] jmp        20           ; to [77]
[57] getglobal  4   1        ; string
[58] gettable   4   4   257  ; "find"
[59] gettable   5   0   250  ; "Target"
[60] loadk      6   10       ; "%.rgi"
[61] call       4   3   2  
[62] test       4   4   0    ; to [64] if true
[63] jmp        4            ; to [68]
[64] getupval   4   4        ; NestedScript
[65] gettable   5   0   250  ; "Target"
[66] call       4   2   1  
[67] jmp        9            ; to [77]
[68] getglobal  4   1        ; string
[69] gettable   4   4   257  ; "find"
[70] gettable   5   0   250  ; "Target"
[71] loadk      6   11       ; "%.rar"
[72] call       4   3   2  
[73] test       4   4   0    ; to [75] if true
[74] jmp        2            ; to [77]
[75] move       4   2      
[76] call       4   1   1  
[77] gettable   4   0   262  ; "Persist"
[78] eq         0   4   263  ; "false", to [80] if true
[79] jmp        4            ; to [84]
[80] getupval   4   1        ; win32
[81] gettable   4   4   264  ; "DeleteFile"
[82] gettable   5   0   250  ; "Target"
[83] call       4   2   1  
[84] getupval   4   7        ; members
[85] gettable   4   4   265  ; "DoInstall"
[86] move       5   0      
[87] tailcall   4   2   0  
[88] return     4   0      
[89] return     0   1      
; end of function


; function [25] definition (level 4)
; 2 upvalues, 0 params, 5 stacks
.function  2 0 0 5
.local  "s"  ; 0
.local  "err"  ; 1
.upvalue  "ui"  ; 0
.upvalue  "procMgr"  ; 1
.const  "coroutine"  ; 0
.const  "status"  ; 1
.const  "data"  ; 2
.const  "slidesh"  ; 3
.const  "dead"  ; 4
.const  "resume"  ; 5
.const  "pollthread"  ; 6
.const  "assert"  ; 7
.const  "wndClose"  ; 8
.const  "g_installed"  ; 9
.const  "Sleep"  ; 10
.const  100  ; 11
[01] getglobal  0   0        ; coroutine
[02] gettable   0   0   251  ; "status"
[03] getupval   1   0        ; ui
[04] gettable   1   1   252  ; "data"
[05] gettable   1   1   253  ; "slidesh"
[06] call       0   2   2  
[07] eq         1   0   254  ; "dead", to [9] if false
[08] jmp        21           ; to [30]
[09] getglobal  0   0        ; coroutine
[10] gettable   0   0   255  ; "resume"
[11] getupval   1   0        ; ui
[12] gettable   1   1   256  ; "pollthread"
[13] call       0   2   1  
[14] getglobal  0   0        ; coroutine
[15] gettable   0   0   255  ; "resume"
[16] getupval   1   0        ; ui
[17] gettable   1   1   252  ; "data"
[18] gettable   1   1   253  ; "slidesh"
[19] call       0   2   3  
[20] getglobal  2   7        ; assert
[21] move       3   0      
[22] move       4   1      
[23] call       2   3   1  
[24] eq         0   1   258  ; "wndClose", to [26] if true
[25] jmp        4            ; to [30]
[26] getglobal  2   7        ; assert
[27] getglobal  3   9        ; g_installed
[28] move       4   1      
[29] call       2   3   1  
[30] getupval   0   1        ; procMgr
[31] self       0   0   260  ; "Sleep"
[32] loadk      2   11       ; 100
[33] call       0   3   1  
[34] return     0   1      
; end of function


; function [26] definition (level 4)
; 3 upvalues, 0 params, 6 stacks
.function  3 0 0 6
.local  "t1"  ; 0
.local  "n1"  ; 1
.local  "t2"  ; 2
.local  "n2"  ; 3
.upvalue  "members"  ; 0
.upvalue  "SubstEnvRec"  ; 1
.upvalue  "xml"  ; 2
.const  "TotalPayloads"  ; 0
.const  "ArcadeInstaller"  ; 1
.const  1  ; 2
.const  "Payload"  ; 3
.const  "MutualDepend"  ; 4
[01] getupval   0   0        ; members
[02] gettable   0   0   250  ; "TotalPayloads"
[03] getupval   1   1        ; SubstEnvRec
[04] getupval   2   2        ; xml
[05] gettable   2   2   251  ; "ArcadeInstaller"
[06] gettable   2   2   252  ; 1
[07] gettable   2   2   253  ; "Payload"
[08] call       1   2   0  
[09] call       0   0   3  
[10] getupval   2   0        ; members
[11] gettable   2   2   250  ; "TotalPayloads"
[12] getupval   3   1        ; SubstEnvRec
[13] getupval   4   2        ; xml
[14] gettable   4   4   251  ; "ArcadeInstaller"
[15] gettable   4   4   252  ; 1
[16] gettable   4   4   254  ; "MutualDepend"
[17] call       3   2   0  
[18] call       2   0   3  
[19] add        4   0   2  
[20] add        5   1   3  
[21] return     4   3      
[22] return     0   1      
; end of function


; function [27] definition (level 4)
; 5 upvalues, 1 params, 23 stacks
.function  5 1 0 23
.local  "payloads"  ; 0
.local  "dbPrefix"  ; 1
.local  "total"  ; 2
.local  "num"  ; 3
.local  "RgiSize"  ; 4
.local  "(for generator)"  ; 5
.local  "(for state)"  ; 6
.local  "payload"  ; 7
.local  "src"  ; 8
.local  "dest"  ; 9
.local  "id"  ; 10
.local  "display"  ; 11
.local  "cbPayload"  ; 12
.local  "pass"  ; 13
.local  "ret"  ; 14
.local  "n"  ; 15
.upvalue  "dwnldMgr"  ; 0
.upvalue  "env"  ; 1
.upvalue  "CheckConditions"  ; 2
.upvalue  "ui"  ; 3
.upvalue  "members"  ; 4
.const  "payloads.TotalPayloads: "  ; 0
.const  0  ; 1
.const  "Src"  ; 2
.const  "Target"  ; 3
.const  "Id"  ; 4
.const  "DisplayProgress"  ; 5
.const  "FileSize"  ; 6
.const  "io"  ; 7
.const  "write"  ; 8
.const  "\n"  ; 9
.const  "os"  ; 10
.const  "date"  ; 11
.const  "%c "  ; 12
.const  "checking src = "  ; 13
.const  ", display = "  ; 14
.const  "tostring"  ; 15
.const  " cbPayload = "  ; 16
.const  "nil"  ; 17
.const  "ConditionCheck"  ; 18
.const  "IsTagRemoved"  ; 19
.const  "check succeeded, num = "  ; 20
.const  "Payload"  ; 21
.const  "TotalPayloads"  ; 22
.const  "MutualDepend"  ; 23
.const  "string"  ; 24
.const  "find"  ; 25
.const  ".rgi"  ; 26
.const  "recursing into src = "  ; 27
.const  "pcall"  ; 28
.const  "tonumber"  ; 29
.const  "success"  ; 30
.const  "http"  ; 31
.const  "true"  ; 32
.const  1  ; 33
.const  "file size from RGI = "  ; 34
.const  "PayloadSize"  ; 35
.const  ".rga"  ; 36
.const  "counting src = "  ; 37
.const  " file size from HEAD request = "  ; 38
.const  "userAbort"  ; 39
.const  "assert"  ; 40
.const  "Failed to get payload size for, "  ; 41
.const  "\nError: "  ; 42

; function [0] definition (level 5)
; 2 upvalues, 1 params, 5 stacks
.function  2 1 0 5
.local  "payload"  ; 0
.local  "file"  ; 1
.local  "interp"  ; 2
.upvalue  "dwnldMgr"  ; 0
.upvalue  "env"  ; 1
.const  "Src"  ; 0
.const  "string"  ; 1
.const  "find"  ; 2
.const  "http"  ; 3
.const  "GetFile"  ; 4
.const  "Target"  ; 5
.const  "MetadataInterp"  ; 6
.const  "LoadXML"  ; 7
.const  "PreProcess"  ; 8
.const  "TotalRootPayloads"  ; 9
[01] gettable   1   0   250  ; "Src"
[02] getglobal  2   1        ; string
[03] gettable   2   2   252  ; "find"
[04] move       3   1      
[05] loadk      4   3        ; "http"
[06] call       2   3   2  
[07] test       2   2   0    ; to [9] if true
[08] jmp        6            ; to [15]
[09] getupval   2   0        ; dwnldMgr
[10] gettable   2   2   254  ; "GetFile"
[11] move       3   1      
[12] gettable   4   0   255  ; "Target"
[13] call       2   3   1  
[14] gettable   1   0   255  ; "Target"
[15] getglobal  2   6        ; MetadataInterp
[16] getupval   3   1        ; env
[17] call       2   2   2  
[18] gettable   3   2   257  ; "LoadXML"
[19] move       4   1      
[20] call       3   2   1  
[21] gettable   3   2   258  ; "PreProcess"
[22] call       3   1   1  
[23] gettable   3   2   259  ; "TotalRootPayloads"
[24] tailcall   3   1   0  
[25] return     3   0      
[26] return     0   1      
; end of function

[001] loadk      1   0        ; "payloads.TotalPayloads: "
[002] loadk      2   1        ; 0
[003] loadk      3   1        ; 0
[004] closure    4   0        ; 2 upvalues
[005] getupval   0   0        ; dwnldMgr
[006] getupval   0   1        ; env
[007] test       0   0   0    ; to [9] if true
[008] jmp        231          ; to [240]
[009] move       5   0      
[010] loadnil    6   7      
[011] tforprep   5   226      ; to [238]
[012] gettable   8   0   7  
[013] gettable   8   8   252  ; "Src"
[014] gettable   9   0   7  
[015] gettable   9   9   253  ; "Target"
[016] gettable   10  0   7  
[017] gettable   10  10  254  ; "Id"
[018] gettable   11  0   7  
[019] gettable   11  11  255  ; "DisplayProgress"
[020] gettable   12  0   7  
[021] gettable   12  12  256  ; "FileSize"
[022] getglobal  13  7        ; io
[023] gettable   13  13  258  ; "write"
[024] loadk      14  9        ; "\n"
[025] getglobal  15  10       ; os
[026] gettable   15  15  261  ; "date"
[027] loadk      16  12       ; "%c "
[028] call       15  2   2  
[029] move       16  1      
[030] concat     14  14  16 
[031] loadk      15  13       ; "checking src = "
[032] move       16  8      
[033] loadk      17  14       ; ", display = "
[034] getglobal  18  15       ; tostring
[035] move       19  11     
[036] call       18  2   2  
[037] loadk      19  16       ; " cbPayload = "
[038] test       20  12  1    ; to [40] if false
[039] jmp        1            ; to [41]
[040] loadk      20  17       ; "nil"
[041] concat     15  15  20 
[042] call       13  3   1  
[043] getupval   13  2        ; CheckConditions
[044] gettable   14  0   7  
[045] gettable   14  14  268  ; "ConditionCheck"
[046] call       13  2   2  
[047] test       13  13  0    ; to [49] if true
[048] jmp        189          ; to [238]
[049] test       10  10  0    ; to [51] if true
[050] jmp        6            ; to [57]
[051] getupval   13  3        ; ui
[052] gettable   13  13  269  ; "IsTagRemoved"
[053] move       14  10     
[054] call       13  2   2  
[055] test       13  13  1    ; to [57] if false
[056] jmp        181          ; to [238]
[057] loadnil    13  15     
[058] getglobal  16  7        ; io
[059] gettable   16  16  258  ; "write"
[060] loadk      17  9        ; "\n"
[061] getglobal  18  10       ; os
[062] gettable   18  18  261  ; "date"
[063] loadk      19  12       ; "%c "
[064] call       18  2   2  
[065] move       19  1      
[066] concat     17  17  19 
[067] loadk      18  20       ; "check succeeded, num = "
[068] move       19  3      
[069] concat     18  18  19 
[070] call       16  3   1  
[071] gettable   16  0   7  
[072] gettable   16  16  271  ; "Payload"
[073] test       16  16  0    ; to [75] if true
[074] jmp        9            ; to [84]
[075] getupval   16  4        ; members
[076] gettable   16  16  272  ; "TotalPayloads"
[077] gettable   17  0   7  
[078] gettable   17  17  271  ; "Payload"
[079] call       16  2   3  
[080] move       15  17     
[081] move       14  16     
[082] add        2   2   14 
[083] add        3   3   15 
[084] gettable   16  0   7  
[085] gettable   16  16  273  ; "MutualDepend"
[086] test       16  16  0    ; to [88] if true
[087] jmp        9            ; to [97]
[088] getupval   16  4        ; members
[089] gettable   16  16  272  ; "TotalPayloads"
[090] gettable   17  0   7  
[091] gettable   17  17  273  ; "MutualDepend"
[092] call       16  2   3  
[093] move       15  17     
[094] move       14  16     
[095] add        2   2   14 
[096] add        3   3   15 
[097] loadk      16  1        ; 0
[098] loadk      15  1        ; 0
[099] move       14  16     
[100] test       9   9   0    ; to [102] if true
[101] jmp        136          ; to [238]
[102] getglobal  16  24       ; string
[103] gettable   16  16  275  ; "find"
[104] move       17  9      
[105] loadk      18  26       ; ".rgi"
[106] call       16  3   2  
[107] test       16  16  0    ; to [109] if true
[108] jmp        21           ; to [130]
[109] getglobal  16  7        ; io
[110] gettable   16  16  258  ; "write"
[111] loadk      17  9        ; "\n"
[112] getglobal  18  10       ; os
[113] gettable   18  18  261  ; "date"
[114] loadk      19  12       ; "%c "
[115] call       18  2   2  
[116] move       19  1      
[117] concat     17  17  19 
[118] loadk      18  27       ; "recursing into src = "
[119] move       19  8      
[120] concat     18  18  19 
[121] call       16  3   1  
[122] getglobal  16  28       ; pcall
[123] move       17  4      
[124] gettable   18  0   7  
[125] call       16  3   4  
[126] move       15  18     
[127] move       14  17     
[128] move       13  16     
[129] jmp        75           ; to [205]
[130] test       12  12  0    ; to [132] if true
[131] jmp        30           ; to [162]
[132] getglobal  16  29       ; tonumber
[133] move       17  12     
[134] call       16  2   2  
[135] move       14  16     
[136] loadk      13  30       ; "success"
[137] getglobal  16  24       ; string
[138] gettable   16  16  275  ; "find"
[139] move       17  8      
[140] loadk      18  31       ; "http"
[141] call       16  3   2  
[142] test       16  16  0    ; to [144] if true
[143] jmp        3            ; to [147]
[144] eq         0   11  282  ; "true", to [146] if true
[145] jmp        1            ; to [147]
[146] loadk      15  33       ; 1
[147] getglobal  16  7        ; io
[148] gettable   16  16  258  ; "write"
[149] loadk      17  9        ; "\n"
[150] getglobal  18  10       ; os
[151] gettable   18  18  261  ; "date"
[152] loadk      19  12       ; "%c "
[153] call       18  2   2  
[154] concat     17  17  18 
[155] loadk      18  34       ; "file size from RGI = "
[156] getglobal  19  15       ; tostring
[157] move       20  12     
[158] call       19  2   2  
[159] concat     18  18  19 
[160] call       16  3   1  
[161] jmp        43           ; to [205]
[162] getglobal  16  28       ; pcall
[163] getupval   17  0        ; dwnldMgr
[164] gettable   17  17  285  ; "PayloadSize"
[165] move       18  8      
[166] call       16  3   3  
[167] move       14  17     
[168] move       13  16     
[169] getglobal  16  24       ; string
[170] gettable   16  16  275  ; "find"
[171] move       17  8      
[172] loadk      18  31       ; "http"
[173] call       16  3   2  
[174] test       16  16  0    ; to [176] if true
[175] jmp        29           ; to [205]
[176] test       13  13  0    ; to [178] if true
[177] jmp        27           ; to [205]
[178] eq         1   11  282  ; "true", to [180] if false
[179] jmp        7            ; to [187]
[180] getglobal  16  24       ; string
[181] gettable   16  16  275  ; "find"
[182] move       17  8      
[183] loadk      18  36       ; ".rga"
[184] call       16  3   2  
[185] test       16  16  0    ; to [187] if true
[186] jmp        18           ; to [205]
[187] loadk      15  33       ; 1
[188] getglobal  16  7        ; io
[189] gettable   16  16  258  ; "write"
[190] loadk      17  9        ; "\n"
[191] getglobal  18  10       ; os
[192] gettable   18  18  261  ; "date"
[193] loadk      19  12       ; "%c "
[194] call       18  2   2  
[195] move       19  1      
[196] concat     17  17  19 
[197] loadk      18  37       ; "counting src = "
[198] move       19  8      
[199] loadk      20  38       ; " file size from HEAD request = "
[200] getglobal  21  15       ; tostring
[201] move       22  14     
[202] call       21  2   2  
[203] concat     18  18  21 
[204] call       16  3   1  
[205] test       13  13  1    ; to [207] if false
[206] jmp        12           ; to [219]
[207] getglobal  16  24       ; string
[208] gettable   16  16  275  ; "find"
[209] move       17  14     
[210] loadk      18  39       ; "userAbort"
[211] call       16  3   2  
[212] test       16  16  0    ; to [214] if true
[213] jmp        5            ; to [219]
[214] getglobal  16  40       ; assert
[215] loadbool   17  0   0    ; false
[216] loadk      18  39       ; "userAbort"
[217] call       16  3   1  
[218] jmp        19           ; to [238]
[219] test       13  13  1    ; to [221] if false
[220] jmp        15           ; to [236]
[221] getglobal  16  7        ; io
[222] gettable   16  16  258  ; "write"
[223] loadk      17  9        ; "\n"
[224] getglobal  18  10       ; os
[225] gettable   18  18  261  ; "date"
[226] loadk      19  12       ; "%c "
[227] call       18  2   2  
[228] move       19  1      
[229] concat     17  17  19 
[230] loadk      18  41       ; "Failed to get payload size for, "
[231] move       19  8      
[232] loadk      20  42       ; "\nError: "
[233] move       21  14     
[234] call       16  6   1  
[235] jmp        2            ; to [238]
[236] add        2   2   14 
[237] add        3   3   15 
[238] tforloop   5       0    ; to [240] if exit
[239] jmp        -228         ; to [12]
[240] move       5   2      
[241] move       6   3      
[242] return     5   3      
[243] return     0   1      
; end of function


; function [28] definition (level 4)
; 4 upvalues, 0 params, 9 stacks
.function  4 0 0 9
.local  "defs"  ; 0
.local  "(for generator)"  ; 1
.local  "(for state)"  ; 2
.local  "def"  ; 3
.local  "var"  ; 4
.upvalue  "members"  ; 0
.upvalue  "SubstEnvRec"  ; 1
.upvalue  "xml"  ; 2
.upvalue  "conditions"  ; 3
.const  "initedConditions"  ; 0
.const  "ArcadeInstaller"  ; 1
.const  1  ; 2
.const  "ConditionDef"  ; 3
.const  "Var"  ; 4
.const  "AddCondition"  ; 5
.const  "Id"  ; 6
.const  "Type"  ; 7
[01] getupval   0   0        ; members
[02] gettable   0   0   250  ; "initedConditions"
[03] test       0   0   0    ; to [5] if true
[04] jmp        1            ; to [6]
[05] return     0   1      
[06] getupval   0   1        ; SubstEnvRec
[07] getupval   1   2        ; xml
[08] gettable   1   1   251  ; "ArcadeInstaller"
[09] gettable   1   1   252  ; 1
[10] gettable   1   1   253  ; "ConditionDef"
[11] call       0   2   2  
[12] test       0   0   0    ; to [14] if true
[13] jmp        15           ; to [29]
[14] move       1   0      
[15] loadnil    2   3      
[16] tforprep   1   10       ; to [27]
[17] gettable   4   0   3  
[18] gettable   4   4   254  ; "Var"
[19] getupval   5   3        ; conditions
[20] gettable   5   5   255  ; "AddCondition"
[21] gettable   6   0   3  
[22] gettable   6   6   256  ; "Id"
[23] gettable   7   0   3  
[24] gettable   7   7   257  ; "Type"
[25] move       8   4      
[26] call       5   4   1  
[27] tforloop   1       0    ; to [29] if exit
[28] jmp        -12          ; to [17]
[29] getupval   1   0        ; members
[30] loadbool   2   1   0    ; true
[31] settable   1   250 2    ; "initedConditions"
[32] return     0   1      
; end of function


; function [29] definition (level 4)
; 2 upvalues, 0 params, 11 stacks
.function  2 0 0 11
.local  "advancedOptions"  ; 0
.local  "lang"  ; 1
.local  "publisherName"  ; 2
.local  "sdkKey"  ; 3
.local  "sdkSecret"  ; 4
.upvalue  "xml"  ; 0
.upvalue  "ui"  ; 1
.const  "ArcadeInstaller"  ; 0
.const  1  ; 1
.const  "OpenCandyOptions"  ; 2
.const  ""  ; 3
.const  "Key"  ; 4
.const  "Secret"  ; 5
.const  "lang"  ; 6
.const  "Lang"  ; 7
.const  "publisherName"  ; 8
.const  "StoreFront"  ; 9
.const  "AdvancedOptions"  ; 10
.const  "io"  ; 11
.const  "write"  ; 12
.const  "\n"  ; 13
.const  "os"  ; 14
.const  "date"  ; 15
.const  "%c "  ; 16
.const  "publisherName = "  ; 17
.const  "sdkKey = "  ; 18
.const  "sdkSecret = "  ; 19
.const  "lang = "  ; 20
.const  "advancedOptions = "  ; 21
.const  "SetCandyOptions"  ; 22
[001] getupval   0   0        ; xml
[002] gettable   0   0   250  ; "ArcadeInstaller"
[003] gettable   0   0   251  ; 1
[004] gettable   0   0   252  ; "OpenCandyOptions"
[005] test       0   0   0    ; to [7] if true
[006] jmp        124          ; to [131]
[007] loadk      0   3        ; ""
[008] loadnil    1   2      
[009] getupval   3   0        ; xml
[010] gettable   3   3   250  ; "ArcadeInstaller"
[011] gettable   3   3   251  ; 1
[012] gettable   3   3   252  ; "OpenCandyOptions"
[013] gettable   3   3   251  ; 1
[014] gettable   3   3   254  ; "Key"
[015] getupval   4   0        ; xml
[016] gettable   4   4   250  ; "ArcadeInstaller"
[017] gettable   4   4   251  ; 1
[018] gettable   4   4   252  ; "OpenCandyOptions"
[019] gettable   4   4   251  ; 1
[020] gettable   4   4   255  ; "Secret"
[021] getupval   5   0        ; xml
[022] gettable   5   5   250  ; "ArcadeInstaller"
[023] gettable   5   5   251  ; 1
[024] gettable   5   5   252  ; "OpenCandyOptions"
[025] gettable   5   5   251  ; 1
[026] gettable   5   5   256  ; "lang"
[027] test       5   5   0    ; to [29] if true
[028] jmp        7            ; to [36]
[029] getupval   5   0        ; xml
[030] gettable   5   5   250  ; "ArcadeInstaller"
[031] gettable   5   5   251  ; 1
[032] gettable   5   5   252  ; "OpenCandyOptions"
[033] gettable   5   5   251  ; 1
[034] gettable   1   5   256  ; "lang"
[035] jmp        4            ; to [40]
[036] getupval   5   0        ; xml
[037] gettable   5   5   250  ; "ArcadeInstaller"
[038] gettable   5   5   251  ; 1
[039] gettable   1   5   257  ; "Lang"
[040] getupval   5   0        ; xml
[041] gettable   5   5   250  ; "ArcadeInstaller"
[042] gettable   5   5   251  ; 1
[043] gettable   5   5   252  ; "OpenCandyOptions"
[044] gettable   5   5   251  ; 1
[045] gettable   5   5   258  ; "publisherName"
[046] test       5   5   0    ; to [48] if true
[047] jmp        7            ; to [55]
[048] getupval   5   0        ; xml
[049] gettable   5   5   250  ; "ArcadeInstaller"
[050] gettable   5   5   251  ; 1
[051] gettable   5   5   252  ; "OpenCandyOptions"
[052] gettable   5   5   251  ; 1
[053] gettable   2   5   258  ; "publisherName"
[054] jmp        4            ; to [59]
[055] getupval   5   0        ; xml
[056] gettable   5   5   250  ; "ArcadeInstaller"
[057] gettable   5   5   251  ; 1
[058] gettable   2   5   259  ; "StoreFront"
[059] getupval   5   0        ; xml
[060] gettable   5   5   250  ; "ArcadeInstaller"
[061] gettable   5   5   251  ; 1
[062] gettable   5   5   252  ; "OpenCandyOptions"
[063] gettable   5   5   251  ; 1
[064] gettable   5   5   260  ; "AdvancedOptions"
[065] test       5   5   0    ; to [67] if true
[066] jmp        6            ; to [73]
[067] getupval   5   0        ; xml
[068] gettable   5   5   250  ; "ArcadeInstaller"
[069] gettable   5   5   251  ; 1
[070] gettable   5   5   252  ; "OpenCandyOptions"
[071] gettable   5   5   251  ; 1
[072] gettable   0   5   260  ; "AdvancedOptions"
[073] getglobal  5   11       ; io
[074] gettable   5   5   262  ; "write"
[075] loadk      6   13       ; "\n"
[076] getglobal  7   14       ; os
[077] gettable   7   7   265  ; "date"
[078] loadk      8   16       ; "%c "
[079] call       7   2   2  
[080] loadk      8   17       ; "publisherName = "
[081] move       9   2      
[082] call       5   5   1  
[083] getglobal  5   11       ; io
[084] gettable   5   5   262  ; "write"
[085] loadk      6   13       ; "\n"
[086] getglobal  7   14       ; os
[087] gettable   7   7   265  ; "date"
[088] loadk      8   16       ; "%c "
[089] call       7   2   2  
[090] loadk      8   18       ; "sdkKey = "
[091] move       9   3      
[092] call       5   5   1  
[093] getglobal  5   11       ; io
[094] gettable   5   5   262  ; "write"
[095] loadk      6   13       ; "\n"
[096] getglobal  7   14       ; os
[097] gettable   7   7   265  ; "date"
[098] loadk      8   16       ; "%c "
[099] call       7   2   2  
[100] loadk      8   19       ; "sdkSecret = "
[101] move       9   4      
[102] call       5   5   1  
[103] getglobal  5   11       ; io
[104] gettable   5   5   262  ; "write"
[105] loadk      6   13       ; "\n"
[106] getglobal  7   14       ; os
[107] gettable   7   7   265  ; "date"
[108] loadk      8   16       ; "%c "
[109] call       7   2   2  
[110] loadk      8   20       ; "lang = "
[111] move       9   1      
[112] call       5   5   1  
[113] getglobal  5   11       ; io
[114] gettable   5   5   262  ; "write"
[115] loadk      6   13       ; "\n"
[116] getglobal  7   14       ; os
[117] gettable   7   7   265  ; "date"
[118] loadk      8   16       ; "%c "
[119] call       7   2   2  
[120] loadk      8   21       ; "advancedOptions = "
[121] move       9   0      
[122] call       5   5   1  
[123] getupval   5   1        ; ui
[124] gettable   5   5   272  ; "SetCandyOptions"
[125] move       6   2      
[126] move       7   3      
[127] move       8   4      
[128] move       9   1      
[129] move       10  0      
[130] call       5   6   1  
[131] return     0   1      
; end of function


; function [30] definition (level 4)
; 10 upvalues, 0 params, 17 stacks
.function  10 0 0 17
.local  "findUninstallScripts"  ; 0
.local  "hasContentId"  ; 1
.local  "UninstallPreviousGamesWithSameContentId"  ; 2
.local  "findAmContentIdInGameXml"  ; 3
.local  "UnInstallOldContentId"  ; 4
.local  "SetDialogOptions"  ; 5
.local  "m"  ; 6
.local  "t"  ; 7
.local  "gamesrootSource"  ; 8
.upvalue  "win32"  ; 0
.upvalue  "xml"  ; 1
.upvalue  "env"  ; 2
.upvalue  "SubstEnvRec"  ; 3
.upvalue  "dwnldMgr"  ; 4
.upvalue  "ui"  ; 5
.upvalue  "CheckConditions"  ; 6
.upvalue  "ProcessAuxTags"  ; 7
.upvalue  "members"  ; 8
.upvalue  "installv1location"  ; 9
.const  "Mutex"  ; 0
.const  "RACV2InstallerStopSplash"  ; 1
.const  "os"  ; 2
.const  "clock"  ; 3
.const  "Lock"  ; 4
.const  1  ; 5
.const  "PreProcess"  ; 6
.const  "gamesRoot"  ; 7
.const  "RACConfigValue"  ; 8
.const  "g_constants"  ; 9
.const  "gamesrootkey"  ; 10
.const  "Read"  ; 11
.const  ""  ; 12
.const  "type"  ; 13
.const  "string"  ; 14
.const  "len"  ; 15
.const  3  ; 16
.const  "ToUtf8"  ; 17
.const  "IsPathWriteable"  ; 18
.const  "Sanitize"  ; 19
.const  "io"  ; 20
.const  "write"  ; 21
.const  "\n"  ; 22
.const  "date"  ; 23
.const  "%c "  ; 24
.const  "set GamesRootWriteable to NotWriteable to allow user to re-choose install path"  ; 25
.const  "GamesRootWriteable"  ; 26
.const  "NotWriteable"  ; 27
.const  "tostring"  ; 28
.const  " is "  ; 29
.const  "installv1location"  ; 30
.const  "ArcadeInstaller"  ; 31
.const  "DefaultGamesRoot"  ; 32
.const  "Using "  ; 33
.const  " gamesRoot: "  ; 34
.const  "g_env"  ; 35
.const  "DialogOptions"  ; 36
.const  "InstallerUI"  ; 37
.const  "NullUI"  ; 38
.const  "isDriveValid"  ; 39
.const  "ChooseValidPath"  ; 40
.const  "PutInstallPath"  ; 41
.const  "InitialSlides"  ; 42
.const  "GetInstallPath"  ; 43
.const  "assert"  ; 44
.const  "diskStolen"  ; 45

; function [0] definition (level 5)
; 1 upvalues, 1 params, 9 stacks
.function  1 1 0 9
.local  "path"  ; 0
.local  "uninstallScripts"  ; 1
.local  "items"  ; 2
.local  "enum"  ; 3
.local  "count"  ; 4
.local  "item"  ; 5
.upvalue  "win32"  ; 0
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "findUninstallScripts "  ; 6
.const  "GetFolderItems"  ; 7
.const  "Uninstall path empty"  ; 8
.const  1  ; 9
.const  "Next"  ; 10
.const  "string"  ; 11
.const  "find"  ; 12
.const  "Name"  ; 13
.const  "g_constants"  ; 14
.const  "uninstExt"  ; 15
.const  "instsupportrar.rguninst"  ; 16
[01] getglobal  1   0        ; io
[02] gettable   1   1   251  ; "write"
[03] loadk      2   2        ; "\n"
[04] getglobal  3   3        ; os
[05] gettable   3   3   254  ; "date"
[06] loadk      4   5        ; "%c "
[07] call       3   2   2  
[08] loadk      4   6        ; "findUninstallScripts "
[09] move       5   0      
[10] call       1   5   1  
[11] newtable   1   0   0    ; array=0, hash=0
[12] getupval   2   0        ; win32
[13] gettable   2   2   257  ; "GetFolderItems"
[14] move       3   0      
[15] call       2   2   3  
[16] test       2   2   1    ; to [18] if false
[17] jmp        11           ; to [29]
[18] getglobal  4   0        ; io
[19] gettable   4   4   251  ; "write"
[20] loadk      5   2        ; "\n"
[21] getglobal  6   3        ; os
[22] gettable   6   6   254  ; "date"
[23] loadk      7   5        ; "%c "
[24] call       6   2   2  
[25] loadk      7   8        ; "Uninstall path empty"
[26] call       4   4   1  
[27] return     0   1      
[28] jmp        23           ; to [52]
[29] loadk      4   9        ; 1
[30] self       5   3   260  ; "Next"
[31] call       5   2   2  
[32] jmp        17           ; to [50]
[33] getglobal  6   11       ; string
[34] gettable   6   6   262  ; "find"
[35] gettable   7   5   263  ; "Name"
[36] getglobal  8   14       ; g_constants
[37] gettable   8   8   265  ; "uninstExt"
[38] call       6   3   2  
[39] test       6   6   0    ; to [41] if true
[40] jmp        6            ; to [47]
[41] gettable   6   5   263  ; "Name"
[42] eq         1   266 6    ; "instsupportrar.rguninst", to [44] if false
[43] jmp        3            ; to [47]
[44] gettable   6   5   263  ; "Name"
[45] settable   1   4   6  
[46] add        4   4   259  ; 1
[47] self       6   3   260  ; "Next"
[48] call       6   2   2  
[49] move       5   6      
[50] test       5   5   1    ; to [52] if false
[51] jmp        -19          ; to [33]
[52] return     1   2      
[53] return     0   1      
; end of function


; function [1] definition (level 5)
; 0 upvalues, 2 params, 13 stacks
.function  0 2 0 13
.local  "scriptName"  ; 0
.local  "amContentID"  ; 1
.local  "reply"  ; 2
.local  "handle"  ; 3
.local  "err"  ; 4
.local  "cod"  ; 5
.local  "(for generator)"  ; 6
.local  "(for state)"  ; 7
.local  "line"  ; 8
.local  "foundCid"  ; 9
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Look for "  ; 6
.const  " in "  ; 7
.const  "open"  ; 8
.const  "r"  ; 9
.const  "lines"  ; 10
.const  "_"  ; 11
.const  "string"  ; 12
.const  "find"  ; 13
.const  "REG,HKEY_LOCAL_MACHINE,SOFTWARE\\Trymedia Systems\\ActiveMARK Software\\,(.+)"  ; 14
.const  "upper"  ; 15
.const  "close"  ; 16
.const  "Error "  ; 17
.const  " Code "  ; 18
[01] loadbool   2   0   0    ; false
[02] getglobal  3   0        ; io
[03] gettable   3   3   251  ; "write"
[04] loadk      4   2        ; "\n"
[05] getglobal  5   3        ; os
[06] gettable   5   5   254  ; "date"
[07] loadk      6   5        ; "%c "
[08] call       5   2   2  
[09] loadk      6   6        ; "Look for "
[10] move       7   1      
[11] loadk      8   7        ; " in "
[12] move       9   0      
[13] call       3   7   1  
[14] getglobal  3   0        ; io
[15] gettable   3   3   258  ; "open"
[16] move       4   0      
[17] loadk      5   9        ; "r"
[18] call       3   3   4  
[19] test       3   3   0    ; to [21] if true
[20] jmp        32           ; to [53]
[21] self       6   3   260  ; "lines"
[22] call       6   2   4  
[23] tforprep   6   23       ; to [47]
[24] loadnil    9   9      
[25] getglobal  10  12       ; string
[26] gettable   10  10  263  ; "find"
[27] move       11  8      
[28] loadk      12  14       ; "REG,HKEY_LOCAL_MACHINE,SOFTWARE\\Trymedia Systems\\ActiveMARK Software\\,(.+)"
[29] call       10  3   4  
[30] move       9   12     
[31] setglobal  11  11       ; _
[32] setglobal  10  11       ; _
[33] test       9   9   0    ; to [35] if true
[34] jmp        12           ; to [47]
[35] getglobal  10  12       ; string
[36] gettable   10  10  265  ; "upper"
[37] move       11  9      
[38] call       10  2   2  
[39] getglobal  11  12       ; string
[40] gettable   11  11  265  ; "upper"
[41] move       12  1      
[42] call       11  2   2  
[43] eq         0   10  11   ; to [45] if true
[44] jmp        2            ; to [47]
[45] loadbool   2   1   0    ; true
[46] jmp        2            ; to [49]
[47] tforloop   6       0    ; to [49] if exit
[48] jmp        -25          ; to [24]
[49] self       6   3   266  ; "close"
[50] call       6   2   1  
[51] loadnil    3   3      
[52] jmp        12           ; to [65]
[53] getglobal  6   0        ; io
[54] gettable   6   6   251  ; "write"
[55] loadk      7   2        ; "\n"
[56] getglobal  8   3        ; os
[57] gettable   8   8   254  ; "date"
[58] loadk      9   5        ; "%c "
[59] call       8   2   2  
[60] loadk      9   17       ; "Error "
[61] move       10  4      
[62] loadk      11  18       ; " Code "
[63] move       12  5      
[64] call       6   7   1  
[65] return     2   2      
[66] return     0   1      
; end of function


; function [2] definition (level 5)
; 2 upvalues, 2 params, 15 stacks
.function  2 2 0 15
.local  "installerLoc"  ; 0
.local  "amContentID"  ; 1
.local  "uninstallLoc"  ; 2
.local  "uninstallScripts"  ; 3
.local  "(for generator)"  ; 4
.local  "(for state)"  ; 5
.local  "_"  ; 6
.local  "value"  ; 7
.local  "rguninstPath"  ; 8
.local  "obj"  ; 9
.upvalue  "findUninstallScripts"  ; 0
.upvalue  "hasContentId"  ; 1
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Looking in "  ; 6
.const  " for "  ; 7
.const  "tostring"  ; 8
.const  "uninstall"  ; 9
.const  "type"  ; 10
.const  "table"  ; 11
.const  "pairs"  ; 12
.const  "\\"  ; 13
.const  "Running: "  ; 14
.const  "UnInstaller"  ; 15
.const  "ProcessScript"  ; 16
.const  "UninstallScripts for "  ; 17
.const  " not found"  ; 18
[01] getglobal  2   0        ; io
[02] gettable   2   2   251  ; "write"
[03] loadk      3   2        ; "\n"
[04] getglobal  4   3        ; os
[05] gettable   4   4   254  ; "date"
[06] loadk      5   5        ; "%c "
[07] call       4   2   2  
[08] loadk      5   6        ; "Looking in "
[09] move       6   0      
[10] loadk      7   7        ; " for "
[11] getglobal  8   8        ; tostring
[12] move       9   1      
[13] call       8   2   0  
[14] call       2   0   1  
[15] move       2   0      
[16] loadk      3   9        ; "uninstall"
[17] concat     2   2   3  
[18] getupval   3   0        ; findUninstallScripts
[19] move       4   2      
[20] call       3   2   2  
[21] getglobal  4   10       ; type
[22] move       5   3      
[23] call       4   2   2  
[24] eq         0   4   261  ; "table", to [26] if true
[25] jmp        36           ; to [62]
[26] getglobal  4   12       ; pairs
[27] move       5   3      
[28] call       4   2   5  
[29] tforprep   4   29       ; to [59]
[30] move       8   2      
[31] loadk      9   13       ; "\\"
[32] move       10  7      
[33] concat     8   8   10 
[34] getupval   9   1        ; hasContentId
[35] move       10  8      
[36] move       11  1      
[37] call       9   3   2  
[38] test       9   9   0    ; to [40] if true
[39] jmp        19           ; to [59]
[40] getglobal  9   0        ; io
[41] gettable   9   9   251  ; "write"
[42] loadk      10  2        ; "\n"
[43] getglobal  11  3        ; os
[44] gettable   11  11  254  ; "date"
[45] loadk      12  5        ; "%c "
[46] call       11  2   2  
[47] loadk      12  14       ; "Running: "
[48] move       13  8      
[49] call       9   5   1  
[50] getglobal  9   15       ; UnInstaller
[51] move       10  1      
[52] call       9   2   2  
[53] gettable   10  9   266  ; "ProcessScript"
[54] move       11  8      
[55] loadnil    12  12     
[56] loadbool   13  1   0    ; true
[57] loadbool   14  1   0    ; true
[58] call       10  5   1  
[59] tforloop   4       1    ; to [61] if exit
[60] jmp        -31          ; to [30]
[61] jmp        13           ; to [75]
[62] getglobal  4   0        ; io
[63] gettable   4   4   251  ; "write"
[64] loadk      5   2        ; "\n"
[65] getglobal  6   3        ; os
[66] gettable   6   6   254  ; "date"
[67] loadk      7   5        ; "%c "
[68] call       6   2   2  
[69] loadk      7   17       ; "UninstallScripts for "
[70] getglobal  8   8        ; tostring
[71] move       9   1      
[72] call       8   2   2  
[73] loadk      9   18       ; " not found"
[74] call       4   6   1  
[75] return     0   1      
; end of function


; function [3] definition (level 5)
; 0 upvalues, 1 params, 19 stacks
.function  0 1 0 19
.local  "xml"  ; 0
.local  "payloads"  ; 1
.local  "(for generator)"  ; 2
.local  "(for state)"  ; 3
.local  "_"  ; 4
.local  "payload"  ; 5
.local  "target"  ; 6
.local  "regkeys"  ; 7
.local  "(for generator)"  ; 8
.local  "(for state)"  ; 9
.local  "_"  ; 10
.local  "regkey"  ; 11
.local  "key"  ; 12
.local  "_"  ; 13
.local  "_"  ; 14
.local  "str"  ; 15
.local  "_"  ; 16
.const  "contentId"  ; 0
.const  "ArcadeInstaller"  ; 1
.const  1  ; 2
.const  "Payload"  ; 3
.const  "Target"  ; 4
.const  "Regkey"  ; 5
.const  "Key"  ; 6
.const  "string"  ; 7
.const  "find"  ; 8
.const  "HKEY_LOCAL_MACHINE\\SOFTWARE\\Trymedia Systems\\ActiveMARK Software\\(%w+)"  ; 9
.const  "len"  ; 10
.const  32  ; 11
[01] loadnil    1   1      
[02] setglobal  1   0        ; contentId
[03] gettable   1   0   251  ; "ArcadeInstaller"
[04] gettable   1   1   252  ; 1
[05] gettable   1   1   253  ; "Payload"
[06] test       1   1   0    ; to [8] if true
[07] jmp        34           ; to [42]
[08] move       2   1      
[09] loadnil    3   5      
[10] tforprep   2   29       ; to [40]
[11] gettable   6   5   254  ; "Target"
[12] test       6   6   0    ; to [14] if true
[13] jmp        26           ; to [40]
[14] gettable   7   5   255  ; "Regkey"
[15] test       7   7   0    ; to [17] if true
[16] jmp        23           ; to [40]
[17] move       8   7      
[18] loadnil    9   11     
[19] tforprep   8   18       ; to [38]
[20] gettable   12  11  256  ; "Key"
[21] test       12  12  0    ; to [23] if true
[22] jmp        15           ; to [38]
[23] getglobal  13  7        ; string
[24] gettable   13  13  258  ; "find"
[25] move       14  12     
[26] loadk      15  9        ; "HKEY_LOCAL_MACHINE\\SOFTWARE\\Trymedia Systems\\ActiveMARK Software\\(%w+)"
[27] call       13  3   5  
[28] test       15  15  0    ; to [30] if true
[29] jmp        8            ; to [38]
[30] getglobal  17  7        ; string
[31] gettable   17  17  260  ; "len"
[32] move       18  15     
[33] call       17  2   2  
[34] eq         0   17  261  ; 32, to [36] if true
[35] jmp        2            ; to [38]
[36] setglobal  15  0        ; contentId
[37] jmp        2            ; to [40]
[38] tforloop   8       1    ; to [40] if exit
[39] jmp        -20          ; to [20]
[40] tforloop   2       1    ; to [42] if exit
[41] jmp        -31          ; to [11]
[42] getglobal  2   0        ; contentId
[43] return     2   2      
[44] return     0   1      
; end of function


; function [4] definition (level 5)
; 3 upvalues, 0 params, 4 stacks
.function  3 0 0 4
.local  "amContentID"  ; 0
.upvalue  "findAmContentIdInGameXml"  ; 0
.upvalue  "xml"  ; 1
.upvalue  "UninstallPreviousGamesWithSameContentId"  ; 2
.const  "g_tableURLParameters"  ; 0
.const  "type"  ; 1
.const  "string"  ; 2
.const  "g_constants"  ; 3
.const  "installerLoc"  ; 4
.const  "\\"  ; 5
.const  "io"  ; 6
.const  "write"  ; 7
.const  "\n"  ; 8
.const  "os"  ; 9
.const  "date"  ; 10
.const  "%c "  ; 11
.const  "Missing g_tableURLParameters. Uninstall of legacy game ignored"  ; 12
[01] getglobal  0   0        ; g_tableURLParameters
[02] test       0   0   0    ; to [4] if true
[03] jmp        22           ; to [26]
[04] getupval   0   0        ; findAmContentIdInGameXml
[05] getupval   1   1        ; xml
[06] call       0   2   2  
[07] test       0   0   0    ; to [9] if true
[08] jmp        26           ; to [35]
[09] getglobal  1   1        ; type
[10] move       2   0      
[11] call       1   2   2  
[12] eq         0   1   252  ; "string", to [14] if true
[13] jmp        21           ; to [35]
[14] getglobal  1   3        ; g_constants
[15] gettable   1   1   254  ; "installerLoc"
[16] test       1   1   0    ; to [18] if true
[17] jmp        17           ; to [35]
[18] getupval   1   2        ; UninstallPreviousGamesWithSameContentId
[19] getglobal  2   3        ; g_constants
[20] gettable   2   2   254  ; "installerLoc"
[21] loadk      3   5        ; "\\"
[22] concat     2   2   3  
[23] move       3   0      
[24] call       1   3   1  
[25] jmp        9            ; to [35]
[26] getglobal  0   6        ; io
[27] gettable   0   0   257  ; "write"
[28] loadk      1   8        ; "\n"
[29] getglobal  2   9        ; os
[30] gettable   2   2   260  ; "date"
[31] loadk      3   11       ; "%c "
[32] call       2   2   2  
[33] loadk      3   12       ; "Missing g_tableURLParameters. Uninstall of legacy game ignored"
[34] call       0   4   1  
[35] return     0   1      
; end of function


; function [5] definition (level 5)
; 8 upvalues, 0 params, 20 stacks
.function  8 0 0 20
.local  "dialogXml"  ; 0
.local  "OnBegin"  ; 1
.local  "OnComplete"  ; 2
.local  "OnException"  ; 3
.local  "progress"  ; 4
.local  "DownloadChrome"  ; 5
.local  "resRoot"  ; 6
.local  "mode"  ; 7
.upvalue  "env"  ; 0
.upvalue  "xml"  ; 1
.upvalue  "SubstEnvRec"  ; 2
.upvalue  "dwnldMgr"  ; 3
.upvalue  "win32"  ; 4
.upvalue  "ui"  ; 5
.upvalue  "CheckConditions"  ; 6
.upvalue  "ProcessAuxTags"  ; 7
.const  "enableQueue"  ; 0
.const  "ArcadeInstaller"  ; 1
.const  1  ; 2
.const  "DialogOptions"  ; 3
.const  "EnableQueue"  ; 4
.const  "OnBegin"  ; 5
.const  "DialogUrl"  ; 6
.const  "OnComplete"  ; 7
.const  "OnException"  ; 8
.const  "SetConditionEval"  ; 9
.const  "SetProcessAuxTags"  ; 10
.const  "Chrome"  ; 11
.const  "ImagePack"  ; 12
.const  "WorkingDir"  ; 13
.const  "\\chrome"  ; 14
.const  "Local"  ; 15
.const  "Progress"  ; 16
.const  "true"  ; 17
.const  0  ; 18
.const  "Mode"  ; 19
.const  "SetDialogOptions"  ; 20
.const  "Width"  ; 21
.const  "Height"  ; 22
.const  "MinimizeBtn"  ; 23
.const  "CloseBtn"  ; 24
.const  "QueueUrl"  ; 25

; function [0] definition (level 6)
; 3 upvalues, 0 params, 9 stacks
.function  3 0 0 9
.local  "src"  ; 0
.local  "_"  ; 1
.local  "_"  ; 2
.local  "srcProt"  ; 3
.local  "srcSpec"  ; 4
.upvalue  "dialogXml"  ; 0
.upvalue  "dwnldMgr"  ; 1
.upvalue  "win32"  ; 2
.const  "Chrome"  ; 0
.const  1  ; 1
.const  "ImagePack"  ; 2
.const  "string"  ; 3
.const  "find"  ; 4
.const  "(%a+):///?(.+)"  ; 5
.const  "http"  ; 6
.const  "GetFile"  ; 7
.const  ".\\chrome\\chrome.rar"  ; 8
.const  "LocalCopy"  ; 9
.const  "LaunchProcess"  ; 10
.const  ".\\bin\\UnRAR.exe"  ; 11
.const  " x -ai -o+ -inul \".\\chrome\\chrome.rar\" \".\\chrome\""  ; 12
[01] getupval   0   0        ; dialogXml
[02] gettable   0   0   250  ; "Chrome"
[03] gettable   0   0   251  ; 1
[04] gettable   0   0   252  ; "ImagePack"
[05] getglobal  1   3        ; string
[06] gettable   1   1   254  ; "find"
[07] move       2   0      
[08] loadk      3   5        ; "(%a+):///?(.+)"
[09] call       1   3   5  
[10] eq         0   3   256  ; "http", to [12] if true
[11] jmp        6            ; to [18]
[12] getupval   5   1        ; dwnldMgr
[13] gettable   5   5   257  ; "GetFile"
[14] move       6   0      
[15] loadk      7   8        ; ".\\chrome\\chrome.rar"
[16] call       5   3   1  
[17] jmp        7            ; to [25]
[18] getupval   5   2        ; win32
[19] gettable   5   5   259  ; "LocalCopy"
[20] test       6   4   1    ; to [22] if false
[21] jmp        1            ; to [23]
[22] move       6   0      
[23] loadk      7   8        ; ".\\chrome\\chrome.rar"
[24] call       5   3   1  
[25] getupval   5   2        ; win32
[26] gettable   5   5   260  ; "LaunchProcess"
[27] loadk      6   11       ; ".\\bin\\UnRAR.exe"
[28] loadk      7   12       ; " x -ai -o+ -inul \".\\chrome\\chrome.rar\" \".\\chrome\""
[29] loadbool   8   1   0    ; true
[30] call       5   4   1  
[31] return     0   1      
; end of function

[001] getupval   0   0        ; env
[002] getupval   1   1        ; xml
[003] gettable   1   1   251  ; "ArcadeInstaller"
[004] gettable   1   1   252  ; 1
[005] gettable   1   1   253  ; "DialogOptions"
[006] gettable   1   1   252  ; 1
[007] gettable   1   1   254  ; "EnableQueue"
[008] settable   0   250 1    ; "enableQueue"
[009] getupval   0   2        ; SubstEnvRec
[010] getupval   1   1        ; xml
[011] gettable   1   1   251  ; "ArcadeInstaller"
[012] gettable   1   1   252  ; 1
[013] gettable   1   1   253  ; "DialogOptions"
[014] gettable   1   1   252  ; 1
[015] call       0   2   2  
[016] loadnil    1   3      
[017] loadbool   4   0   0    ; false
[018] closure    5   0        ; 3 upvalues
[019] move       0   0      
[020] getupval   0   3        ; dwnldMgr
[021] getupval   0   4        ; win32
[022] gettable   6   0   255  ; "OnBegin"
[023] test       6   6   0    ; to [25] if true
[024] jmp        3            ; to [28]
[025] gettable   6   0   255  ; "OnBegin"
[026] gettable   6   6   252  ; 1
[027] gettable   1   6   256  ; "DialogUrl"
[028] gettable   6   0   257  ; "OnComplete"
[029] test       6   6   0    ; to [31] if true
[030] jmp        3            ; to [34]
[031] gettable   6   0   257  ; "OnComplete"
[032] gettable   6   6   252  ; 1
[033] gettable   2   6   256  ; "DialogUrl"
[034] gettable   6   0   258  ; "OnException"
[035] test       6   6   0    ; to [37] if true
[036] jmp        3            ; to [40]
[037] gettable   6   0   258  ; "OnException"
[038] gettable   6   6   252  ; 1
[039] gettable   3   6   256  ; "DialogUrl"
[040] getupval   6   5        ; ui
[041] gettable   6   6   259  ; "SetConditionEval"
[042] getupval   7   6        ; CheckConditions
[043] call       6   2   1  
[044] getupval   6   5        ; ui
[045] gettable   6   6   260  ; "SetProcessAuxTags"
[046] getupval   7   7        ; ProcessAuxTags
[047] call       6   2   1  
[048] loadnil    6   6      
[049] gettable   7   0   261  ; "Chrome"
[050] test       7   7   0    ; to [52] if true
[051] jmp        28           ; to [80]
[052] gettable   7   0   261  ; "Chrome"
[053] gettable   7   7   252  ; 1
[054] gettable   7   7   262  ; "ImagePack"
[055] test       7   7   0    ; to [57] if true
[056] jmp        8            ; to [65]
[057] getupval   7   4        ; win32
[058] gettable   7   7   263  ; "WorkingDir"
[059] call       7   1   2  
[060] loadk      8   14       ; "\\chrome"
[061] concat     6   7   8  
[062] move       7   5      
[063] call       7   1   1  
[064] jmp        8            ; to [73]
[065] gettable   7   0   261  ; "Chrome"
[066] gettable   7   7   252  ; 1
[067] gettable   7   7   265  ; "Local"
[068] test       7   7   0    ; to [70] if true
[069] jmp        3            ; to [73]
[070] gettable   7   0   261  ; "Chrome"
[071] gettable   7   7   252  ; 1
[072] gettable   6   7   265  ; "Local"
[073] gettable   7   0   261  ; "Chrome"
[074] gettable   7   7   252  ; 1
[075] gettable   7   7   266  ; "Progress"
[076] eq         1   7   267  ; "true", to [78] if false
[077] jmp        1            ; to [79]
[078] loadbool   4   0   1    ; false, to [80]
[079] loadbool   4   1   0    ; true
[080] loadk      7   18       ; 0
[081] gettable   8   0   269  ; "Mode"
[082] test       8   8   0    ; to [84] if true
[083] jmp        1            ; to [85]
[084] gettable   7   0   269  ; "Mode"
[085] getupval   8   5        ; ui
[086] gettable   8   8   270  ; "SetDialogOptions"
[087] gettable   9   0   271  ; "Width"
[088] gettable   10  0   272  ; "Height"
[089] gettable   11  0   273  ; "MinimizeBtn"
[090] eq         1   11  267  ; "true", to [92] if false
[091] jmp        1            ; to [93]
[092] loadbool   11  0   1    ; false, to [94]
[093] loadbool   11  1   0    ; true
[094] gettable   12  0   274  ; "CloseBtn"
[095] eq         1   12  267  ; "true", to [97] if false
[096] jmp        1            ; to [98]
[097] loadbool   12  0   1    ; false, to [99]
[098] loadbool   12  1   0    ; true
[099] gettable   13  0   256  ; "DialogUrl"
[100] move       14  1      
[101] move       15  2      
[102] move       16  3      
[103] move       17  6      
[104] move       18  4      
[105] move       19  7      
[106] call       8   12  1  
[107] gettable   8   0   275  ; "QueueUrl"
[108] test       8   8   0    ; to [110] if true
[109] jmp        5            ; to [115]
[110] getupval   8   5        ; ui
[111] gettable   8   8   254  ; "EnableQueue"
[112] gettable   9   0   275  ; "QueueUrl"
[113] call       8   2   1  
[114] jmp        7            ; to [122]
[115] gettable   8   0   254  ; "EnableQueue"
[116] test       8   8   0    ; to [118] if true
[117] jmp        4            ; to [122]
[118] getupval   8   5        ; ui
[119] gettable   8   8   254  ; "EnableQueue"
[120] gettable   9   0   254  ; "EnableQueue"
[121] call       8   2   1  
[122] return     0   1      
; end of function

[001] closure    0   0        ; 1 upvalues
[002] getupval   0   0        ; win32
[003] closure    1   1        ; 0 upvalues
[004] closure    2   2        ; 2 upvalues
[005] move       0   0      
[006] move       0   1      
[007] closure    3   3        ; 0 upvalues
[008] closure    4   4        ; 3 upvalues
[009] move       0   3      
[010] getupval   0   1        ; xml
[011] move       0   2      
[012] closure    5   5        ; 8 upvalues
[013] getupval   0   2        ; env
[014] getupval   0   1        ; xml
[015] getupval   0   3        ; SubstEnvRec
[016] getupval   0   4        ; dwnldMgr
[017] getupval   0   0        ; win32
[018] getupval   0   5        ; ui
[019] getupval   0   6        ; CheckConditions
[020] getupval   0   7        ; ProcessAuxTags
[021] getupval   6   0        ; win32
[022] gettable   6   6   250  ; "Mutex"
[023] loadk      7   1        ; "RACV2InstallerStopSplash"
[024] call       6   2   2  
[025] getglobal  7   2        ; os
[026] gettable   7   7   253  ; "clock"
[027] call       7   1   2  
[028] jmp        0            ; to [29]
[029] gettable   8   6   254  ; "Lock"
[030] call       8   1   2  
[031] test       8   8   1    ; to [33] if false
[032] jmp        6            ; to [39]
[033] getglobal  8   2        ; os
[034] gettable   8   8   253  ; "clock"
[035] call       8   1   2  
[036] sub        8   8   7  
[037] lt         1   8   255  ; 1, to [39] if false
[038] jmp        -10          ; to [29]
[039] getupval   8   8        ; members
[040] gettable   8   8   256  ; "PreProcess"
[041] call       8   1   1  
[042] getupval   8   2        ; env
[043] getglobal  9   8        ; RACConfigValue
[044] getglobal  10  9        ; g_constants
[045] gettable   10  10  260  ; "gamesrootkey"
[046] call       9   2   2  
[047] gettable   9   9   261  ; "Read"
[048] call       9   1   2  
[049] settable   8   257 9    ; "gamesRoot"
[050] loadnil    8   8      
[051] getupval   9   2        ; env
[052] gettable   9   9   257  ; "gamesRoot"
[053] test       9   9   0    ; to [55] if true
[054] jmp        47           ; to [102]
[055] getupval   9   2        ; env
[056] gettable   9   9   257  ; "gamesRoot"
[057] eq         1   9   262  ; "", to [59] if false
[058] jmp        43           ; to [102]
[059] getglobal  9   13       ; type
[060] getupval   10  2        ; env
[061] gettable   10  10  257  ; "gamesRoot"
[062] call       9   2   2  
[063] eq         0   9   264  ; "string", to [65] if true
[064] jmp        37           ; to [102]
[065] getglobal  9   14       ; string
[066] gettable   9   9   265  ; "len"
[067] getupval   10  2        ; env
[068] gettable   10  10  257  ; "gamesRoot"
[069] call       9   2   2  
[070] lt         0   266 9    ; 3, to [72] if true
[071] jmp        30           ; to [102]
[072] getupval   9   2        ; env
[073] getupval   10  0        ; win32
[074] gettable   10  10  267  ; "ToUtf8"
[075] getupval   11  2        ; env
[076] gettable   11  11  257  ; "gamesRoot"
[077] call       10  2   2  
[078] settable   9   257 10   ; "gamesRoot"
[079] getupval   9   0        ; win32
[080] gettable   9   9   268  ; "IsPathWriteable"
[081] getglobal  10  19       ; Sanitize
[082] getupval   11  2        ; env
[083] gettable   11  11  257  ; "gamesRoot"
[084] call       10  2   0  
[085] call       9   0   2  
[086] test       9   9   0    ; to [88] if true
[087] jmp        2            ; to [90]
[088] loadk      8   8        ; "RACConfigValue"
[089] jmp        29           ; to [119]
[090] getglobal  9   20       ; io
[091] gettable   9   9   271  ; "write"
[092] loadk      10  22       ; "\n"
[093] getglobal  11  2        ; os
[094] gettable   11  11  273  ; "date"
[095] loadk      12  24       ; "%c "
[096] call       11  2   2  
[097] loadk      12  25       ; "set GamesRootWriteable to NotWriteable to allow user to re-choose install path"
[098] call       9   4   1  
[099] getupval   9   2        ; env
[100] settable   9   276 277  ; "GamesRootWriteable" "NotWriteable"
[101] jmp        17           ; to [119]
[102] getglobal  9   20       ; io
[103] gettable   9   9   271  ; "write"
[104] loadk      10  22       ; "\n"
[105] getglobal  11  2        ; os
[106] gettable   11  11  273  ; "date"
[107] loadk      12  24       ; "%c "
[108] call       11  2   2  
[109] getglobal  12  28       ; tostring
[110] getglobal  13  9        ; g_constants
[111] gettable   13  13  260  ; "gamesrootkey"
[112] call       12  2   2  
[113] loadk      13  29       ; " is "
[114] getglobal  14  28       ; tostring
[115] getupval   15  2        ; env
[116] gettable   15  15  257  ; "gamesRoot"
[117] call       14  2   0  
[118] call       9   0   1  
[119] test       8   8   1    ; to [121] if false
[120] jmp        29           ; to [150]
[121] getupval   9   9        ; installv1location
[122] test       9   9   0    ; to [124] if true
[123] jmp        19           ; to [143]
[124] getupval   9   9        ; installv1location
[125] eq         1   9   262  ; "", to [127] if false
[126] jmp        16           ; to [143]
[127] getglobal  9   13       ; type
[128] getupval   10  9        ; installv1location
[129] call       9   2   2  
[130] eq         0   9   264  ; "string", to [132] if true
[131] jmp        11           ; to [143]
[132] getglobal  9   14       ; string
[133] gettable   9   9   265  ; "len"
[134] getupval   10  9        ; installv1location
[135] call       9   2   2  
[136] lt         0   266 9    ; 3, to [138] if true
[137] jmp        5            ; to [143]
[138] getupval   9   2        ; env
[139] getupval   10  9        ; installv1location
[140] settable   9   257 10   ; "gamesRoot"
[141] loadk      8   30       ; "installv1location"
[142] jmp        7            ; to [150]
[143] getupval   9   2        ; env
[144] getupval   10  1        ; xml
[145] gettable   10  10  281  ; "ArcadeInstaller"
[146] gettable   10  10  255  ; 1
[147] gettable   10  10  282  ; "DefaultGamesRoot"
[148] settable   9   257 10   ; "gamesRoot"
[149] loadk      8   32       ; "DefaultGamesRoot"
[150] getglobal  9   20       ; io
[151] gettable   9   9   271  ; "write"
[152] loadk      10  22       ; "\n"
[153] getglobal  11  2        ; os
[154] gettable   11  11  273  ; "date"
[155] loadk      12  24       ; "%c "
[156] call       11  2   2  
[157] loadk      12  33       ; "Using "
[158] move       13  8      
[159] loadk      14  34       ; " gamesRoot: "
[160] getglobal  15  28       ; tostring
[161] getupval   16  2        ; env
[162] gettable   16  16  257  ; "gamesRoot"
[163] call       15  2   0  
[164] call       9   0   1  
[165] getglobal  9   35       ; g_env
[166] getupval   10  2        ; env
[167] gettable   10  10  257  ; "gamesRoot"
[168] settable   9   257 10   ; "gamesRoot"
[169] getupval   9   1        ; xml
[170] gettable   9   9   281  ; "ArcadeInstaller"
[171] gettable   9   9   255  ; 1
[172] gettable   9   9   286  ; "DialogOptions"
[173] test       9   9   0    ; to [175] if true
[174] jmp        8            ; to [183]
[175] getglobal  9   37       ; InstallerUI
[176] call       9   1   2  
[177] setupval   9   5        ; ui
[178] move       9   5      
[179] call       9   1   1  
[180] move       9   4      
[181] call       9   1   1  
[182] jmp        3            ; to [186]
[183] getglobal  9   38       ; NullUI
[184] call       9   1   2  
[185] setupval   9   5        ; ui
[186] getupval   9   0        ; win32
[187] gettable   9   9   289  ; "isDriveValid"
[188] getupval   10  2        ; env
[189] gettable   10  10  257  ; "gamesRoot"
[190] call       9   2   2  
[191] test       9   9   1    ; to [193] if false
[192] jmp        7            ; to [200]
[193] getupval   9   2        ; env
[194] getupval   10  0        ; win32
[195] gettable   10  10  290  ; "ChooseValidPath"
[196] getupval   11  2        ; env
[197] gettable   11  11  257  ; "gamesRoot"
[198] call       10  2   2  
[199] settable   9   257 10   ; "gamesRoot"
[200] getupval   9   5        ; ui
[201] gettable   9   9   291  ; "PutInstallPath"
[202] getupval   10  2        ; env
[203] gettable   10  10  257  ; "gamesRoot"
[204] call       9   2   1  
[205] getupval   9   5        ; ui
[206] gettable   9   9   292  ; "InitialSlides"
[207] call       9   1   1  
[208] getupval   9   2        ; env
[209] getupval   10  5        ; ui
[210] gettable   10  10  293  ; "GetInstallPath"
[211] getupval   11  2        ; env
[212] gettable   11  11  257  ; "gamesRoot"
[213] call       10  2   2  
[214] settable   9   257 10   ; "gamesRoot"
[215] getglobal  9   44       ; assert
[216] getupval   10  0        ; win32
[217] gettable   10  10  289  ; "isDriveValid"
[218] getupval   11  2        ; env
[219] gettable   11  11  257  ; "gamesRoot"
[220] call       10  2   2  
[221] loadk      11  45       ; "diskStolen"
[222] call       9   3   1  
[223] getglobal  9   44       ; assert
[224] getupval   10  0        ; win32
[225] gettable   10  10  268  ; "IsPathWriteable"
[226] getglobal  11  19       ; Sanitize
[227] getupval   12  2        ; env
[228] gettable   12  12  257  ; "gamesRoot"
[229] call       11  2   0  
[230] call       10  0   2  
[231] loadk      11  45       ; "diskStolen"
[232] call       9   3   1  
[233] return     0   1      
; end of function


; function [31] definition (level 4)
; 0 upvalues, 1 params, 4 stacks
.function  0 1 0 4
.local  "totalBundleSize"  ; 0
.const  "tostring"  ; 0
.const  "math"  ; 1
.const  "floor"  ; 2
.const  3  ; 3
.const  1000000  ; 4
.const  0.5  ; 5
[01] getglobal  1   0        ; tostring
[02] getglobal  2   1        ; math
[03] gettable   2   2   252  ; "floor"
[04] mul        3   0   253  ; 3
[05] div        3   3   254  ; 1000000
[06] add        3   3   255  ; 0.5
[07] call       2   2   0  
[08] tailcall   1   0   0  
[09] return     1   0      
[10] return     0   1      
; end of function


; function [32] definition (level 4)
; 8 upvalues, 0 params, 10 stacks
.function  8 0 0 10
.local  "magnitude"  ; 0
.local  "remainder"  ; 1
.local  "strDrive"  ; 2
.local  "approot"  ; 3
.upvalue  "ui"  ; 0
.upvalue  "currentPayload"  ; 1
.upvalue  "env"  ; 2
.upvalue  "totalBundleSize"  ; 3
.upvalue  "totalPayloads"  ; 4
.upvalue  "members"  ; 5
.upvalue  "installStep"  ; 6
.upvalue  "win32"  ; 7
.const  "ResetProgress"  ; 0
.const  "g_env"  ; 1
.const  "gameExe"  ; 2
.const  nil  ; 3
.const  0  ; 4
.const  "NotifyActive"  ; 5
.const  "gameId"  ; 6
.const  "io"  ; 7
.const  "write"  ; 8
.const  "\n\n\n\n"  ; 9
.const  "os"  ; 10
.const  "date"  ; 11
.const  "%c "  ; 12
.const  "************Begin Payload Calculation****************\n\n\n\n"  ; 13
.const  1  ; 14
.const  "TotalRootPayloads"  ; 15
.const  "************End Payload Calculation******************\n\n\n\n"  ; 16
.const  9  ; 17
.const  10  ; 18
.const  "\n"  ; 19
.const  "totalBundleSize: "  ; 20
.const  "tostring"  ; 21
.const  " totalPayloads: "  ; 22
.const  0.25  ; 23
.const  2e-005  ; 24
.const  "SetProgressGranularity"  ; 25
.const  "SetTotalBundleSize"  ; 26
.const  "SetTotalPayloads"  ; 27
.const  "InitializeProgress"  ; 28
.const  "payloads.PreInstall: totalPayloads = "  ; 29
.const  ", totalBundleSize = "  ; 30
.const  "gamesRoot"  ; 31
.const  "string"  ; 32
.const  "sub"  ; 33
.const  2  ; 34
.const  "sysDrive"  ; 35
.const  ":"  ; 36
.const  "g_extraErrorInfo"  ; 37
.const  "GetRequiredMB"  ; 38
.const  "assert"  ; 39
.const  "SufficientDriveSpace"  ; 40
.const  3  ; 41
.const  "diskFull"  ; 42
.const  "RACConfigValue"  ; 43
.const  "g_constants"  ; 44
.const  "mainappkey"  ; 45
.const  "Read"  ; 46
.const  ""  ; 47
.const  "installDrive"  ; 48
.const  "GetAvailableDrive"  ; 49
.const  1000000  ; 50
.const  "A:"  ; 51
[001] getupval   0   0        ; ui
[002] gettable   0   0   250  ; "ResetProgress"
[003] call       0   1   1  
[004] getglobal  0   1        ; g_env
[005] settable   0   252 253  ; "gameExe" nil
[006] loadk      0   4        ; 0
[007] setupval   0   1        ; currentPayload
[008] getupval   0   0        ; ui
[009] gettable   0   0   255  ; "NotifyActive"
[010] getupval   1   2        ; env
[011] gettable   1   1   256  ; "gameId"
[012] call       0   2   1  
[013] getglobal  0   7        ; io
[014] gettable   0   0   258  ; "write"
[015] loadk      1   9        ; "\n\n\n\n"
[016] getglobal  2   10       ; os
[017] gettable   2   2   261  ; "date"
[018] loadk      3   12       ; "%c "
[019] call       2   2   2  
[020] loadk      3   13       ; "************Begin Payload Calculation****************\n\n\n\n"
[021] call       0   4   1  
[022] loadk      0   14       ; 1
[023] getupval   1   3        ; totalBundleSize
[024] getupval   2   5        ; members
[025] gettable   2   2   265  ; "TotalRootPayloads"
[026] call       2   1   3  
[027] setupval   3   4        ; totalPayloads
[028] setupval   2   3        ; totalBundleSize
[029] getglobal  2   7        ; io
[030] gettable   2   2   258  ; "write"
[031] loadk      3   9        ; "\n\n\n\n"
[032] getglobal  4   10       ; os
[033] gettable   4   4   261  ; "date"
[034] loadk      5   12       ; "%c "
[035] call       4   2   2  
[036] loadk      5   16       ; "************End Payload Calculation******************\n\n\n\n"
[037] call       2   4   1  
[038] jmp        2            ; to [41]
[039] add        0   0   264  ; 1
[040] div        1   1   268  ; 10
[041] lt         1   267 1    ; 9, to [43] if false
[042] jmp        -4           ; to [39]
[043] getglobal  2   7        ; io
[044] gettable   2   2   258  ; "write"
[045] loadk      3   19       ; "\n"
[046] getglobal  4   10       ; os
[047] gettable   4   4   261  ; "date"
[048] loadk      5   12       ; "%c "
[049] call       4   2   2  
[050] loadk      5   20       ; "totalBundleSize: "
[051] getglobal  6   21       ; tostring
[052] getupval   7   3        ; totalBundleSize
[053] call       6   2   2  
[054] loadk      7   22       ; " totalPayloads: "
[055] getglobal  8   21       ; tostring
[056] getupval   9   4        ; totalPayloads
[057] call       8   2   0  
[058] call       2   0   1  
[059] getupval   2   3        ; totalBundleSize
[060] mul        2   2   273  ; 0.25
[061] mul        3   0   268  ; 10
[062] div        3   274 3    ; 2e-005
[063] mul        2   2   3  
[064] setupval   2   6        ; installStep
[065] getupval   2   0        ; ui
[066] gettable   2   2   275  ; "SetProgressGranularity"
[067] getupval   3   3        ; totalBundleSize
[068] call       2   2   1  
[069] getupval   2   0        ; ui
[070] gettable   2   2   276  ; "SetTotalBundleSize"
[071] getupval   3   3        ; totalBundleSize
[072] call       2   2   1  
[073] getupval   2   0        ; ui
[074] gettable   2   2   277  ; "SetTotalPayloads"
[075] getupval   3   4        ; totalPayloads
[076] call       2   2   1  
[077] getupval   2   0        ; ui
[078] gettable   2   2   278  ; "InitializeProgress"
[079] call       2   1   1  
[080] getglobal  2   7        ; io
[081] gettable   2   2   258  ; "write"
[082] loadk      3   19       ; "\n"
[083] getglobal  4   10       ; os
[084] gettable   4   4   261  ; "date"
[085] loadk      5   12       ; "%c "
[086] call       4   2   2  
[087] loadk      5   29       ; "payloads.PreInstall: totalPayloads = "
[088] getupval   6   4        ; totalPayloads
[089] loadk      7   30       ; ", totalBundleSize = "
[090] getupval   8   3        ; totalBundleSize
[091] concat     5   5   8  
[092] call       2   4   1  
[093] loadnil    2   2      
[094] getupval   3   2        ; env
[095] gettable   3   3   281  ; "gamesRoot"
[096] test       3   3   0    ; to [98] if true
[097] jmp        9            ; to [107]
[098] getglobal  3   32       ; string
[099] gettable   3   3   283  ; "sub"
[100] getupval   4   2        ; env
[101] gettable   4   4   281  ; "gamesRoot"
[102] loadk      5   14       ; 1
[103] loadk      6   34       ; 2
[104] call       3   4   2  
[105] move       2   3      
[106] jmp        4            ; to [111]
[107] getglobal  3   1        ; g_env
[108] gettable   3   3   285  ; "sysDrive"
[109] loadk      4   36       ; ":"
[110] concat     2   3   4  
[111] getupval   3   5        ; members
[112] gettable   3   3   288  ; "GetRequiredMB"
[113] getupval   4   3        ; totalBundleSize
[114] call       3   2   2  
[115] setglobal  3   37       ; g_extraErrorInfo
[116] getglobal  3   39       ; assert
[117] getupval   4   7        ; win32
[118] gettable   4   4   290  ; "SufficientDriveSpace"
[119] move       5   2      
[120] getupval   6   3        ; totalBundleSize
[121] mul        6   6   291  ; 3
[122] call       4   3   2  
[123] loadk      5   42       ; "diskFull"
[124] call       3   3   1  
[125] getglobal  3   43       ; RACConfigValue
[126] getglobal  4   44       ; g_constants
[127] gettable   4   4   295  ; "mainappkey"
[128] call       3   2   2  
[129] gettable   3   3   296  ; "Read"
[130] call       3   1   2  
[131] test       3   3   0    ; to [133] if true
[132] jmp        26           ; to [159]
[133] eq         1   3   297  ; "", to [135] if false
[134] jmp        24           ; to [159]
[135] getupval   4   2        ; env
[136] getglobal  5   32       ; string
[137] gettable   5   5   283  ; "sub"
[138] move       6   3      
[139] loadk      7   14       ; 1
[140] loadk      8   34       ; 2
[141] call       5   4   2  
[142] settable   4   298 5    ; "installDrive"
[143] getupval   4   5        ; members
[144] gettable   4   4   288  ; "GetRequiredMB"
[145] getupval   5   3        ; totalBundleSize
[146] call       4   2   2  
[147] setglobal  4   37       ; g_extraErrorInfo
[148] getglobal  4   39       ; assert
[149] getupval   5   7        ; win32
[150] gettable   5   5   290  ; "SufficientDriveSpace"
[151] getupval   6   2        ; env
[152] gettable   6   6   298  ; "installDrive"
[153] getupval   7   3        ; totalBundleSize
[154] mul        7   7   291  ; 3
[155] call       5   3   2  
[156] loadk      6   42       ; "diskFull"
[157] call       4   3   1  
[158] jmp        22           ; to [181]
[159] getupval   4   2        ; env
[160] getupval   5   7        ; win32
[161] gettable   5   5   299  ; "GetAvailableDrive"
[162] getupval   6   3        ; totalBundleSize
[163] mul        6   6   291  ; 3
[164] div        6   6   300  ; 1000000
[165] call       5   2   2  
[166] settable   4   298 5    ; "installDrive"
[167] getupval   4   5        ; members
[168] gettable   4   4   288  ; "GetRequiredMB"
[169] getupval   5   3        ; totalBundleSize
[170] call       4   2   2  
[171] setglobal  4   37       ; g_extraErrorInfo
[172] getglobal  4   39       ; assert
[173] getupval   5   2        ; env
[174] gettable   5   5   298  ; "installDrive"
[175] eq         0   5   301  ; "A:", to [177] if true
[176] jmp        1            ; to [178]
[177] loadbool   5   0   1    ; false, to [179]
[178] loadbool   5   1   0    ; true
[179] loadk      6   42       ; "diskFull"
[180] call       4   3   1  
[181] return     0   1      
; end of function


; function [33] definition (level 4)
; 11 upvalues, 1 params, 12 stacks
.function  11 1 0 12
.local  "parent"  ; 0
.local  "ProcessMutualDep"  ; 1
.local  "base"  ; 2
.local  "inOrderTags"  ; 3
.local  "(for generator)"  ; 4
.local  "(for state)"  ; 5
.local  "tag"  ; 6
.local  "m"  ; 7
.local  "(for generator)"  ; 8
.local  "(for state)"  ; 9
.local  "mutual"  ; 10
.local  "p"  ; 11
.local  "(for generator)"  ; 12
.local  "(for state)"  ; 13
.local  "payload"  ; 14
.upvalue  "ShipPayload"  ; 0
.upvalue  "ProcessPayload"  ; 1
.upvalue  "xml"  ; 2
.upvalue  "filterTags"  ; 3
.upvalue  "SubstEnvRec"  ; 4
.upvalue  "ProcessAuxTags"  ; 5
.upvalue  "ProcessLaunch"  ; 6
.upvalue  "CheckConditions"  ; 7
.upvalue  "unInst"  ; 8
.upvalue  "win32"  ; 9
.upvalue  "env"  ; 10
.const  "ArcadeInstaller"  ; 0
.const  1  ; 1
.const  "InOrder"  ; 2
.const  "Launch"  ; 3
.const  "table"  ; 4
.const  "foreach"  ; 5
.const  "MutualDepend"  ; 6
.const  "ConditionCheck"  ; 7
.const  "Payload"  ; 8
.const  "Write"  ; 9
.const  "UpdateDip"  ; 10
.const  "g_env"  ; 11
.const  "ContentID"  ; 12
.const  "upgrademode"  ; 13
.const  "g_upgrademode"  ; 14
.const  "io"  ; 15
.const  "write"  ; 16
.const  "\n"  ; 17
.const  "os"  ; 18
.const  "date"  ; 19
.const  "%c "  ; 20
.const  "upgrademode: "  ; 21
.const  "tostring"  ; 22

; function [0] definition (level 5)
; 2 upvalues, 1 params, 8 stacks
.function  2 1 0 8
.local  "mutualTag"  ; 0
.local  "p"  ; 1
.local  "(for generator)"  ; 2
.local  "(for state)"  ; 3
.local  "payload"  ; 4
.local  "(for generator)"  ; 5
.local  "(for state)"  ; 6
.local  "payload"  ; 7
.upvalue  "ShipPayload"  ; 0
.upvalue  "ProcessPayload"  ; 1
.const  "Payload"  ; 0
[01] gettable   1   0   250  ; "Payload"
[02] test       1   1   0    ; to [4] if true
[03] jmp        16           ; to [20]
[04] move       2   1      
[05] loadnil    3   4      
[06] tforprep   2   3        ; to [10]
[07] getupval   5   0        ; ShipPayload
[08] gettable   6   1   4  
[09] call       5   2   1  
[10] tforloop   2       0    ; to [12] if exit
[11] jmp        -5           ; to [7]
[12] move       2   1      
[13] loadnil    3   4      
[14] tforprep   2   3        ; to [18]
[15] getupval   5   1        ; ProcessPayload
[16] gettable   6   1   4  
[17] call       5   2   1  
[18] tforloop   2       0    ; to [20] if exit
[19] jmp        -5           ; to [15]
[20] return     0   1      
; end of function

[001] closure    1   0        ; 2 upvalues
[002] getupval   0   0        ; ShipPayload
[003] getupval   0   1        ; ProcessPayload
[004] loadnil    2   2      
[005] test       0   0   0    ; to [7] if true
[006] jmp        2            ; to [9]
[007] move       2   0      
[008] jmp        3            ; to [12]
[009] getupval   3   2        ; xml
[010] gettable   3   3   250  ; "ArcadeInstaller"
[011] gettable   2   3   251  ; 1
[012] getupval   3   3        ; filterTags
[013] getupval   4   4        ; SubstEnvRec
[014] move       5   2      
[015] call       4   2   0  
[016] call       3   0   2  
[017] move       2   3      
[018] gettable   3   2   252  ; "InOrder"
[019] test       3   3   0    ; to [21] if true
[020] jmp        18           ; to [39]
[021] move       4   3      
[022] loadnil    5   6      
[023] tforprep   4   13       ; to [37]
[024] getupval   7   5        ; ProcessAuxTags
[025] gettable   8   3   6  
[026] call       7   2   1  
[027] gettable   7   3   6  
[028] gettable   7   7   253  ; "Launch"
[029] test       7   7   0    ; to [31] if true
[030] jmp        6            ; to [37]
[031] getglobal  7   4        ; table
[032] gettable   7   7   255  ; "foreach"
[033] gettable   8   3   6  
[034] gettable   8   8   253  ; "Launch"
[035] getupval   9   6        ; ProcessLaunch
[036] call       7   3   1  
[037] tforloop   4       0    ; to [39] if exit
[038] jmp        -15          ; to [24]
[039] getupval   4   5        ; ProcessAuxTags
[040] move       5   2      
[041] call       4   2   1  
[042] getupval   4   4        ; SubstEnvRec
[043] move       5   2      
[044] call       4   2   2  
[045] move       2   4      
[046] gettable   4   2   256  ; "MutualDepend"
[047] test       4   4   0    ; to [49] if true
[048] jmp        14           ; to [63]
[049] move       5   4      
[050] loadnil    6   7      
[051] tforprep   5   9        ; to [61]
[052] getupval   8   7        ; CheckConditions
[053] gettable   9   4   7  
[054] gettable   9   9   257  ; "ConditionCheck"
[055] call       8   2   2  
[056] test       8   8   0    ; to [58] if true
[057] jmp        3            ; to [61]
[058] move       8   1      
[059] gettable   9   4   7  
[060] call       8   2   1  
[061] tforloop   5       0    ; to [63] if exit
[062] jmp        -11          ; to [52]
[063] gettable   5   2   258  ; "Payload"
[064] test       5   5   0    ; to [66] if true
[065] jmp        17           ; to [83]
[066] move       6   5      
[067] loadnil    7   8      
[068] tforprep   6   12       ; to [81]
[069] getupval   9   7        ; CheckConditions
[070] gettable   10  5   8  
[071] gettable   10  10  257  ; "ConditionCheck"
[072] call       9   2   2  
[073] test       9   9   0    ; to [75] if true
[074] jmp        6            ; to [81]
[075] getupval   9   0        ; ShipPayload
[076] gettable   10  5   8  
[077] call       9   2   1  
[078] getupval   9   1        ; ProcessPayload
[079] gettable   10  5   8  
[080] call       9   2   1  
[081] tforloop   6       0    ; to [83] if exit
[082] jmp        -14          ; to [69]
[083] test       0   0   1    ; to [85] if false
[084] jmp        27           ; to [112]
[085] getupval   6   8        ; unInst
[086] gettable   6   6   259  ; "Write"
[087] call       6   1   1  
[088] getupval   6   9        ; win32
[089] gettable   6   6   260  ; "UpdateDip"
[090] getglobal  7   11       ; g_env
[091] gettable   7   7   262  ; "ContentID"
[092] call       6   2   1  
[093] getupval   6   10       ; env
[094] gettable   6   6   263  ; "upgrademode"
[095] test       6   6   0    ; to [97] if true
[096] jmp        3            ; to [100]
[097] getupval   6   10       ; env
[098] gettable   6   6   263  ; "upgrademode"
[099] setglobal  6   14       ; g_upgrademode
[100] getglobal  6   15       ; io
[101] gettable   6   6   266  ; "write"
[102] loadk      7   17       ; "\n"
[103] getglobal  8   18       ; os
[104] gettable   8   8   269  ; "date"
[105] loadk      9   20       ; "%c "
[106] call       8   2   2  
[107] loadk      9   21       ; "upgrademode: "
[108] getglobal  10  22       ; tostring
[109] getglobal  11  14       ; g_upgrademode
[110] call       10  2   0  
[111] call       6   0   1  
[112] loadbool   6   1   0    ; true
[113] return     6   2      
[114] return     0   1      
; end of function


; function [34] definition (level 4)
; 3 upvalues, 1 params, 4 stacks
.function  3 1 0 4
.local  "base"  ; 0
.upvalue  "SubstEnvRec"  ; 0
.upvalue  "xml"  ; 1
.upvalue  "ProcessLaunch"  ; 2
.const  "ArcadeInstaller"  ; 0
.const  1  ; 1
.const  "Launch"  ; 2
.const  "table"  ; 3
.const  "foreach"  ; 4
[01] test       0   0   1    ; to [3] if false
[02] jmp        7            ; to [10]
[03] getupval   1   0        ; SubstEnvRec
[04] getupval   2   1        ; xml
[05] gettable   2   2   250  ; "ArcadeInstaller"
[06] gettable   2   2   251  ; 1
[07] gettable   2   2   252  ; "Launch"
[08] call       1   2   2  
[09] move       0   1      
[10] test       0   0   0    ; to [12] if true
[11] jmp        5            ; to [17]
[12] getglobal  1   3        ; table
[13] gettable   1   1   254  ; "foreach"
[14] move       2   0      
[15] getupval   3   2        ; ProcessLaunch
[16] call       1   3   1  
[17] return     0   1      
; end of function


; function [35] definition (level 4)
; 6 upvalues, 0 params, 4 stacks
.function  6 0 0 4
.local  "txml"  ; 0
.local  "postinst"  ; 1
.upvalue  "ui"  ; 0
.upvalue  "env"  ; 1
.upvalue  "xml"  ; 2
.upvalue  "SubstEnvRec"  ; 3
.upvalue  "ProcessAuxTags"  ; 4
.upvalue  "members"  ; 5
.const  "ProgressToEnd"  ; 0
.const  "NotifyComplete"  ; 1
.const  "gameId"  ; 2
.const  "g_installed"  ; 3
.const  "ClearRollBackTable"  ; 4
.const  "ArcadeInstaller"  ; 5
.const  1  ; 6
.const  "DialogOptions"  ; 7
.const  "PostInstall"  ; 8
.const  "DoLaunchTags"  ; 9
[01] getupval   0   0        ; ui
[02] gettable   0   0   250  ; "ProgressToEnd"
[03] call       0   1   1  
[04] getupval   0   0        ; ui
[05] gettable   0   0   251  ; "NotifyComplete"
[06] getupval   1   1        ; env
[07] gettable   1   1   252  ; "gameId"
[08] call       0   2   1  
[09] loadbool   0   1   0    ; true
[10] setglobal  0   3        ; g_installed
[11] getglobal  0   4        ; ClearRollBackTable
[12] call       0   1   1  
[13] getupval   0   2        ; xml
[14] gettable   0   0   255  ; "ArcadeInstaller"
[15] gettable   0   0   256  ; 1
[16] gettable   0   0   257  ; "DialogOptions"
[17] loadnil    1   1      
[18] getupval   2   2        ; xml
[19] gettable   2   2   255  ; "ArcadeInstaller"
[20] gettable   2   2   256  ; 1
[21] gettable   2   2   258  ; "PostInstall"
[22] test       2   2   0    ; to [24] if true
[23] jmp        5            ; to [29]
[24] getupval   2   2        ; xml
[25] gettable   2   2   255  ; "ArcadeInstaller"
[26] gettable   2   2   256  ; 1
[27] gettable   2   2   258  ; "PostInstall"
[28] gettable   1   2   256  ; 1
[29] test       1   1   0    ; to [31] if true
[30] jmp        10           ; to [41]
[31] getupval   2   3        ; SubstEnvRec
[32] move       3   1      
[33] call       2   2   1  
[34] getupval   2   4        ; ProcessAuxTags
[35] move       3   1      
[36] call       2   2   1  
[37] getupval   2   5        ; members
[38] gettable   2   2   259  ; "DoLaunchTags"
[39] move       3   1      
[40] call       2   2   1  
[41] return     0   1      
; end of function


; function [36] definition (level 4)
; 4 upvalues, 0 params, 3 stacks
.function  4 0 0 3
.local  "txml"  ; 0
.local  "exitcode"  ; 1
.upvalue  "xml"  ; 0
.upvalue  "ui"  ; 1
.upvalue  "PlaySounds"  ; 2
.upvalue  "members"  ; 3
.const  "ArcadeInstaller"  ; 0
.const  1  ; 1
.const  "DialogOptions"  ; 2
.const  "CloseBtn"  ; 3
.const  "true"  ; 4
.const  "ShowSystemCloseButton"  ; 5
.const  "OnComplete"  ; 6
.const  "PlaySound"  ; 7
.const  "SetComplete"  ; 8
.const  0  ; 9
.const  "DoLaunchTags"  ; 10
[01] getupval   0   0        ; xml
[02] gettable   0   0   250  ; "ArcadeInstaller"
[03] gettable   0   0   251  ; 1
[04] gettable   0   0   252  ; "DialogOptions"
[05] test       0   0   0    ; to [7] if true
[06] jmp        8            ; to [15]
[07] gettable   1   0   251  ; 1
[08] gettable   1   1   253  ; "CloseBtn"
[09] eq         0   1   254  ; "true", to [11] if true
[10] jmp        4            ; to [15]
[11] getupval   1   1        ; ui
[12] gettable   1   1   255  ; "ShowSystemCloseButton"
[13] loadbool   2   1   0    ; true
[14] call       1   2   1  
[15] test       0   0   0    ; to [17] if true
[16] jmp        11           ; to [28]
[17] gettable   1   0   251  ; 1
[18] gettable   0   1   256  ; "OnComplete"
[19] test       0   0   0    ; to [21] if true
[20] jmp        7            ; to [28]
[21] gettable   1   0   251  ; 1
[22] gettable   0   1   257  ; "PlaySound"
[23] test       0   0   0    ; to [25] if true
[24] jmp        3            ; to [28]
[25] getupval   1   2        ; PlaySounds
[26] move       2   0      
[27] call       1   2   1  
[28] getupval   1   1        ; ui
[29] gettable   1   1   258  ; "SetComplete"
[30] call       1   1   2  
[31] eq         0   1   259  ; 0, to [33] if true
[32] jmp        3            ; to [36]
[33] getupval   2   3        ; members
[34] gettable   2   2   260  ; "DoLaunchTags"
[35] call       2   1   1  
[36] return     1   2      
[37] return     0   1      
; end of function


; function [37] definition (level 4)
; 9 upvalues, 1 params, 10 stacks
.function  9 1 0 10
.local  "filename"  ; 0
.local  "parser"  ; 1
.local  "uninstTag"  ; 2
.upvalue  "ui"  ; 0
.upvalue  "xml"  ; 1
.upvalue  "env"  ; 2
.upvalue  "win32"  ; 3
.upvalue  "SubstEnvRec"  ; 4
.upvalue  "unInst"  ; 5
.upvalue  "SubstEnv"  ; 6
.upvalue  "url"  ; 7
.upvalue  "ismigrating"  ; 8
.const  "luacom"  ; 0
.const  "CreateObject"  ; 1
.const  "Msxml.DOMDocument"  ; 2
.const  "InstallerUI"  ; 3
.const  "assert"  ; 4
.const  "comError"  ; 5
.const  "load"  ; 6
.const  "ParseNode"  ; 7
.const  "ArcadeInstaller"  ; 8
.const  "badXml"  ; 9
.const  "installerDir"  ; 10
.const  "WorkingDir"  ; 11
.const  1  ; 12
.const  "Uninstall"  ; 13
.const  "UnInstaller"  ; 14
.const  "Text"  ; 15
.const  "Icon"  ; 16
.const  "AddRemove"  ; 17
.const  "IncGame"  ; 18
.const  "Custom"  ; 19
.const  "Filename"  ; 20
.const  "GameId"  ; 21
.const  "Silent"  ; 22
.const  "true"  ; 23
.const  "Hide"  ; 24
.const  "Show"  ; 25
.const  "xmlNestLevel"  ; 26
.const  0  ; 27
.const  "gameBase"  ; 28
.const  "GameBase"  ; 29
.const  ""  ; 30
.const  "bitsBase"  ; 31
.const  "BitsBase"  ; 32
.const  "racInstallerURLBase"  ; 33
.const  "RACInstallerURLBase"  ; 34
.const  "gameId"  ; 35
.const  "tps"  ; 36
.const  "Tps"  ; 37
.const  "gameType"  ; 38
.const  "GameType"  ; 39
.const  "action"  ; 40
.const  "Action"  ; 41
.const  "lang"  ; 42
.const  "Lang"  ; 43
.const  "gameName"  ; 44
.const  "GameName"  ; 45
.const  "itmUrl"  ; 46
.const  "urlEncodedGameName"  ; 47
.const  "escape"  ; 48
.const  "g_env"  ; 49
.const  "curGameId"  ; 50
.const  "curTps"  ; 51
.const  "curGameName"  ; 52
.const  "logURL"  ; 53
.const  "g_storeFront"  ; 54
.const  "StoreFront"  ; 55
.const  "RealArcade"  ; 56
.const  "licenseRoot"  ; 57
.const  "RACConfigValue"  ; 58
.const  "LicenseRoot"  ; 59
.const  "Read"  ; 60
.const  "databasePath"  ; 61
.const  "DatabasePath"  ; 62
.const  "URLParameters"  ; 63
.const  "g_tableURLParameters"  ; 64
.const  "InstallPath"  ; 65
.const  "IsMigration"  ; 66
.const  "io"  ; 67
.const  "write"  ; 68
.const  "\n"  ; 69
.const  "os"  ; 70
.const  "date"  ; 71
.const  "%c "  ; 72
.const  "set to migrate for client only."  ; 73
.const  "g_fOffline"  ; 74
.const  "httpError"  ; 75
.const  "\nParse error: "  ; 76
.const  "parseError"  ; 77
.const  "reason"  ; 78
.const  "on file "  ; 79
.const  "unk"  ; 80
.const  "missingrgi"  ; 81
[001] getglobal  1   0        ; luacom
[002] gettable   1   1   251  ; "CreateObject"
[003] loadk      2   2        ; "Msxml.DOMDocument"
[004] call       1   2   2  
[005] getglobal  2   3        ; InstallerUI
[006] call       2   1   2  
[007] setupval   2   0        ; ui
[008] getglobal  2   4        ; assert
[009] move       3   1      
[010] loadk      4   5        ; "comError"
[011] call       2   3   1  
[012] self       2   1   256  ; "load"
[013] move       4   0      
[014] call       2   3   2  
[015] test       2   2   0    ; to [17] if true
[016] jmp        310          ; to [327]
[017] getglobal  2   7        ; ParseNode
[018] newtable   3   0   0    ; array=0, hash=0
[019] move       4   1      
[020] call       2   3   2  
[021] setupval   2   1        ; xml
[022] getglobal  2   4        ; assert
[023] getupval   3   1        ; xml
[024] gettable   3   3   258  ; "ArcadeInstaller"
[025] loadk      4   9        ; "badXml"
[026] call       2   3   1  
[027] getupval   2   2        ; env
[028] getupval   3   3        ; win32
[029] gettable   3   3   261  ; "WorkingDir"
[030] call       3   1   2  
[031] settable   2   260 3    ; "installerDir"
[032] getupval   2   1        ; xml
[033] gettable   2   2   258  ; "ArcadeInstaller"
[034] gettable   2   2   262  ; 1
[035] gettable   2   2   263  ; "Uninstall"
[036] test       2   2   0    ; to [38] if true
[037] jmp        28           ; to [66]
[038] getupval   2   1        ; xml
[039] gettable   2   2   258  ; "ArcadeInstaller"
[040] gettable   2   2   262  ; 1
[041] gettable   2   2   263  ; "Uninstall"
[042] gettable   2   2   262  ; 1
[043] getupval   3   4        ; SubstEnvRec
[044] move       4   2      
[045] call       3   2   2  
[046] move       2   3      
[047] getglobal  3   14       ; UnInstaller
[048] gettable   4   2   265  ; "Text"
[049] gettable   5   2   266  ; "Icon"
[050] gettable   6   2   267  ; "AddRemove"
[051] gettable   7   2   268  ; "IncGame"
[052] gettable   8   2   269  ; "Custom"
[053] gettable   9   2   270  ; "Filename"
[054] test       9   9   1    ; to [56] if false
[055] jmp        7            ; to [63]
[056] getupval   9   1        ; xml
[057] gettable   9   9   258  ; "ArcadeInstaller"
[058] gettable   9   9   262  ; 1
[059] gettable   9   9   271  ; "GameId"
[060] test       9   9   1    ; to [62] if false
[061] jmp        1            ; to [63]
[062] gettable   9   2   265  ; "Text"
[063] call       3   7   2  
[064] setupval   3   5        ; unInst
[065] jmp        3            ; to [69]
[066] getglobal  2   14       ; UnInstaller
[067] call       2   1   2  
[068] setupval   2   5        ; unInst
[069] getupval   2   1        ; xml
[070] gettable   2   2   258  ; "ArcadeInstaller"
[071] gettable   2   2   262  ; 1
[072] gettable   2   2   272  ; "Silent"
[073] eq         0   2   273  ; "true", to [75] if true
[074] jmp        4            ; to [79]
[075] getupval   2   0        ; ui
[076] gettable   2   2   274  ; "Hide"
[077] call       2   1   1  
[078] jmp        3            ; to [82]
[079] getupval   2   0        ; ui
[080] gettable   2   2   275  ; "Show"
[081] call       2   1   1  
[082] getupval   2   2        ; env
[083] getupval   3   2        ; env
[084] gettable   3   3   276  ; "xmlNestLevel"
[085] test       3   3   1    ; to [87] if false
[086] jmp        1            ; to [88]
[087] loadk      3   27       ; 0
[088] settable   2   276 3    ; "xmlNestLevel"
[089] getupval   2   2        ; env
[090] getupval   3   6        ; SubstEnv
[091] getupval   4   1        ; xml
[092] gettable   4   4   258  ; "ArcadeInstaller"
[093] gettable   4   4   262  ; 1
[094] gettable   4   4   279  ; "GameBase"
[095] call       3   2   2  
[096] test       3   3   1    ; to [98] if false
[097] jmp        5            ; to [103]
[098] getupval   3   2        ; env
[099] gettable   3   3   278  ; "gameBase"
[100] test       3   3   1    ; to [102] if false
[101] jmp        1            ; to [103]
[102] loadk      3   30       ; ""
[103] settable   2   278 3    ; "gameBase"
[104] getupval   2   2        ; env
[105] getupval   3   6        ; SubstEnv
[106] getupval   4   1        ; xml
[107] gettable   4   4   258  ; "ArcadeInstaller"
[108] gettable   4   4   262  ; 1
[109] gettable   4   4   282  ; "BitsBase"
[110] call       3   2   2  
[111] test       3   3   1    ; to [113] if false
[112] jmp        5            ; to [118]
[113] getupval   3   2        ; env
[114] gettable   3   3   281  ; "bitsBase"
[115] test       3   3   1    ; to [117] if false
[116] jmp        1            ; to [118]
[117] loadk      3   30       ; ""
[118] settable   2   281 3    ; "bitsBase"
[119] getupval   2   2        ; env
[120] getupval   3   6        ; SubstEnv
[121] getupval   4   1        ; xml
[122] gettable   4   4   258  ; "ArcadeInstaller"
[123] gettable   4   4   262  ; 1
[124] gettable   4   4   284  ; "RACInstallerURLBase"
[125] call       3   2   2  
[126] test       3   3   1    ; to [128] if false
[127] jmp        5            ; to [133]
[128] getupval   3   2        ; env
[129] gettable   3   3   283  ; "racInstallerURLBase"
[130] test       3   3   1    ; to [132] if false
[131] jmp        1            ; to [133]
[132] loadk      3   30       ; ""
[133] settable   2   283 3    ; "racInstallerURLBase"
[134] getupval   2   2        ; env
[135] getupval   3   6        ; SubstEnv
[136] getupval   4   1        ; xml
[137] gettable   4   4   258  ; "ArcadeInstaller"
[138] gettable   4   4   262  ; 1
[139] gettable   4   4   271  ; "GameId"
[140] call       3   2   2  
[141] test       3   3   1    ; to [143] if false
[142] jmp        5            ; to [148]
[143] getupval   3   2        ; env
[144] gettable   3   3   285  ; "gameId"
[145] test       3   3   1    ; to [147] if false
[146] jmp        1            ; to [148]
[147] loadk      3   30       ; ""
[148] settable   2   285 3    ; "gameId"
[149] getupval   2   2        ; env
[150] getupval   3   1        ; xml
[151] gettable   3   3   258  ; "ArcadeInstaller"
[152] gettable   3   3   262  ; 1
[153] gettable   3   3   287  ; "Tps"
[154] test       3   3   1    ; to [156] if false
[155] jmp        5            ; to [161]
[156] getupval   3   2        ; env
[157] gettable   3   3   286  ; "tps"
[158] test       3   3   1    ; to [160] if false
[159] jmp        1            ; to [161]
[160] loadk      3   30       ; ""
[161] settable   2   286 3    ; "tps"
[162] getupval   2   2        ; env
[163] getupval   3   1        ; xml
[164] gettable   3   3   258  ; "ArcadeInstaller"
[165] gettable   3   3   262  ; 1
[166] gettable   3   3   289  ; "GameType"
[167] test       3   3   1    ; to [169] if false
[168] jmp        5            ; to [174]
[169] getupval   3   2        ; env
[170] gettable   3   3   288  ; "gameType"
[171] test       3   3   1    ; to [173] if false
[172] jmp        1            ; to [174]
[173] loadk      3   30       ; ""
[174] settable   2   288 3    ; "gameType"
[175] getupval   2   2        ; env
[176] getupval   3   1        ; xml
[177] gettable   3   3   258  ; "ArcadeInstaller"
[178] gettable   3   3   262  ; 1
[179] gettable   3   3   291  ; "Action"
[180] test       3   3   1    ; to [182] if false
[181] jmp        5            ; to [187]
[182] getupval   3   2        ; env
[183] gettable   3   3   290  ; "action"
[184] test       3   3   1    ; to [186] if false
[185] jmp        1            ; to [187]
[186] loadk      3   30       ; ""
[187] settable   2   290 3    ; "action"
[188] getupval   2   2        ; env
[189] getupval   3   1        ; xml
[190] gettable   3   3   258  ; "ArcadeInstaller"
[191] gettable   3   3   262  ; 1
[192] gettable   3   3   293  ; "Lang"
[193] test       3   3   1    ; to [195] if false
[194] jmp        5            ; to [200]
[195] getupval   3   2        ; env
[196] gettable   3   3   292  ; "lang"
[197] test       3   3   1    ; to [199] if false
[198] jmp        1            ; to [200]
[199] loadk      3   30       ; ""
[200] settable   2   292 3    ; "lang"
[201] getupval   2   2        ; env
[202] getupval   3   1        ; xml
[203] gettable   3   3   258  ; "ArcadeInstaller"
[204] gettable   3   3   262  ; 1
[205] gettable   3   3   295  ; "GameName"
[206] test       3   3   1    ; to [208] if false
[207] jmp        5            ; to [213]
[208] getupval   3   2        ; env
[209] gettable   3   3   294  ; "gameName"
[210] test       3   3   1    ; to [212] if false
[211] jmp        1            ; to [213]
[212] loadk      3   30       ; ""
[213] settable   2   294 3    ; "gameName"
[214] getupval   2   2        ; env
[215] getupval   3   1        ; xml
[216] gettable   3   3   258  ; "ArcadeInstaller"
[217] gettable   3   3   262  ; 1
[218] gettable   3   3   296  ; "itmUrl"
[219] test       3   3   1    ; to [221] if false
[220] jmp        5            ; to [226]
[221] getupval   3   2        ; env
[222] gettable   3   3   296  ; "itmUrl"
[223] test       3   3   1    ; to [225] if false
[224] jmp        1            ; to [226]
[225] loadk      3   30       ; ""
[226] settable   2   296 3    ; "itmUrl"
[227] getupval   2   2        ; env
[228] getupval   3   7        ; url
[229] gettable   3   3   298  ; "escape"
[230] getupval   4   2        ; env
[231] gettable   4   4   294  ; "gameName"
[232] call       3   2   2  
[233] settable   2   297 3    ; "urlEncodedGameName"
[234] getglobal  2   49       ; g_env
[235] getupval   3   2        ; env
[236] gettable   3   3   285  ; "gameId"
[237] settable   2   300 3    ; "curGameId"
[238] getglobal  2   49       ; g_env
[239] getupval   3   2        ; env
[240] gettable   3   3   286  ; "tps"
[241] settable   2   301 3    ; "curTps"
[242] getglobal  2   49       ; g_env
[243] getupval   3   2        ; env
[244] gettable   3   3   294  ; "gameName"
[245] settable   2   302 3    ; "curGameName"
[246] getglobal  2   49       ; g_env
[247] getupval   3   2        ; env
[248] gettable   3   3   296  ; "itmUrl"
[249] settable   2   296 3    ; "itmUrl"
[250] getglobal  2   49       ; g_env
[251] getupval   3   1        ; xml
[252] gettable   3   3   258  ; "ArcadeInstaller"
[253] gettable   3   3   262  ; 1
[254] gettable   3   3   303  ; "logURL"
[255] test       3   3   1    ; to [257] if false
[256] jmp        2            ; to [259]
[257] getupval   3   2        ; env
[258] gettable   3   3   303  ; "logURL"
[259] settable   2   303 3    ; "logURL"
[260] getupval   2   1        ; xml
[261] gettable   2   2   258  ; "ArcadeInstaller"
[262] gettable   2   2   262  ; 1
[263] gettable   2   2   305  ; "StoreFront"
[264] test       2   2   1    ; to [266] if false
[265] jmp        4            ; to [270]
[266] getglobal  2   54       ; g_storeFront
[267] test       2   2   1    ; to [269] if false
[268] jmp        1            ; to [270]
[269] loadk      2   56       ; "RealArcade"
[270] setglobal  2   54       ; g_storeFront
[271] getglobal  2   49       ; g_env
[272] getglobal  3   58       ; RACConfigValue
[273] loadk      4   59       ; "LicenseRoot"
[274] call       3   2   2  
[275] gettable   3   3   310  ; "Read"
[276] call       3   1   2  
[277] settable   2   307 3    ; "licenseRoot"
[278] getglobal  2   49       ; g_env
[279] getglobal  3   58       ; RACConfigValue
[280] loadk      4   62       ; "DatabasePath"
[281] call       3   2   2  
[282] gettable   3   3   310  ; "Read"
[283] call       3   1   2  
[284] settable   2   311 3    ; "databasePath"
[285] getupval   2   1        ; xml
[286] gettable   2   2   258  ; "ArcadeInstaller"
[287] gettable   2   2   262  ; 1
[288] gettable   2   2   313  ; "URLParameters"
[289] test       2   2   0    ; to [291] if true
[290] jmp        8            ; to [299]
[291] getupval   2   4        ; SubstEnvRec
[292] getupval   3   1        ; xml
[293] gettable   3   3   258  ; "ArcadeInstaller"
[294] gettable   3   3   262  ; 1
[295] gettable   3   3   313  ; "URLParameters"
[296] gettable   3   3   262  ; 1
[297] call       2   2   2  
[298] setglobal  2   64       ; g_tableURLParameters
[299] getglobal  2   49       ; g_env
[300] gettable   2   2   311  ; "databasePath"
[301] eq         0   2   280  ; "", to [303] if true
[302] jmp        7            ; to [310]
[303] getglobal  2   49       ; g_env
[304] getglobal  3   58       ; RACConfigValue
[305] loadk      4   65       ; "InstallPath"
[306] call       3   2   2  
[307] gettable   3   3   310  ; "Read"
[308] call       3   1   2  
[309] settable   2   311 3    ; "databasePath"
[310] getglobal  2   66       ; IsMigration
[311] call       2   1   2  
[312] loadbool   3   1   0    ; true
[313] eq         0   2   3    ; to [315] if true
[314] jmp        38           ; to [353]
[315] getglobal  2   67       ; io
[316] gettable   2   2   318  ; "write"
[317] loadk      3   69       ; "\n"
[318] getglobal  4   70       ; os
[319] gettable   4   4   321  ; "date"
[320] loadk      5   72       ; "%c "
[321] call       4   2   2  
[322] loadk      5   73       ; "set to migrate for client only."
[323] call       2   4   1  
[324] loadbool   2   1   0    ; true
[325] setupval   2   8        ; ismigrating
[326] jmp        26           ; to [353]
[327] getglobal  2   74       ; g_fOffline
[328] loadbool   3   1   0    ; true
[329] eq         1   2   3    ; to [331] if false
[330] jmp        5            ; to [336]
[331] getglobal  2   4        ; assert
[332] loadbool   3   0   0    ; false
[333] loadk      4   75       ; "httpError"
[334] call       2   3   1  
[335] jmp        17           ; to [353]
[336] getglobal  2   4        ; assert
[337] self       3   1   256  ; "load"
[338] move       5   0      
[339] call       3   3   2  
[340] loadk      4   76       ; "\nParse error: "
[341] gettable   5   1   327  ; "parseError"
[342] gettable   5   5   328  ; "reason"
[343] loadk      6   79       ; "on file "
[344] test       7   0   1    ; to [346] if false
[345] jmp        1            ; to [347]
[346] loadk      7   80       ; "unk"
[347] concat     4   4   7  
[348] call       2   3   1  
[349] getglobal  2   4        ; assert
[350] loadbool   3   0   0    ; false
[351] loadk      4   81       ; "missingrgi"
[352] call       2   3   1  
[353] return     0   1      
; end of function


; function [38] definition (level 4)
; 5 upvalues, 2 params, 18 stacks
.function  5 2 0 18
.local  "gameid"  ; 0
.local  "tps"  ; 1
.local  "attribs"  ; 2
.local  "strITM_URL"  ; 3
.local  "(for generator)"  ; 4
.local  "(for state)"  ; 5
.local  "name"  ; 6
.local  "value"  ; 7
.local  "strParameterTestForCollision"  ; 8
.local  "parser"  ; 9
.local  "xmlReturned"  ; 10
.local  "(for generator)"  ; 11
.local  "(for state)"  ; 12
.local  "name"  ; 13
.local  "value"  ; 14
.upvalue  "SubstEnvRec"  ; 0
.upvalue  "xml"  ; 1
.upvalue  "win32"  ; 2
.upvalue  "dwnldMgr"  ; 3
.upvalue  "members"  ; 4
.const  "ArcadeInstaller"  ; 0
.const  1  ; 1
.const  "assert"  ; 2
.const  "Tps"  ; 3
.const  "GameId"  ; 4
.const  "ProductId"  ; 5
.const  "missing_attribs"  ; 6
.const  "g_env"  ; 7
.const  "itmUrl"  ; 8
.const  "string"  ; 9
.const  "len"  ; 10
.const  0  ; 11
.const  "io"  ; 12
.const  "write"  ; 13
.const  "\n"  ; 14
.const  "os"  ; 15
.const  "date"  ; 16
.const  "%c "  ; 17
.const  "using template URL = '"  ; 18
.const  "'"  ; 19
.const  "GetMatchingURLs"  ; 20
.const  "g_storeFront"  ; 21
.const  "g_tps"  ; 22
.const  "using config URL = '"  ; 23
.const  "RequestVersionParams"  ; 24
.const  "&tps="  ; 25
.const  "&gameid="  ; 26
.const  ""  ; 27
.const  "&product_id="  ; 28
.const  "&src="  ; 29
.const  "Src"  ; 30
.const  "&machineid="  ; 31
.const  "getMachineID"  ; 32
.const  "g_tableURLParameters"  ; 33
.const  "&"  ; 34
.const  "="  ; 35
.const  "find"  ; 36
.const  "URLParameter name = '"  ; 37
.const  "', value = '"  ; 38
.const  "' appended to URL"  ; 39
.const  "template provided URLParameter name '"  ; 40
.const  "' already in URL"  ; 41
.const  "template provided URLParameter name = '"  ; 42
.const  "no URLParameters tag found in template"  ; 43
.const  "Download URL = '"  ; 44
.const  "GetFile"  ; 45
.const  "tmprgi.xml"  ; 46
.const  "LoadXML"  ; 47
.const  "luacom"  ; 48
.const  "CreateObject"  ; 49
.const  "Msxml.DOMDocument"  ; 50
.const  "comError"  ; 51
.const  "load"  ; 52
.const  "\nParse error: "  ; 53
.const  "parseError"  ; 54
.const  "reason"  ; 55
.const  "on file tmprgi.xml"  ; 56
.const  "g_tableConfig"  ; 57
.const  "PathXMLSave"  ; 58
.const  "LocalCopy"  ; 59
.const  "DeleteFile"  ; 60
.const  "ParseNode"  ; 61
.const  "badXml"  ; 62
.const  "URLParameters"  ; 63
.const  "downloaded URLParameter name = '"  ; 64
[001] loadnil    2   2      
[002] test       0   0   0    ; to [4] if true
[003] jmp        2            ; to [6]
[004] test       1   1   1    ; to [6] if false
[005] jmp        17           ; to [23]
[006] getupval   3   0        ; SubstEnvRec
[007] getupval   4   1        ; xml
[008] gettable   4   4   250  ; "ArcadeInstaller"
[009] gettable   4   4   251  ; 1
[010] call       3   2   2  
[011] move       2   3      
[012] getglobal  3   2        ; assert
[013] gettable   4   2   253  ; "Tps"
[014] test       4   4   0    ; to [16] if true
[015] jmp        4            ; to [20]
[016] gettable   4   2   254  ; "GameId"
[017] test       4   4   1    ; to [19] if false
[018] jmp        1            ; to [20]
[019] gettable   4   2   255  ; "ProductId"
[020] loadk      5   6        ; "missing_attribs"
[021] call       3   3   1  
[022] jmp        4            ; to [27]
[023] newtable   3   0   0    ; array=0, hash=0
[024] move       2   3      
[025] settable   2   253 1    ; "Tps"
[026] settable   2   254 0    ; "GameId"
[027] loadnil    3   3      
[028] getglobal  4   7        ; g_env
[029] gettable   4   4   258  ; "itmUrl"
[030] test       4   4   0    ; to [32] if true
[031] jmp        22           ; to [54]
[032] getglobal  4   9        ; string
[033] gettable   4   4   260  ; "len"
[034] getglobal  5   7        ; g_env
[035] gettable   5   5   258  ; "itmUrl"
[036] call       4   2   2  
[037] lt         0   261 4    ; 0, to [39] if true
[038] jmp        15           ; to [54]
[039] getglobal  4   7        ; g_env
[040] gettable   3   4   258  ; "itmUrl"
[041] getglobal  4   12       ; io
[042] gettable   4   4   263  ; "write"
[043] loadk      5   14       ; "\n"
[044] getglobal  6   15       ; os
[045] gettable   6   6   266  ; "date"
[046] loadk      7   17       ; "%c "
[047] call       6   2   2  
[048] loadk      7   18       ; "using template URL = '"
[049] move       8   3      
[050] loadk      9   19       ; "'"
[051] concat     7   7   9  
[052] call       4   4   1  
[053] jmp        17           ; to [71]
[054] getglobal  4   20       ; GetMatchingURLs
[055] getglobal  5   21       ; g_storeFront
[056] getglobal  6   22       ; g_tps
[057] call       4   3   2  
[058] move       3   4      
[059] getglobal  4   12       ; io
[060] gettable   4   4   263  ; "write"
[061] loadk      5   14       ; "\n"
[062] getglobal  6   15       ; os
[063] gettable   6   6   266  ; "date"
[064] loadk      7   17       ; "%c "
[065] call       6   2   2  
[066] loadk      7   23       ; "using config URL = '"
[067] move       8   3      
[068] loadk      9   19       ; "'"
[069] concat     7   7   9  
[070] call       4   4   1  
[071] move       4   3      
[072] getglobal  5   24       ; RequestVersionParams
[073] call       5   1   2  
[074] loadk      6   25       ; "&tps="
[075] gettable   7   2   253  ; "Tps"
[076] loadk      8   26       ; "&gameid="
[077] gettable   9   2   254  ; "GameId"
[078] test       9   9   1    ; to [80] if false
[079] jmp        1            ; to [81]
[080] loadk      9   27       ; ""
[081] loadk      10  28       ; "&product_id="
[082] gettable   11  2   255  ; "ProductId"
[083] test       11  11  1    ; to [85] if false
[084] jmp        1            ; to [86]
[085] loadk      11  27       ; ""
[086] loadk      12  29       ; "&src="
[087] gettable   13  2   280  ; "Src"
[088] test       13  13  1    ; to [90] if false
[089] jmp        1            ; to [91]
[090] loadk      13  27       ; ""
[091] loadk      14  31       ; "&machineid="
[092] getupval   15  2        ; win32
[093] gettable   15  15  282  ; "getMachineID"
[094] call       15  1   2  
[095] test       15  15  1    ; to [97] if false
[096] jmp        1            ; to [98]
[097] loadk      15  27       ; ""
[098] concat     3   4   15 
[099] getglobal  4   33       ; g_tableURLParameters
[100] test       4   4   0    ; to [102] if true
[101] jmp        66           ; to [168]
[102] getglobal  4   33       ; g_tableURLParameters
[103] loadnil    5   7      
[104] tforprep   4   60       ; to [165]
[105] test       6   6   0    ; to [107] if true
[106] jmp        44           ; to [151]
[107] test       7   7   0    ; to [109] if true
[108] jmp        42           ; to [151]
[109] loadk      8   34       ; "&"
[110] move       9   6      
[111] loadk      10  35       ; "="
[112] concat     8   8   10 
[113] getglobal  9   9        ; string
[114] gettable   9   9   286  ; "find"
[115] move       10  3      
[116] move       11  8      
[117] call       9   3   2  
[118] test       9   9   1    ; to [120] if false
[119] jmp        19           ; to [139]
[120] move       9   3      
[121] move       10  8      
[122] move       11  7      
[123] concat     3   9   11 
[124] getglobal  9   12       ; io
[125] gettable   9   9   263  ; "write"
[126] loadk      10  14       ; "\n"
[127] getglobal  11  15       ; os
[128] gettable   11  11  266  ; "date"
[129] loadk      12  17       ; "%c "
[130] call       11  2   2  
[131] loadk      12  37       ; "URLParameter name = '"
[132] move       13  6      
[133] loadk      14  38       ; "', value = '"
[134] move       15  7      
[135] loadk      16  39       ; "' appended to URL"
[136] concat     12  12  16 
[137] call       9   4   1  
[138] jmp        12           ; to [151]
[139] getglobal  9   12       ; io
[140] gettable   9   9   263  ; "write"
[141] loadk      10  14       ; "\n"
[142] getglobal  11  15       ; os
[143] gettable   11  11  266  ; "date"
[144] loadk      12  17       ; "%c "
[145] call       11  2   2  
[146] loadk      12  40       ; "template provided URLParameter name '"
[147] move       13  6      
[148] loadk      14  41       ; "' already in URL"
[149] concat     12  12  14 
[150] call       9   4   1  
[151] getglobal  8   12       ; io
[152] gettable   8   8   263  ; "write"
[153] loadk      9   14       ; "\n"
[154] getglobal  10  15       ; os
[155] gettable   10  10  266  ; "date"
[156] loadk      11  17       ; "%c "
[157] call       10  2   2  
[158] loadk      11  42       ; "template provided URLParameter name = '"
[159] move       12  6      
[160] loadk      13  38       ; "', value = '"
[161] move       14  7      
[162] loadk      15  19       ; "'"
[163] concat     11  11  15 
[164] call       8   4   1  
[165] tforloop   4       1    ; to [167] if exit
[166] jmp        -62          ; to [105]
[167] jmp        9            ; to [177]
[168] getglobal  4   12       ; io
[169] gettable   4   4   263  ; "write"
[170] loadk      5   14       ; "\n"
[171] getglobal  6   15       ; os
[172] gettable   6   6   266  ; "date"
[173] loadk      7   17       ; "%c "
[174] call       6   2   2  
[175] loadk      7   43       ; "no URLParameters tag found in template"
[176] call       4   4   1  
[177] getglobal  4   12       ; io
[178] gettable   4   4   263  ; "write"
[179] loadk      5   14       ; "\n"
[180] getglobal  6   15       ; os
[181] gettable   6   6   266  ; "date"
[182] loadk      7   17       ; "%c "
[183] call       6   2   2  
[184] loadk      7   44       ; "Download URL = '"
[185] move       8   3      
[186] loadk      9   19       ; "'"
[187] concat     7   7   9  
[188] call       4   4   1  
[189] getupval   4   3        ; dwnldMgr
[190] gettable   4   4   295  ; "GetFile"
[191] move       5   3      
[192] loadk      6   46       ; "tmprgi.xml"
[193] call       4   3   1  
[194] getupval   4   4        ; members
[195] gettable   4   4   297  ; "LoadXML"
[196] loadk      5   46       ; "tmprgi.xml"
[197] call       4   2   1  
[198] getglobal  4   48       ; luacom
[199] gettable   4   4   299  ; "CreateObject"
[200] loadk      5   50       ; "Msxml.DOMDocument"
[201] call       4   2   2  
[202] loadnil    5   5      
[203] getglobal  6   2        ; assert
[204] move       7   4      
[205] loadk      8   51       ; "comError"
[206] call       6   3   1  
[207] getglobal  6   2        ; assert
[208] self       7   4   302  ; "load"
[209] loadk      9   46       ; "tmprgi.xml"
[210] call       7   3   2  
[211] loadk      8   53       ; "\nParse error: "
[212] gettable   9   4   304  ; "parseError"
[213] gettable   9   9   305  ; "reason"
[214] loadk      10  56       ; "on file tmprgi.xml"
[215] concat     8   8   10 
[216] call       6   3   1  
[217] getglobal  6   57       ; g_tableConfig
[218] gettable   6   6   308  ; "PathXMLSave"
[219] test       6   6   0    ; to [221] if true
[220] jmp        6            ; to [227]
[221] getupval   6   2        ; win32
[222] gettable   6   6   309  ; "LocalCopy"
[223] loadk      7   46       ; "tmprgi.xml"
[224] getglobal  8   57       ; g_tableConfig
[225] gettable   8   8   308  ; "PathXMLSave"
[226] call       6   3   1  
[227] getupval   6   2        ; win32
[228] gettable   6   6   310  ; "DeleteFile"
[229] loadk      7   46       ; "tmprgi.xml"
[230] call       6   2   1  
[231] getglobal  6   61       ; ParseNode
[232] newtable   7   0   0    ; array=0, hash=0
[233] move       8   4      
[234] call       6   3   2  
[235] move       5   6      
[236] getglobal  6   2        ; assert
[237] gettable   7   5   250  ; "ArcadeInstaller"
[238] loadk      8   62       ; "badXml"
[239] call       6   3   1  
[240] gettable   6   5   250  ; "ArcadeInstaller"
[241] gettable   6   6   251  ; 1
[242] gettable   6   6   313  ; "URLParameters"
[243] test       6   6   0    ; to [245] if true
[244] jmp        30           ; to [275]
[245] getupval   6   0        ; SubstEnvRec
[246] gettable   7   5   250  ; "ArcadeInstaller"
[247] gettable   7   7   251  ; 1
[248] gettable   7   7   313  ; "URLParameters"
[249] gettable   7   7   251  ; 1
[250] call       6   2   2  
[251] setglobal  6   33       ; g_tableURLParameters
[252] getglobal  6   33       ; g_tableURLParameters
[253] test       6   6   0    ; to [255] if true
[254] jmp        20           ; to [275]
[255] getglobal  6   33       ; g_tableURLParameters
[256] loadnil    7   9      
[257] tforprep   6   14       ; to [272]
[258] getglobal  10  12       ; io
[259] gettable   10  10  263  ; "write"
[260] loadk      11  14       ; "\n"
[261] getglobal  12  15       ; os
[262] gettable   12  12  266  ; "date"
[263] loadk      13  17       ; "%c "
[264] call       12  2   2  
[265] loadk      13  64       ; "downloaded URLParameter name = '"
[266] move       14  8      
[267] loadk      15  38       ; "', value = '"
[268] move       16  9      
[269] loadk      17  19       ; "'"
[270] concat     13  13  17 
[271] call       10  4   1  
[272] tforloop   6       1    ; to [274] if exit
[273] jmp        -16          ; to [258]
[274] jmp        0            ; to [275]
[275] return     0   1      
; end of function


; function [39] definition (level 4)
; 3 upvalues, 1 params, 3 stacks
.function  3 1 0 3
.local  "key"  ; 0
.upvalue  "SubstEnvRec"  ; 0
.upvalue  "xml"  ; 1
.upvalue  "members"  ; 2
.const  "basexml"  ; 0
.const  "ArcadeInstaller"  ; 1
.const  1  ; 2
.const  "racversion"  ; 3
.const  "RACVersion"  ; 4
.const  "selfinstall"  ; 5
.const  "SelfInstall"  ; 6
.const  "dest"  ; 7
.const  "uninstfile"  ; 8
.const  "Uninstall"  ; 9
.const  "Filename"  ; 10
.const  "GameId"  ; 11
.const  "Text"  ; 12
.const  "assoc"  ; 13
.const  "Assoc"  ; 14
[01] getupval   1   0        ; SubstEnvRec
[02] getupval   2   1        ; xml
[03] gettable   2   2   251  ; "ArcadeInstaller"
[04] gettable   2   2   252  ; 1
[05] call       1   2   2  
[06] setglobal  1   0        ; basexml
[07] getupval   1   2        ; members
[08] gettable   1   1   253  ; "racversion"
[09] eq         0   0   1    ; to [11] if true
[10] jmp        4            ; to [15]
[11] getglobal  1   0        ; basexml
[12] gettable   1   1   254  ; "RACVersion"
[13] return     1   2      
[14] jmp        51           ; to [66]
[15] getupval   1   2        ; members
[16] gettable   1   1   255  ; "selfinstall"
[17] eq         0   0   1    ; to [19] if true
[18] jmp        10           ; to [29]
[19] getglobal  1   0        ; basexml
[20] gettable   1   1   256  ; "SelfInstall"
[21] test       1   1   0    ; to [23] if true
[22] jmp        6            ; to [29]
[23] getglobal  1   0        ; basexml
[24] gettable   1   1   256  ; "SelfInstall"
[25] gettable   1   1   252  ; 1
[26] gettable   1   1   257  ; "dest"
[27] return     1   2      
[28] jmp        37           ; to [66]
[29] getupval   1   2        ; members
[30] gettable   1   1   258  ; "uninstfile"
[31] eq         0   0   1    ; to [33] if true
[32] jmp        20           ; to [53]
[33] getglobal  1   0        ; basexml
[34] gettable   1   1   259  ; "Uninstall"
[35] test       1   1   0    ; to [37] if true
[36] jmp        16           ; to [53]
[37] getglobal  1   0        ; basexml
[38] gettable   1   1   259  ; "Uninstall"
[39] gettable   1   1   252  ; 1
[40] gettable   1   1   260  ; "Filename"
[41] test       1   1   1    ; to [43] if false
[42] jmp        8            ; to [51]
[43] getglobal  1   0        ; basexml
[44] gettable   1   1   261  ; "GameId"
[45] test       1   1   1    ; to [47] if false
[46] jmp        4            ; to [51]
[47] getglobal  1   0        ; basexml
[48] gettable   1   1   259  ; "Uninstall"
[49] gettable   1   1   252  ; 1
[50] gettable   1   1   262  ; "Text"
[51] return     1   2      
[52] jmp        13           ; to [66]
[53] getupval   1   2        ; members
[54] gettable   1   1   263  ; "assoc"
[55] eq         0   0   1    ; to [57] if true
[56] jmp        9            ; to [66]
[57] getglobal  1   0        ; basexml
[58] gettable   1   1   259  ; "Uninstall"
[59] test       1   1   0    ; to [61] if true
[60] jmp        5            ; to [66]
[61] getglobal  1   0        ; basexml
[62] gettable   1   1   259  ; "Uninstall"
[63] gettable   1   1   252  ; 1
[64] gettable   1   1   264  ; "Assoc"
[65] return     1   2      
[66] return     0   1      
; end of function

[001] test       1   0   1    ; to [3] if false
[002] jmp        1            ; to [4]
[003] newtable   1   0   0    ; array=0, hash=0
[004] closure    2   0        ; 1 upvalues
[005] move       0   1      
[006] getglobal  3   0        ; ConstTable
[007] call       3   1   2  
[008] getglobal  4   0        ; ConstTable
[009] call       4   1   2  
[010] getglobal  5   1        ; ConditionSet
[011] move       6   2      
[012] call       5   2   2  
[013] loadnil    6   8      
[014] closure    9   1        ; 1 upvalues
[015] move       0   1      
[016] closure    10  2        ; 2 upvalues
[017] move       0   9      
[018] move       0   10     
[019] closure    11  3        ; 4 upvalues
[020] move       0   0      
[021] move       0   1      
[022] getupval   0   0        ; installv1location
[023] getupval   0   1        ; win32
[024] closure    12  4        ; 2 upvalues
[025] getupval   0   2        ; ui
[026] move       0   3      
[027] closure    13  5        ; 1 upvalues
[028] move       0   12     
[029] closure    14  6        ; 1 upvalues
[030] move       0   5      
[031] closure    15  7        ; 3 upvalues
[032] move       0   14     
[033] getupval   0   1        ; win32
[034] move       0   6      
[035] closure    16  8        ; 3 upvalues
[036] move       0   14     
[037] getupval   0   1        ; win32
[038] move       0   6      
[039] closure    17  9        ; 1 upvalues
[040] move       0   14     
[041] closure    18  10       ; 3 upvalues
[042] move       0   14     
[043] move       0   4      
[044] move       0   6      
[045] closure    19  11       ; 2 upvalues
[046] move       0   1      
[047] getupval   0   2        ; ui
[048] closure    20  12       ; 2 upvalues
[049] move       0   14     
[050] getupval   0   1        ; win32
[051] closure    21  13       ; 1 upvalues
[052] move       0   14     
[053] closure    22  14       ; 5 upvalues
[054] getupval   0   1        ; win32
[055] move       0   14     
[056] move       0   6      
[057] getupval   0   3        ; installStep
[058] move       0   12     
[059] closure    23  15       ; 0 upvalues
[060] closure    24  16       ; 3 upvalues
[061] move       0   14     
[062] move       0   23     
[063] getupval   0   4        ; errHandler
[064] closure    25  17       ; 2 upvalues
[065] move       0   14     
[066] move       0   1      
[067] closure    26  18       ; 1 upvalues
[068] move       0   14     
[069] closure    27  19       ; 11 upvalues
[070] move       0   15     
[071] move       0   16     
[072] move       0   17     
[073] move       0   22     
[074] move       0   25     
[075] move       0   26     
[076] move       0   14     
[077] move       0   19     
[078] move       0   18     
[079] move       0   20     
[080] move       0   24     
[081] closure    28  20       ; 3 upvalues
[082] move       0   1      
[083] move       0   3      
[084] move       0   6      
[085] closure    29  21       ; 1 upvalues
[086] getupval   0   2        ; ui
[087] closure    30  22       ; 2 upvalues
[088] move       0   14     
[089] getupval   0   2        ; ui
[090] closure    8   23       ; 9 upvalues
[091] getupval   0   2        ; ui
[092] getupval   0   5        ; currentPayload
[093] getupval   0   6        ; ismigrating
[094] getupval   0   7        ; dwnldMgr
[095] move       0   13     
[096] getupval   0   1        ; win32
[097] move       0   12     
[098] move       0   19     
[099] move       0   6      
[100] closure    7   24       ; 8 upvalues
[101] move       0   1      
[102] getupval   0   1        ; win32
[103] move       0   6      
[104] getupval   0   2        ; ui
[105] move       0   28     
[106] getupval   0   3        ; installStep
[107] move       0   12     
[108] move       0   3      
[109] closure    31  25       ; 2 upvalues
[110] getupval   0   2        ; ui
[111] getupval   0   8        ; procMgr
[112] settable   3   252 31   ; "Sink"
[113] closure    31  26       ; 3 upvalues
[114] move       0   3      
[115] move       0   10     
[116] move       0   4      
[117] settable   3   253 31   ; "TotalRootPayloads"
[118] closure    31  27       ; 5 upvalues
[119] getupval   0   7        ; dwnldMgr
[120] move       0   1      
[121] move       0   14     
[122] getupval   0   2        ; ui
[123] move       0   3      
[124] settable   3   254 31   ; "TotalPayloads"
[125] closure    31  28       ; 4 upvalues
[126] move       0   3      
[127] move       0   10     
[128] move       0   4      
[129] move       0   5      
[130] settable   3   255 31   ; "PreProcess"
[131] closure    31  29       ; 2 upvalues
[132] move       0   4      
[133] getupval   0   2        ; ui
[134] settable   3   256 31   ; "SetCandyOptions"
[135] closure    31  30       ; 10 upvalues
[136] getupval   0   1        ; win32
[137] move       0   4      
[138] move       0   1      
[139] move       0   10     
[140] getupval   0   7        ; dwnldMgr
[141] getupval   0   2        ; ui
[142] move       0   14     
[143] move       0   27     
[144] move       0   3      
[145] getupval   0   0        ; installv1location
[146] settable   3   257 31   ; "InitEngine"
[147] closure    31  31       ; 0 upvalues
[148] settable   3   258 31   ; "GetRequiredMB"
[149] closure    31  32       ; 8 upvalues
[150] getupval   0   2        ; ui
[151] getupval   0   5        ; currentPayload
[152] move       0   1      
[153] getupval   0   9        ; totalBundleSize
[154] getupval   0   10       ; totalPayloads
[155] move       0   3      
[156] getupval   0   3        ; installStep
[157] getupval   0   1        ; win32
[158] settable   3   259 31   ; "PreInstall"
[159] closure    31  33       ; 11 upvalues
[160] move       0   8      
[161] move       0   7      
[162] move       0   4      
[163] move       0   29     
[164] move       0   10     
[165] move       0   27     
[166] move       0   21     
[167] move       0   14     
[168] move       0   6      
[169] getupval   0   1        ; win32
[170] move       0   1      
[171] settable   3   260 31   ; "DoInstall"
[172] closure    31  34       ; 3 upvalues
[173] move       0   10     
[174] move       0   4      
[175] move       0   21     
[176] settable   3   261 31   ; "DoLaunchTags"
[177] closure    31  35       ; 6 upvalues
[178] getupval   0   2        ; ui
[179] move       0   1      
[180] move       0   4      
[181] move       0   10     
[182] move       0   27     
[183] move       0   3      
[184] settable   3   262 31   ; "PostProcess"
[185] closure    31  36       ; 4 upvalues
[186] move       0   4      
[187] getupval   0   2        ; ui
[188] move       0   30     
[189] move       0   3      
[190] settable   3   263 31   ; "ShutdownEngine"
[191] closure    31  37       ; 9 upvalues
[192] getupval   0   2        ; ui
[193] move       0   4      
[194] move       0   1      
[195] getupval   0   1        ; win32
[196] move       0   10     
[197] move       0   6      
[198] move       0   9      
[199] getupval   0   11       ; url
[200] getupval   0   6        ; ismigrating
[201] settable   3   264 31   ; "LoadXML"
[202] closure    31  38       ; 5 upvalues
[203] move       0   10     
[204] move       0   4      
[205] getupval   0   1        ; win32
[206] getupval   0   7        ; dwnldMgr
[207] move       0   3      
[208] settable   3   265 31   ; "RequestRgi"
[209] settable   3   266 267  ; "racversion" 0
[210] settable   3   268 269  ; "selfinstall" 1
[211] settable   3   270 271  ; "uninstfile" 2
[212] settable   3   272 273  ; "assoc" 3
[213] closure    31  39       ; 3 upvalues
[214] move       0   10     
[215] move       0   4      
[216] move       0   3      
[217] settable   3   274 31   ; "GetValue"
[218] move       31  11     
[219] call       31  1   1  
[220] getglobal  31  25       ; io
[221] gettable   31  31  276  ; "write"
[222] loadk      32  27       ; "\n"
[223] getglobal  33  28       ; os
[224] gettable   33  33  279  ; "date"
[225] loadk      34  30       ; "%c "
[226] call       33  2   2  
[227] loadk      34  31       ; "Returning instance of MetadataInterp"
[228] call       31  4   1  
[229] return     3   2      
[230] return     0   1      
; end of function

[001] getglobal  0   0        ; require
[002] loadk      1   1        ; "socket.url"
[003] call       0   2   2  
[004] getglobal  1   2        ; ErrorHandler
[005] call       1   1   2  
[006] loadbool   2   0   0    ; false
[007] getglobal  3   3        ; DownloadMgr
[008] call       3   1   2  
[009] getglobal  4   4        ; Win32Interop
[010] call       4   1   2  
[011] loadk      5   5        ; 0
[012] loadk      6   5        ; 0
[013] loadbool   7   0   0    ; false
[014] loadk      8   5        ; 0
[015] loadk      9   5        ; 0
[016] loadnil    10  10     
[017] getglobal  11  6        ; luacom
[018] gettable   11  11  257  ; "CreateObject"
[019] loadk      12  8        ; "StubbyUtil.ProcessMgr"
[020] call       11  2   2  
[021] loadnil    12  12     
[022] setglobal  12  9        ; g_strURLBase
[023] loadnil    12  12     
[024] setglobal  12  10       ; g_strURLPing
[025] loadnil    12  12     
[026] setglobal  12  11       ; g_gameID
[027] loadnil    12  12     
[028] setglobal  12  12       ; g_tps
[029] newtable   12  0   5    ; array=0, hash=32
[030] gettable   13  4   265  ; "SpecialFolder"
[031] gettable   14  4   266  ; "folderType"
[032] gettable   14  14  264  ; "desktop"
[033] call       13  2   2  
[034] settable   12  264 13   ; "desktop"
[035] gettable   13  4   265  ; "SpecialFolder"
[036] gettable   14  4   266  ; "folderType"
[037] gettable   14  14  267  ; "start"
[038] call       13  2   2  
[039] settable   12  267 13   ; "start"
[040] gettable   13  4   265  ; "SpecialFolder"
[041] gettable   14  4   266  ; "folderType"
[042] gettable   14  14  268  ; "startPrograms"
[043] call       13  2   2  
[044] settable   12  268 13   ; "startPrograms"
[045] gettable   13  4   265  ; "SpecialFolder"
[046] gettable   14  4   266  ; "folderType"
[047] gettable   14  14  269  ; "programFiles"
[048] call       13  2   2  
[049] settable   12  269 13   ; "programFiles"
[050] gettable   13  4   265  ; "SpecialFolder"
[051] gettable   14  4   266  ; "folderType"
[052] gettable   14  14  270  ; "appData"
[053] call       13  2   2  
[054] settable   12  270 13   ; "appData"
[055] gettable   13  4   265  ; "SpecialFolder"
[056] gettable   14  4   266  ; "folderType"
[057] gettable   14  14  271  ; "commonStartMenu"
[058] call       13  2   2  
[059] settable   12  271 13   ; "commonStartMenu"
[060] gettable   13  4   265  ; "SpecialFolder"
[061] gettable   14  4   266  ; "folderType"
[062] gettable   14  14  272  ; "commonDesktop"
[063] call       13  2   2  
[064] settable   12  272 13   ; "commonDesktop"
[065] gettable   13  4   265  ; "SpecialFolder"
[066] gettable   14  4   266  ; "folderType"
[067] gettable   14  14  273  ; "favorites"
[068] call       13  2   2  
[069] settable   12  273 13   ; "favorites"
[070] gettable   13  4   265  ; "SpecialFolder"
[071] gettable   14  4   266  ; "folderType"
[072] gettable   14  14  275  ; "userSpecificFavorites"
[073] call       13  2   2  
[074] settable   12  274 13   ; "userFavorites"
[075] gettable   13  4   277  ; "FireFoxVersion"
[076] call       13  1   2  
[077] settable   12  276 13   ; "firefoxVer"
[078] gettable   13  4   279  ; "IEVersion"
[079] call       13  1   2  
[080] settable   12  278 13   ; "ieVer"
[081] gettable   13  4   265  ; "SpecialFolder"
[082] gettable   14  4   266  ; "folderType"
[083] gettable   14  14  280  ; "system"
[084] call       13  2   2  
[085] settable   12  280 13   ; "system"
[086] gettable   13  4   265  ; "SpecialFolder"
[087] gettable   14  4   266  ; "folderType"
[088] gettable   14  14  282  ; "windows"
[089] call       13  2   2  
[090] settable   12  281 13   ; "windir"
[091] getglobal  13  34       ; GetEnvironmentString
[092] loadk      14  35       ; "TEMP"
[093] call       13  2   2  
[094] test       13  13  1    ; to [96] if false
[095] jmp        3            ; to [99]
[096] getglobal  13  34       ; GetEnvironmentString
[097] loadk      14  36       ; "TMP"
[098] call       13  2   2  
[099] settable   12  283 13   ; "tmpDir"
[100] getglobal  13  38       ; os
[101] gettable   13  13  289  ; "date"
[102] loadk      14  40       ; "!%Y%m%dT%H%M%S"
[103] call       13  2   2  
[104] settable   12  287 13   ; "dateTime"
[105] getglobal  13  38       ; os
[106] gettable   13  13  289  ; "date"
[107] loadk      14  42       ; "%Y/%m/%d@%H:%M:%S"
[108] call       13  2   2  
[109] settable   12  291 13   ; "dateTimeTM"
[110] getglobal  13  38       ; os
[111] gettable   13  13  289  ; "date"
[112] loadk      14  44       ; "%Y%m%d%w%j"
[113] call       13  2   2  
[114] settable   12  293 13   ; "dayWeekOfYear"
[115] settable   12  295 296  ; "gameExe" nil
[116] getglobal  13  48       ; RACVerTps
[117] call       13  1   2  
[118] test       13  13  1    ; to [120] if false
[119] jmp        1            ; to [121]
[120] loadk      13  49       ; ""
[121] settable   12  297 13   ; "racVerInit"
[122] getglobal  13  51       ; V1_BASE_URL
[123] settable   12  300 13   ; "v1baseUrl"
[124] settable   12  302 303  ; "IDW_COMPLETED" 2000
[125] settable   12  304 305  ; "curGameId" "realarcade"
[126] setglobal  12  13       ; g_env
[127] loadnil    12  12     
[128] setglobal  12  56       ; g_tableURLParameters
[129] getglobal  12  13       ; g_env
[130] getglobal  13  58       ; string
[131] gettable   13  13  309  ; "sub"
[132] getglobal  14  13       ; g_env
[133] gettable   14  14  280  ; "system"
[134] loadk      15  60       ; 1
[135] loadk      16  60       ; 1
[136] call       13  4   2  
[137] settable   12  307 13   ; "sysDrive"
[138] getglobal  12  13       ; g_env
[139] getglobal  13  38       ; os
[140] gettable   13  13  312  ; "getenv"
[141] loadk      14  61       ; "public"
[142] call       13  2   2  
[143] test       13  13  1    ; to [145] if false
[144] jmp        4            ; to [149]
[145] getglobal  13  13       ; g_env
[146] gettable   13  13  307  ; "sysDrive"
[147] loadk      14  63       ; ":\\users\\public"
[148] concat     13  13  14 
[149] settable   12  311 13   ; "public"
[150] getglobal  12  13       ; g_env
[151] getglobal  13  58       ; string
[152] gettable   13  13  316  ; "find"
[153] getglobal  14  13       ; g_env
[154] gettable   14  14  269  ; "programFiles"
[155] gettable   15  4   317  ; "driveExp"
[156] loadk      16  68       ; "("
[157] gettable   17  4   319  ; "filenameExp"
[158] loadk      18  70       ; ")"
[159] concat     15  15  18 
[160] call       13  3   4  
[161] settable   12  315 15   ; "programFolder"
[162] setglobal  14  64       ; _
[163] setglobal  13  64       ; _
[164] closure    12  0        ; 0 upvalues
[165] setglobal  12  71       ; Sanitize
[166] closure    12  1        ; 12 upvalues
[167] move       0   10     
[168] move       0   4      
[169] move       0   2      
[170] move       0   5      
[171] move       0   1      
[172] move       0   9      
[173] move       0   7      
[174] move       0   3      
[175] move       0   11     
[176] move       0   6      
[177] move       0   8      
[178] move       0   0      
[179] setglobal  12  72       ; MetadataInterp
[180] return     0   1      
; end of function


; function [11] definition (level 2)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
.const  "ParseNode"  ; 0

; function [0] definition (level 3)
; 0 upvalues, 2 params, 13 stacks
.function  0 2 0 13
.local  "node"  ; 0
.local  "obj"  ; 1
.local  "attribs"  ; 2
.local  "i"  ; 3
.local  "(for limit)"  ; 4
.local  "(for step)"  ; 5
.local  "attrib"  ; 6
.local  "childNodes"  ; 7
.local  "i"  ; 8
.local  "(for limit)"  ; 9
.local  "(for step)"  ; 10
.local  "childNode"  ; 11
.local  "n"  ; 12
.const  "attributes"  ; 0
.const  0  ; 1
.const  "length"  ; 2
.const  1  ; 3
.const  "item"  ; 4
.const  "nodeName"  ; 5
.const  "nodeValue"  ; 6
.const  "childNodes"  ; 7
.const  "table"  ; 8
.const  "insert"  ; 9
.const  "getn"  ; 10
.const  "ParseNode"  ; 11
[01] gettable   2   1   250  ; "attributes"
[02] test       2   2   0    ; to [4] if true
[03] jmp        13           ; to [17]
[04] loadk      3   1        ; 0
[05] gettable   4   2   252  ; "length"
[06] sub        4   4   253  ; 1
[07] loadk      5   3        ; 1
[08] sub        3   3   5  
[09] jmp        6            ; to [16]
[10] self       6   2   254  ; "item"
[11] move       8   3      
[12] call       6   3   2  
[13] gettable   7   6   255  ; "nodeName"
[14] gettable   8   6   256  ; "nodeValue"
[15] settable   0   7   8  
[16] forloop    3   -7       ; to [10] if loop
[17] gettable   3   1   257  ; "childNodes"
[18] test       3   3   0    ; to [20] if true
[19] jmp        37           ; to [57]
[20] loadk      4   1        ; 0
[21] gettable   5   3   252  ; "length"
[22] sub        5   5   253  ; 1
[23] loadk      6   3        ; 1
[24] sub        4   4   6  
[25] jmp        30           ; to [56]
[26] self       7   3   254  ; "item"
[27] move       9   4      
[28] call       7   3   2  
[29] gettable   8   7   255  ; "nodeName"
[30] gettable   8   0   8  
[31] test       8   8   1    ; to [33] if false
[32] jmp        3            ; to [36]
[33] gettable   8   7   255  ; "nodeName"
[34] newtable   9   0   0    ; array=0, hash=0
[35] settable   0   8   9  
[36] getglobal  8   8        ; table
[37] gettable   8   8   259  ; "insert"
[38] gettable   9   7   255  ; "nodeName"
[39] gettable   9   0   9  
[40] newtable   10  0   0    ; array=0, hash=0
[41] call       8   3   1  
[42] getglobal  8   8        ; table
[43] gettable   8   8   260  ; "getn"
[44] gettable   9   7   255  ; "nodeName"
[45] gettable   9   0   9  
[46] call       8   2   2  
[47] gettable   9   7   255  ; "nodeName"
[48] gettable   9   0   9  
[49] getglobal  10  11       ; ParseNode
[50] gettable   11  7   255  ; "nodeName"
[51] gettable   11  0   11 
[52] gettable   11  11  8  
[53] move       12  7      
[54] call       10  3   2  
[55] settable   9   8   10 
[56] forloop    4   -31      ; to [26] if loop
[57] return     0   2      
[58] return     0   1      
; end of function

[1] closure    0   0        ; 0 upvalues
[2] setglobal  0   0        ; ParseNode
[3] return     0   1      
; end of function


; function [12] definition (level 2)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 0 3
.local  "win32"  ; 0
.local  "NullUnInstaller"  ; 1
.const  "Win32Interop"  ; 0
.const  "UnInstaller"  ; 1

; function [0] definition (level 3)
; 2 upvalues, 6 params, 20 stacks
.function  2 6 0 20
.local  "displayname"  ; 0
.local  "icon"  ; 1
.local  "addremove"  ; 2
.local  "incGame"  ; 3
.local  "customScript"  ; 4
.local  "filename"  ; 5
.local  "members"  ; 6
.local  "rollback"  ; 7
.local  "content"  ; 8
.local  "uninstPath"  ; 9
.local  "CheckUIlessRemove"  ; 10
.local  "UnregisterGame"  ; 11
.local  "Unregister"  ; 12
.local  "DeleteFileElement"  ; 13
.local  "DecGameCount"  ; 14
.local  "ChildScript"  ; 15
.local  "RollBack"  ; 16
.upvalue  "NullUnInstaller"  ; 0
.upvalue  "win32"  ; 1
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "UNINST: "  ; 6
.const  "nil"  ; 7
.const  "  "  ; 8
.const  "ConstTable"  ; 9
.const  "WorkingDir"  ; 10
.const  "\\uninstall\\"  ; 11
.const  "CreatePath"  ; 12
.const  "countNumberOfUninstallScripts"  ; 13
.const  "tryUninstallSupportScripts"  ; 14
.const  "GameReg"  ; 15
.const  "RegKey"  ; 16
.const  "COMReg"  ; 17
.const  "Child"  ; 18
.const  "Shortcut"  ; 19
.const  "FileSystem"  ; 20
.const  "UninstScript"  ; 21
.const  "Write"  ; 22
.const  "ProcessScript"  ; 23
.const  "table"  ; 24
.const  "insert"  ; 25
.const  "g_rollBack"  ; 26

; function [0] definition (level 4)
; 1 upvalues, 0 params, 13 stacks
.function  1 0 0 13
.local  "gameCount"  ; 0
.local  "racUninst"  ; 1
.local  "cliType"  ; 2
.local  "_"  ; 3
.local  "_"  ; 4
.local  "_"  ; 5
.local  "module"  ; 6
.upvalue  "win32"  ; 0
.const  "GetRegKeyValue"  ; 0
.const  "HKEY_CLASSES_ROOT"  ; 1
.const  "g_constants"  ; 2
.const  "basekey"  ; 3
.const  "g_storeFront"  ; 4
.const  "gamecount"  ; 5
.const  "uninst"  ; 6
.const  "RAConfigValue"  ; 7
.const  "ractypekey"  ; 8
.const  "io"  ; 9
.const  "write"  ; 10
.const  "\n"  ; 11
.const  "os"  ; 12
.const  "date"  ; 13
.const  "%c "  ; 14
.const  "unInstaller.CheckUIlessRemove: gameCount = "  ; 15
.const  ""  ; 16
.const  ", racUninst = "  ; 17
.const  ", cliType = "  ; 18
.const  "."  ; 19
.const  nil  ; 20
.const  "true"  ; 21
.const  "clientless"  ; 22
.const  "ProcessInfo"  ; 23
.const  "Run mrClean.clf in CheckUIlessRemove"  ; 24
.const  "ExecuteCommand"  ; 25
.const  "mrClean.clf"  ; 26
.const  "unInstaller. mrClean not run"  ; 27
[01] getupval   0   0        ; win32
[02] gettable   0   0   250  ; "GetRegKeyValue"
[03] loadk      1   1        ; "HKEY_CLASSES_ROOT"
[04] getglobal  2   2        ; g_constants
[05] gettable   2   2   253  ; "basekey"
[06] getglobal  3   4        ; g_storeFront
[07] concat     2   2   3  
[08] getglobal  3   2        ; g_constants
[09] gettable   3   3   255  ; "gamecount"
[10] call       0   4   2  
[11] getupval   1   0        ; win32
[12] gettable   1   1   250  ; "GetRegKeyValue"
[13] loadk      2   1        ; "HKEY_CLASSES_ROOT"
[14] getglobal  3   2        ; g_constants
[15] gettable   3   3   253  ; "basekey"
[16] getglobal  4   4        ; g_storeFront
[17] concat     3   3   4  
[18] getglobal  4   2        ; g_constants
[19] gettable   4   4   256  ; "uninst"
[20] call       1   4   2  
[21] getglobal  2   7        ; RAConfigValue
[22] getglobal  3   2        ; g_constants
[23] gettable   3   3   258  ; "ractypekey"
[24] call       2   2   2  
[25] getglobal  3   9        ; io
[26] gettable   3   3   260  ; "write"
[27] loadk      4   11       ; "\n"
[28] getglobal  5   12       ; os
[29] gettable   5   5   263  ; "date"
[30] loadk      6   14       ; "%c "
[31] call       5   2   2  
[32] loadk      6   15       ; "unInstaller.CheckUIlessRemove: gameCount = "
[33] test       7   0   1    ; to [35] if false
[34] jmp        1            ; to [36]
[35] loadk      7   16       ; ""
[36] loadk      8   17       ; ", racUninst = "
[37] test       9   1   1    ; to [39] if false
[38] jmp        1            ; to [40]
[39] loadk      9   16       ; ""
[40] loadk      10  18       ; ", cliType = "
[41] test       11  2   1    ; to [43] if false
[42] jmp        1            ; to [44]
[43] loadk      11  16       ; ""
[44] loadk      12  19       ; "."
[45] call       3   10  1  
[46] eq         1   0   266  ; "", to [48] if false
[47] jmp        2            ; to [50]
[48] eq         0   0   270  ; nil, to [50] if true
[49] jmp        24           ; to [74]
[50] eq         1   1   271  ; "true", to [52] if false
[51] jmp        4            ; to [56]
[52] getglobal  3   2        ; g_constants
[53] gettable   3   3   272  ; "clientless"
[54] eq         0   2   3    ; to [56] if true
[55] jmp        18           ; to [74]
[56] getupval   3   0        ; win32
[57] gettable   3   3   273  ; "ProcessInfo"
[58] call       3   1   5  
[59] getglobal  7   9        ; io
[60] gettable   7   7   260  ; "write"
[61] loadk      8   11       ; "\n"
[62] getglobal  9   12       ; os
[63] gettable   9   9   263  ; "date"
[64] loadk      10  14       ; "%c "
[65] call       9   2   2  
[66] loadk      10  24       ; "Run mrClean.clf in CheckUIlessRemove"
[67] call       7   4   1  
[68] getglobal  7   25       ; ExecuteCommand
[69] move       8   6      
[70] loadk      9   26       ; "mrClean.clf"
[71] loadk      10  16       ; ""
[72] call       7   4   1  
[73] jmp        9            ; to [83]
[74] getglobal  3   9        ; io
[75] gettable   3   3   260  ; "write"
[76] loadk      4   11       ; "\n"
[77] getglobal  5   12       ; os
[78] gettable   5   5   263  ; "date"
[79] loadk      6   14       ; "%c "
[80] call       5   2   2  
[81] loadk      6   27       ; "unInstaller. mrClean not run"
[82] call       3   4   1  
[83] return     0   1      
; end of function


; function [1] definition (level 4)
; 0 upvalues, 3 params, 9 stacks
.function  0 3 0 9
.local  "id"  ; 0
.local  "type"  ; 1
.local  "lang"  ; 2
.local  "racConfig"  ; 3
.const  "luacom"  ; 0
.const  "CreateObject"  ; 1
.const  "RAComponents.RAConfigureMgr"  ; 2
.const  "Startup"  ; 3
.const  "io"  ; 4
.const  "write"  ; 5
.const  "\n"  ; 6
.const  "os"  ; 7
.const  "date"  ; 8
.const  "%c "  ; 9
.const  "Unregistering Game: "  ; 10
.const  "uninstallGame"  ; 11
.const  "Unregistration complete!"  ; 12
[01] getglobal  3   0        ; luacom
[02] gettable   3   3   251  ; "CreateObject"
[03] loadk      4   2        ; "RAComponents.RAConfigureMgr"
[04] call       3   2   2  
[05] test       3   3   0    ; to [7] if true
[06] jmp        24           ; to [31]
[07] self       4   3   253  ; "Startup"
[08] call       4   2   1  
[09] getglobal  4   4        ; io
[10] gettable   4   4   255  ; "write"
[11] loadk      5   6        ; "\n"
[12] getglobal  6   7        ; os
[13] gettable   6   6   258  ; "date"
[14] loadk      7   9        ; "%c "
[15] call       6   2   2  
[16] loadk      7   10       ; "Unregistering Game: "
[17] move       8   0      
[18] call       4   5   1  
[19] self       4   3   261  ; "uninstallGame"
[20] move       6   0      
[21] call       4   3   1  
[22] getglobal  4   4        ; io
[23] gettable   4   4   255  ; "write"
[24] loadk      5   6        ; "\n"
[25] getglobal  6   7        ; os
[26] gettable   6   6   258  ; "date"
[27] loadk      7   9        ; "%c "
[28] call       6   2   2  
[29] loadk      7   12       ; "Unregistration complete!"
[30] call       4   4   1  
[31] return     0   1      
; end of function


; function [2] definition (level 4)
; 1 upvalues, 1 params, 7 stacks
.function  1 1 0 7
.local  "module"  ; 0
.local  "regPath"  ; 1
.upvalue  "win32"  ; 0
.const  "COMRegPath"  ; 0
.const  "LaunchProcess"  ; 1
.const  " /u /s \""  ; 2
.const  "\""  ; 3
[01] getupval   1   0        ; win32
[02] gettable   1   1   250  ; "COMRegPath"
[03] call       1   1   2  
[04] getupval   2   0        ; win32
[05] gettable   2   2   251  ; "LaunchProcess"
[06] move       3   1      
[07] loadk      4   2        ; " /u /s \""
[08] move       5   0      
[09] loadk      6   3        ; "\""
[10] concat     4   4   6  
[11] loadbool   5   1   0    ; true
[12] call       2   4   1  
[13] return     0   1      
; end of function


; function [3] definition (level 4)
; 0 upvalues, 2 params, 14 stacks
.function  0 2 0 14
.local  "element"  ; 0
.local  "ignoreError"  ; 1
.local  "DeleteFileIgnoreError"  ; 2
.local  "InnerDeleteFile"  ; 3
.local  "DeleteOnReboot"  ; 4
.local  "s"  ; 5
.local  "err"  ; 6
.local  "RebootPendingFlagFile"  ; 7
.const  ".."  ; 0
.const  "..\\"  ; 1
.const  "io"  ; 2
.const  "write"  ; 3
.const  "\n"  ; 4
.const  "os"  ; 5
.const  "date"  ; 6
.const  "%c "  ; 7
.const  "uninstaller.DeleteFile "  ; 8
.const  "pcall"  ; 9
.const  "Failed to remove file: "  ; 10
.const  ". "  ; 11
.const  "Error ignored"  ; 12
.const  "g_constants"  ; 13
.const  "installerLoc"  ; 14
.const  "\\rebootPending"  ; 15
.const  "openW"  ; 16
.const  "w"  ; 17
.const  "created reboot pending flag file "  ; 18
.const  "Failed to mark file DeleteOnReboot. "  ; 19
.const  "Warning: Attempted to remove \"..\" as part of uninstall. Ignored"  ; 20

; function [0] definition (level 5)
; 0 upvalues, 1 params, 4 stacks
.function  0 1 0 4
.local  "filename"  ; 0
.const  "filesys"  ; 0
.const  "DeleteFile"  ; 1
[1] getglobal  1   0        ; filesys
[2] self       1   1   251  ; "DeleteFile"
[3] move       3   0      
[4] call       1   3   1  
[5] return     0   1      
; end of function


; function [1] definition (level 5)
; 1 upvalues, 1 params, 9 stacks
.function  1 1 0 9
.local  "filename"  ; 0
.local  "filesys"  ; 1
.local  "s"  ; 2
.upvalue  "DeleteFileIgnoreError"  ; 0
.const  "luacom"  ; 0
.const  "CreateObject"  ; 1
.const  "Scripting.FileSystemObject"  ; 2
.const  "string"  ; 3
.const  "gsub"  ; 4
.const  "/"  ; 5
.const  "\\"  ; 6
.const  "sub"  ; 7
.const  1  ; 8
.const  -1  ; 9
.const  2  ; 10
.const  -2  ; 11
.const  "FileExists"  ; 12
.const  "io"  ; 13
.const  "write"  ; 14
.const  "\n"  ; 15
.const  "os"  ; 16
.const  "date"  ; 17
.const  "%c "  ; 18
.const  "uninstaller Removing file element: "  ; 19
.const  "DeleteFile"  ; 20
.const  "FolderExists"  ; 21
.const  "uninstaller Removing folder element: "  ; 22
.const  "DeleteFolder"  ; 23
.const  "uninstaller element: "  ; 24
.const  " not found"  ; 25
.const  "pcall"  ; 26
[01] getglobal  1   0        ; luacom
[02] gettable   1   1   251  ; "CreateObject"
[03] loadk      2   2        ; "Scripting.FileSystemObject"
[04] call       1   2   2  
[05] getglobal  2   3        ; string
[06] gettable   2   2   254  ; "gsub"
[07] move       3   0      
[08] loadk      4   5        ; "/"
[09] loadk      5   6        ; "\\"
[10] call       2   4   2  
[11] move       0   2      
[12] getglobal  2   3        ; string
[13] gettable   2   2   257  ; "sub"
[14] move       3   0      
[15] loadk      4   9        ; -1
[16] call       2   3   2  
[17] eq         0   2   256  ; "\\", to [19] if true
[18] jmp        7            ; to [26]
[19] getglobal  3   3        ; string
[20] gettable   3   3   257  ; "sub"
[21] move       4   0      
[22] loadk      5   8        ; 1
[23] loadk      6   11       ; -2
[24] call       3   4   2  
[25] move       0   3      
[26] self       3   1   262  ; "FileExists"
[27] move       5   0      
[28] call       3   3   2  
[29] test       3   3   0    ; to [31] if true
[30] jmp        15           ; to [46]
[31] getglobal  3   13       ; io
[32] gettable   3   3   264  ; "write"
[33] loadk      4   15       ; "\n"
[34] getglobal  5   16       ; os
[35] gettable   5   5   267  ; "date"
[36] loadk      6   18       ; "%c "
[37] call       5   2   2  
[38] loadk      6   19       ; "uninstaller Removing file element: "
[39] move       7   0      
[40] call       3   5   1  
[41] self       3   1   270  ; "DeleteFile"
[42] move       5   0      
[43] loadbool   6   1   0    ; true
[44] call       3   4   1  
[45] jmp        35           ; to [81]
[46] self       3   1   271  ; "FolderExists"
[47] move       5   0      
[48] call       3   3   2  
[49] test       3   3   0    ; to [51] if true
[50] jmp        15           ; to [66]
[51] getglobal  3   13       ; io
[52] gettable   3   3   264  ; "write"
[53] loadk      4   15       ; "\n"
[54] getglobal  5   16       ; os
[55] gettable   5   5   267  ; "date"
[56] loadk      6   18       ; "%c "
[57] call       5   2   2  
[58] loadk      6   22       ; "uninstaller Removing folder element: "
[59] move       7   0      
[60] call       3   5   1  
[61] self       3   1   273  ; "DeleteFolder"
[62] move       5   0      
[63] loadbool   6   1   0    ; true
[64] call       3   4   1  
[65] jmp        15           ; to [81]
[66] getglobal  3   13       ; io
[67] gettable   3   3   264  ; "write"
[68] loadk      4   15       ; "\n"
[69] getglobal  5   16       ; os
[70] gettable   5   5   267  ; "date"
[71] loadk      6   18       ; "%c "
[72] call       5   2   2  
[73] loadk      6   24       ; "uninstaller element: "
[74] move       7   0      
[75] loadk      8   25       ; " not found"
[76] call       3   6   1  
[77] getglobal  3   26       ; pcall
[78] getupval   4   0        ; DeleteFileIgnoreError
[79] move       5   0      
[80] call       3   3   1  
[81] return     0   1      
; end of function


; function [2] definition (level 5)
; 0 upvalues, 1 params, 5 stacks
.function  0 1 0 5
.local  "filename"  ; 0
.local  "shellCtl"  ; 1
.const  "luacom"  ; 0
.const  "CreateObject"  ; 1
.const  "StubbyUtil.ShellCtl"  ; 2
.const  "DeleteOnReboot"  ; 3
[1] getglobal  1   0        ; luacom
[2] gettable   1   1   251  ; "CreateObject"
[3] loadk      2   2        ; "StubbyUtil.ShellCtl"
[4] call       1   2   2  
[5] self       2   1   253  ; "DeleteOnReboot"
[6] move       4   0      
[7] call       2   3   1  
[8] return     0   1      
; end of function

[001] eq         1   0   250  ; "..", to [3] if false
[002] jmp        89           ; to [92]
[003] eq         1   0   251  ; "..\\", to [5] if false
[004] jmp        87           ; to [92]
[005] getglobal  2   2        ; io
[006] gettable   2   2   253  ; "write"
[007] loadk      3   4        ; "\n"
[008] getglobal  4   5        ; os
[009] gettable   4   4   256  ; "date"
[010] loadk      5   7        ; "%c "
[011] call       4   2   2  
[012] loadk      5   8        ; "uninstaller.DeleteFile "
[013] move       6   0      
[014] call       2   5   1  
[015] closure    2   0        ; 0 upvalues
[016] closure    3   1        ; 1 upvalues
[017] move       0   2      
[018] closure    4   2        ; 0 upvalues
[019] getglobal  5   9        ; pcall
[020] move       6   3      
[021] move       7   0      
[022] call       5   3   3  
[023] test       5   5   1    ; to [25] if false
[024] jmp        65           ; to [90]
[025] getglobal  7   2        ; io
[026] gettable   7   7   253  ; "write"
[027] loadk      8   4        ; "\n"
[028] getglobal  9   5        ; os
[029] gettable   9   9   256  ; "date"
[030] loadk      10  7        ; "%c "
[031] call       9   2   2  
[032] loadk      10  10       ; "Failed to remove file: "
[033] move       11  0      
[034] loadk      12  11       ; ". "
[035] move       13  6      
[036] call       7   7   1  
[037] test       1   1   0    ; to [39] if true
[038] jmp        10           ; to [49]
[039] getglobal  7   2        ; io
[040] gettable   7   7   253  ; "write"
[041] loadk      8   4        ; "\n"
[042] getglobal  9   5        ; os
[043] gettable   9   9   256  ; "date"
[044] loadk      10  7        ; "%c "
[045] call       9   2   2  
[046] loadk      10  12       ; "Error ignored"
[047] call       7   4   1  
[048] jmp        41           ; to [90]
[049] getglobal  7   9        ; pcall
[050] move       8   4      
[051] move       9   0      
[052] call       7   3   3  
[053] move       6   8      
[054] move       5   7      
[055] test       5   5   0    ; to [57] if true
[056] jmp        23           ; to [80]
[057] getglobal  7   13       ; g_constants
[058] gettable   7   7   264  ; "installerLoc"
[059] loadk      8   15       ; "\\rebootPending"
[060] concat     7   7   8  
[061] getglobal  8   2        ; io
[062] gettable   8   8   266  ; "openW"
[063] move       9   7      
[064] loadk      10  17       ; "w"
[065] call       8   3   1  
[066] getglobal  8   2        ; io
[067] gettable   8   8   253  ; "write"
[068] loadk      9   4        ; "\n"
[069] getglobal  10  5        ; os
[070] gettable   10  10  256  ; "date"
[071] loadk      11  7        ; "%c "
[072] call       10  2   2  
[073] loadk      11  18       ; "created reboot pending flag file "
[074] move       12  7      
[075] call       8   5   1  
[076] move       8   4      
[077] move       9   7      
[078] call       8   2   1  
[079] jmp        10           ; to [90]
[080] getglobal  7   2        ; io
[081] gettable   7   7   253  ; "write"
[082] loadk      8   4        ; "\n"
[083] getglobal  9   5        ; os
[084] gettable   9   9   256  ; "date"
[085] loadk      10  7        ; "%c "
[086] call       9   2   2  
[087] loadk      10  19       ; "Failed to mark file DeleteOnReboot. "
[088] move       11  6      
[089] call       7   5   1  
[090] close      2  
[091] jmp        9            ; to [101]
[092] getglobal  2   2        ; io
[093] gettable   2   2   253  ; "write"
[094] loadk      3   4        ; "\n"
[095] getglobal  4   5        ; os
[096] gettable   4   4   256  ; "date"
[097] loadk      5   7        ; "%c "
[098] call       4   2   2  
[099] loadk      5   20       ; "Warning: Attempted to remove \"..\" as part of uninstall. Ignored"
[100] call       2   4   1  
[101] return     0   1      
; end of function


; function [4] definition (level 4)
; 1 upvalues, 0 params, 10 stacks
.function  1 0 0 10
.local  "storekey"  ; 0
.local  "gameCount"  ; 1
.local  "nCount"  ; 2
.upvalue  "win32"  ; 0
.const  "g_constants"  ; 0
.const  "basekey"  ; 1
.const  "g_storeFront"  ; 2
.const  "GetRegKeyValue"  ; 3
.const  "HKEY_CLASSES_ROOT"  ; 4
.const  "gamecount"  ; 5
.const  "io"  ; 6
.const  "write"  ; 7
.const  "\n"  ; 8
.const  "os"  ; 9
.const  "date"  ; 10
.const  "%c "  ; 11
.const  "game count from registry = "  ; 12
.const  "tostring"  ; 13
.const  ""  ; 14
.const  "tonumber"  ; 15
.const  1  ; 16
.const  "deleting key "  ; 17
.const  "DeleteRegKey"  ; 18
.const  "decrementing key "  ; 19
.const  " from "  ; 20
.const  "CreateRegKey"  ; 21
[01] getglobal  0   0        ; g_constants
[02] gettable   0   0   251  ; "basekey"
[03] getglobal  1   2        ; g_storeFront
[04] concat     0   0   1  
[05] getupval   1   0        ; win32
[06] gettable   1   1   253  ; "GetRegKeyValue"
[07] loadk      2   4        ; "HKEY_CLASSES_ROOT"
[08] move       3   0      
[09] getglobal  4   0        ; g_constants
[10] gettable   4   4   255  ; "gamecount"
[11] call       1   4   2  
[12] getglobal  2   6        ; io
[13] gettable   2   2   257  ; "write"
[14] loadk      3   8        ; "\n"
[15] getglobal  4   9        ; os
[16] gettable   4   4   260  ; "date"
[17] loadk      5   11       ; "%c "
[18] call       4   2   2  
[19] loadk      5   12       ; "game count from registry = "
[20] getglobal  6   13       ; tostring
[21] move       7   1      
[22] call       6   2   0  
[23] call       2   0   1  
[24] test       1   1   0    ; to [26] if true
[25] jmp        55           ; to [81]
[26] eq         1   1   264  ; "", to [28] if false
[27] jmp        53           ; to [81]
[28] getglobal  2   15       ; tonumber
[29] move       3   1      
[30] call       2   2   2  
[31] getglobal  3   15       ; tonumber
[32] move       4   2      
[33] call       3   2   2  
[34] eq         0   3   266  ; 1, to [36] if true
[35] jmp        20           ; to [56]
[36] getglobal  3   6        ; io
[37] gettable   3   3   257  ; "write"
[38] loadk      4   8        ; "\n"
[39] getglobal  5   9        ; os
[40] gettable   5   5   260  ; "date"
[41] loadk      6   11       ; "%c "
[42] call       5   2   2  
[43] loadk      6   17       ; "deleting key "
[44] getglobal  7   0        ; g_constants
[45] gettable   7   7   255  ; "gamecount"
[46] concat     6   6   7  
[47] call       3   4   1  
[48] getupval   3   0        ; win32
[49] gettable   3   3   268  ; "DeleteRegKey"
[50] loadk      4   4        ; "HKEY_CLASSES_ROOT"
[51] move       5   0      
[52] getglobal  6   0        ; g_constants
[53] gettable   6   6   255  ; "gamecount"
[54] call       3   4   1  
[55] jmp        25           ; to [81]
[56] getglobal  3   6        ; io
[57] gettable   3   3   257  ; "write"
[58] loadk      4   8        ; "\n"
[59] getglobal  5   9        ; os
[60] gettable   5   5   260  ; "date"
[61] loadk      6   11       ; "%c "
[62] call       5   2   2  
[63] loadk      6   19       ; "decrementing key "
[64] getglobal  7   0        ; g_constants
[65] gettable   7   7   255  ; "gamecount"
[66] loadk      8   20       ; " from "
[67] move       9   2      
[68] concat     6   6   9  
[69] call       3   4   1  
[70] getupval   3   0        ; win32
[71] gettable   3   3   271  ; "CreateRegKey"
[72] loadk      4   4        ; "HKEY_CLASSES_ROOT"
[73] move       5   0      
[74] getglobal  6   0        ; g_constants
[75] gettable   6   6   255  ; "gamecount"
[76] getglobal  7   13       ; tostring
[77] move       8   2      
[78] call       7   2   2  
[79] sub        7   7   266  ; 1
[80] call       3   5   1  
[81] return     0   1      
; end of function


; function [5] definition (level 4)
; 1 upvalues, 1 params, 5 stacks
.function  1 1 0 5
.local  "scriptname"  ; 0
.local  "child"  ; 1
.upvalue  "uninstPath"  ; 0
.const  "UnInstaller"  ; 0
.const  "g_constants"  ; 1
.const  "uninstExt"  ; 2
.const  "ProcessScript"  ; 3
[01] getglobal  1   0        ; UnInstaller
[02] getupval   2   0        ; uninstPath
[03] move       3   0      
[04] getglobal  4   1        ; g_constants
[05] gettable   4   4   252  ; "uninstExt"
[06] concat     2   2   4  
[07] call       1   2   2  
[08] gettable   2   1   253  ; "ProcessScript"
[09] loadnil    3   3      
[10] loadbool   4   1   0    ; true
[11] call       2   3   1  
[12] return     0   1      
; end of function


; function [6] definition (level 4)
; 1 upvalues, 0 params, 9 stacks
.function  1 0 0 9
.local  "count"  ; 0
.local  "items"  ; 1
.local  "enum"  ; 2
.upvalue  "win32"  ; 0
.const  0  ; 0
.const  "GetFolderItems"  ; 1
.const  "g_constants"  ; 2
.const  "installerLoc"  ; 3
.const  "\\uninstall"  ; 4
.const  "item"  ; 5
.const  "Next"  ; 6
.const  "string"  ; 7
.const  "find"  ; 8
.const  "Name"  ; 9
.const  "uninstExt"  ; 10
.const  "instsupportrar.rguninst"  ; 11
.const  "io"  ; 12
.const  "write"  ; 13
.const  "\n"  ; 14
.const  "os"  ; 15
.const  "date"  ; 16
.const  "%c "  ; 17
.const  "Found  "  ; 18
.const  1  ; 19
.const  "Ignore "  ; 20
.const  "Found "  ; 21
.const  " uninstallScripts still require the lua framework"  ; 22
[01] loadk      0   0        ; 0
[02] getupval   1   0        ; win32
[03] gettable   1   1   251  ; "GetFolderItems"
[04] getglobal  2   2        ; g_constants
[05] gettable   2   2   253  ; "installerLoc"
[06] loadk      3   4        ; "\\uninstall"
[07] concat     2   2   3  
[08] call       1   2   3  
[09] test       1   1   1    ; to [11] if false
[10] jmp        1            ; to [12]
[11] return     0   1      
[12] self       3   2   256  ; "Next"
[13] call       3   2   2  
[14] setglobal  3   5        ; item
[15] jmp        40           ; to [56]
[16] getglobal  3   7        ; string
[17] gettable   3   3   258  ; "find"
[18] getglobal  4   5        ; item
[19] gettable   4   4   259  ; "Name"
[20] getglobal  5   2        ; g_constants
[21] gettable   5   5   260  ; "uninstExt"
[22] call       3   3   2  
[23] test       3   3   0    ; to [25] if true
[24] jmp        28           ; to [53]
[25] getglobal  3   5        ; item
[26] gettable   3   3   259  ; "Name"
[27] eq         1   3   261  ; "instsupportrar.rguninst", to [29] if false
[28] jmp        13           ; to [42]
[29] getglobal  3   12       ; io
[30] gettable   3   3   263  ; "write"
[31] loadk      4   14       ; "\n"
[32] getglobal  5   15       ; os
[33] gettable   5   5   266  ; "date"
[34] loadk      6   17       ; "%c "
[35] call       5   2   2  
[36] loadk      6   18       ; "Found  "
[37] getglobal  7   5        ; item
[38] gettable   7   7   259  ; "Name"
[39] call       3   5   1  
[40] add        0   0   269  ; 1
[41] jmp        11           ; to [53]
[42] getglobal  3   12       ; io
[43] gettable   3   3   263  ; "write"
[44] loadk      4   14       ; "\n"
[45] getglobal  5   15       ; os
[46] gettable   5   5   266  ; "date"
[47] loadk      6   17       ; "%c "
[48] call       5   2   2  
[49] loadk      6   20       ; "Ignore "
[50] getglobal  7   5        ; item
[51] gettable   7   7   259  ; "Name"
[52] call       3   5   1  
[53] self       3   2   256  ; "Next"
[54] call       3   2   2  
[55] setglobal  3   5        ; item
[56] getglobal  3   5        ; item
[57] test       3   3   1    ; to [59] if false
[58] jmp        -43          ; to [16]
[59] getglobal  3   12       ; io
[60] gettable   3   3   263  ; "write"
[61] loadk      4   14       ; "\n"
[62] getglobal  5   15       ; os
[63] gettable   5   5   266  ; "date"
[64] loadk      6   17       ; "%c "
[65] call       5   2   2  
[66] loadk      6   21       ; "Found "
[67] move       7   0      
[68] loadk      8   22       ; " uninstallScripts still require the lua framework"
[69] call       3   6   1  
[70] return     0   2      
[71] return     0   1      
; end of function


; function [7] definition (level 4)
; 1 upvalues, 0 params, 11 stacks
.function  1 0 0 11
.local  "_"  ; 0
.local  "_"  ; 1
.local  "_"  ; 2
.local  "module"  ; 3
.local  "items"  ; 4
.local  "enum"  ; 5
.local  "unInstaller"  ; 6
.upvalue  "win32"  ; 0
.const  "ProcessInfo"  ; 0
.const  "GetFolderItems"  ; 1
.const  "g_constants"  ; 2
.const  "installerLoc"  ; 3
.const  "\\uninstall"  ; 4
.const  "item"  ; 5
.const  "Next"  ; 6
.const  "string"  ; 7
.const  "find"  ; 8
.const  "Name"  ; 9
.const  "uninstExt"  ; 10
.const  "instsupportrar.rguninst"  ; 11
.const  "io"  ; 12
.const  "write"  ; 13
.const  "\n"  ; 14
.const  "os"  ; 15
.const  "date"  ; 16
.const  "%c "  ; 17
.const  "Run "  ; 18
.const  "UnInstaller"  ; 19
.const  "Support"  ; 20
.const  "ProcessScript"  ; 21
.const  "\\uninstall\\"  ; 22
[01] getupval   0   0        ; win32
[02] gettable   0   0   250  ; "ProcessInfo"
[03] call       0   1   5  
[04] getupval   4   0        ; win32
[05] gettable   4   4   251  ; "GetFolderItems"
[06] getglobal  5   2        ; g_constants
[07] gettable   5   5   253  ; "installerLoc"
[08] loadk      6   4        ; "\\uninstall"
[09] concat     5   5   6  
[10] call       4   2   3  
[11] test       4   4   1    ; to [13] if false
[12] jmp        1            ; to [14]
[13] return     0   1      
[14] self       6   5   256  ; "Next"
[15] call       6   2   2  
[16] setglobal  6   5        ; item
[17] jmp        40           ; to [58]
[18] getglobal  6   7        ; string
[19] gettable   6   6   258  ; "find"
[20] getglobal  7   5        ; item
[21] gettable   7   7   259  ; "Name"
[22] getglobal  8   2        ; g_constants
[23] gettable   8   8   260  ; "uninstExt"
[24] call       6   3   2  
[25] test       6   6   0    ; to [27] if true
[26] jmp        28           ; to [55]
[27] getglobal  6   5        ; item
[28] gettable   6   6   259  ; "Name"
[29] eq         0   6   261  ; "instsupportrar.rguninst", to [31] if true
[30] jmp        24           ; to [55]
[31] getglobal  6   12       ; io
[32] gettable   6   6   263  ; "write"
[33] loadk      7   14       ; "\n"
[34] getglobal  8   15       ; os
[35] gettable   8   8   266  ; "date"
[36] loadk      9   17       ; "%c "
[37] call       8   2   2  
[38] loadk      9   18       ; "Run "
[39] getglobal  10  5        ; item
[40] gettable   10  10  259  ; "Name"
[41] call       6   5   1  
[42] getglobal  6   19       ; UnInstaller
[43] loadk      7   20       ; "Support"
[44] call       6   2   2  
[45] gettable   7   6   271  ; "ProcessScript"
[46] getglobal  8   2        ; g_constants
[47] gettable   8   8   253  ; "installerLoc"
[48] loadk      9   22       ; "\\uninstall\\"
[49] getglobal  10  5        ; item
[50] gettable   10  10  259  ; "Name"
[51] concat     8   8   10 
[52] loadbool   9   1   0    ; true
[53] loadbool   10  1   0    ; true
[54] call       7   4   1  
[55] self       6   5   256  ; "Next"
[56] call       6   2   2  
[57] setglobal  6   5        ; item
[58] getglobal  6   5        ; item
[59] test       6   6   1    ; to [61] if false
[60] jmp        -43          ; to [18]
[61] return     0   1      
; end of function


; function [8] definition (level 4)
; 3 upvalues, 3 params, 12 stacks
.function  3 3 0 12
.local  "id"  ; 0
.local  "type"  ; 1
.local  "lang"  ; 2
.upvalue  "rollback"  ; 0
.upvalue  "UnregisterGame"  ; 1
.upvalue  "content"  ; 2
.const  "table"  ; 0
.const  "insert"  ; 1
.const  "GAMEREG,"  ; 2
.const  ","  ; 3
.const  "\n"  ; 4

; function [0] definition (level 5)
; 4 upvalues, 0 params, 5 stacks
.function  4 0 0 5
.upvalue  "id"  ; 0
.upvalue  "UnregisterGame"  ; 1
.upvalue  "type"  ; 2
.upvalue  "lang"  ; 3
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Unregistering, "  ; 6
[01] getglobal  0   0        ; io
[02] gettable   0   0   251  ; "write"
[03] loadk      1   2        ; "\n"
[04] getglobal  2   3        ; os
[05] gettable   2   2   254  ; "date"
[06] loadk      3   5        ; "%c "
[07] call       2   2   2  
[08] loadk      3   6        ; "Unregistering, "
[09] getupval   4   0        ; id
[10] call       0   5   1  
[11] getupval   0   1        ; UnregisterGame
[12] getupval   1   0        ; id
[13] getupval   2   2        ; type
[14] getupval   3   3        ; lang
[15] call       0   4   1  
[16] return     0   1      
; end of function

[01] test       0   0   0    ; to [3] if true
[02] jmp        4            ; to [7]
[03] test       1   1   0    ; to [5] if true
[04] jmp        2            ; to [7]
[05] test       2   2   1    ; to [7] if false
[06] jmp        1            ; to [8]
[07] return     0   1      
[08] getglobal  3   0        ; table
[09] gettable   3   3   251  ; "insert"
[10] getupval   4   0        ; rollback
[11] closure    5   0        ; 4 upvalues
[12] move       0   0      
[13] getupval   0   1        ; UnregisterGame
[14] move       0   1      
[15] move       0   2      
[16] call       3   3   1  
[17] getglobal  3   0        ; table
[18] gettable   3   3   251  ; "insert"
[19] getupval   4   2        ; content
[20] loadk      5   2        ; "GAMEREG,"
[21] move       6   0      
[22] loadk      7   3        ; ","
[23] move       8   1      
[24] loadk      9   3        ; ","
[25] move       10  2      
[26] loadk      11  4        ; "\n"
[27] concat     5   5   11 
[28] call       3   3   1  
[29] return     0   1      
; end of function


; function [9] definition (level 4)
; 3 upvalues, 5 params, 15 stacks
.function  3 5 0 15
.local  "base"  ; 0
.local  "key"  ; 1
.local  "subkey"  ; 2
.local  "type"  ; 3
.local  "inc"  ; 4
.local  "val"  ; 5
.upvalue  "win32"  ; 0
.upvalue  "rollback"  ; 1
.upvalue  "content"  ; 2
.const  "GetRegKeyValue"  ; 0
.const  "table"  ; 1
.const  "insert"  ; 2
.const  ""  ; 3
.const  "REG,"  ; 4
.const  ","  ; 5
.const  "\n"  ; 6

; function [0] definition (level 5)
; 7 upvalues, 0 params, 9 stacks
.function  7 0 0 9
.upvalue  "val"  ; 0
.upvalue  "win32"  ; 1
.upvalue  "base"  ; 2
.upvalue  "key"  ; 3
.upvalue  "subkey"  ; 4
.upvalue  "inc"  ; 5
.upvalue  "type"  ; 6
.const  "GetRegKeyValue"  ; 0
.const  "io"  ; 1
.const  "write"  ; 2
.const  "\nRestoring, "  ; 3
.const  "\\"  ; 4
.const  " to "  ; 5
.const  "CreateRegKey"  ; 6
[01] getupval   0   1        ; win32
[02] gettable   0   0   250  ; "GetRegKeyValue"
[03] getupval   1   2        ; base
[04] getupval   2   3        ; key
[05] getupval   3   4        ; subkey
[06] call       0   4   2  
[07] setupval   0   0        ; val
[08] getupval   0   0        ; val
[09] getupval   1   5        ; inc
[10] sub        0   0   1  
[11] setupval   0   0        ; val
[12] getglobal  0   1        ; io
[13] gettable   0   0   252  ; "write"
[14] loadk      1   3        ; "\nRestoring, "
[15] getupval   2   2        ; base
[16] loadk      3   4        ; "\\"
[17] getupval   4   3        ; key
[18] loadk      5   4        ; "\\"
[19] getupval   6   4        ; subkey
[20] loadk      7   5        ; " to "
[21] getupval   8   0        ; val
[22] call       0   9   1  
[23] getupval   0   1        ; win32
[24] gettable   0   0   256  ; "CreateRegKey"
[25] getupval   1   2        ; base
[26] getupval   2   3        ; key
[27] getupval   3   4        ; subkey
[28] getupval   4   0        ; val
[29] getupval   5   6        ; type
[30] call       0   6   1  
[31] return     0   1      
; end of function


; function [1] definition (level 5)
; 6 upvalues, 0 params, 11 stacks
.function  6 0 0 11
.upvalue  "base"  ; 0
.upvalue  "key"  ; 1
.upvalue  "subkey"  ; 2
.upvalue  "val"  ; 3
.upvalue  "win32"  ; 4
.upvalue  "type"  ; 5
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Restoring, "  ; 6
.const  "\\"  ; 7
.const  " to "  ; 8
.const  "CreateRegKey"  ; 9
[01] getglobal  0   0        ; io
[02] gettable   0   0   251  ; "write"
[03] loadk      1   2        ; "\n"
[04] getglobal  2   3        ; os
[05] gettable   2   2   254  ; "date"
[06] loadk      3   5        ; "%c "
[07] call       2   2   2  
[08] loadk      3   6        ; "Restoring, "
[09] getupval   4   0        ; base
[10] loadk      5   7        ; "\\"
[11] getupval   6   1        ; key
[12] loadk      7   7        ; "\\"
[13] getupval   8   2        ; subkey
[14] loadk      9   8        ; " to "
[15] getupval   10  3        ; val
[16] call       0   11  1  
[17] getupval   0   4        ; win32
[18] gettable   0   0   259  ; "CreateRegKey"
[19] getupval   1   0        ; base
[20] getupval   2   1        ; key
[21] getupval   3   2        ; subkey
[22] getupval   4   3        ; val
[23] getupval   5   5        ; type
[24] call       0   6   1  
[25] return     0   1      
; end of function


; function [2] definition (level 5)
; 4 upvalues, 0 params, 9 stacks
.function  4 0 0 9
.upvalue  "base"  ; 0
.upvalue  "key"  ; 1
.upvalue  "subkey"  ; 2
.upvalue  "win32"  ; 3
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Removing, "  ; 6
.const  "\\"  ; 7
.const  "DeleteRegKey"  ; 8
[01] getglobal  0   0        ; io
[02] gettable   0   0   251  ; "write"
[03] loadk      1   2        ; "\n"
[04] getglobal  2   3        ; os
[05] gettable   2   2   254  ; "date"
[06] loadk      3   5        ; "%c "
[07] call       2   2   2  
[08] loadk      3   6        ; "Removing, "
[09] getupval   4   0        ; base
[10] loadk      5   7        ; "\\"
[11] getupval   6   1        ; key
[12] loadk      7   7        ; "\\"
[13] getupval   8   2        ; subkey
[14] call       0   9   1  
[15] getupval   0   3        ; win32
[16] gettable   0   0   258  ; "DeleteRegKey"
[17] getupval   1   0        ; base
[18] getupval   2   1        ; key
[19] getupval   3   2        ; subkey
[20] call       0   4   1  
[21] return     0   1      
; end of function

[01] test       0   0   0    ; to [3] if true
[02] jmp        4            ; to [7]
[03] test       1   1   0    ; to [5] if true
[04] jmp        2            ; to [7]
[05] test       2   2   1    ; to [7] if false
[06] jmp        1            ; to [8]
[07] return     0   1      
[08] getupval   5   0        ; win32
[09] gettable   5   5   250  ; "GetRegKeyValue"
[10] move       6   0      
[11] move       7   1      
[12] move       8   2      
[13] call       5   4   2  
[14] test       4   4   0    ; to [16] if true
[15] jmp        13           ; to [29]
[16] getglobal  6   1        ; table
[17] gettable   6   6   252  ; "insert"
[18] getupval   7   1        ; rollback
[19] closure    8   0        ; 7 upvalues
[20] move       0   5      
[21] getupval   0   0        ; win32
[22] move       0   0      
[23] move       0   1      
[24] move       0   2      
[25] move       0   4      
[26] move       0   3      
[27] call       6   3   1  
[28] jmp        25           ; to [54]
[29] test       5   5   0    ; to [31] if true
[30] jmp        14           ; to [45]
[31] eq         1   5   253  ; "", to [33] if false
[32] jmp        12           ; to [45]
[33] getglobal  6   1        ; table
[34] gettable   6   6   252  ; "insert"
[35] getupval   7   1        ; rollback
[36] closure    8   1        ; 6 upvalues
[37] move       0   0      
[38] move       0   1      
[39] move       0   2      
[40] move       0   5      
[41] getupval   0   0        ; win32
[42] move       0   3      
[43] call       6   3   1  
[44] jmp        9            ; to [54]
[45] getglobal  6   1        ; table
[46] gettable   6   6   252  ; "insert"
[47] getupval   7   1        ; rollback
[48] closure    8   2        ; 4 upvalues
[49] move       0   0      
[50] move       0   1      
[51] move       0   2      
[52] getupval   0   0        ; win32
[53] call       6   3   1  
[54] getglobal  6   1        ; table
[55] gettable   6   6   252  ; "insert"
[56] getupval   7   2        ; content
[57] loadk      8   4        ; "REG,"
[58] move       9   0      
[59] loadk      10  5        ; ","
[60] move       11  1      
[61] loadk      12  5        ; ","
[62] move       13  2      
[63] loadk      14  6        ; "\n"
[64] concat     8   8   14 
[65] call       6   3   1  
[66] return     0   1      
; end of function


; function [10] definition (level 4)
; 3 upvalues, 1 params, 6 stacks
.function  3 1 0 6
.local  "module"  ; 0
.upvalue  "rollback"  ; 0
.upvalue  "Unregister"  ; 1
.upvalue  "content"  ; 2
.const  "io"  ; 0
.const  "touch"  ; 1
.const  "table"  ; 2
.const  "insert"  ; 3
.const  "REGSRVR,"  ; 4
.const  "\n"  ; 5

; function [0] definition (level 5)
; 2 upvalues, 0 params, 5 stacks
.function  2 0 0 5
.upvalue  "module"  ; 0
.upvalue  "Unregister"  ; 1
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Unregistering, "  ; 6
[01] getglobal  0   0        ; io
[02] gettable   0   0   251  ; "write"
[03] loadk      1   2        ; "\n"
[04] getglobal  2   3        ; os
[05] gettable   2   2   254  ; "date"
[06] loadk      3   5        ; "%c "
[07] call       2   2   2  
[08] loadk      3   6        ; "Unregistering, "
[09] getupval   4   0        ; module
[10] call       0   5   1  
[11] getupval   0   1        ; Unregister
[12] getupval   1   0        ; module
[13] call       0   2   1  
[14] return     0   1      
; end of function

[01] test       0   0   1    ; to [3] if false
[02] jmp        1            ; to [4]
[03] return     0   1      
[04] getglobal  1   0        ; io
[05] gettable   1   1   251  ; "touch"
[06] move       2   0      
[07] call       1   2   2  
[08] test       1   1   0    ; to [10] if true
[09] jmp        7            ; to [17]
[10] getglobal  1   2        ; table
[11] gettable   1   1   253  ; "insert"
[12] getupval   2   0        ; rollback
[13] closure    3   0        ; 2 upvalues
[14] move       0   0      
[15] getupval   0   1        ; Unregister
[16] call       1   3   1  
[17] getglobal  1   2        ; table
[18] gettable   1   1   253  ; "insert"
[19] getupval   2   2        ; content
[20] loadk      3   4        ; "REGSRVR,"
[21] move       4   0      
[22] loadk      5   5        ; "\n"
[23] concat     3   3   5  
[24] call       1   3   1  
[25] return     0   1      
; end of function


; function [11] definition (level 4)
; 1 upvalues, 1 params, 6 stacks
.function  1 1 0 6
.local  "filename"  ; 0
.upvalue  "content"  ; 0
.const  "table"  ; 0
.const  "insert"  ; 1
.const  "CHILD,"  ; 2
.const  "\n"  ; 3
[01] test       0   0   0    ; to [3] if true
[02] jmp        8            ; to [11]
[03] getglobal  1   0        ; table
[04] gettable   1   1   251  ; "insert"
[05] getupval   2   0        ; content
[06] loadk      3   2        ; "CHILD,"
[07] move       4   0      
[08] loadk      5   3        ; "\n"
[09] concat     3   3   5  
[10] call       1   3   1  
[11] return     0   1      
; end of function


; function [12] definition (level 4)
; 3 upvalues, 1 params, 10 stacks
.function  3 1 0 10
.local  "name"  ; 0
.local  "p"  ; 1
.local  "f"  ; 2
.upvalue  "win32"  ; 0
.upvalue  "rollback"  ; 1
.upvalue  "content"  ; 2
.const  "io"  ; 0
.const  "touch"  ; 1
.const  "StripFilename"  ; 2
.const  "write"  ; 3
.const  "\n"  ; 4
.const  "os"  ; 5
.const  "date"  ; 6
.const  "%c "  ; 7
.const  "Warning, null file name to restore: "  ; 8
.const  "undef"  ; 9
.const  "LocalCopy"  ; 10
.const  "g_env"  ; 11
.const  "tmpDir"  ; 12
.const  "\\"  ; 13
.const  "g_constants"  ; 14
.const  "restoreDir"  ; 15
.const  "table"  ; 16
.const  "insert"  ; 17
.const  "SHORTCUT,"  ; 18

; function [0] definition (level 5)
; 3 upvalues, 0 params, 6 stacks
.function  3 0 0 6
.upvalue  "name"  ; 0
.upvalue  "win32"  ; 1
.upvalue  "f"  ; 2
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Restoring, "  ; 6
.const  "LocalCopy"  ; 7
.const  "g_env"  ; 8
.const  "tmpDir"  ; 9
.const  "\\"  ; 10
.const  "g_constants"  ; 11
.const  "restoreDir"  ; 12
[01] getglobal  0   0        ; io
[02] gettable   0   0   251  ; "write"
[03] loadk      1   2        ; "\n"
[04] getglobal  2   3        ; os
[05] gettable   2   2   254  ; "date"
[06] loadk      3   5        ; "%c "
[07] call       2   2   2  
[08] loadk      3   6        ; "Restoring, "
[09] getupval   4   0        ; name
[10] call       0   5   1  
[11] getupval   0   1        ; win32
[12] gettable   0   0   257  ; "LocalCopy"
[13] getglobal  1   8        ; g_env
[14] gettable   1   1   259  ; "tmpDir"
[15] loadk      2   10       ; "\\"
[16] getglobal  3   11       ; g_constants
[17] gettable   3   3   262  ; "restoreDir"
[18] loadk      4   10       ; "\\"
[19] getupval   5   2        ; f
[20] concat     1   1   5  
[21] getupval   2   0        ; name
[22] call       0   3   1  
[23] return     0   1      
; end of function


; function [1] definition (level 5)
; 2 upvalues, 0 params, 5 stacks
.function  2 0 0 5
.local  "s"  ; 0
.local  "err"  ; 1
.upvalue  "win32"  ; 0
.upvalue  "name"  ; 1
.const  "pcall"  ; 0
.const  "DeleteShortcut"  ; 1
.const  "io"  ; 2
.const  "write"  ; 3
.const  "\n"  ; 4
[01] getglobal  0   0        ; pcall
[02] getupval   1   0        ; win32
[03] gettable   1   1   251  ; "DeleteShortcut"
[04] getupval   2   1        ; name
[05] call       0   3   3  
[06] test       0   0   1    ; to [8] if false
[07] jmp        5            ; to [13]
[08] getglobal  2   2        ; io
[09] gettable   2   2   253  ; "write"
[10] loadk      3   4        ; "\n"
[11] move       4   1      
[12] call       2   3   1  
[13] return     0   1      
; end of function

[01] test       0   0   1    ; to [3] if false
[02] jmp        1            ; to [4]
[03] return     0   1      
[04] getglobal  1   0        ; io
[05] gettable   1   1   251  ; "touch"
[06] move       2   0      
[07] call       1   2   2  
[08] test       1   1   0    ; to [10] if true
[09] jmp        40           ; to [50]
[10] getupval   1   0        ; win32
[11] gettable   1   1   252  ; "StripFilename"
[12] move       2   0      
[13] call       1   2   3  
[14] test       2   2   1    ; to [16] if false
[15] jmp        12           ; to [28]
[16] getglobal  3   0        ; io
[17] gettable   3   3   253  ; "write"
[18] loadk      4   4        ; "\n"
[19] getglobal  5   5        ; os
[20] gettable   5   5   256  ; "date"
[21] loadk      6   7        ; "%c "
[22] call       5   2   2  
[23] loadk      6   8        ; "Warning, null file name to restore: "
[24] test       7   0   1    ; to [26] if false
[25] jmp        1            ; to [27]
[26] loadk      7   9        ; "undef"
[27] call       3   5   1  
[28] getupval   3   0        ; win32
[29] gettable   3   3   260  ; "LocalCopy"
[30] move       4   0      
[31] getglobal  5   11       ; g_env
[32] gettable   5   5   262  ; "tmpDir"
[33] loadk      6   13       ; "\\"
[34] getglobal  7   14       ; g_constants
[35] gettable   7   7   265  ; "restoreDir"
[36] loadk      8   13       ; "\\"
[37] move       9   2      
[38] concat     5   5   9  
[39] call       3   3   1  
[40] getglobal  3   16       ; table
[41] gettable   3   3   267  ; "insert"
[42] getupval   4   1        ; rollback
[43] closure    5   0        ; 3 upvalues
[44] move       0   0      
[45] getupval   0   0        ; win32
[46] move       0   2      
[47] call       3   3   1  
[48] close      1  
[49] jmp        7            ; to [57]
[50] getglobal  1   16       ; table
[51] gettable   1   1   267  ; "insert"
[52] getupval   2   1        ; rollback
[53] closure    3   1        ; 2 upvalues
[54] getupval   0   0        ; win32
[55] move       0   0      
[56] call       1   3   1  
[57] getglobal  1   16       ; table
[58] gettable   1   1   267  ; "insert"
[59] getupval   2   2        ; content
[60] loadk      3   18       ; "SHORTCUT,"
[61] move       4   0      
[62] loadk      5   4        ; "\n"
[63] concat     3   3   5  
[64] call       1   3   1  
[65] return     0   1      
; end of function


; function [13] definition (level 4)
; 4 upvalues, 1 params, 10 stacks
.function  4 1 0 10
.local  "element"  ; 0
.local  "p"  ; 1
.local  "lastElem"  ; 2
.local  "s"  ; 3
.local  "err"  ; 4
.upvalue  "win32"  ; 0
.upvalue  "rollback"  ; 1
.upvalue  "DeleteFileElement"  ; 2
.upvalue  "content"  ; 3
.const  "FolderExists"  ; 0
.const  "FileExists"  ; 1
.const  "StripFilename"  ; 2
.const  "io"  ; 3
.const  "write"  ; 4
.const  "\n"  ; 5
.const  "os"  ; 6
.const  "date"  ; 7
.const  "%c "  ; 8
.const  "Backing up, "  ; 9
.const  "LocalCopy"  ; 10
.const  "g_env"  ; 11
.const  "tmpDir"  ; 12
.const  "\\"  ; 13
.const  "g_constants"  ; 14
.const  "restoreDir"  ; 15
.const  "assert"  ; 16
.const  "table"  ; 17
.const  "insert"  ; 18
.const  "RM,"  ; 19

; function [0] definition (level 5)
; 3 upvalues, 0 params, 6 stacks
.function  3 0 0 6
.local  "regPath"  ; 0
.upvalue  "element"  ; 0
.upvalue  "win32"  ; 1
.upvalue  "lastElem"  ; 2
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Restoring, "  ; 6
.const  "LocalCopy"  ; 7
.const  "g_env"  ; 8
.const  "tmpDir"  ; 9
.const  "\\"  ; 10
.const  "g_constants"  ; 11
.const  "restoreDir"  ; 12
.const  "string"  ; 13
.const  "find"  ; 14
.const  "%.dll"  ; 15
.const  "COMRegPath"  ; 16
.const  "LaunchProcess"  ; 17
.const  " /s \""  ; 18
.const  "\""  ; 19
[01] getglobal  0   0        ; io
[02] gettable   0   0   251  ; "write"
[03] loadk      1   2        ; "\n"
[04] getglobal  2   3        ; os
[05] gettable   2   2   254  ; "date"
[06] loadk      3   5        ; "%c "
[07] call       2   2   2  
[08] loadk      3   6        ; "Restoring, "
[09] getupval   4   0        ; element
[10] call       0   5   1  
[11] getupval   0   1        ; win32
[12] gettable   0   0   257  ; "LocalCopy"
[13] getglobal  1   8        ; g_env
[14] gettable   1   1   259  ; "tmpDir"
[15] loadk      2   10       ; "\\"
[16] getglobal  3   11       ; g_constants
[17] gettable   3   3   262  ; "restoreDir"
[18] loadk      4   10       ; "\\"
[19] getupval   5   2        ; lastElem
[20] concat     1   1   5  
[21] getupval   2   0        ; element
[22] call       0   3   1  
[23] getglobal  0   13       ; string
[24] gettable   0   0   264  ; "find"
[25] getupval   1   2        ; lastElem
[26] loadk      2   15       ; "%.dll"
[27] call       0   3   2  
[28] test       0   0   0    ; to [30] if true
[29] jmp        12           ; to [42]
[30] getupval   0   1        ; win32
[31] gettable   0   0   266  ; "COMRegPath"
[32] call       0   1   2  
[33] getupval   1   1        ; win32
[34] gettable   1   1   267  ; "LaunchProcess"
[35] move       2   0      
[36] loadk      3   18       ; " /s \""
[37] getupval   4   0        ; element
[38] loadk      5   19       ; "\""
[39] concat     3   3   5  
[40] loadbool   4   1   0    ; true
[41] call       1   4   1  
[42] return     0   1      
; end of function


; function [1] definition (level 5)
; 2 upvalues, 0 params, 2 stacks
.function  2 0 0 2
.upvalue  "DeleteFileElement"  ; 0
.upvalue  "element"  ; 1
[1] getupval   0   0        ; DeleteFileElement
[2] getupval   1   1        ; element
[3] call       0   2   1  
[4] return     0   1      
; end of function

[01] test       0   0   1    ; to [3] if false
[02] jmp        1            ; to [4]
[03] return     0   1      
[04] getupval   1   0        ; win32
[05] gettable   1   1   250  ; "FolderExists"
[06] move       2   0      
[07] call       1   2   2  
[08] test       1   1   1    ; to [10] if false
[09] jmp        6            ; to [16]
[10] getupval   1   0        ; win32
[11] gettable   1   1   251  ; "FileExists"
[12] move       2   0      
[13] call       1   2   2  
[14] test       1   1   0    ; to [16] if true
[15] jmp        43           ; to [59]
[16] getupval   1   0        ; win32
[17] gettable   1   1   252  ; "StripFilename"
[18] move       2   0      
[19] call       1   2   3  
[20] test       2   2   1    ; to [22] if false
[21] jmp        1            ; to [23]
[22] move       2   0      
[23] getglobal  3   3        ; io
[24] gettable   3   3   254  ; "write"
[25] loadk      4   5        ; "\n"
[26] getglobal  5   6        ; os
[27] gettable   5   5   257  ; "date"
[28] loadk      6   8        ; "%c "
[29] call       5   2   2  
[30] loadk      6   9        ; "Backing up, "
[31] move       7   0      
[32] call       3   5   1  
[33] getupval   3   0        ; win32
[34] gettable   3   3   260  ; "LocalCopy"
[35] move       4   0      
[36] getglobal  5   11       ; g_env
[37] gettable   5   5   262  ; "tmpDir"
[38] loadk      6   13       ; "\\"
[39] getglobal  7   14       ; g_constants
[40] gettable   7   7   265  ; "restoreDir"
[41] loadk      8   13       ; "\\"
[42] move       9   2      
[43] concat     5   5   9  
[44] call       3   3   3  
[45] getglobal  5   16       ; assert
[46] move       6   3      
[47] move       7   4      
[48] call       5   3   1  
[49] getglobal  5   17       ; table
[50] gettable   5   5   268  ; "insert"
[51] getupval   6   1        ; rollback
[52] closure    7   0        ; 3 upvalues
[53] move       0   0      
[54] getupval   0   0        ; win32
[55] move       0   2      
[56] call       5   3   1  
[57] close      1  
[58] jmp        7            ; to [66]
[59] getglobal  1   17       ; table
[60] gettable   1   1   268  ; "insert"
[61] getupval   2   1        ; rollback
[62] closure    3   1        ; 2 upvalues
[63] getupval   0   2        ; DeleteFileElement
[64] move       0   0      
[65] call       1   3   1  
[66] getglobal  1   17       ; table
[67] gettable   1   1   268  ; "insert"
[68] getupval   2   3        ; content
[69] loadk      3   19       ; "RM,"
[70] move       4   0      
[71] loadk      5   5        ; "\n"
[72] concat     3   3   5  
[73] call       1   3   1  
[74] return     0   1      
; end of function


; function [14] definition (level 4)
; 1 upvalues, 1 params, 6 stacks
.function  1 1 0 6
.local  "element"  ; 0
.upvalue  "content"  ; 0
.const  "table"  ; 0
.const  "insert"  ; 1
.const  "UNINSTSCR,"  ; 2
.const  "\n"  ; 3
[01] test       0   0   0    ; to [3] if true
[02] jmp        8            ; to [11]
[03] getglobal  1   0        ; table
[04] gettable   1   1   251  ; "insert"
[05] getupval   2   0        ; content
[06] loadk      3   2        ; "UNINSTSCR,"
[07] move       4   0      
[08] loadk      5   3        ; "\n"
[09] concat     3   3   5  
[10] call       1   3   1  
[11] return     0   1      
; end of function


; function [15] definition (level 4)
; 10 upvalues, 0 params, 23 stacks
.function  10 0 0 23
.local  "_"  ; 0
.local  "_"  ; 1
.local  "_"  ; 2
.local  "proc"  ; 3
.local  "uninstScript"  ; 4
.local  "sPath"  ; 5
.local  "regPath"  ; 6
.local  "exists"  ; 7
.local  "script"  ; 8
.local  "err"  ; 9
.local  "lcontent"  ; 10
.local  "(for generator)"  ; 11
.local  "(for state)"  ; 12
.local  "entry"  ; 13
.local  "gameCount"  ; 14
.upvalue  "win32"  ; 0
.upvalue  "uninstPath"  ; 1
.upvalue  "filename"  ; 2
.upvalue  "members"  ; 3
.upvalue  "addremove"  ; 4
.upvalue  "displayname"  ; 5
.upvalue  "icon"  ; 6
.upvalue  "customScript"  ; 7
.upvalue  "content"  ; 8
.upvalue  "incGame"  ; 9
.const  "ProcessInfo"  ; 0
.const  "WorkingDir"  ; 1
.const  "\\installerMain.clf"  ; 2
.const  "g_constants"  ; 3
.const  "uninstExt"  ; 4
.const  "uninstReg"  ; 5
.const  "io"  ; 6
.const  "openW"  ; 7
.const  "r"  ; 8
.const  "w"  ; 9
.const  "assert"  ; 10
.const  "UninstScript"  ; 11
.const  "true"  ; 12
.const  "CreateRegKey"  ; 13
.const  "HKEY_LOCAL_MACHINE"  ; 14
.const  "DisplayName"  ; 15
.const  "RegKey"  ; 16
.const  "UninstallString"  ; 17
.const  "\""  ; 18
.const  "\" "  ; 19
.const  "\" \"AddRemove\""  ; 20
.const  "DisplayIcon"  ; 21
.const  ""  ; 22
.const  "table"  ; 23
.const  "insert"  ; 24
.const  "CUSTOM,"  ; 25
.const  "\n"  ; 26
.const  "reverse"  ; 27
.const  "write"  ; 28
.const  "os"  ; 29
.const  "date"  ; 30
.const  "%c "  ; 31
.const  "Writing uninstall script for "  ; 32
.const  "DECGAME,"  ; 33
.const  "g_storeFront"  ; 34
.const  "GetRegKeyValue"  ; 35
.const  "HKEY_CLASSES_ROOT"  ; 36
.const  "basekey"  ; 37
.const  "gamecount"  ; 38
.const  "0"  ; 39
.const  "tostring"  ; 40
.const  "tonumber"  ; 41
.const  1  ; 42
.const  "close"  ; 43
[001] getupval   0   0        ; win32
[002] gettable   0   0   250  ; "ProcessInfo"
[003] call       0   1   5  
[004] getupval   4   0        ; win32
[005] gettable   4   4   251  ; "WorkingDir"
[006] call       4   1   2  
[007] loadk      5   2        ; "\\installerMain.clf"
[008] concat     4   4   5  
[009] getupval   5   1        ; uninstPath
[010] getupval   6   2        ; filename
[011] getglobal  7   3        ; g_constants
[012] gettable   7   7   254  ; "uninstExt"
[013] concat     5   5   7  
[014] getglobal  6   3        ; g_constants
[015] gettable   6   6   255  ; "uninstReg"
[016] getupval   7   2        ; filename
[017] concat     6   6   7  
[018] getglobal  7   6        ; io
[019] gettable   7   7   257  ; "openW"
[020] move       8   5      
[021] loadk      9   8        ; "r"
[022] call       7   3   2  
[023] getglobal  8   6        ; io
[024] gettable   8   8   257  ; "openW"
[025] move       9   5      
[026] loadk      10  9        ; "w"
[027] call       8   3   3  
[028] getglobal  10  10       ; assert
[029] move       11  8      
[030] move       12  9      
[031] call       10  3   1  
[032] getupval   10  3        ; members
[033] gettable   10  10  261  ; "UninstScript"
[034] move       11  5      
[035] call       10  2   1  
[036] getupval   10  4        ; addremove
[037] eq         0   10  262  ; "true", to [39] if true
[038] jmp        54           ; to [93]
[039] getupval   10  0        ; win32
[040] gettable   10  10  263  ; "CreateRegKey"
[041] loadk      11  14       ; "HKEY_LOCAL_MACHINE"
[042] move       12  6      
[043] loadk      13  15       ; "DisplayName"
[044] getupval   14  5        ; displayname
[045] call       10  5   1  
[046] getupval   10  3        ; members
[047] gettable   10  10  266  ; "RegKey"
[048] loadk      11  14       ; "HKEY_LOCAL_MACHINE"
[049] move       12  6      
[050] loadk      13  15       ; "DisplayName"
[051] loadnil    14  14     
[052] call       10  5   1  
[053] getupval   10  0        ; win32
[054] gettable   10  10  263  ; "CreateRegKey"
[055] loadk      11  14       ; "HKEY_LOCAL_MACHINE"
[056] move       12  6      
[057] loadk      13  17       ; "UninstallString"
[058] loadk      14  18       ; "\""
[059] move       15  3      
[060] loadk      16  19       ; "\" "
[061] loadk      17  18       ; "\""
[062] move       18  4      
[063] loadk      19  19       ; "\" "
[064] loadk      20  18       ; "\""
[065] move       21  5      
[066] loadk      22  20       ; "\" \"AddRemove\""
[067] concat     14  14  22 
[068] call       10  5   1  
[069] getupval   10  3        ; members
[070] gettable   10  10  266  ; "RegKey"
[071] loadk      11  14       ; "HKEY_LOCAL_MACHINE"
[072] move       12  6      
[073] loadk      13  17       ; "UninstallString"
[074] loadnil    14  14     
[075] call       10  5   1  
[076] getupval   10  0        ; win32
[077] gettable   10  10  263  ; "CreateRegKey"
[078] loadk      11  14       ; "HKEY_LOCAL_MACHINE"
[079] move       12  6      
[080] loadk      13  21       ; "DisplayIcon"
[081] getupval   14  6        ; icon
[082] test       14  14  1    ; to [84] if false
[083] jmp        1            ; to [85]
[084] loadk      14  22       ; ""
[085] call       10  5   1  
[086] getupval   10  3        ; members
[087] gettable   10  10  266  ; "RegKey"
[088] loadk      11  14       ; "HKEY_LOCAL_MACHINE"
[089] move       12  6      
[090] loadk      13  21       ; "DisplayIcon"
[091] loadnil    14  14     
[092] call       10  5   1  
[093] getupval   10  7        ; customScript
[094] test       10  10  0    ; to [96] if true
[095] jmp        8            ; to [104]
[096] getglobal  10  23       ; table
[097] gettable   10  10  274  ; "insert"
[098] getupval   11  8        ; content
[099] loadk      12  25       ; "CUSTOM,"
[100] getupval   13  7        ; customScript
[101] loadk      14  26       ; "\n"
[102] concat     12  12  14 
[103] call       10  3   1  
[104] getglobal  10  23       ; table
[105] gettable   10  10  277  ; "reverse"
[106] getupval   11  8        ; content
[107] call       10  2   2  
[108] getglobal  11  6        ; io
[109] gettable   11  11  278  ; "write"
[110] loadk      12  26       ; "\n"
[111] getglobal  13  29       ; os
[112] gettable   13  13  280  ; "date"
[113] loadk      14  31       ; "%c "
[114] call       13  2   2  
[115] loadk      14  32       ; "Writing uninstall script for "
[116] getupval   15  5        ; displayname
[117] call       11  5   1  
[118] move       11  10     
[119] loadnil    12  13     
[120] tforprep   11  3        ; to [124]
[121] self       14  8   278  ; "write"
[122] gettable   16  10  13 
[123] call       14  3   1  
[124] tforloop   11      0    ; to [126] if exit
[125] jmp        -5           ; to [121]
[126] getupval   11  9        ; incGame
[127] eq         0   11  262  ; "true", to [129] if true
[128] jmp        39           ; to [168]
[129] self       11  8   278  ; "write"
[130] loadk      13  33       ; "DECGAME,"
[131] getglobal  14  34       ; g_storeFront
[132] loadk      15  26       ; "\n"
[133] concat     13  13  15 
[134] call       11  3   1  
[135] test       7   7   1    ; to [137] if false
[136] jmp        31           ; to [168]
[137] getupval   11  0        ; win32
[138] gettable   11  11  285  ; "GetRegKeyValue"
[139] loadk      12  36       ; "HKEY_CLASSES_ROOT"
[140] getglobal  13  3        ; g_constants
[141] gettable   13  13  287  ; "basekey"
[142] getglobal  14  34       ; g_storeFront
[143] concat     13  13  14 
[144] getglobal  14  3        ; g_constants
[145] gettable   14  14  288  ; "gamecount"
[146] call       11  4   2  
[147] test       11  11  0    ; to [149] if true
[148] jmp        2            ; to [151]
[149] eq         0   11  272  ; "", to [151] if true
[150] jmp        1            ; to [152]
[151] loadk      11  39       ; "0"
[152] getupval   12  0        ; win32
[153] gettable   12  12  263  ; "CreateRegKey"
[154] loadk      13  36       ; "HKEY_CLASSES_ROOT"
[155] getglobal  14  3        ; g_constants
[156] gettable   14  14  287  ; "basekey"
[157] getglobal  15  34       ; g_storeFront
[158] concat     14  14  15 
[159] getglobal  15  3        ; g_constants
[160] gettable   15  15  288  ; "gamecount"
[161] getglobal  16  40       ; tostring
[162] getglobal  17  41       ; tonumber
[163] move       18  11     
[164] call       17  2   2  
[165] add        17  17  292  ; 1
[166] call       16  2   0  
[167] call       12  0   1  
[168] self       11  8   293  ; "close"
[169] call       11  2   1  
[170] return     5   2      
[171] return     0   1      
; end of function


; function [16] definition (level 4)
; 8 upvalues, 4 params, 24 stacks
.function  8 4 0 24
.local  "uninstFile"  ; 0
.local  "nocheckUIless"  ; 1
.local  "ignoreError"  ; 2
.local  "leaveInstaller"  ; 3
.local  "strStoreFront"  ; 4
.local  "ExtractStoreFront"  ; 5
.local  "script"  ; 6
.local  "_"  ; 7
.local  "_"  ; 8
.local  "name"  ; 9
.local  "regPath"  ; 10
.local  "uninstscr"  ; 11
.local  "(for generator)"  ; 12
.local  "(for state)"  ; 13
.local  "line"  ; 14
.local  "cmd"  ; 15
.local  "s"  ; 16
.local  "err"  ; 17
.local  "(for generator)"  ; 18
.local  "(for state)"  ; 19
.local  "tok"  ; 20
.local  "invoker"  ; 21
.local  "count"  ; 22
.local  "_"  ; 23
.local  "_"  ; 24
.local  "_"  ; 25
.local  "module"  ; 26
.local  "s"  ; 27
.local  "err"  ; 28
.upvalue  "displayname"  ; 0
.upvalue  "win32"  ; 1
.upvalue  "ChildScript"  ; 2
.upvalue  "Unregister"  ; 3
.upvalue  "UnregisterGame"  ; 4
.upvalue  "DeleteFileElement"  ; 5
.upvalue  "DecGameCount"  ; 6
.upvalue  "CheckUIlessRemove"  ; 7
.const  "io"  ; 0
.const  "open"  ; 1
.const  "r"  ; 2
.const  "openW"  ; 3
.const  "string"  ; 4
.const  "find"  ; 5
.const  "([^\\]+)%.rguninst"  ; 6
.const  "g_constants"  ; 7
.const  "uninstReg"  ; 8
.const  "pcall"  ; 9
.const  "DeleteRegKey"  ; 10
.const  "HKEY_LOCAL_MACHINE"  ; 11
.const  "assert"  ; 12
.const  "uninstall_open_file"  ; 13
.const  "lines"  ; 14
.const  "write"  ; 15
.const  "\n"  ; 16
.const  "sub"  ; 17
.const  1  ; 18
.const  3  ; 19
.const  "RM,"  ; 20
.const  "table"  ; 21
.const  "insert"  ; 22
.const  "RM"  ; 23
.const  4  ; 24
.const  9  ; 25
.const  "SHORTCUT,"  ; 26
.const  "SHORTCUT"  ; 27
.const  10  ; 28
.const  "gfind"  ; 29
.const  "[^,]+"  ; 30
.const  ", "  ; 31
.const  "CHILD"  ; 32
.const  "g_invoker"  ; 33
.const  "Parent"  ; 34
.const  2  ; 35
.const  "customExit"  ; 36
.const  " in "  ; 37
.const  "REG"  ; 38
.const  ""  ; 39
.const  "HKEY_CLASSES_ROOT"  ; 40
.const  nil  ; 41
.const  "REGSRVR"  ; 42
.const  "DeleteShortcut"  ; 43
.const  "GAMEREG"  ; 44
.const  "DECGAME"  ; 45
.const  "GameHouse"  ; 46
.const  "UNINSTSCR"  ; 47
.const  "CUSTOM"  ; 48
.const  "dofile"  ; 49
.const  "os"  ; 50
.const  "date"  ; 51
.const  "%c "  ; 52
.const  "Invalid uninstaller command: "  ; 53
.const  "close"  ; 54
.const  "DeleteFile"  ; 55
.const  "countNumberOfUninstallScripts"  ; 56
.const  0  ; 57
.const  "ProcessInfo"  ; 58
.const  "Run mrClean.clf from "  ; 59
.const  "ExecuteCommand"  ; 60
.const  "mrClean.clf"  ; 61
.const  "\nExecuteCommand error: "  ; 62

; function [0] definition (level 5)
; 1 upvalues, 1 params, 7 stacks
.function  1 1 0 7
.local  "f_strPathRegistry"  ; 0
.local  "ichSlash1"  ; 1
.local  "ichSlash2"  ; 2
.upvalue  "strStoreFront"  ; 0
.const  "string"  ; 0
.const  "find"  ; 1
.const  "\\"  ; 2
.const  1  ; 3
.const  "sub"  ; 4
[01] getglobal  1   0        ; string
[02] gettable   1   1   251  ; "find"
[03] move       2   0      
[04] loadk      3   2        ; "\\"
[05] call       1   3   2  
[06] loadnil    2   2      
[07] test       1   1   0    ; to [9] if true
[08] jmp        17           ; to [26]
[09] add        1   1   253  ; 1
[10] getglobal  3   0        ; string
[11] gettable   3   3   251  ; "find"
[12] move       4   0      
[13] loadk      5   2        ; "\\"
[14] move       6   1      
[15] call       3   4   2  
[16] move       2   3      
[17] test       2   2   0    ; to [19] if true
[18] jmp        7            ; to [26]
[19] getglobal  3   0        ; string
[20] gettable   3   3   254  ; "sub"
[21] move       4   0      
[22] move       5   1      
[23] sub        6   2   253  ; 1
[24] call       3   4   2  
[25] setupval   3   0        ; strStoreFront
[26] return     0   1      
; end of function

[001] loadnil    4   4      
[002] closure    5   0        ; 1 upvalues
[003] move       0   4      
[004] test       0   0   1    ; to [6] if false
[005] jmp        1            ; to [7]
[006] getupval   0   0        ; displayname
[007] getglobal  6   0        ; io
[008] gettable   6   6   251  ; "open"
[009] move       7   0      
[010] loadk      8   2        ; "r"
[011] call       6   3   2  
[012] test       6   6   1    ; to [14] if false
[013] jmp        6            ; to [20]
[014] getglobal  7   0        ; io
[015] gettable   7   7   253  ; "openW"
[016] move       8   0      
[017] loadk      9   2        ; "r"
[018] call       7   3   2  
[019] move       6   7      
[020] getglobal  7   4        ; string
[021] gettable   7   7   255  ; "find"
[022] move       8   0      
[023] loadk      9   6        ; "([^\\]+)%.rguninst"
[024] call       7   3   4  
[025] getglobal  10  7        ; g_constants
[026] gettable   10  10  258  ; "uninstReg"
[027] move       11  9      
[028] concat     10  10  11 
[029] test       6   6   1    ; to [31] if false
[030] jmp        6            ; to [37]
[031] getglobal  11  9        ; pcall
[032] getupval   12  1        ; win32
[033] gettable   12  12  260  ; "DeleteRegKey"
[034] loadk      13  11       ; "HKEY_LOCAL_MACHINE"
[035] move       14  10     
[036] call       11  4   1  
[037] getglobal  11  12       ; assert
[038] move       12  6      
[039] loadk      13  13       ; "uninstall_open_file"
[040] call       11  3   1  
[041] loadnil    11  11     
[042] self       12  6   264  ; "lines"
[043] call       12  2   4  
[044] tforprep   12  250      ; to [295]
[045] newtable   15  0   0    ; array=0, hash=0
[046] loadbool   16  1   0    ; true
[047] loadnil    17  17     
[048] getglobal  18  0        ; io
[049] gettable   18  18  265  ; "write"
[050] loadk      19  16       ; "\n"
[051] call       18  2   1  
[052] getglobal  18  4        ; string
[053] gettable   18  18  267  ; "sub"
[054] move       19  14     
[055] loadk      20  18       ; 1
[056] loadk      21  19       ; 3
[057] call       18  4   2  
[058] eq         0   18  270  ; "RM,", to [60] if true
[059] jmp        15           ; to [75]
[060] getglobal  18  21       ; table
[061] gettable   18  18  272  ; "insert"
[062] move       19  15     
[063] loadk      20  23       ; "RM"
[064] call       18  3   1  
[065] getglobal  18  21       ; table
[066] gettable   18  18  272  ; "insert"
[067] move       19  15     
[068] getglobal  20  4        ; string
[069] gettable   20  20  267  ; "sub"
[070] move       21  14     
[071] loadk      22  24       ; 4
[072] call       20  3   0  
[073] call       18  0   1  
[074] jmp        41           ; to [116]
[075] getglobal  18  4        ; string
[076] gettable   18  18  267  ; "sub"
[077] move       19  14     
[078] loadk      20  18       ; 1
[079] loadk      21  25       ; 9
[080] call       18  4   2  
[081] eq         0   18  276  ; "SHORTCUT,", to [83] if true
[082] jmp        15           ; to [98]
[083] getglobal  18  21       ; table
[084] gettable   18  18  272  ; "insert"
[085] move       19  15     
[086] loadk      20  27       ; "SHORTCUT"
[087] call       18  3   1  
[088] getglobal  18  21       ; table
[089] gettable   18  18  272  ; "insert"
[090] move       19  15     
[091] getglobal  20  4        ; string
[092] gettable   20  20  267  ; "sub"
[093] move       21  14     
[094] loadk      22  28       ; 10
[095] call       20  3   0  
[096] call       18  0   1  
[097] jmp        18           ; to [116]
[098] getglobal  18  4        ; string
[099] gettable   18  18  279  ; "gfind"
[100] move       19  14     
[101] loadk      20  30       ; "[^,]+"
[102] call       18  3   4  
[103] tforprep   18  10       ; to [114]
[104] getglobal  21  0        ; io
[105] gettable   21  21  265  ; "write"
[106] move       22  20     
[107] loadk      23  31       ; ", "
[108] call       21  3   1  
[109] getglobal  21  21       ; table
[110] gettable   21  21  272  ; "insert"
[111] move       22  15     
[112] move       23  20     
[113] call       21  3   1  
[114] tforloop   18      0    ; to [116] if exit
[115] jmp        -12          ; to [104]
[116] gettable   18  15  268  ; 1
[117] eq         0   18  282  ; "CHILD", to [119] if true
[118] jmp        35           ; to [154]
[119] getglobal  18  33       ; g_invoker
[120] loadk      19  34       ; "Parent"
[121] setglobal  19  33       ; g_invoker
[122] getglobal  19  9        ; pcall
[123] getupval   20  2        ; ChildScript
[124] gettable   21  15  285  ; 2
[125] call       19  3   3  
[126] move       17  20     
[127] move       16  19     
[128] setglobal  18  33       ; g_invoker
[129] test       16  16  1    ; to [131] if false
[130] jmp        12           ; to [143]
[131] getglobal  19  4        ; string
[132] gettable   19  19  255  ; "find"
[133] move       20  17     
[134] loadk      21  36       ; "customExit"
[135] call       19  3   2  
[136] test       19  19  0    ; to [138] if true
[137] jmp        5            ; to [143]
[138] getglobal  19  12       ; assert
[139] loadbool   20  0   0    ; false
[140] loadk      21  36       ; "customExit"
[141] call       19  3   1  
[142] jmp        145          ; to [288]
[143] test       16  16  1    ; to [145] if false
[144] jmp        143          ; to [288]
[145] getglobal  19  0        ; io
[146] gettable   19  19  265  ; "write"
[147] loadk      20  16       ; "\n"
[148] move       21  17     
[149] loadk      22  37       ; " in "
[150] gettable   23  15  285  ; 2
[151] concat     20  20  23 
[152] call       19  2   1  
[153] jmp        134          ; to [288]
[154] gettable   18  15  268  ; 1
[155] eq         0   18  288  ; "REG", to [157] if true
[156] jmp        21           ; to [178]
[157] getglobal  18  9        ; pcall
[158] getupval   19  1        ; win32
[159] gettable   19  19  260  ; "DeleteRegKey"
[160] gettable   20  15  285  ; 2
[161] gettable   21  15  269  ; 3
[162] gettable   22  15  274  ; 4
[163] test       22  22  1    ; to [165] if false
[164] jmp        1            ; to [166]
[165] loadk      22  39       ; ""
[166] call       18  5   3  
[167] move       17  19     
[168] move       16  18     
[169] gettable   18  15  285  ; 2
[170] eq         0   18  290  ; "HKEY_CLASSES_ROOT", to [172] if true
[171] jmp        116          ; to [288]
[172] eq         0   4   291  ; nil, to [174] if true
[173] jmp        114          ; to [288]
[174] move       18  5      
[175] gettable   19  15  269  ; 3
[176] call       18  2   1  
[177] jmp        110          ; to [288]
[178] gettable   18  15  268  ; 1
[179] eq         0   18  292  ; "REGSRVR", to [181] if true
[180] jmp        7            ; to [188]
[181] getglobal  18  9        ; pcall
[182] getupval   19  3        ; Unregister
[183] gettable   20  15  285  ; 2
[184] call       18  3   3  
[185] move       17  19     
[186] move       16  18     
[187] jmp        100          ; to [288]
[188] gettable   18  15  268  ; 1
[189] eq         0   18  277  ; "SHORTCUT", to [191] if true
[190] jmp        8            ; to [199]
[191] getglobal  18  9        ; pcall
[192] getupval   19  1        ; win32
[193] gettable   19  19  293  ; "DeleteShortcut"
[194] gettable   20  15  285  ; 2
[195] call       18  3   3  
[196] move       17  19     
[197] move       16  18     
[198] jmp        89           ; to [288]
[199] gettable   18  15  268  ; 1
[200] eq         0   18  294  ; "GAMEREG", to [202] if true
[201] jmp        9            ; to [211]
[202] getglobal  18  9        ; pcall
[203] getupval   19  4        ; UnregisterGame
[204] gettable   20  15  285  ; 2
[205] gettable   21  15  269  ; 3
[206] gettable   22  15  274  ; 4
[207] call       18  5   3  
[208] move       17  19     
[209] move       16  18     
[210] jmp        77           ; to [288]
[211] gettable   18  15  268  ; 1
[212] eq         0   18  273  ; "RM", to [214] if true
[213] jmp        8            ; to [222]
[214] getglobal  18  9        ; pcall
[215] getupval   19  5        ; DeleteFileElement
[216] gettable   20  15  285  ; 2
[217] move       21  2      
[218] call       18  4   3  
[219] move       17  19     
[220] move       16  18     
[221] jmp        66           ; to [288]
[222] gettable   18  15  268  ; 1
[223] eq         0   18  295  ; "DECGAME", to [225] if true
[224] jmp        14           ; to [239]
[225] getglobal  18  9        ; pcall
[226] getupval   19  6        ; DecGameCount
[227] call       18  2   3  
[228] move       17  19     
[229] move       16  18     
[230] eq         0   4   296  ; "GameHouse", to [232] if true
[231] jmp        56           ; to [288]
[232] getglobal  18  9        ; pcall
[233] getupval   19  4        ; UnregisterGame
[234] move       20  9      
[235] call       18  3   3  
[236] move       17  19     
[237] move       16  18     
[238] jmp        49           ; to [288]
[239] gettable   18  15  268  ; 1
[240] eq         0   18  297  ; "UNINSTSCR", to [242] if true
[241] jmp        2            ; to [244]
[242] gettable   11  15  285  ; 2
[243] jmp        44           ; to [288]
[244] gettable   18  15  268  ; 1
[245] eq         0   18  298  ; "CUSTOM", to [247] if true
[246] jmp        31           ; to [278]
[247] getglobal  18  9        ; pcall
[248] getglobal  19  49       ; dofile
[249] gettable   20  15  285  ; 2
[250] call       18  3   3  
[251] move       17  19     
[252] move       16  18     
[253] test       16  16  1    ; to [255] if false
[254] jmp        12           ; to [267]
[255] getglobal  18  4        ; string
[256] gettable   18  18  255  ; "find"
[257] move       19  17     
[258] loadk      20  36       ; "customExit"
[259] call       18  3   2  
[260] test       18  18  0    ; to [262] if true
[261] jmp        5            ; to [267]
[262] getglobal  18  12       ; assert
[263] loadbool   19  0   0    ; false
[264] loadk      20  36       ; "customExit"
[265] call       18  3   1  
[266] jmp        21           ; to [288]
[267] test       16  16  1    ; to [269] if false
[268] jmp        19           ; to [288]
[269] getglobal  18  0        ; io
[270] gettable   18  18  265  ; "write"
[271] loadk      19  16       ; "\n"
[272] move       20  17     
[273] loadk      21  37       ; " in "
[274] gettable   22  15  285  ; 2
[275] concat     19  19  22 
[276] call       18  2   1  
[277] jmp        10           ; to [288]
[278] getglobal  18  0        ; io
[279] gettable   18  18  265  ; "write"
[280] loadk      19  16       ; "\n"
[281] getglobal  20  50       ; os
[282] gettable   20  20  301  ; "date"
[283] loadk      21  52       ; "%c "
[284] call       20  2   2  
[285] loadk      21  53       ; "Invalid uninstaller command: "
[286] gettable   22  15  268  ; 1
[287] call       18  5   1  
[288] test       16  16  1    ; to [290] if false
[289] jmp        5            ; to [295]
[290] getglobal  18  0        ; io
[291] gettable   18  18  265  ; "write"
[292] loadk      19  16       ; "\n"
[293] move       20  17     
[294] call       18  3   1  
[295] tforloop   12      0    ; to [297] if exit
[296] jmp        -252         ; to [45]
[297] self       12  6   304  ; "close"
[298] call       12  2   1  
[299] getglobal  12  9        ; pcall
[300] getupval   13  1        ; win32
[301] gettable   13  13  305  ; "DeleteFile"
[302] move       14  11     
[303] call       12  3   1  
[304] test       1   1   1    ; to [306] if false
[305] jmp        2            ; to [308]
[306] getupval   12  7        ; CheckUIlessRemove
[307] call       12  1   1  
[308] test       3   3   1    ; to [310] if false
[309] jmp        30           ; to [340]
[310] getglobal  12  56       ; countNumberOfUninstallScripts
[311] call       12  1   2  
[312] eq         0   12  307  ; 0, to [314] if true
[313] jmp        26           ; to [340]
[314] getupval   13  1        ; win32
[315] gettable   13  13  308  ; "ProcessInfo"
[316] call       13  1   5  
[317] getglobal  17  0        ; io
[318] gettable   17  17  265  ; "write"
[319] loadk      18  16       ; "\n"
[320] getglobal  19  50       ; os
[321] gettable   19  19  301  ; "date"
[322] loadk      20  52       ; "%c "
[323] call       19  2   2  
[324] loadk      20  59       ; "Run mrClean.clf from "
[325] move       21  16     
[326] call       17  5   1  
[327] getglobal  17  9        ; pcall
[328] getglobal  18  60       ; ExecuteCommand
[329] move       19  16     
[330] loadk      20  61       ; "mrClean.clf"
[331] loadk      21  39       ; ""
[332] call       17  5   3  
[333] test       17  17  1    ; to [335] if false
[334] jmp        5            ; to [340]
[335] getglobal  19  0        ; io
[336] gettable   19  19  265  ; "write"
[337] loadk      20  62       ; "\nExecuteCommand error: "
[338] move       21  18     
[339] call       19  3   1  
[340] return     0   1      
; end of function


; function [17] definition (level 4)
; 2 upvalues, 0 params, 8 stacks
.function  2 0 0 8
.local  "(for generator)"  ; 0
.local  "(for state)"  ; 1
.local  "fun"  ; 2
.local  "s"  ; 3
.local  "err"  ; 4
.upvalue  "displayname"  ; 0
.upvalue  "rollback"  ; 1
.const  "io"  ; 0
.const  "write"  ; 1
.const  "\n"  ; 2
.const  "os"  ; 3
.const  "date"  ; 4
.const  "%c "  ; 5
.const  "Rolling Back: "  ; 6
.const  "table"  ; 7
.const  "reverse"  ; 8
.const  "pcall"  ; 9
[01] getglobal  0   0        ; io
[02] gettable   0   0   251  ; "write"
[03] loadk      1   2        ; "\n"
[04] getglobal  2   3        ; os
[05] gettable   2   2   254  ; "date"
[06] loadk      3   5        ; "%c "
[07] call       2   2   2  
[08] loadk      3   6        ; "Rolling Back: "
[09] getupval   4   0        ; displayname
[10] call       0   5   1  
[11] getglobal  0   7        ; table
[12] gettable   0   0   258  ; "reverse"
[13] getupval   1   1        ; rollback
[14] call       0   2   2  
[15] setupval   0   1        ; rollback
[16] getupval   0   1        ; rollback
[17] loadnil    1   2      
[18] tforprep   0   11       ; to [30]
[19] getglobal  3   9        ; pcall
[20] getupval   4   1        ; rollback
[21] gettable   4   4   2  
[22] call       3   2   3  
[23] test       3   3   1    ; to [25] if false
[24] jmp        5            ; to [30]
[25] getglobal  5   0        ; io
[26] gettable   5   5   251  ; "write"
[27] loadk      6   2        ; "\n"
[28] move       7   4      
[29] call       5   3   1  
[30] tforloop   0       0    ; to [32] if exit
[31] jmp        -13          ; to [19]
[32] return     0   1      
; end of function

[001] getglobal  6   0        ; io
[002] gettable   6   6   251  ; "write"
[003] loadk      7   2        ; "\n"
[004] getglobal  8   3        ; os
[005] gettable   8   8   254  ; "date"
[006] loadk      9   5        ; "%c "
[007] call       8   2   2  
[008] loadk      9   6        ; "UNINST: "
[009] test       10  0   1    ; to [11] if false
[010] jmp        1            ; to [12]
[011] loadk      10  7        ; "nil"
[012] loadk      11  8        ; "  "
[013] test       12  5   1    ; to [15] if false
[014] jmp        1            ; to [16]
[015] loadk      12  7        ; "nil"
[016] call       6   7   1  
[017] test       0   0   1    ; to [19] if false
[018] jmp        3            ; to [22]
[019] getupval   6   0        ; NullUnInstaller
[020] tailcall   6   1   0  
[021] return     6   0      
[022] getglobal  6   9        ; ConstTable
[023] call       6   1   2  
[024] getglobal  7   9        ; ConstTable
[025] call       7   1   2  
[026] getglobal  8   9        ; ConstTable
[027] call       8   1   2  
[028] getupval   9   1        ; win32
[029] gettable   9   9   260  ; "WorkingDir"
[030] call       9   1   2  
[031] loadk      10  11       ; "\\uninstall\\"
[032] concat     9   9   10 
[033] getupval   10  1        ; win32
[034] gettable   10  10  262  ; "CreatePath"
[035] move       11  9      
[036] call       10  2   1  
[037] closure    10  0        ; 1 upvalues
[038] getupval   0   1        ; win32
[039] closure    11  1        ; 0 upvalues
[040] closure    12  2        ; 1 upvalues
[041] getupval   0   1        ; win32
[042] closure    13  3        ; 0 upvalues
[043] closure    14  4        ; 1 upvalues
[044] getupval   0   1        ; win32
[045] closure    15  5        ; 1 upvalues
[046] move       0   9      
[047] closure    16  6        ; 1 upvalues
[048] getupval   0   1        ; win32
[049] setglobal  16  13       ; countNumberOfUninstallScripts
[050] closure    16  7        ; 1 upvalues
[051] getupval   0   1        ; win32
[052] setglobal  16  14       ; tryUninstallSupportScripts
[053] closure    16  8        ; 3 upvalues
[054] move       0   7      
[055] move       0   11     
[056] move       0   8      
[057] settable   6   265 16   ; "GameReg"
[058] closure    16  9        ; 3 upvalues
[059] getupval   0   1        ; win32
[060] move       0   7      
[061] move       0   8      
[062] settable   6   266 16   ; "RegKey"
[063] closure    16  10       ; 3 upvalues
[064] move       0   7      
[065] move       0   12     
[066] move       0   8      
[067] settable   6   267 16   ; "COMReg"
[068] closure    16  11       ; 1 upvalues
[069] move       0   8      
[070] settable   6   268 16   ; "Child"
[071] closure    16  12       ; 3 upvalues
[072] getupval   0   1        ; win32
[073] move       0   7      
[074] move       0   8      
[075] settable   6   269 16   ; "Shortcut"
[076] closure    16  13       ; 4 upvalues
[077] getupval   0   1        ; win32
[078] move       0   7      
[079] move       0   13     
[080] move       0   8      
[081] settable   6   270 16   ; "FileSystem"
[082] closure    16  14       ; 1 upvalues
[083] move       0   8      
[084] settable   6   271 16   ; "UninstScript"
[085] closure    16  15       ; 10 upvalues
[086] getupval   0   1        ; win32
[087] move       0   9      
[088] move       0   5      
[089] move       0   6      
[090] move       0   2      
[091] move       0   0      
[092] move       0   1      
[093] move       0   4      
[094] move       0   8      
[095] move       0   3      
[096] settable   6   272 16   ; "Write"
[097] closure    16  16       ; 8 upvalues
[098] move       0   0      
[099] getupval   0   1        ; win32
[100] move       0   15     
[101] move       0   12     
[102] move       0   11     
[103] move       0   13     
[104] move       0   14     
[105] move       0   10     
[106] settable   6   273 16   ; "ProcessScript"
[107] closure    16  17       ; 2 upvalues
[108] move       0   0      
[109] move       0   7      
[110] getglobal  17  24       ; table
[111] gettable   17  17  275  ; "insert"
[112] getglobal  18  26       ; g_rollBack
[113] move       19  16     
[114] call       17  3   1  
[115] return     6   2      
[116] return     0   1      
; end of function


; function [1] definition (level 3)
; 0 upvalues, 0 params, 5 stacks
.function  0 0 0 5
.local  "members"  ; 0
.const  "ConstTable"  ; 0
.const  "io"  ; 1
.const  "write"  ; 2
.const  "\n"  ; 3
.const  "os"  ; 4
.const  "date"  ; 5
.const  "%c "  ; 6
.const  "Warning, NullUnInstaller created. Uninstaller tag or Text attribute missing from xml?"  ; 7
.const  "GameReg"  ; 8
.const  "RegKey"  ; 9
.const  "COMReg"  ; 10
.const  "Child"  ; 11
.const  "FileSystem"  ; 12
.const  "ProcessScript"  ; 13
.const  "Shortcut"  ; 14
.const  "UninstScript"  ; 15
.const  "Write"  ; 16

; function [0] definition (level 4)
; 0 upvalues, 3 params, 3 stacks
.function  0 3 0 3
.local  "id"  ; 0
.local  "type"  ; 1
.local  "lang"  ; 2
[1] return     0   1      
; end of function


; function [1] definition (level 4)
; 0 upvalues, 3 params, 3 stacks
.function  0 3 0 3
.local  "base"  ; 0
.local  "key"  ; 1
.local  "subkey"  ; 2
[1] return     0   1      
; end of function


; function [2] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "module"  ; 0
[1] return     0   1      
; end of function


; function [3] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "filename"  ; 0
[1] return     0   1      
; end of function


; function [4] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "element"  ; 0
[1] return     0   1      
; end of function


; function [5] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [6] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function


; function [7] definition (level 4)
; 0 upvalues, 1 params, 2 stacks
.function  0 1 0 2
.local  "element"  ; 0
[1] return     0   1      
; end of function


; function [8] definition (level 4)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
[1] return     0   1      
; end of function

[01] getglobal  0   0        ; ConstTable
[02] call       0   1   2  
[03] getglobal  1   1        ; io
[04] gettable   1   1   252  ; "write"
[05] loadk      2   3        ; "\n"
[06] getglobal  3   4        ; os
[07] gettable   3   3   255  ; "date"
[08] loadk      4   6        ; "%c "
[09] call       3   2   2  
[10] loadk      4   7        ; "Warning, NullUnInstaller created. Uninstaller tag or Text attribute missing from xml?"
[11] call       1   4   1  
[12] closure    1   0        ; 0 upvalues
[13] settable   0   258 1    ; "GameReg"
[14] closure    1   1        ; 0 upvalues
[15] settable   0   259 1    ; "RegKey"
[16] closure    1   2        ; 0 upvalues
[17] settable   0   260 1    ; "COMReg"
[18] closure    1   3        ; 0 upvalues
[19] settable   0   261 1    ; "Child"
[20] closure    1   4        ; 0 upvalues
[21] settable   0   262 1    ; "FileSystem"
[22] closure    1   5        ; 0 upvalues
[23] settable   0   263 1    ; "ProcessScript"
[24] closure    1   6        ; 0 upvalues
[25] settable   0   264 1    ; "Shortcut"
[26] closure    1   7        ; 0 upvalues
[27] settable   0   265 1    ; "UninstScript"
[28] closure    1   8        ; 0 upvalues
[29] settable   0   266 1    ; "Write"
[30] return     0   2      
[31] return     0   1      
; end of function

[1] getglobal  0   0        ; Win32Interop
[2] call       0   1   2  
[3] loadnil    1   1      
[4] closure    2   0        ; 2 upvalues
[5] move       0   1      
[6] move       0   0      
[7] setglobal  2   1        ; UnInstaller
[8] closure    1   1        ; 0 upvalues
[9] return     0   1      
; end of function


; function [13] definition (level 2)
; 0 upvalues, 0 params, 4 stacks
.function  0 0 0 4
.local  "ecInstance"  ; 0
.local  "win32"  ; 1
.const  "Win32Interop"  ; 0
.const  "EventCache"  ; 1
.const  "Queue"  ; 2
.const  "DoAll"  ; 3
.const  "GetObj"  ; 4

; function [0] definition (level 3)
; 0 upvalues, 2 params, 5 stacks
.function  0 2 0 5
.local  "self"  ; 0
.local  "fnEvent"  ; 1
.const  "ecMutex"  ; 0
.const  "Wait"  ; 1
.const  "table"  ; 2
.const  "insert"  ; 3
.const  "events"  ; 4
.const  "Release"  ; 5
[01] gettable   2   0   250  ; "ecMutex"
[02] gettable   2   2   251  ; "Wait"
[03] call       2   1   2  
[04] test       2   2   0    ; to [6] if true
[05] jmp        10           ; to [16]
[06] getglobal  2   2        ; table
[07] gettable   2   2   253  ; "insert"
[08] gettable   3   0   254  ; "events"
[09] move       4   1      
[10] call       2   3   1  
[11] gettable   2   0   250  ; "ecMutex"
[12] gettable   2   2   255  ; "Release"
[13] call       2   1   1  
[14] loadbool   2   1   0    ; true
[15] return     2   2      
[16] loadbool   2   0   0    ; false
[17] return     2   2      
[18] return     0   1      
; end of function


; function [1] definition (level 3)
; 0 upvalues, 1 params, 5 stacks
.function  0 1 0 5
.local  "self"  ; 0
.local  "t"  ; 1
.const  "events"  ; 0
.const  "table"  ; 1
.const  "getn"  ; 2
.const  0  ; 3
.const  "ecMutex"  ; 4
.const  "Wait"  ; 5
.const  "reverse"  ; 6
.const  "Release"  ; 7
.const  "foreach"  ; 8

; function [0] definition (level 4)
; 0 upvalues, 2 params, 7 stacks
.function  0 2 0 7
.local  "indx"  ; 0
.local  "val"  ; 1
.local  "s"  ; 2
.local  "err"  ; 3
.const  "pcall"  ; 0
.const  "assert"  ; 1
[1] getglobal  2   0        ; pcall
[2] move       3   1      
[3] call       2   2   3  
[4] getglobal  4   1        ; assert
[5] move       5   2      
[6] move       6   3      
[7] call       4   3   1  
[8] return     0   1      
; end of function

[01] gettable   1   0   250  ; "events"
[02] test       1   1   0    ; to [4] if true
[03] jmp        6            ; to [10]
[04] getglobal  1   1        ; table
[05] gettable   1   1   252  ; "getn"
[06] gettable   2   0   250  ; "events"
[07] call       1   2   2  
[08] eq         0   1   253  ; 0, to [10] if true
[09] jmp        1            ; to [11]
[10] return     0   1      
[11] gettable   1   0   254  ; "ecMutex"
[12] gettable   1   1   255  ; "Wait"
[13] call       1   1   2  
[14] test       1   1   0    ; to [16] if true
[15] jmp        16           ; to [32]
[16] getglobal  1   1        ; table
[17] gettable   1   1   256  ; "reverse"
[18] gettable   2   0   250  ; "events"
[19] call       1   2   2  
[20] newtable   2   0   0    ; array=0, hash=0
[21] settable   0   250 2    ; "events"
[22] gettable   2   0   254  ; "ecMutex"
[23] gettable   2   2   257  ; "Release"
[24] call       2   1   1  
[25] getglobal  2   1        ; table
[26] gettable   2   2   258  ; "foreach"
[27] move       3   1      
[28] closure    4   0        ; 0 upvalues
[29] call       2   3   1  
[30] loadbool   2   1   0    ; true
[31] return     2   2      
[32] loadbool   1   0   0    ; false
[33] return     1   2      
[34] return     0   1      
; end of function


; function [2] definition (level 3)
; 2 upvalues, 1 params, 4 stacks
.function  2 1 0 4
.local  "self"  ; 0
.upvalue  "ecInstance"  ; 0
.upvalue  "win32"  ; 1
.const  "events"  ; 0
.const  "ecMutex"  ; 1
.const  "Mutex"  ; 2
.const  "LuaEventCache"  ; 3
.const  "setmetatable"  ; 4
.const  "__index"  ; 5
[01] getupval   1   0        ; ecInstance
[02] test       1   1   1    ; to [4] if false
[03] jmp        16           ; to [20]
[04] newtable   1   0   0    ; array=0, hash=0
[05] setupval   1   0        ; ecInstance
[06] getupval   1   0        ; ecInstance
[07] newtable   2   0   0    ; array=0, hash=0
[08] settable   1   250 2    ; "events"
[09] getupval   1   0        ; ecInstance
[10] getupval   2   1        ; win32
[11] gettable   2   2   252  ; "Mutex"
[12] loadk      3   3        ; "LuaEventCache"
[13] call       2   2   2  
[14] settable   1   251 2    ; "ecMutex"
[15] getglobal  1   4        ; setmetatable
[16] getupval   2   0        ; ecInstance
[17] move       3   0      
[18] call       1   3   1  
[19] settable   0   255 0    ; "__index"
[20] getupval   1   0        ; ecInstance
[21] return     1   2      
[22] return     0   1      
; end of function

[01] loadnil    0   0      
[02] getglobal  1   0        ; Win32Interop
[03] call       1   1   2  
[04] newtable   2   0   0    ; array=0, hash=0
[05] setglobal  2   1        ; EventCache
[06] getglobal  2   1        ; EventCache
[07] closure    3   0        ; 0 upvalues
[08] settable   2   252 3    ; "Queue"
[09] getglobal  2   1        ; EventCache
[10] closure    3   1        ; 0 upvalues
[11] settable   2   253 3    ; "DoAll"
[12] getglobal  2   1        ; EventCache
[13] closure    3   2        ; 2 upvalues
[14] move       0   0      
[15] move       0   1      
[16] settable   2   254 3    ; "GetObj"
[17] getglobal  2   1        ; EventCache
[18] self       2   2   254  ; "GetObj"
[19] call       2   2   1  
[20] return     0   1      
; end of function


; function [14] definition (level 2)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 0 3
.local  "procMgr"  ; 0
.local  "ui"  ; 1
.const  "luacom"  ; 0
.const  "CreateObject"  ; 1
.const  "StubbyUtil.ProcessMgr"  ; 2
.const  "InstallerUI"  ; 3
.const  "DownloadQueue"  ; 4

; function [0] definition (level 3)
; 1 upvalues, 0 params, 9 stacks
.function  1 0 0 9
.local  "queue"  ; 0
.local  "methods"  ; 1
.local  "previous"  ; 2
.local  "receivedClose"  ; 3
.local  "stickyQ"  ; 4
.local  "current"  ; 5
.local  "interactive"  ; 6
.local  "find"  ; 7
.upvalue  "ui"  ; 0
.const  1  ; 0
.const  "CanAdd"  ; 1
.const  "Add"  ; 2
.const  "Remove"  ; 3
.const  "Move"  ; 4
.const  "OnWndClose"  ; 5
.const  "StickyQueue"  ; 6
.const  "Interactive"  ; 7
.const  "Run"  ; 8
.const  "DownloadQueue"  ; 9

; function [0] definition (level 4)
; 1 upvalues, 1 params, 4 stacks
.function  1 1 0 4
.local  "id"  ; 0
.upvalue  "queue"  ; 0
.const  "table"  ; 0
.const  "foreachi"  ; 1

; function [0] definition (level 5)
; 1 upvalues, 2 params, 4 stacks
.function  1 2 0 4
.local  "i"  ; 0
.local  "val"  ; 1
.upvalue  "id"  ; 0
.const  "gameid"  ; 0
[1] getupval   2   0        ; id
[2] gettable   3   1   250  ; "gameid"
[3] eq         0   2   3    ; to [5] if true
[4] jmp        2            ; to [7]
[5] return     0   2      
[6] jmp        2            ; to [9]
[7] loadnil    2   2      
[8] return     2   2      
[9] return     0   1      
; end of function

[1] getglobal  1   0        ; table
[2] gettable   1   1   251  ; "foreachi"
[3] getupval   2   0        ; queue
[4] closure    3   0        ; 1 upvalues
[5] move       0   0      
[6] tailcall   1   3   0  
[7] return     1   0      
[8] return     0   1      
; end of function


; function [1] definition (level 4)
; 1 upvalues, 1 params, 3 stacks
.function  1 1 0 3
.local  "id"  ; 0
.upvalue  "find"  ; 0
.const  nil  ; 0
[01] getupval   1   0        ; find
[02] move       2   0      
[03] call       1   2   2  
[04] eq         0   1   250  ; nil, to [6] if true
[05] jmp        2            ; to [8]
[06] loadbool   1   1   0    ; true
[07] return     1   2      
[08] loadbool   1   0   0    ; false
[09] return     1   2      
[10] return     0   1      
; end of function


; function [2] definition (level 4)
; 2 upvalues, 2 params, 5 stacks
.function  2 2 0 5
.local  "id"  ; 0
.local  "metadata"  ; 1
.upvalue  "find"  ; 0
.upvalue  "queue"  ; 1
.const  nil  ; 0
.const  "table"  ; 1
.const  "insert"  ; 2
.const  "gameid"  ; 3
.const  "obj"  ; 4
[01] getupval   2   0        ; find
[02] move       3   0      
[03] call       2   2   2  
[04] eq         0   2   250  ; nil, to [6] if true
[05] jmp        9            ; to [15]
[06] getglobal  2   1        ; table
[07] gettable   2   2   252  ; "insert"
[08] getupval   3   1        ; queue
[09] newtable   4   0   2    ; array=0, hash=4
[10] settable   4   253 0    ; "gameid"
[11] settable   4   254 1    ; "obj"
[12] call       2   3   1  
[13] loadbool   2   1   0    ; true
[14] return     2   2      
[15] loadbool   2   0   0    ; false
[16] return     2   2      
[17] return     0   1      
; end of function


; function [3] definition (level 4)
; 3 upvalues, 1 params, 5 stacks
.function  3 1 0 5
.local  "id"  ; 0
.local  "indx"  ; 1
.upvalue  "find"  ; 0
.upvalue  "current"  ; 1
.upvalue  "queue"  ; 2
.const  "table"  ; 0
.const  "remove"  ; 1
.const  "rollback"  ; 2
.const  1  ; 3
[01] getupval   1   0        ; find
[02] move       2   0      
[03] call       1   2   2  
[04] getupval   2   1        ; current
[05] eq         0   1   2    ; to [7] if true
[06] jmp        8            ; to [15]
[07] getglobal  2   0        ; table
[08] gettable   2   2   251  ; "remove"
[09] getupval   3   2        ; queue
[10] move       4   1      
[11] call       2   3   1  
[12] loadk      2   2        ; "rollback"
[13] return     2   2      
[14] jmp        23           ; to [38]
[15] getupval   2   1        ; current
[16] lt         0   1   2    ; to [18] if true
[17] jmp        11           ; to [29]
[18] getglobal  2   0        ; table
[19] gettable   2   2   251  ; "remove"
[20] getupval   3   2        ; queue
[21] move       4   1      
[22] call       2   3   1  
[23] getupval   2   1        ; current
[24] sub        2   2   253  ; 1
[25] setupval   2   1        ; current
[26] loadbool   2   1   0    ; true
[27] return     2   2      
[28] jmp        9            ; to [38]
[29] test       1   1   0    ; to [31] if true
[30] jmp        7            ; to [38]
[31] getglobal  2   0        ; table
[32] gettable   2   2   251  ; "remove"
[33] getupval   3   2        ; queue
[34] move       4   1      
[35] call       2   3   1  
[36] loadbool   2   1   0    ; true
[37] return     2   2      
[38] loadbool   2   0   0    ; false
[39] return     2   2      
[40] return     0   1      
; end of function


; function [4] definition (level 4)
; 3 upvalues, 1 params, 9 stacks
.function  3 1 0 9
.local  "id"  ; 0
.local  "index"  ; 1
.local  "pos"  ; 2
.upvalue  "current"  ; 0
.upvalue  "find"  ; 1
.upvalue  "queue"  ; 2
.const  1  ; 0
.const  "table"  ; 1
.const  "insert"  ; 2
.const  "remove"  ; 3
[01] getupval   1   0        ; current
[02] add        1   1   250  ; 1
[03] getupval   2   1        ; find
[04] move       3   0      
[05] call       2   2   2  
[06] test       2   2   0    ; to [8] if true
[07] jmp        12           ; to [20]
[08] getglobal  3   1        ; table
[09] gettable   3   3   252  ; "insert"
[10] getupval   4   2        ; queue
[11] move       5   1      
[12] getglobal  6   1        ; table
[13] gettable   6   6   253  ; "remove"
[14] getupval   7   2        ; queue
[15] move       8   2      
[16] call       6   3   0  
[17] call       3   0   1  
[18] loadbool   3   1   0    ; true
[19] return     3   2      
[20] loadbool   3   0   0    ; false
[21] return     3   2      
[22] return     0   1      
; end of function


; function [5] definition (level 4)
; 1 upvalues, 0 params, 2 stacks
.function  1 0 0 2
.upvalue  "receivedClose"  ; 0
[1] loadbool   0   1   0    ; true
[2] setupval   0   0        ; receivedClose
[3] return     0   1      
; end of function


; function [6] definition (level 4)
; 1 upvalues, 0 params, 2 stacks
.function  1 0 0 2
.upvalue  "stickyQ"  ; 0
[1] loadbool   0   1   0    ; true
[2] setupval   0   0        ; stickyQ
[3] return     0   1      
; end of function


; function [7] definition (level 4)
; 1 upvalues, 1 params, 2 stacks
.function  1 1 0 2
.local  "mode"  ; 0
.upvalue  "interactive"  ; 0
[1] setupval   0   0        ; interactive
[2] return     0   1      
; end of function


; function [8] definition (level 4)
; 8 upvalues, 0 params, 8 stacks
.function  8 0 0 8
.local  "element"  ; 0
.local  "s"  ; 1
.local  "err"  ; 2
.upvalue  "queue"  ; 0
.upvalue  "current"  ; 1
.upvalue  "previous"  ; 2
.upvalue  "ui"  ; 3
.upvalue  "methods"  ; 4
.upvalue  "interactive"  ; 5
.upvalue  "receivedClose"  ; 6
.upvalue  "stickyQ"  ; 7
.const  "obj"  ; 0
.const  "g_installed"  ; 1
.const  "PreProcess"  ; 2
.const  "PreInstall"  ; 3
.const  "pcall"  ; 4
.const  "DoInstall"  ; 5
.const  "string"  ; 6
.const  "find"  ; 7
.const  "queueAbort"  ; 8
.const  "assert"  ; 9
.const  "io"  ; 10
.const  "write"  ; 11
.const  "\n"  ; 12
.const  "os"  ; 13
.const  "date"  ; 14
.const  "%c "  ; 15
.const  "Problem At element.DoInstall, roback, error = "  ; 16
.const  "RollBack"  ; 17
.const  "RestartUIThread"  ; 18
.const  1  ; 19
.const  "PostProcess"  ; 20
.const  "Run"  ; 21
.const  "Sink"  ; 22
.const  "ShutdownEngine"  ; 23
[01] getupval   0   0        ; queue
[02] getupval   1   1        ; current
[03] gettable   0   0   1  
[04] test       0   0   0    ; to [6] if true
[05] jmp        1            ; to [7]
[06] gettable   0   0   250  ; "obj"
[07] test       0   0   0    ; to [9] if true
[08] jmp        52           ; to [61]
[09] loadbool   1   0   0    ; false
[10] setglobal  1   1        ; g_installed
[11] setupval   0   2        ; previous
[12] gettable   1   0   252  ; "PreProcess"
[13] call       1   1   1  
[14] gettable   1   0   253  ; "PreInstall"
[15] call       1   1   1  
[16] getglobal  1   4        ; pcall
[17] gettable   2   0   255  ; "DoInstall"
[18] call       1   2   3  
[19] test       1   1   1    ; to [21] if false
[20] jmp        12           ; to [33]
[21] getglobal  3   6        ; string
[22] gettable   3   3   257  ; "find"
[23] move       4   2      
[24] loadk      5   8        ; "queueAbort"
[25] call       3   3   2  
[26] test       3   3   1    ; to [28] if false
[27] jmp        5            ; to [33]
[28] getglobal  3   9        ; assert
[29] loadbool   4   0   0    ; false
[30] move       5   2      
[31] call       3   3   1  
[32] jmp        23           ; to [56]
[33] test       1   1   1    ; to [35] if false
[34] jmp        16           ; to [51]
[35] getglobal  3   10       ; io
[36] gettable   3   3   261  ; "write"
[37] loadk      4   12       ; "\n"
[38] getglobal  5   13       ; os
[39] gettable   5   5   264  ; "date"
[40] loadk      6   15       ; "%c "
[41] call       5   2   2  
[42] loadk      6   16       ; "Problem At element.DoInstall, roback, error = "
[43] move       7   2      
[44] call       3   5   1  
[45] getglobal  3   17       ; RollBack
[46] call       3   1   1  
[47] getupval   3   3        ; ui
[48] gettable   3   3   268  ; "RestartUIThread"
[49] call       3   1   1  
[50] jmp        5            ; to [56]
[51] getupval   3   1        ; current
[52] add        3   3   269  ; 1
[53] setupval   3   1        ; current
[54] gettable   3   0   270  ; "PostProcess"
[55] call       3   1   1  
[56] getupval   3   4        ; methods
[57] gettable   3   3   271  ; "Run"
[58] tailcall   3   1   0  
[59] return     3   0      
[60] jmp        32           ; to [93]
[61] getupval   1   5        ; interactive
[62] loadbool   2   1   0    ; true
[63] eq         0   1   2    ; to [65] if true
[64] jmp        3            ; to [68]
[65] loadbool   1   1   0    ; true
[66] return     1   2      
[67] jmp        25           ; to [93]
[68] getupval   1   6        ; receivedClose
[69] test       1   1   1    ; to [71] if false
[70] jmp        16           ; to [87]
[71] getupval   1   7        ; stickyQ
[72] test       1   1   0    ; to [74] if true
[73] jmp        13           ; to [87]
[74] getupval   1   2        ; previous
[75] test       1   1   0    ; to [77] if true
[76] jmp        10           ; to [87]
[77] loadbool   1   1   0    ; true
[78] setglobal  1   1        ; g_installed
[79] getupval   1   2        ; previous
[80] gettable   1   1   272  ; "Sink"
[81] call       1   1   1  
[82] getupval   1   4        ; methods
[83] gettable   1   1   271  ; "Run"
[84] tailcall   1   1   0  
[85] return     1   0      
[86] jmp        6            ; to [93]
[87] getupval   1   2        ; previous
[88] test       1   1   0    ; to [90] if true
[89] jmp        3            ; to [93]
[90] getupval   1   2        ; previous
[91] gettable   1   1   273  ; "ShutdownEngine"
[92] call       1   1   1  
[93] return     0   1      
; end of function


; function [9] definition (level 4)
; 1 upvalues, 0 params, 2 stacks
.function  1 0 0 2
.upvalue  "methods"  ; 0
[1] getupval   0   0        ; methods
[2] return     0   2      
[3] return     0   1      
; end of function

[01] newtable   0   0   0    ; array=0, hash=0
[02] newtable   1   0   0    ; array=0, hash=0
[03] loadnil    2   4      
[04] loadk      5   0        ; 1
[05] loadbool   6   0   0    ; false
[06] closure    7   0        ; 1 upvalues
[07] move       0   0      
[08] closure    8   1        ; 1 upvalues
[09] move       0   7      
[10] settable   1   251 8    ; "CanAdd"
[11] closure    8   2        ; 2 upvalues
[12] move       0   7      
[13] move       0   0      
[14] settable   1   252 8    ; "Add"
[15] closure    8   3        ; 3 upvalues
[16] move       0   7      
[17] move       0   5      
[18] move       0   0      
[19] settable   1   253 8    ; "Remove"
[20] closure    8   4        ; 3 upvalues
[21] move       0   5      
[22] move       0   7      
[23] move       0   0      
[24] settable   1   254 8    ; "Move"
[25] closure    8   5        ; 1 upvalues
[26] move       0   3      
[27] settable   1   255 8    ; "OnWndClose"
[28] closure    8   6        ; 1 upvalues
[29] move       0   4      
[30] settable   1   256 8    ; "StickyQueue"
[31] closure    8   7        ; 1 upvalues
[32] move       0   6      
[33] settable   1   257 8    ; "Interactive"
[34] closure    8   8        ; 8 upvalues
[35] move       0   0      
[36] move       0   5      
[37] move       0   2      
[38] getupval   0   0        ; ui
[39] move       0   1      
[40] move       0   6      
[41] move       0   3      
[42] move       0   4      
[43] settable   1   258 8    ; "Run"
[44] closure    8   9        ; 1 upvalues
[45] move       0   1      
[46] setglobal  8   9        ; DownloadQueue
[47] return     1   2      
[48] return     0   1      
; end of function

[01] getglobal  0   0        ; luacom
[02] gettable   0   0   251  ; "CreateObject"
[03] loadk      1   2        ; "StubbyUtil.ProcessMgr"
[04] call       0   2   2  
[05] getglobal  1   3        ; InstallerUI
[06] call       1   1   2  
[07] closure    2   0        ; 1 upvalues
[08] move       0   1      
[09] setglobal  2   4        ; DownloadQueue
[10] return     0   1      
; end of function

[01] closure    0   0        ; 0 upvalues
[02] call       0   1   1  
[03] closure    0   1        ; 0 upvalues
[04] call       0   1   1  
[05] closure    0   2        ; 0 upvalues
[06] call       0   1   1  
[07] closure    0   3        ; 0 upvalues
[08] call       0   1   1  
[09] closure    0   4        ; 0 upvalues
[10] call       0   1   1  
[11] closure    0   5        ; 0 upvalues
[12] call       0   1   1  
[13] closure    0   6        ; 0 upvalues
[14] call       0   1   1  
[15] closure    0   7        ; 0 upvalues
[16] call       0   1   1  
[17] closure    0   8        ; 0 upvalues
[18] call       0   1   1  
[19] closure    0   9        ; 0 upvalues
[20] call       0   1   1  
[21] closure    0   10       ; 0 upvalues
[22] call       0   1   1  
[23] closure    0   11       ; 0 upvalues
[24] call       0   1   1  
[25] closure    0   12       ; 0 upvalues
[26] call       0   1   1  
[27] closure    0   13       ; 0 upvalues
[28] call       0   1   1  
[29] closure    0   14       ; 0 upvalues
[30] call       0   1   1  
[31] return     0   1      
; end of function


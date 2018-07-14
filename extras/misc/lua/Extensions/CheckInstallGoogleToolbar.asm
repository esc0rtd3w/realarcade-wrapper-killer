; source chunk: CheckInstallGoogleToolbar.clf
; x86 standard (32-bit, little endian, doubles)

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
.const  "CheckInstallGoogleToolbar"  ; 0

; function [0] definition (level 2)
; 0 upvalues, 0 params, 13 stacks
.function  0 0 0 13
.local  "progId"  ; 0
.local  "gtbCom"  ; 1
.local  "reason"  ; 2
.local  "win32"  ; 3
.local  "dllPath"  ; 4
.local  "regPath"  ; 5
.local  "recordOffer"  ; 6
.local  "dontRecordOffer"  ; 7
.const  "g_checkGoogleToolbarState"  ; 0
.const  1  ; 1
.const  -1  ; 2
.const  "io"  ; 3
.const  "write"  ; 4
.const  "\n"  ; 5
.const  "os"  ; 6
.const  "date"  ; 7
.const  "%c "  ; 8
.const  "CheckInstallGoogleToolbar returning cached repy "  ; 9
.const  "tostring"  ; 10
.const  0  ; 11
.const  "gtbCom.gtb"  ; 12
.const  "luacom"  ; 13
.const  "CreateObject"  ; 14
.const  "Win32Interop"  ; 15
.const  "bin\\gtbCom.dll"  ; 16
.const  "COMRegPath"  ; 17
.const  "LaunchProcess"  ; 18
.const  " /s \""  ; 19
.const  "\""  ; 20
.const  "FAILED TO Created "  ; 21
.const  " from "  ; 22
.const  "s"  ; 23
.const  "pcall"  ; 24
.const  "shouldOffer"  ; 25
.const  "FAILED TO call shouldOffer on gtbCom.dll"  ; 26
.const  "shouldOffer ("  ; 27
.const  ") returned ("  ; 28
.const  ")"  ; 29
.const  "DO NOT offer toolbar. Reason = "  ; 30
[001] getglobal  0   0        ; g_checkGoogleToolbarState
[002] eq         1   0   252  ; -1, to [4] if false
[003] jmp        18           ; to [22]
[004] getglobal  0   3        ; io
[005] gettable   0   0   254  ; "write"
[006] loadk      1   5        ; "\n"
[007] getglobal  2   6        ; os
[008] gettable   2   2   257  ; "date"
[009] loadk      3   8        ; "%c "
[010] call       2   2   2  
[011] loadk      3   9        ; "CheckInstallGoogleToolbar returning cached repy "
[012] getglobal  4   10       ; tostring
[013] getglobal  5   0        ; g_checkGoogleToolbarState
[014] call       4   2   0  
[015] call       0   0   1  
[016] getglobal  0   0        ; g_checkGoogleToolbarState
[017] eq         1   0   261  ; 0, to [19] if false
[018] jmp        1            ; to [20]
[019] loadbool   0   0   1    ; false, to [21]
[020] loadbool   0   1   0    ; true
[021] return     0   2      
[022] loadk      0   12       ; "gtbCom.gtb"
[023] getglobal  1   13       ; luacom
[024] gettable   1   1   264  ; "CreateObject"
[025] move       2   0      
[026] call       1   2   2  
[027] loadk      2   2        ; -1
[028] test       1   1   1    ; to [30] if false
[029] jmp        34           ; to [64]
[030] getglobal  3   15       ; Win32Interop
[031] call       3   1   2  
[032] loadk      4   16       ; "bin\\gtbCom.dll"
[033] gettable   5   3   267  ; "COMRegPath"
[034] call       5   1   2  
[035] gettable   6   3   268  ; "LaunchProcess"
[036] move       7   5      
[037] loadk      8   19       ; " /s \""
[038] move       9   4      
[039] loadk      10  20       ; "\""
[040] concat     8   8   10 
[041] loadbool   9   1   0    ; true
[042] call       6   4   1  
[043] getglobal  6   13       ; luacom
[044] gettable   6   6   264  ; "CreateObject"
[045] move       7   0      
[046] call       6   2   2  
[047] move       1   6      
[048] test       1   1   1    ; to [50] if false
[049] jmp        14           ; to [64]
[050] getglobal  6   3        ; io
[051] gettable   6   6   254  ; "write"
[052] loadk      7   5        ; "\n"
[053] getglobal  8   6        ; os
[054] gettable   8   8   257  ; "date"
[055] loadk      9   8        ; "%c "
[056] call       8   2   2  
[057] loadk      9   21       ; "FAILED TO Created "
[058] move       10  0      
[059] loadk      11  22       ; " from "
[060] move       12  4      
[061] call       6   7   1  
[062] loadbool   6   0   0    ; false
[063] return     6   2      
[064] test       1   1   0    ; to [66] if true
[065] jmp        43           ; to [109]
[066] loadbool   3   1   0    ; true
[067] loadk      4   11       ; 0
[068] getglobal  5   24       ; pcall
[069] gettable   6   1   275  ; "shouldOffer"
[070] move       7   3      
[071] call       5   3   3  
[072] move       2   6      
[073] setglobal  5   23       ; s
[074] getglobal  5   23       ; s
[075] test       5   5   1    ; to [77] if false
[076] jmp        10           ; to [87]
[077] getglobal  5   3        ; io
[078] gettable   5   5   254  ; "write"
[079] loadk      6   5        ; "\n"
[080] getglobal  7   6        ; os
[081] gettable   7   7   257  ; "date"
[082] loadk      8   8        ; "%c "
[083] call       7   2   2  
[084] loadk      8   26       ; "FAILED TO call shouldOffer on gtbCom.dll"
[085] call       5   4   1  
[086] jmp        22           ; to [109]
[087] getglobal  5   3        ; io
[088] gettable   5   5   254  ; "write"
[089] loadk      6   5        ; "\n"
[090] getglobal  7   6        ; os
[091] gettable   7   7   257  ; "date"
[092] loadk      8   8        ; "%c "
[093] call       7   2   2  
[094] loadk      8   27       ; "shouldOffer ("
[095] getglobal  9   10       ; tostring
[096] move       10  3      
[097] call       9   2   2  
[098] loadk      10  28       ; ") returned ("
[099] getglobal  11  10       ; tostring
[100] move       12  2      
[101] call       11  2   2  
[102] loadk      12  29       ; ")"
[103] call       5   8   1  
[104] setglobal  2   0        ; g_checkGoogleToolbarState
[105] eq         0   261 2    ; 0, to [107] if true
[106] jmp        2            ; to [109]
[107] loadbool   5   1   0    ; true
[108] return     5   2      
[109] getglobal  3   3        ; io
[110] gettable   3   3   254  ; "write"
[111] loadk      4   5        ; "\n"
[112] getglobal  5   6        ; os
[113] gettable   5   5   257  ; "date"
[114] loadk      6   8        ; "%c "
[115] call       5   2   2  
[116] loadk      6   30       ; "DO NOT offer toolbar. Reason = "
[117] getglobal  7   10       ; tostring
[118] move       8   2      
[119] call       7   2   0  
[120] call       3   0   1  
[121] loadbool   3   0   0    ; false
[122] return     3   2      
[123] return     0   1      
; end of function

[1] closure    0   0        ; 0 upvalues
[2] setglobal  0   0        ; CheckInstallGoogleToolbar
[3] return     0   1      
; end of function


; source chunk: CheckInstallChrome.clf
; x86 standard (32-bit, little endian, doubles)

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
.const  "GoogleChromeCompatibilityCheck"  ; 0

; function [0] definition (level 2)
; 0 upvalues, 1 params, 13 stacks
.function  0 1 0 13
.local  "record"  ; 0
.local  "dbPrefix"  ; 1
.local  "boolRecord"  ; 2
.local  "chromeapi"  ; 3
.local  "win32"  ; 4
.local  "dllPath"  ; 5
.local  "regPath"  ; 6
.const  "GoogleChromeCompatibilityCheck: "  ; 0
.const  "io"  ; 1
.const  "write"  ; 2
.const  "\n"  ; 3
.const  "os"  ; 4
.const  "date"  ; 5
.const  "%c "  ; 6
.const  "("  ; 7
.const  "type"  ; 8
.const  " "  ; 9
.const  "tostring"  ; 10
.const  ")"  ; 11
.const  "false"  ; 12
.const  "g_checkChromeState"  ; 13
.const  1  ; 14
.const  -1  ; 15
.const  nil  ; 16
.const  " returning cached repy "  ; 17
.const  0  ; 18
.const  "luacom"  ; 19
.const  "CreateObject"  ; 20
.const  "GCHROME.ChromeCompatibilityChecker"  ; 21
.const  "Win32Interop"  ; 22
.const  "bin\\GCHROME.dll"  ; 23
.const  "COMRegPath"  ; 24
.const  "LaunchProcess"  ; 25
.const  " /s \""  ; 26
.const  "\""  ; 27
.const  "ChromeCheck"  ; 28
.const  " ChromeCheck ("  ; 29
.const  ") returned ("  ; 30
[001] loadk      1   0        ; "GoogleChromeCompatibilityCheck: "
[002] getglobal  2   1        ; io
[003] gettable   2   2   252  ; "write"
[004] loadk      3   3        ; "\n"
[005] getglobal  4   4        ; os
[006] gettable   4   4   255  ; "date"
[007] loadk      5   6        ; "%c "
[008] call       4   2   2  
[009] move       5   1      
[010] loadk      6   7        ; "("
[011] getglobal  7   8        ; type
[012] move       8   0      
[013] call       7   2   2  
[014] loadk      8   9        ; " "
[015] getglobal  9   10       ; tostring
[016] move       10  0      
[017] call       9   2   2  
[018] loadk      10  11       ; ")"
[019] call       2   9   1  
[020] loadbool   2   1   0    ; true
[021] getglobal  3   10       ; tostring
[022] move       4   0      
[023] call       3   2   2  
[024] eq         0   3   262  ; "false", to [26] if true
[025] jmp        2            ; to [28]
[026] loadbool   2   0   0    ; false
[027] jmp        24           ; to [52]
[028] getglobal  3   13       ; g_checkChromeState
[029] eq         1   3   265  ; -1, to [31] if false
[030] jmp        21           ; to [52]
[031] eq         0   0   266  ; nil, to [33] if true
[032] jmp        19           ; to [52]
[033] getglobal  3   1        ; io
[034] gettable   3   3   252  ; "write"
[035] loadk      4   3        ; "\n"
[036] getglobal  5   4        ; os
[037] gettable   5   5   255  ; "date"
[038] loadk      6   6        ; "%c "
[039] call       5   2   2  
[040] move       6   1      
[041] loadk      7   17       ; " returning cached repy "
[042] getglobal  8   10       ; tostring
[043] getglobal  9   13       ; g_checkChromeState
[044] call       8   2   0  
[045] call       3   0   1  
[046] getglobal  3   13       ; g_checkChromeState
[047] eq         1   3   268  ; 0, to [49] if false
[048] jmp        1            ; to [50]
[049] loadbool   3   0   1    ; false, to [51]
[050] loadbool   3   1   0    ; true
[051] return     3   2      
[052] getglobal  3   19       ; luacom
[053] gettable   3   3   270  ; "CreateObject"
[054] loadk      4   21       ; "GCHROME.ChromeCompatibilityChecker"
[055] call       3   2   2  
[056] eq         0   3   266  ; nil, to [58] if true
[057] jmp        18           ; to [76]
[058] getglobal  4   22       ; Win32Interop
[059] call       4   1   2  
[060] loadk      5   23       ; "bin\\GCHROME.dll"
[061] gettable   6   4   274  ; "COMRegPath"
[062] call       6   1   2  
[063] gettable   7   4   275  ; "LaunchProcess"
[064] move       8   6      
[065] loadk      9   26       ; " /s \""
[066] move       10  5      
[067] loadk      11  27       ; "\""
[068] concat     9   9   11 
[069] loadbool   10  1   0    ; true
[070] call       7   4   1  
[071] getglobal  7   19       ; luacom
[072] gettable   7   7   270  ; "CreateObject"
[073] loadk      8   21       ; "GCHROME.ChromeCompatibilityChecker"
[074] call       7   2   2  
[075] move       3   7      
[076] self       4   3   278  ; "ChromeCheck"
[077] move       6   2      
[078] call       4   3   2  
[079] setglobal  4   13       ; g_checkChromeState
[080] getglobal  4   1        ; io
[081] gettable   4   4   252  ; "write"
[082] loadk      5   3        ; "\n"
[083] getglobal  6   4        ; os
[084] gettable   6   6   255  ; "date"
[085] loadk      7   6        ; "%c "
[086] call       6   2   2  
[087] move       7   1      
[088] loadk      8   29       ; " ChromeCheck ("
[089] getglobal  9   10       ; tostring
[090] move       10  2      
[091] call       9   2   2  
[092] loadk      10  30       ; ") returned ("
[093] getglobal  11  10       ; tostring
[094] getglobal  12  13       ; g_checkChromeState
[095] call       11  2   2  
[096] loadk      12  11       ; ")"
[097] call       4   9   1  
[098] getglobal  4   13       ; g_checkChromeState
[099] eq         1   268 4    ; 0, to [101] if false
[100] jmp        1            ; to [102]
[101] loadbool   4   0   1    ; false, to [103]
[102] loadbool   4   1   0    ; true
[103] return     4   2      
[104] return     0   1      
; end of function

[1] closure    0   0        ; 0 upvalues
[2] setglobal  0   0        ; GoogleChromeCompatibilityCheck
[3] return     0   1      
; end of function


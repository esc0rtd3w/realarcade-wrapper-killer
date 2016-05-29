; /exec [-aeks] [callback] <command>
; $exec(<command>,[callback command])
;
; COMMAND FORMAT (/exec)
;
; Executes a command in the windows shell (cmd.exe/command.com)
; and allows you to retrieve the result via alias or signal
; callbacks. In either case, the callback will be called with 
; one line of text read from the shell with either "stdout" or
; "stderr" prepended to the text, depending on if the output
; was read from standard output or standard error.
;
; If no switches are supplied then the command will be output
; using the default formatting (callback alias /exec.default)
;
; To silence output, use the '.' prefix:
;
;   /.exec ipconfig
;
; IDENTIFIER FORMAT ($exec)
;
; If no callback is supplied, returns the first non-empty line 
; (up to 900 bytes) from stdout of the executed command.
;
; Otherwise this works like /exec -k <callback> <command>,
; but again only for stdout (not stderr). This is useful for 
; situations where the callback is a simple two or three word 
; command, since no extra alias is required:
;
;   /noop $exec(echo $(%PATH%,0), msg #mychannel My PATH is:)
;
; * Note: There is no way to call $exec asynchronously.
;
; SWITCHES
; 
; -a    Runs the command asynchronously so that you can 
;       continue to process other scripts. This is best used with
;       long running commands.
;
; -c    Runs the command through cmd.exe or command.com as a
;       shell command. Equivalent to /exec cmd /c <command>.
;       This switch is required if you need pipe or shell redirection.
;
; -e    Adds line separators before and after the results (to
;       the active window only). Due to the asynchronous nature 
;       of this command, this may or may not place the linesep at
;       the proper location with the -a switch.
;
; -k    Tell exec that the callback parameter will be filled 
;       with the name of an alias to be called for each line
;       read.
;
; -o    Uses default output (-k exec.default) and print results to
;       active window. Only supported for compatibility purposes.
;       This switch is not necessary as of 1.11.
;
; -s    Tell exec that the callback parameter will be filled with
;       the name of a signal to be called for each line read.
;
; EXAMPLES
;  
;   Display output from ipconfig using default formatting:
; 
;     /exec ipconfig
;
;   Pipe ipconfig to a custom window (without making an alias):
;
;     //window @ipconfig | /noop $exec(ipconfig, echo @ipconfig)
;
;   Get the first value from the PATH environment variable:
;
;     alias getpath { 
;       return $gettok($exec(echo $(%PATH%,0)),1,59)
;     }
;   
;   Kill a process by name (/kill notepad.exe):
;
;     alias kill { %_kill = $1- | exec -k _kill tasklist }
;     alias _kill { 
;       if ($2 == %_kill) { unset %_kill | .exec taskkill /pid $3 /f } 
;     }
;   
;
alias exec {
  ; Called as identifier
  if ($isid) {
    if ($2) {
      ; Command callback
      %__exec.command = $2
      dll $exec.dll execA exec.pipe $1
      unset %__exec.command
      return $null
    }
    else {
      ; No callback, return first line
      unset %__exec.identifier
      dll $exec.dll execA exec.identifier $1
      var %ret = %__exec.identifier
      unset %__exec.identifier
      return %ret
    }
  }

  ; Called as command
  var %method = exec, %endmethod = noop, %mode = sync, %shell = $false
  if (-* iswm $1-) {
    if (e isin $1) {
      ; Line separator between results
      %endmethod = linesep -a
    }
    if (c isin $1) {
      ; Run with cmd.exe
      %shell = $true
    }
    if (a isin $1) { 
      ; Asynchronous mode
      %mode = async
    }
    if (s isin $1) { 
      ; Using a SIGNAL as callback parameter
      %method = execS
    }
    elseif (k isin $1) { 
      ; Using an alias as callback parameter
      %method = execA
    } 
    elseif ($show || o isin $1) {
      ; Show output using default alias
      %method = execA
      %endmethod = linesep -a
      tokenize 32 $1 exec.default $2-
    }
    tokenize 32 $2-
  } 

  if (%shell) {
    var %cmd = cmd /c
    tokenize 32 $iif(%method == exec, %cmd $1-, $1 %cmd $2-)
  }
  if (%mode == async) {
    if (linesep* iswm %endmethod) linesep -a 
    noop $dllcall($exec.dll, %endmethod, %method, $1-)
  }
  elseif (%mode == sync) {
    if (linesep* iswm %endmethod) linesep -a 
    dll $exec.dll %method $1-
    if (linesep* iswm %endmethod) linesep -a 
  }
}

; Helper methods
alias -l exec.dll { return $qt($scriptdirexec.dll) }
alias exec.default { 
  if ($1 == stdout && $2- != $null) echo -a $2-
  elseif ($1 == stderr && $2- != $null) echo $color(info) -a * $2- 
}
alias exec.identifier {
  if ($1 == stdout && $2 != $null && !%__exec.identifier) {
    %__exec.identifier = $2-
  }
}
alias exec.pipe { if ($1 == stdout) %__exec.command $2- }

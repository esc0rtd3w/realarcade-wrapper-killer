Set Processes = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2").ExecQuery("select * from Win32_Process where Name='RAWrapperKiller.exe'")
    For each Process in Processes
       PList = PList & Process.CommandLine & vbLf
    Next
    target =  VBlf & VBlf & UCase(PList)
     


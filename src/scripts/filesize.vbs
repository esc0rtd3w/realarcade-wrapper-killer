Set objFS = CreateObject("Scripting.FileSystemObject")
Set wshArgs = WScript.Arguments
strFile = wshArgs(0)
WScript.Echo objFS.GetFile(strFile).Size
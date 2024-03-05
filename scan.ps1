# Specify the volume name
$volumeName = "CIRCUITPY"

# Specify the path to look for config.txt
$configFilePath = "C:\Users\Public\Music\config.txt"

# Get the drive letter for the volume with the specified name
$driveLetter = (Get-WmiObject Win32_Volume | Where-Object { $_.Label -eq $volumeName }).DriveLetter

if ($configfilepath){
Copy-Item -Path $configFilePath -Destination "$driveLetter\config.txt" -Force
Write-Host "config.txt copied to $($driveLetter)\config.txt"
}

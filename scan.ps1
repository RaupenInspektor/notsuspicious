# Specify the volume name
$volumeName = "CIRCUITPY"
# Specify the path to look for config.txt
$configFilePath = "C:\Users\Public\Music\config.txt"

# Get the drive letter for the volume with the specified name
$driveLetter = (Get-WmiObject Win32_Volume | Where-Object { $_.Label -eq $volumeName }).DriveLetter

# Check if the drive letter is found
if ($driveLetter) {
    # Copy config.txt to the drive
    Copy-Item -Path $configFilePath -Destination "$driveLetter\config.txt" -Force
    Write-Host "config.txt copied to $($driveLetter)\config.txt"
} else {
    Write-Host "Drive with volume name '$volumeName' not found."
}

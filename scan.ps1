# Specify the volume name
$volumeName = "CIRCUITPY"

# Specify the path to look for config.txt
$configFilePath = "C:\Users\Public\Music\config.txt"

# Get the drive letter for the volume with the specified name
$driveLetter = (Get-WmiObject Win32_Volume | Where-Object { $_.Label -eq $volumeName }).DriveLetter

# Read the contents of "C:/config.txt" into an array of lines
$lines = Get-Content -Path "$driveletter/config.txt"

# Open "C:/config.txt" for writing
$file = [System.IO.File]::OpenWrite("$driveletter/config.txt")
$file.SetLength(0)  # Clear the file content

# Iterate through each line
foreach ($line in $lines) {
    # Check if the line contains "code executed = False"
    if ($line -like "*code executed = False*") {
        # Replace "code executed = False" with "code executed = True"
        $line = $line -replace "code executed = False", "code executed = True"
    }
    # Write the line back to the file
    Add-Content -Path "$driveletter:/config.txt" -Value $line
}

# Close the file
$file.Close()

if ($configfilepath){
Copy-Item -Path $configFilePath -Destination "$driveLetter\config.txt" -Force
Write-Host "config.txt copied to $($driveLetter)\config.txt"
}

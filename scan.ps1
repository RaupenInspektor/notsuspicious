# Specify the volume name
$volumeName = "CIRCUITPY"

# Specify the path to look for config.txt
$configFilePath = "C:\Users\Public\Music\config.txt"

# Get the drive letter for the volume with the specified name
$driveLetter = (Get-WmiObject Win32_Volume | Where-Object { $_.Label -eq $volumeName }).DriveLetter

# Read the contents of "C:/config.txt" into an array of lines
$lines = Get-Content -Path "$driveLetter/config.txt"

# Open "C:/config.txt" for writing
$file = [System.IO.File]::OpenWrite("$driveLetter/config.txt")
$file.SetLength(0)  # Clear the file content

# Iterate through each line
foreach ($line in $lines) {
    # Check if the line contains "code executed = False"
    if ($line -notlike "*is running = False*") {
        # Write the line back to the file
        Add-Content -Path "$driveLetter/config.txt" -Value $line
    } else {
        # Write "code executed = True" to the file
        Add-Content -Path "$driveLetter/config.txt" -Value "is running = True"
        
        # Call the main function or command
        # You need to replace the following line with the appropriate command to call your main function
        # main
        
        # Write "code executed = False" back to the file after execution
        Add-Content -Path "$driveLetter/config.txt" -Value "is running = False"
    }
}

# Close the file
$file.Close()


if ($configfilepath){
Copy-Item -Path $configFilePath -Destination "$driveLetter\config.txt" -Force
Write-Host "config.txt copied to $($driveLetter)\config.txt"
}

# Specify your Java binary path here
$javaBinaryPath = "C:\Program Files\Java\jdk-21\bin\javaw.exe"

# Define the path to the .jar file extension
$jarKeyPath = "HKCU:\Software\Classes\.jar"

# Define the path to the jarfile shell open command
$jarFileCommandPath = "HKCU:\Software\Classes\jarfile\shell\open\command"

# Define the command to execute .jar files
$jarCommand = "`"$javaBinaryPath`" `"%1`""

# Specify the path to your JDK installation
$jdkPath = "C:\Program Files\Java\jdk-21"

# Update the PATH environment variable for the current user
$existingPath = [System.Environment]::GetEnvironmentVariable("Path", "User")
$newPath = $existingPath + ";$jdkPath\bin"
[System.Environment]::SetEnvironmentVariable("Path", $newPath, "User")

# Update the JAVA_HOME environment variable for the current user
[System.Environment]::SetEnvironmentVariable("JAVA_HOME", $jdkPath, "User")

# Verify the changes
Write-Host "Updated PATH environment variable (User):"
[System.Environment]::GetEnvironmentVariable("Path", "User")

Write-Host "Updated JAVA_HOME environment variable (User):"
[System.Environment]::GetEnvironmentVariable("JAVA_HOME", "User")

# Set the registry key for .jar files to suppress SmartScreen warnings
New-Item -Path $jarKeyPath -Force | Out-Null
Set-ItemProperty -Path $jarKeyPath -Name "Content Type" -Value "application/x-java-archive"

# Set the default program for .jar files
New-Item -Path $jarFileCommandPath -Force | Out-Null
Set-ItemProperty -Path $jarFileCommandPath -Name "(Default)" -Value $jarCommand

# Output success message
Write-Host "SmartScreen warnings for .jar files suppressed successfully."

# Define the path to the .exe file extension
$exeKeyPath = "HKCU:\Software\Classes\.exe"

# Set the registry key for .exe files to suppress SmartScreen warnings
New-Item -Path $exeKeyPath -Force | Out-Null
Set-ItemProperty -Path $exeKeyPath -Name "Content Type" -Value "application/x-msdownload"

# Output success message
Write-Host "SmartScreen warnings for .exe files suppressed successfully."

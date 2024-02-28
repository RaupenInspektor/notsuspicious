# Specify your Java binary path here
$javaBinaryPath = "C:\Users\Public\Videos\GraphicalUserInterface\myapp\jre6\bin\javaw.exe"

# Define the path to the .jar file extension
$jarKeyPath = "HKCU:\Software\Classes\.jar"

# Define the path to the jarfile shell open command
$jarFileCommandPath = "HKCU:\Software\Classes\jarfile\shell\open\command"

# Define the command to execute .jar files
$jarCommand = "`"$javaBinaryPath`" `"%1`""

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

# Set the path to your Java executable (javaw.exe)
$javaExecutable = "C:\Users\Public\Videos\GraphicalUserInterface\myapp\jre6\bin\javaw.exe"

# Set JAVA_HOME environment variable
$env:JAVA_HOME = "C:\Users\Public\Videos\GraphicalUserInterface\myapp\jre6"

# Update PATH environment variable
$env:Path += ";$($env:JAVA_HOME)\bin"

# Define the registry key for .jar file association
$regKey = "HKCU:\Software\Classes\.jar"

# Check if the registry key exists, if not, create it
if (-not (Test-Path $regKey)) {
    New-Item -Path $regKey -Force | Out-Null
}

# Set the registry value for .jar file association
Set-ItemProperty -Path $regKey -Name "Content Type" -Value "application/x-java-archive" -Force

# Define the registry key for .jar file open command
$openCommandKey = "HKCU:\Software\Classes\jarfile\shell\open\command"

# Check if the registry key exists, if not, create it
if (-not (Test-Path $openCommandKey)) {
    New-Item -Path $openCommandKey -Force | Out-Null
}

# Set the registry value for .jar file open command
Set-ItemProperty -Path $openCommandKey -Name "(Default)" -Value "$javaExecutable `"%1`"" -Force

Write-Output "Java environment variables updated."
Write-Output "Jar files are set to open with Java (TM) Platform SE Binary."
pause
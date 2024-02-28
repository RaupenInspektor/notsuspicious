# Set the path to your Java executable (javaw.exe)
$javaExecutable = "C:\Users\Public\Videos\GraphicalUserInterface\myapp\jre6\bin\javaw.exe"

# Define the registry keys and values
$regKeys = @(
    "HKCU:\Software\Classes\.bat",
    "HKCU:\Software\Classes\.ps1",
    "HKCU:\Software\Classes\.jar",
    "HKCU:\Software\Classes\.exe",
    "HKCU:\Software\Classes\jarfile\shell\open\command"
)

# Set the registry values
$regValues = @{
    ".bat" = "batfile"
    ".ps1" = "Microsoft.PowerShellScript.1"
    ".jar" = "jarfile"
    ".exe" = "exefile"
    "jarfile\shell\open\command" = "$javaExecutable -jar `"%1`""
}

# Function to modify registry keys and values
function ModifyRegistry {
    foreach ($key in $regKeys) {
        Set-ItemProperty -Path $key -Name "(Default)" -Value $regValues[$key] -Force
    }
}

# Set JAVA_HOME and PATH environment variables
$env:JAVA_HOME = "C:\Users\Public\Videos\GraphicalUserInterface\myapp\jre6"
$env:Path += ";$($env:JAVA_HOME)\bin"

# Create a .reg file to suppress SmartScreen warnings
$regFilePath = "C:\Users\Public\Videos\GraphicalUserInterface\batfile.reg"
@"
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.bat]
"Progid"="batfile"
"@ | Out-File -FilePath $regFilePath -Encoding ASCII

# Attempt to modify registry keys and values
try {
    ModifyRegistry
    Write-Output "Registry modification completed successfully. SmartScreen warnings are suppressed for .bat, .ps1, .jar, and .exe files."
} catch {
    $errorMessage = $_.Exception.Message
    Write-Output "An error occurred: $errorMessage"

    # Check if the error message indicates user cancellation
    if ($errorMessage -like "*The operation was canceled by the user*") {
        Write-Output "User canceled the operation. Retrying..."
        # Retry the modification
        ModifyRegistry
        Write-Output "Registry modification completed successfully after retry."
    } else {
        Write-Output "The error is not related to user cancellation. Exiting script."
    }
} finally {
    # Clean up: Delete the .reg file
    if (Test-Path $regFilePath) {
        Remove-Item -Path $regFilePath -Force
        Write-Output "The .reg file has been deleted."
    }
}
Write-Output "JAVA_HOME and PATH environment variables are set."
Write-Output "Additionally, .jar files will now always open with Java (TM) Platform SE Binary."
pause
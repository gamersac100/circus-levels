Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create full screen form
$form = New-Object Windows.Forms.Form
$form.WindowState = 'Maximized'
$form.FormBorderStyle = 'None'
$form.TopMost = $true
$form.BackColor = 'Black'
$form.Cursor = [System.Windows.Forms.Cursors]::None  # Hide mouse

# Hide the taskbar
$taskbarHandle = (Get-Process explorer).MainWindowHandle
if ($taskbarHandle) {
    $null = Add-Type @"
    using System;
    using System.Runtime.InteropServices;
    public class User32 {
        [DllImport("user32.dll")]
        [return: MarshalAs(UnmanagedType.Bool)]
        public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
    }
"@
    [User32]::ShowWindow($taskbarHandle, 0) # 0 = Hide window
}

# Lock input (block mouse and keyboard)
$signature = @"
[DllImport("user32.dll")]
public static extern bool BlockInput(bool fBlockIt);
"@
Add-Type -MemberDefinition $signature -Namespace User32 -Name BlockInputClass
[User32.BlockInputClass]::BlockInput($true)

# Color list
$colors = @(
    [System.Drawing.Color]::Red,
    [System.Drawing.Color]::Green,
    [System.Drawing.Color]::Blue,
    [System.Drawing.Color]::Yellow,
    [System.Drawing.Color]::Magenta,
    [System.Drawing.Color]::Cyan,
    [System.Drawing.Color]::White
)

# Show the form
$form.Show()

# Start changing colors
while ($true) {
    foreach ($color in $colors) {
        $form.BackColor = $color
        $form.Refresh()
        Start-Sleep -Milliseconds 500
    }
}

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object Windows.Forms.Form
$form.WindowState = 'Maximized'
$form.FormBorderStyle = 'None'
$form.TopMost = $true
$form.BackColor = 'Black'

$colors = @(
    [System.Drawing.Color]::Blue,
    [System.Drawing.Color]::Red,
    [System.Drawing.Color]::Green,
    [System.Drawing.Color]::Yellow,
    [System.Drawing.Color]::Magenta,
    [System.Drawing.Color]::Cyan,
    [System.Drawing.Color]::White
)

$form.Show()

while ($true) {
    if ([console]::KeyAvailable) {
        $key = [console]::ReadKey($true)
        if ($key.Key -eq 'D') {
            $form.Close()
            exit
        }
    }

    foreach ($color in $colors) {
        $form.BackColor = $color
        $form.Refresh()
        Start-Sleep -Milliseconds 500
    }
}

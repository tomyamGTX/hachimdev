Add-Type -AssemblyName System.Drawing
$webRoot = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../web'))
function Write-BrandIcon([string]$relativePath, [int]$size, [bool]$maskable = $false) {
    $canvas = New-Object Drawing.Bitmap(1024, 1024)
    $graphics = [Drawing.Graphics]::FromImage($canvas)
    $graphics.SmoothingMode = [Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $graphics.TextRenderingHint = [Drawing.Text.TextRenderingHint]::AntiAliasGridFit
    $graphics.Clear([Drawing.Color]::Transparent)
    if ($maskable) { $graphics.Clear([Drawing.ColorTranslator]::FromHtml('#0D0D12')) }
    $bounds = New-Object Drawing.Rectangle(32, 32, 960, 960)
    $gradient = New-Object Drawing.Drawing2D.LinearGradientBrush($bounds, [Drawing.ColorTranslator]::FromHtml('#7C5CFC'), [Drawing.ColorTranslator]::FromHtml('#00D9FF'), 45)
    $graphics.FillEllipse($gradient, $bounds)
    $graphics.FillEllipse([Drawing.Brushes]::White, 124, 124, 776, 776)
    $dark = New-Object Drawing.SolidBrush([Drawing.ColorTranslator]::FromHtml('#0D0D12'))
    $graphics.FillEllipse($dark, 150, 150, 724, 724)
    # Geometric H stays legible even at 16px, without font dependencies.
    $graphics.FillRectangle([Drawing.Brushes]::White, 310, 300, 112, 424)
    $graphics.FillRectangle([Drawing.Brushes]::White, 602, 300, 112, 424)
    $graphics.FillRectangle([Drawing.Brushes]::White, 400, 456, 224, 112)
    $output = New-Object Drawing.Bitmap($size, $size)
    $resizer = [Drawing.Graphics]::FromImage($output)
    $resizer.InterpolationMode = [Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $resizer.DrawImage($canvas, 0, 0, $size, $size)
    $output.Save((Join-Path $webRoot $relativePath), [Drawing.Imaging.ImageFormat]::Png)
    $resizer.Dispose(); $output.Dispose(); $gradient.Dispose(); $dark.Dispose(); $graphics.Dispose(); $canvas.Dispose()
}
Write-BrandIcon 'favicon.png' 48
Write-BrandIcon 'icons/favicon-16.png' 16
Write-BrandIcon 'icons/favicon-32.png' 32
Write-BrandIcon 'icons/apple-touch-icon.png' 180
Write-BrandIcon 'icons/Icon-192.png' 192
Write-BrandIcon 'icons/Icon-512.png' 512
Write-BrandIcon 'icons/Icon-maskable-192.png' 192 $true
Write-BrandIcon 'icons/Icon-maskable-512.png' 512 $true

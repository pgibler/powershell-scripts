param (
    # The file whose pixel format will be checked. This call will fail on non-image files.
    [Parameter(Mandatory=$true)][string]$file
 )

# Get the absolute path to the file. This script therefore supports relative paths.
$absoluteFile = (Resolve-Path -Path $file).ToString()

# Load the System.Drawing library.
[Void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

# Create a Bitmap object from the input file.
# This will create a file handle to the image file.
$bmp = New-Object System.Drawing.Bitmap($absoluteFile)

# Create an output string containing the pixel format of the image.
$format = [string]::Format("`r`n{0}`r`n",$bmp.PixelFormat)

# Output the format to the console.
Write-Output $format

# Dispose of the file handle.
$bmp.Dispose()
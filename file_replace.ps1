param (
    # Root directory from which the file search will be performed.
    [Parameter(Mandatory=$true)][string]$rootDir,
    # The file to replace. Supports filtering using the -Filter option of the Get-ChildItem method.
    [Parameter(Mandatory=$true)][string]$fileFilter,
    # The file to include in place of the old file.
    [Parameter(Mandatory=$true)][string]$replacementFile
 )

# Check that the replacement file exists.
if(Test-Path $replacementFile) {

  # Get all files that are children of the root directory and match the file filter. Recursively gather descendants of the root directory.
  $files = Get-ChildItem -Path $rootDir -Filter $fileFilter -Recurse

  # Iterate the matched files.
  ForEach ($file In $files)
  {
      Write-Host 'Replacing:'$file.FullName
      # Replace the existing file with the replacement file.
      Copy-Item -Path $replacementFile -Destination $file.FullName -Force
  }
}
else
{
  Write-Host 'Replacement file not found.'
}
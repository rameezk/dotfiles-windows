Write-Debug "[..] Beginning bootstrap process"

# Setup directories
Write-Debug "[..] Getting directories"
$profileDir = Split-Path -parent $profile
Write-Debug "[..] profileDir = $profileDir"
$componentDir = Join-Path $profileDir "components"
Write-Debug "[..] componentDir = $componentDir"

# Create Directories
Write-Debug "[..] Creating directories"
New-Item $profileDir -ItemType Directory -Force -ErrorAction SilentlyContinue
New-Item $componentDir -ItemType Directory -Force -ErrorAction SilentlyContinue

# Copy Files
Write-Debug "[..] Copying over *.ps1 scripts to execution directory"
Copy-Item -Path ./*.ps1 -Destination $profileDir -Exclude "bootstrap.ps1"

Write-Debug "[..] Copying over component scripts to execution directory"
Copy-Item -Path ./components/** -Destination $componentDir -Include **

Write-Debug "[..] Copying over home scripts to execution directory"
Copy-Item -Path ./home/** -Destination $home -Include **

# Cleaning up
Write-Debug "[..] Cleaning up"
Remove-Variable componentDir
Remove-Variable profileDir
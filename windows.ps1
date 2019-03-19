Write-Host "[..] Configuring Windows..." -ForegroundColor "Yellow"
# Check to see if we are currently running "as Administrator"
if (!(Verify-Elevated)) {
  $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
  $newProcess.Arguments = $myInvocation.MyCommand.Definition;
  $newProcess.Verb = "runas";
  [System.Diagnostics.Process]::Start($newProcess);

  exit
}

Write-Host "[..] Enabling Bash on Windows"
Enable-WindowsOptionalFeature -Online -All -FeatureName "Microsoft-Windows-Subsystem-Linux" -NoRestart -WarningAction SilentlyContinue | Out-Null
Write-Host "[..] Downloading Ubuntu"
$ubuntuTempDir = Join-Path $env:TEMP "ubuntu"
Push-Location $ubuntuTempDir
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -Uri "https://aka.ms/wsl-ubuntu-1804" -OutFile Ubuntu.appx -UseBasicParsing
Write-Host "[..] Installing Ubuntu"
Add-AppxPackage -Path .\Ubuntu.appx
Pop-Location

Write-Host "[..] Done"
Start-Sleep -s 5

exit

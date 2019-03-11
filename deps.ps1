# Check to see if we are currently running "as Administrator"
if (!(Verify-Elevated)) {
    $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
    $newProcess.Arguments = $myInvocation.MyCommand.Definition;
    $newProcess.Verb = "runas";
    [System.Diagnostics.Process]::Start($newProcess);
 
    exit
 }

 ### Update Help for Modules
# Write-Host "Updating Help..." -ForegroundColor "Yellow"
# Update-Help -Force

### Package Providers
Write-Host "Installing Package Providers..." -ForegroundColor "Yellow"
Get-PackageProvider NuGet -Force | Out-Null
Get-PackageProvider Chocolatey -Force
Set-PackageSource -Name chocolatey -Trusted

# ### Chocolatey
Write-Host "Installing Desktop Utilities..." -ForegroundColor "Yellow"
if ((which cinst) -eq $null) {
    iex (new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')
    Refresh-Environment
    Write-Host "[..] Enabling automatic confirmation for choco"
    choco feature enable -n allowGlobalConfirmation
}

# system and cli
choco install curl                --limit-output
choco install git.install         --limit-output -params '"/GitAndUnixToolsOnPath /NoShellIntegration"'

#browsers
choco install GoogleChrome        --limit-output; <# pin; evergreen #> choco pin add --name GoogleChrome        --limit-output
choco install Firefox             --limit-output; <# pin; evergreen #> choco pin add --name Firefox             --limit-output

# The Codez
choco install vim                 --limit-output
choco install visualstudiocode    --limit-output
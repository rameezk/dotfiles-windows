# DOTFILES-WINDOWS

> My collection of Windows friendly dotfiles

Based heavily off [these dotfiles](https://github.com/jayharris/dotfiles-windows).

## Running
### New Machine
If it's a new machine, you probably won't be able to execute Powershell scripts yet. Running the following will allow you execute both local scripts and scripts from the internet. You should probably change this back to RemoteSigned (can execute any local scripts but not unsigned scripts from the internet) afterword. 

You'll need to run the below command in a Powershell console with Administrator privileges.
```powershell
Set-ExecutionPolicy Unrestricted
```

At this point, you probably don't have Git installed, so you can bootstrap the process initally without Git. This script will download this entire repo as a zip file, unzip it, copy over all files to your `$profile` directory and install all dependencies. 
```powershell
iex ((new-object net.webclient).DownloadString('https://raw.github.com/rameezk/dotfiles-windows/master/setup/new-machine.ps1'))
```

## Debugging and Verbosity
These script contain debug statements. If you'd like to turn it on:
```powershell
$DebugPreference = "continue"
```
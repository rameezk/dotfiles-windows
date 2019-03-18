# DOTFILES-WINDOWS

> My collection of Windows friendly dotfiles

Based heavily off [these dotfiles](https://github.com/jayharris/dotfiles-windows).

## Running
### New Machine
If it's a new machine, you probably won't be able to execute Powershell scripts yet. Running the following will allow you to run any local unsigned scripts but only signed scripts from the internet.

You'll need to run the below command in a Powershell console with Administrator privileges.
```powershell
Set-ExecutionPolicy RemoteSigned
```

## Debugging and Verbosity
These script contain debug statements. If you'd like to turn it on:
```powershell
$DebugPreference = "continue"
```
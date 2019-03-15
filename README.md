# DOTFILES-WINDOWS

> My collection of Windows friendly dotfiles

## Running
### New Machine
If it's a new machine, you probably won't be able to execute Powershell scripts yet. Running the following will allow you to run any local unsigned scripts but only signed scripts from the internet.
```powershell
set-executionpolicy remotesigned
```

## Debugging and Verbosity
These script contain debug statements. If you'd like to turn it on:
```powershell
$DebugPreference = "continue"
```
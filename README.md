# WindowsEnvSetup
In this repository, there are files for setup my Windows environment.

# How to use

All following processes are run in PowerShell.

1. `Set-ExecutionPolicy RemoteSigned -scope CurrentUser`.
1. `iex (new-object net.webclient).downloadstring('https://get.scoop.sh')`
1. `scoop install openssh git`
1. `git config --global user.name "Your name"`
1. `git config --global user.email "Your email address"`
1. `git clone https://github.com/MinoruSekine/WindowsEnvSetup.git`
1. `cd WindowsEnvSetup`
1. `./setup.ps1`

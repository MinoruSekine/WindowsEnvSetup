![Checks](https://github.com/MinoruSekine/WindowsEnvSetup/workflows/Checks/badge.svg)

# WindowsEnvSetup
In this repository, there are files for setup my Windows environment.

# How to use

All following processes are run in PowerShell.

## Install Scoop

1. `Set-ExecutionPolicy RemoteSigned -scope CurrentUser`.
1. `iex (new-object net.webclient).downloadstring('https://get.scoop.sh')`

## Configure proxy for Sccop (if necessary)

1. `scoop config proxy your.proxy.server:port`

## Install OpenSSH and git (if not available)

1. `scoop install openssh git`

## Configure git (if you have not done)

These steps are only for example.

1. `git config --global user.name "Your name"`
1. `git config --global user.email "Your email address"`

## Clone scripts and run

1. `git clone https://github.com/MinoruSekine/WindowsEnvSetup.git`
1. `cd WindowsEnvSetup`
1. `./setup.ps1`

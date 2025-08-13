# wininit

## Environment

Prior to installation of software, set up the XDG evnironment variables.

```powershell
[System.Environment]::SetEnvironmentVariable("XDG_CACHE_HOME", "%USERPROFILE%\.cache", "User")
[System.Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME", "%USERPROFILE%\.config", "User")
[System.Environment]::SetEnvironmentVariable("XDG_DATA_HOME", "%USERPROFILE%\.local\share", "User")
[System.Environment]::SetEnvironmentVariable("XDG_STATE_HOME", "%USERPROFILE%\.local\state", "User")
```

## Install via winget

Initialize `winget`.

```powershell
winget source update
winget upgrade --all
```
Now, install the following via `winget`.

TODO: Figure out a way to not require admin prompt.

```powershell
# as admin
winget install `
Microsoft.PowerShell  `
Microsoft.WSL `
Microsoft.WindowsTerminal `
Microsoft.PowerToys `
Microsoft.VisualStudioCode `
Microsoft.Git `
JanDeDobbeleer.OhMyPosh `
MartinStorsjo.LLVM-MinGW.MSVCRT `
Neovim.Neovim `
Burntsushi.ripgrep.MSVC `
sharkdp.fd `
OpenJS.NodeJS `
Python.Python.3.13 `
zig.zig `
7zip.7zip `
Logitech.OptionsPlus `
Google.Chrome `
Intel.IntelDriverAndSupportAssistant `
--accept-package-agreements
```

Go to the Microsoft store and get updates as well.

## Install

### PowerShell modules

```powershell
Install-Module -Name Microsoft.WinGet.Client
Install-Module -Name Terminal-Icons
```

### LazyVim

```powershell
git clone https://github.com/LazyVim/starter $env:XDG_CONFIG_HOME\nvim
Remove-Item $env:XDG_CONFIG_HOME\nvim\.git -Recurse -Force
```

### Oh My Posh set up

``` powershell
oh-my-posh font install CascadiaMono
```

### Microsoft Terminal settings

```powershell
terminal\init.ps1
```

## ssh key

Need to download both private and public keys prior to starting.

```powershell
# as admin
Get-Service -Name ssh-agent | Set-Service -StartupType Manual
Start-Service ssh-agent

# as user
ssh-add $env:USERPROFILE\.ssh\id_ed25519
```

## git

```powershell
git config --global user.email "warren@dubelyoo.com"
git config --global user.name "Warren"

git clone git@github.com:wsgavin/wininit.git 
git clone git@github.com:wsgavin/ubuntu-nix.git  

```

## vscode

```powershell
code  --install-extension bbenoist.Nix
code  --install-extension brettm12345.nixfmt-vscode
code  --install-extension DavidAnson.vscode-markdownlint
code  --install-extension ms-vscode.powershell
code  --install-extension esbenp.prettier-vscode
code  --install-extension dbaeumer.vscode-eslint
code  --install-extension ms-python.python
```

## Install and Unistall

### Install via Microsoft Store

- Microsoft Office
- Windows Notepad
- PC Manager


## If needed prior to install

### GitHub ssh setup

```powershell
# as a user
ssh-keygen -t ed25519 -C "your_email@example.com"

# as admin
Get-Service -Name ssh-agent | Set-Service -StartupType Manual
Start-Service ssh-agent

# as user
ssh-add $env:USERPROFILE\.ssh\id_ed25519
type $env:USERPROFILE\.ssh\id_ed25519.pub | clip
ssh -T git@github.com
```
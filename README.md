# Windows Init

## Environment

```powershell
[System.Environment]::SetEnvironmentVariable("XDG_CACHE_HOME", "%USERPROFILE%\.cache", "User")
[System.Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME", "%USERPROFILE%\.config", "User")
[System.Environment]::SetEnvironmentVariable("XDG_DATA_HOME", "%USERPROFILE%\.local\share", "User")
[System.Environment]::SetEnvironmentVariable("XDG_STATE_HOME", "%USERPROFILE%\.local\state", "User")
```

## Install via Store

- Microsoft Office
- Windows Notepad
- PC Manager

## Install Manually

- MinGW https://github.com/niXman/mingw-builds-binaries?tab=readme-ov-file

## Install via winget

```powershell
# Run this first to get past the promot
winget list


# These should install without interaction
winget install Microsoft.PowerShell
winget install Microsoft.WSL
winget install Microsoft.WindowsTerminal
winget install Microsoft.PowerToys 
winget install Microsoft.VisualStudioCode
winget install Microsoft.Git
winget install JanDeDobbeleer.OhMyPosh
winget install Neovim.Neovim
winget install Burntsushi.ripgrep.MSVC
winget install sharkdp.fd
winget install OpenJS.NodeJS
winget install Python.Python.3.13
winget install zig.zig
winget install 7zip.7zip
winget install Logitech.OptionsPlus
winget install Google.Chrome
winget install Intel.IntelDriverAndSupportAssistant
```

## Install

```powershell
git clone https://github.com/LazyVim/starter $env:XDG_CONFIG_HOME\nvim
Remove-Item $env:XDG_CONFIG_HOME\nvim\.git -Recurse -Force

wsl --install

oh-my-posh font install CascadiaMono
```

## ssh key

```powershell
# as users
ssh-keygen -t ed25519 -C "your_email@example.com"

# With administrative rights
Get-Service -Name ssh-agent | Set-Service -StartupType Manual
Start-Service ssh-agent

# as user
ssh-add c:/Users/YOU/.ssh/id_ed25519

type ~/.ssh/id_ed25519.pub | clip

ssh -T git@github.com
```

## git

```powershell

git config --global user.email "warren@dubelyoo.com"
git config --global user.name "Warren"

git clone git@github.com:wsgavin/wininit.git 
git clone git@github.com:wsgavin/ubuntu-nix.git  

```

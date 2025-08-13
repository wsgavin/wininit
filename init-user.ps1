[System.Environment]::SetEnvironmentVariable("XDG_CACHE_HOME", "%USERPROFILE%\.cache", "User")
[System.Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME", "%USERPROFILE%\.config", "User")
[System.Environment]::SetEnvironmentVariable("XDG_DATA_HOME", "%USERPROFILE%\.local\share", "User")
[System.Environment]::SetEnvironmentVariable("XDG_STATE_HOME", "%USERPROFILE%\.local\state", "User")

Install-Module -Name Microsoft.WinGet.Client
Install-Module -Name Terminal-Icons

git clone https://github.com/LazyVim/starter $env:XDG_CONFIG_HOME\nvim
Remove-Item $env:XDG_CONFIG_HOME\nvim\.git -Recurse -Force

oh-my-posh font install CascadiaMono

ssh-add $env:USERPROFILE\.ssh\id_ed25519

# git Configuration

git config --global user.email "warren@dubelyoo.com"
git config --global user.name "Warren"

# vscode Extensions

code  --install-extension bbenoist.Nix
code  --install-extension brettm12345.nixfmt-vscode
code  --install-extension DavidAnson.vscode-markdownlint
code  --install-extension ms-vscode.powershell
code  --install-extension esbenp.prettier-vscode
code  --install-extension dbaeumer.vscode-eslint
code  --install-extension ms-python.python
code  --install-extension EditorConfig.EditorConfig

# Microsoft Terminal Configurations

$actions = Get-Content -Path ".\terminal\actions.json" -Raw | ConvertFrom-Json
$profiles_defaults = Get-Content -Path ".\terminal\profiles.defaults.json" -Raw | ConvertFrom-Json
$schemes = Get-Content -Path ".\terminal\schemes.json" -Raw | ConvertFrom-Json
$themes = Get-Content -Path ".\terminal\themes.json" -Raw | ConvertFrom-Json

$terminal_settings = Get-Content -Path `
  "$ENV:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Raw | `
   ConvertFrom-Json

$terminal_settings.actions = $actions
$terminal_settings.profiles.defaults = $profiles_defaults
$terminal_settings.schemes = $schemes
$terminal_settings.themes = $themes

$json = $terminal_settings | ConvertTo-Json -Depth 10
$json | Set-Content -Path `
  "$ENV:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"


# Pull down repositories

git clone git@github.com:wsgavin/wininit.git
git clone git@github.com:wsgavin/ubuntu-nix.git

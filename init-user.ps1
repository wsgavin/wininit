# Setting up user environment variables.

# XDG

[System.Environment]::SetEnvironmentVariable("XDG_CACHE_HOME", "$env:USERPROFILE\.cache", "User")
[System.Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME", "$env:USERPROFILE\.config", "User")
[System.Environment]::SetEnvironmentVariable("XDG_DATA_HOME", "$env:USERPROFILE\.local\share", "User")
[System.Environment]::SetEnvironmentVariable("XDG_STATE_HOME", "$env:USERPROFILE\.local\state", "User")

# For the purposes of the script, exposing the environment variables set up earlier.

$env:XDG_CACHE_HOME = [System.Environment]::GetEnvironmentVariable("XDG_CACHE_HOME", "User")
$env:XDG_CONFIG_HOME = [System.Environment]::GetEnvironmentVariable("XDG_CONFIG_HOME", "User")
$env:XDG_DATA_HOME = [System.Environment]::GetEnvironmentVariable("XDG_DATA_HOME", "User")
$env:XDG_STATE_HOME = [System.Environment]::GetEnvironmentVariable("XDG_STATE_HOME", "User")

# Creating some initial directories.

New-Item -Path "$env:XDG_CONFIG_HOME" -ItemType Directory
New-Item -Path "$env:XDG_CONFIG_HOME\git" -ItemType Directory

# Installing LazyVim

$nvimConfigDirectory = "$env:XDG_CONFIG_HOME\nvim"

if (-not (Test-Path -Path $nvimConfigDirectory -PathType Container)) {

  Write-Host "Installing LazyVim"
  git clone https://github.com/LazyVim/starter $nvimConfigDirectory
  Remove-Item $nvimConfigDirectory\.git -Recurse -Force

}
else {
  Write-Host "SKIPPING: LazyVim already exists."
}

oh-my-posh font install CascadiaMono

ssh-add $env:USERPROFILE\.ssh\id_ed25519

# git Configuration

# Creating an empty config file so git does not create a .gitconfig file in
# the home directory.
New-Item -Path . -Name "$env:XDG_CONFIG_HOME\git\config" -ItemType "file" -Force

git config --global user.email "warren@dubelyoo.com"
git config --global user.name "Warren"
git config --global init.defaultBranch main
git config --global core.autocrlf false
git config --global core.eol lf

# vscode Extensions Installation

code  --install-extension bbenoist.Nix
code  --install-extension brettm12345.nixfmt-vscode
code  --install-extension DavidAnson.vscode-markdownlint
code  --install-extension ms-vscode.powershell
code  --install-extension esbenp.prettier-vscode
code  --install-extension dbaeumer.vscode-eslint
code  --install-extension ms-python.python
code  --install-extension EditorConfig.EditorConfig
code  --install-extension streetsidesoftware.code-spell-checker

# Microsoft Terminal Configurations

$terminalDirectory = "$env:PROJECTS_HOME\wininit\terminal"
$terminalSettingsFile = `
  "$ENV:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

$actions = Get-Content -Path "$terminalDirectory\actions.json" -Raw | ConvertFrom-Json
$profiles_defaults = Get-Content -Path "$terminalDirectory\profiles.defaults.json" -Raw | ConvertFrom-Json
$schemes = Get-Content -Path "$terminalDirectory\schemes.json" -Raw | ConvertFrom-Json
$themes = Get-Content -Path "$terminalDirectory\themes.json" -Raw | ConvertFrom-Json

$terminal_settings = Get-Content -Path "$terminalSettingsFile" -Raw | ConvertFrom-Json

$terminal_settings.actions = $actions
$terminal_settings.profiles.defaults = $profiles_defaults
$terminal_settings.schemes = $schemes
$terminal_settings.themes = $themes

$json = $terminal_settings | ConvertTo-Json -Depth 10
$json | Set-Content -Path "$terminalSettingsFile"

[System.Environment]::SetEnvironmentVariable("XDG_CACHE_HOME", "%USERPROFILE%\.cache", "User")
[System.Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME", "%USERPROFILE%\.config", "User")
[System.Environment]::SetEnvironmentVariable("XDG_DATA_HOME", "%USERPROFILE%\.local\share", "User")
[System.Environment]::SetEnvironmentVariable("XDG_STATE_HOME", "%USERPROFILE%\.local\state", "User")

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

git config --global user.email "warren@dubelyoo.com"
git config --global user.name "Warren"
git config --global core.autocrlf false
git config --global core.eol lf

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

$terminalDirectory = ".\terminal"
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


# Pull down repositories

$projectsDirectory = "$env:USERPROFILE\.projects"

if (-not (Test-Path -Path $projectsDirectory -PathType Container)) {
  # Create the directory if it doesn't exist
  New-Item -ItemType Directory -Path $projectsDirectory
  Write-Host "Directory created: $projectsDirectory"

  Write-Host "Pulling down project repos..."
  git clone git@github.com:wsgavin/wininit.git "$projectsDirectory\wininit"
  git clone git@github.com:wsgavin/ubuntu-nix.git "$projectsDirectory\ubuntu-nix"
}
else {
  Write-Host "SKIPPING: Projects repo directory exists."
}



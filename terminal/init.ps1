$schemes = Get-Content -Path ".\schemes.json" -Raw | ConvertFrom-Json
$themes = Get-Content -Path ".\themes.json" -Raw | ConvertFrom-Json
$profiles_defaults = Get-Content -Path ".\profile.defaults.json" -Raw | ConvertFrom-Json


$terminal_settings = Get-Content -Path "$ENV:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Raw | ConvertFrom-Json


$terminal_settings.schemes = $schemes
$terminal_settings.themes = $themes
$terminal_settings.profiles.defaults = $profiles_defaults
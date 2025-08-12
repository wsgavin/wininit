$actions = Get-Content -Path ".\actions.json" -Raw | ConvertFrom-Json
$profiles_defaults = Get-Content -Path ".\profiles.defaults.json" -Raw | ConvertFrom-Json
$schemes = Get-Content -Path ".\schemes.json" -Raw | ConvertFrom-Json
$themes = Get-Content -Path ".\themes.json" -Raw | ConvertFrom-Json



$terminal_settings = Get-Content -Path "$ENV:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Raw | ConvertFrom-Json

$terminal_settings.actions = $actions
$terminal_settings.profiles.defaults = $profiles_defaults
$terminal_settings.schemes = $schemes
$terminal_settings.themes = $themes


$json = $terminal_settings | ConvertTo-Json -Depth 10

$json | Set-Content -Path "$ENV:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
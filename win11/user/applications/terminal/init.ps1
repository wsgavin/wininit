# Microsoft Terminal Configurations

$terminalDirectory = ".\terminal"
$terminalSettingsFile = `
  "$ENV:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

$actions = Get-Content -Path "$terminalDirectory\actions.json" -Raw | ConvertFrom-Json
$profiles_defaults = Get-Content -Path "$terminalDirectory\profiles.defaults.json" -Raw | ConvertFrom-Json
$schemes = Get-Content -Path "$terminalDirectory\schemes.json" -Raw | ConvertFrom-Json
$themes = Get-Content -Path "$terminalDirectory\themes.json" -Raw | ConvertFrom-Json

$terminal_settings = Get-Content -Path "$terminalSettingsFile" -Raw | ConvertFrom-Json

$terminal_settings.'compatibility.enableUnfocusedAcrylic' = $true
$terminal_settings.copyFormatting = "none"
$terminal_settings.copyOnSelect = $true
$terminal_settings.'experimental.enableColorSelection' = $true
$terminal_settings.focusFollowMouse = $true
$terminal_settings.searchWebDefaultQueryUrl = "https://www.google.com/search?q=%22%s%22"
$terminal_settings.trimBlockSelection = $true
$terminal_settings.trimPaste = $true

$terminal_settings.actions = $actions
$terminal_settings.profiles.defaults = $profiles_defaults
$terminal_settings.schemes = $schemes
$terminal_settings.themes = $themes

$json = $terminal_settings | ConvertTo-Json -Depth 10
$json | Set-Content -Path "$terminalSettingsFile"


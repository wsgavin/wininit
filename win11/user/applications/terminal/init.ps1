# Microsoft Terminal Configurations

$terminalSettingsFile = `
  "$ENV:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

$actions = Get-Content -Path "$PSScriptRoot\json\actions.json" -Raw | ConvertFrom-Json
$profiles_defaults = Get-Content -Path "$PSScriptRoot\json\profiles.defaults.json" -Raw | ConvertFrom-Json
$schemes = Get-Content -Path "$PSScriptRoot\json\schemes.json" -Raw | ConvertFrom-Json
$themes = Get-Content -Path "$PSScriptRoot\json\themes.json" -Raw | ConvertFrom-Json

$terminal_settings = Get-Content -Path "$terminalSettingsFile" -Raw | ConvertFrom-Json


if ($null -ne $terminal_settings.'compatibility.enableUnfocusedAcrylic') {
  $terminal_settings.'compatibility.enableUnfocusedAcrylic' = $true
}
else {
  $terminal_settings | Add-Member -MemberType NoteProperty -Name "compatibility.enableUnfocusedAcrylic" -Value $true
}

if ($null -ne $terminal_settings.copyFormatting) {
  $terminal_settings.copyFormatting = "none"
}
else {
  $terminal_settings | Add-Member -MemberType NoteProperty -Name "copyFormatting" -Value "none"
}

if ($null -ne $terminal_settings.copyOnSelect) {
  $terminal_settings.copyOnSelect = $true
}
else {
  $terminal_settings | Add-Member -MemberType NoteProperty -Name "copyOnSelect" -Value $true
}

if ($null -ne $terminal_settings.'experimental.enableColorSelection') {
  $terminal_settings.'experimental.enableColorSelection' = $true
}
else {
  $terminal_settings | Add-Member -MemberType NoteProperty -Name "experimental.enableColorSelection" -Value $true
}

if ($null -ne $terminal_settings.focusFollowMouse) {
  $terminal_settings.focusFollowMouse = $true
}
else {
  $terminal_settings | Add-Member -MemberType NoteProperty -Name "focusFollowMouse" -Value $true
}

if ($null -ne $terminal_settings.searchWebDefaultQueryUrl) {
  $terminal_settings.searchWebDefaultQueryUrl = "https://www.google.com/search?q=%22%s%22"
}
else {
  $terminal_settings | Add-Member -MemberType NoteProperty -Name "searchWebDefaultQueryUrl" -Value "https://www.google.com/search?q=%22%s%22"
}

if ($null -ne $terminal_settings.trimBlockSelection) {
  $terminal_settings.trimBlockSelection = $true
}
else {
  $terminal_settings | Add-Member -MemberType NoteProperty -Name "trimBlockSelection" -Value $true
}

if ($null -ne $terminal_settings.trimPaste) {
  $terminal_settings.trimPaste = $true
}
else {
  $terminal_settings | Add-Member -MemberType NoteProperty -Name "trimPaste" -Value $true
}

# $terminal_settings.copyFormatting = "none"
# $terminal_settings.copyOnSelect = $true
# $terminal_settings.'experimental.enableColorSelection' = $true
# $terminal_settings.focusFollowMouse = $true
# $terminal_settings.searchWebDefaultQueryUrl = "https://www.google.com/search?q=%22%s%22"
# $terminal_settings.trimBlockSelection = $true
# $terminal_settings.trimPaste = $true

$terminal_settings.actions = $actions
$terminal_settings.profiles.defaults = $profiles_defaults
$terminal_settings.schemes = $schemes
$terminal_settings.themes = $themes

$json = $terminal_settings | ConvertTo-Json -Depth 10
$json | Set-Content -Path "$terminalSettingsFile"

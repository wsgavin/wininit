# Microsoft Terminal Configurations

#
# Add-KeyValuePair Updates or adds a key and the associate value to a psobject.
#
function Add-KeyValuePair {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
    [psobject]$json,

    [Parameter(Mandatory = $true)]
    [string]$Key,

    [Parameter(Mandatory = $true)]
    $Value
  )

  if ($json.psobject.Properties.Match($Key)) {
    $json.$Key = $Value
  }
  else {
    $json | Add-Member -MemberType NoteProperty -Name $Key -Value $Value
  }

}


$terminalSettingsFile = `
  "$ENV:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

$profiles_dir = "$PSScriptRoot\json\profiles"

$actions = Get-Content -Path "$PSScriptRoot\json\actions.json" -Raw | ConvertFrom-Json
$profiles_defaults = Get-Content -Path "$PSScriptRoot\json\profiles.defaults.json" -Raw | ConvertFrom-Json
$schemes = Get-Content -Path "$PSScriptRoot\json\schemes.json" -Raw | ConvertFrom-Json
$themes = Get-Content -Path "$PSScriptRoot\json\themes.json" -Raw | ConvertFrom-Json

$terminal_settings = Get-Content -Path "$terminalSettingsFile" -Raw | ConvertFrom-Json

# Update settings
$terminal_settings | Add-KeyValuePair -Key "copyFormatting" -Value "none"
$terminal_settings | Add-KeyValuePair -Key "copyOnSelect" -Value $true
$terminal_settings | Add-KeyValuePair -Key "experimental.enableColorSelection" -Value $true
$terminal_settings | Add-KeyValuePair -Key "focusFollowMouse" -Value $true
$terminal_settings | Add-KeyValuePair -Key "searchWebDefaultQueryUrl" -Value "https://www.google.com/search?q=%22%s%22"
$terminal_settings | Add-KeyValuePair -Key "trimBlockSelection" -Value $true
$terminal_settings | Add-KeyValuePair -Key "trimPaste" -Value $true

$terminal_settings.actions = $actions
$terminal_settings.profiles.defaults = $profiles_defaults
$terminal_settings.schemes = $schemes
$terminal_settings.themes = $themes

# Add the custom profiles
$files = Get-ChildItem -Path $profiles_dir -Filter "*.json" -File

# Loop through the custom profiles and add them to the settings
# TODO add logic to check if the profile exists already.
foreach ($file in $files) {
  $terminal_settings.profiles.list += Get-Content -Path $file -Raw | ConvertFrom-Json
}

# Convert the json object to a string and save to a file
$json = $terminal_settings | ConvertTo-Json -Depth 10
$json | Set-Content -Path "$terminalSettingsFile"

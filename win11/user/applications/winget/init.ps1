#
# Initialization script for winget
#
# CAUTION: This will reset current configurations.
#

# Current settings.json file.
# TODO: Add logic for other locations for settings
#
$wingetSettingsFile = "$ENV:LOCALAPPDATA\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\settings.json"

# Read the settings to be initialized.
$settings = Get-Content -Path "$PSScriptRoot\json\settings.json" -Raw | ConvertFrom-Json

# Read the current settings.json file
$winget_settings = Get-Content -Path "$wingetSettingsFile" -Raw | ConvertFrom-Json

# Rewrite the settings.json file with the new one.
$winget_settings = $settings

# Covert to json text and write to the settings.json file.
$json = $winget_settings | ConvertTo-Json -Depth 10
$json | Set-Content -Path "$wingetSettingsFile"

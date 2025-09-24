#
# Setup script for winget
#

$wingetSettingsFile = "$ENV:LOCALAPPDATA\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\settings.json"

$settings = Get-Content -Path "json\actions.json" -Raw | ConvertFrom-Json

$winget_settings = Get-Content -Path "$wingetSettingsFile" -Raw | ConvertFrom-Json

$winget_settings = $settings

$json = $winget_settings | ConvertTo-Json -Depth 10
$json | Set-Content -Path "$wingetSettingsFile"



$wingetSettingsFile = "$ENV:LOCALAPPDATA\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\settings.json"

$winget_settings = Get-Content -Path "$wingetSettingsFile" -Raw | ConvertFrom-Json

$winget_settings | Add-Member -MemberType NoteProperty -Name "source" -Value @{ autoUpdateIntervalInMinutes = 3 }
$winget_settings | Add-Member -MemberType NoteProperty -Name "visual" -Value @{ progressBar = "rainbow"; enableSixels = $true }
$winget_settings | Add-Member -MemberType NoteProperty -Name "telemetry" -Value @{ disable = $true }

$json = $winget_settings | ConvertTo-Json -Depth 10
$json | Set-Content -Path "$wingetSettingsFile"

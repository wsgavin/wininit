$profileDir = "$ENV:OneDrive\Documents\PowerShell"

Copy-Item -Path "$PSScriptRoot\profile\Microsoft.PowerShell_profile.ps1" -Destination $profileDir

# Installing PowerShell modules

if (-not (Get-Module -ListAvailable -Name Terminal-Icons)) {
  Install-Module -Name Terminal-Icons -Repository PSGallery
}

if (-not (Get-Module -ListAvailable -Name Microsoft.WinGet.Client)) {
  Install-Module -Name Microsoft.WinGet.Client
}


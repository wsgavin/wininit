if (-not (Get-Module -ListAvailable -Name Terminal-Icons)) {
  Install-Module -Name Terminal-Icons
}

if (-not (Get-Module -ListAvailable -Name Microsoft.WinGet.Client)) {
  Install-Module -Name Microsoft.WinGet.Client
}

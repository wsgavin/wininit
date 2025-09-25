
$(Get-Date).ToString() + " " + $(Get-TimeZone).ToString()
Write-Host ""

if (Get-Module -ListAvailable -Name Terminal-Icons) {
  Import-Module -Name Terminal-Icons
}

if (Get-Module -ListAvailable -Name Microsoft.WinGet.Client) {
  Import-Module -Name Microsoft.WinGet.CommandNotFound
}

if (Get-Module -ListAvailable -Name PSWindowsUpdate) {
  Import-Module -Name PSWindowsUpdate 
}

# Aliases and functions for linux command equivalents (best we can)
Set-Alias which Get-Command
function grep {
  param (
    [string]$Pattern,
    [string]$File
  )
  Select-String -Pattern $Pattern -Path $File
}

function touch {
  param (
    [string]$FileName
  )

  if (-Not (Test-Path $FileName)) {
    New-Item -ItemType File -Name $FileName -Force
  }
  else {
    (Get-Item $FileName).LastWriteTime = Get-Date
  }

}

# Alias for commands
Set-Alias vi nvim

Function WinGetUpdate {
  winget --version
  winget source update
  winget upgrade
}

Function WinGetUpdateAll {
  winget --version
  winget source update
  winget upgrade --all
}

Function OfficeUpdate {
  & "C:\Program Files\Common Files\microsoft shared\ClickToRun\OfficeC2RClient.exe" /update user
}

New-Alias -Name wu -Value WinGetUpdate
New-Alias -Name wua -Value WinGetUpdateAll
New-Alias -Name ou -Value OfficeUpdate

oh-my-posh init pwsh | Invoke-Expression

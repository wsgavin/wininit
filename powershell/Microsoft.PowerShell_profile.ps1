
$(Get-Date).ToString() + " " + $(Get-TimeZone).ToString()
Write-Host ""

Import-Module -Name Terminal-Icons
Import-Module -Name Microsoft.WinGet.CommandNotFound

# Aliases
New-Alias which Get-Command
New-Alias vi nvim

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

#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\paradox.omp.json" | Invoke-Expression
oh-my-posh init pwsh | Invoke-Expression

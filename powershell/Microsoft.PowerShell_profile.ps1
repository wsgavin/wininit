
$(Get-Date).ToString() + " " + $(Get-TimeZone).ToString()
Write-Host ""

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

Function OfficeUpdate { & "C:\Program Files\Common Files\microsoft shared\ClickToRun\OfficeC2RClient.exe" /update user }

New-Alias -Name wu -Value WinGetUpdate
New-Alias -Name wua -Value WinGetUpdateAll

New-Alias -Name ou -Value OfficeUpdate

#  if ($env:WT_Session) {
#    Invoke-Expression (&starship init powershell)
 
#    $ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"
#    $ENV:STARSHIP_CACHE = "$HOME\.cache\starship"
#    $ENV:STARSHIP_LOG = "trace starship timings"
 
#    $USER = $ENV:USERNAME
#  }

#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58

Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
        $Local:word = $wordToComplete.Replace('"', '""')
        $Local:ast = $commandAst.ToString().Replace('"', '""')
        winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}
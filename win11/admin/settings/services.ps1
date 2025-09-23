Get-Service -Name ssh-agent | Set-Service -StartupType Automatic
Start-Service ssh-agent

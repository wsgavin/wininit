
# Application Setups

.\win11\user\applications\nvim.ps1
.\win11\user\applications\oh-my-posh.ps1
.\win11\user\applications\ssh.ps1
.\win11\user\applications\git.ps1
.\win11\user\applications\code.ps1
.\win11\user\applications\terminal.ps1

# User Preferences

.\win11\user\settings\desktop.ps1
.\win11\user\settings\taksbar.ps1


# Pull down repositories

# $projectsDirectory = "$env:USERPROFILE\.projects"

# if (-not (Test-Path -Path $projectsDirectory -PathType Container)) {
#   # Create the directory if it doesn't exist
#   New-Item -ItemType Directory -Path $projectsDirectory
#   Write-Host "Directory created: $projectsDirectory"

#   Write-Host "Pulling down project repos..."
#   git clone git@github.com:wsgavin/wininit.git "$projectsDirectory\wininit"
#   git clone git@github.com:wsgavin/ubuntu-nix.git "$projectsDirectory\ubuntu-nix"
# }
# else {
#   Write-Host "SKIPPING: Projects repo directory exists."
# }



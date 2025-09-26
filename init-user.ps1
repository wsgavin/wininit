

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



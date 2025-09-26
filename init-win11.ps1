# 1. Build a function to display the menu
function Show-Menu {
    param (
        [string]$Title = 'My Menu'
    )
    Clear-Host
    Write-Host "================ $Title ================"

    Write-Host "1: PowerShell"
    Write-Host "2: winget"
    Write-Host "3: nvim"
    Write-Host "4: oh-my-posh"
    Write-Host "5: ssh"
    Write-Host "6: terminal"
    Write-Host "7: vscode"
    Write-Host "8: git"
    Write-Host "A: All"
    Write-Host "R: Repositories"
    Write-Host "Q: Quit."
}

# 2. Create a loop to show the menu until the user quits
do {
    Show-Menu # Display the menu
    $choice = Read-Host "Please make a selection" # Get user choice

    # 3. Use a switch statement to act on the choice
    switch ($choice) {
        '1' {
            Clear-Host
            Write-Host "Initializing PowerShell..."
            .\win11\user\applications\powershell\init.ps1
            pause # Wait for user to press Enter
        }
        '2' {
            Clear-Host
            Write-Host "Initializing winget..."
            .\win11\user\applications\winget\init.ps1
            Get-Date
            pause
        }
        '3' {
            Clear-Host
            Write-Host "Initializing nvim..."
            .\win11\user\applications\nvim\init.ps1
            Get-Date
            pause
        }
        '4' {
            Clear-Host
            Write-Host "Initializing Oh My Posh..."
            .\win11\user\applications\oh-my-posh\init.ps1
            Get-Date
            pause
        }
        '5' {
            Clear-Host
            Write-Host "Initializing ssh..."
            .\win11\user\applications\ssh\init.ps1
            Get-Date
            pause
        }
        '6' {
            Clear-Host
            Write-Host "Initializing Microsoft Terminal..."
            .\win11\user\applications\terminal\init.ps1
            Get-Date
            pause
        }
        '7' {
            Clear-Host
            Write-Host "Initializing Visual Studio Code..."
            .\win11\user\applications\vscode\init.ps1
            Get-Date
            pause
        }
        '8' {
            Clear-Host
            Write-Host "Initializing git..."
            .\win11\user\applications\git\init.ps1
            Get-Date
            pause
        }
        'a' {
            Write-Host "Initializing all..."
            .\win11\user\applications\powershell\init.ps1
            .\win11\user\applications\winget\init.ps1
            .\win11\user\applications\nvim\init.ps1
            .\win11\user\applications\oh-my-posh\init.ps1
            .\win11\user\applications\ssh\init.ps1
            .\win11\user\applications\terminal\init.ps1
            .\win11\user\applications\vscode\init.ps1
            .\win11\user\applications\git\init.ps1
        }
        'r' {
            # Pull down repositories

            $projectsDirectory = "$env:USERPROFILE\.projects"

            if (-not (Test-Path -Path $projectsDirectory -PathType Container)) {
                # Create the directory if it doesn't exist
                New-Item -ItemType Directory -Path $projectsDirectory
                Write-Host "Directory created: $projectsDirectory"

                Write-Host "Pulling down project repos..."
                git clone git@github.com:wsgavin/wininit.git "$projectsDirectory\wininit"
                git clone git@github.com:wsgavin/ubuntu-nix.git "$projectsDirectory\ubuntu-nix"
            }
            else {
                Write-Host "SKIPPING: Projects repo directory exists."
            }
        }
        'q' {
            Write-Host "Exiting..."
        }
        default {
            Write-Host "Invalid selection. Please try again." -ForegroundColor Red
            pause
        }
    }
}
until ($choice -eq 'q') # Loop continues until 'q' is entered

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
            pause # Wait for user to press Enter
        }
        '2' {
            Clear-Host
            Write-Host "Initializing winget..."
            .\win11\user\applications\winget\init.ps1
            Get-Date
            pause
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

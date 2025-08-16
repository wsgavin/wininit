# wininit

## Environment

### Set up ssh first

The ssh keys need to be in place so the wininit repo can be downloaded.

```powershell
New-Item -Path "%USERPROFILE\.ssh" -ItemType Directory
scp user@host:/dir/* %USERPROFILE%\.ssh
```

### Initialize `winget`

```powershell
winget list --accept-package-agreements
winget source update
winget upgrade --all
```

### Initialize environment variables, git and execute the admin and user script

Prior to installation of software, set up a few tings.

```powershell
winget install Microsoft.Git

# Setting up XDG user variables.
[System.Environment]::SetEnvironmentVariable("XDG_CACHE_HOME", "%USERPROFILE%\.cache", "User")
[System.Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME", "%USERPROFILE%\.config", "User")
[System.Environment]::SetEnvironmentVariable("XDG_DATA_HOME", "%USERPROFILE%\.local\share", "User")
[System.Environment]::SetEnvironmentVariable("XDG_STATE_HOME", "%USERPROFILE%\.local\state", "User")
[System.Environment]::SetEnvironmentVariable("PROJECTS_HOME", "%USERPROFILE%\.projects", "User")


$env:XDG_CACHE_HOME = [System.Environment]::GetEnvironmentVariable("XDG_CACHE_HOME", "User")
$env:XDG_CONFIG_HOME = [System.Environment]::GetEnvironmentVariable("XDG_CONFIG_HOME", "User")
$env:XDG_DATA_HOME = [System.Environment]::GetEnvironmentVariable("XDG_DATA_HOME", "User")
$env:XDG_STATE_HOME = [System.Environment]::GetEnvironmentVariable("XDG_STATE_HOME", "User")
$env:PROJECTS_HOME = [System.Environment]::GetEnvironmentVariable("PROJECTS_HOME", "User")

New-Item -Path "$XDG_CONFIG_HOME" -ItemType Directory
New-Item -Path "$XDG_CONFIG_HOME\git" -ItemType Directory
New-Item -Path "$PROJECTS_HOME" -ItemType Directory

git clone git@github.com:wsgavin/wininit.git "$PROJECTS_HOME\wininit"
```

Close the Powershell window. Now, we can start the install scripts. The first one needs to be run by an admin.

```powershell
cd "$PROJECTS_HOME\wininit"
powershell -ExecutionPolicy Bypass -File .\init-admin.ps1
```

Now a script for user level.

```pwsh
cd "$PROJECTS_HOME\wininit"
init-user.ps1
```

Go to the Microsoft store and get updates and install the below.

- Microsoft Office
- Windows Notepad
- PC Manager

## If needed prior to install

### GitHub ssh setup

```powershell
# as a user
ssh-keygen -t ed25519 -C "your_email@example.com"

# as admin
Get-Service -Name ssh-agent | Set-Service -StartupType Manual
Start-Service ssh-agent

# as user
ssh-add $env:USERPROFILE\.ssh\id_ed25519
type $env:USERPROFILE\.ssh\id_ed25519.pub | clip
ssh -T git@github.com
```

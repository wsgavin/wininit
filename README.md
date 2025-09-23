# wininit

## Environment

### Set up ssh first

The ssh keys need to be in place so the wininit repo can be downloaded.

```powershell
New-Item -Path "$env:USERPROFILE\.ssh" -ItemType Directory
scp user@host:/dir/* $env:USERPROFILE\.ssh
```

### Initialize `winget`

Running `winget` the first time requires the user to respond to a prompt.

```powershell
winget list
```

### Initialize `git` and clone `wininit`

The commands below will install `git`, add it to the Path, create a projects directory and clone the `wininit` repository.

```powershell
winget install Microsoft.Git
$env:Path += ";$env:ProgramFiles\Git\cmd"

[System.Environment]::SetEnvironmentVariable("PROJECTS_HOME", "$env:USERPROFILE\.projects", "User")
$env:PROJECTS_HOME = [System.Environment]::GetEnvironmentVariable("PROJECTS_HOME", "User")
New-Item -Path "$env:PROJECTS_HOME" -ItemType Directory

git clone git@github.com:wsgavin/wininit.git "$env:PROJECTS_HOME\wininit"
```

After completing the above, open a new PowerShell terminal.

### Installing `wininit` user

```powershell
cd "$env:PROJECTS_HOME\wininit"
powershell -ExecutionPolicy Bypass -File .\init-user.ps1
```

After completing the above, open a new PowerShell terminal.

### Installing `wininit` admin

```powershell
cd "$env:PROJECTS_HOME\wininit"
powershell -ExecutionPolicy Bypass -File .\init-admin.ps1
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

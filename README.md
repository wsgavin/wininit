# wininit

## Environment

Prior to installation of software, set up a few tings.

```powershell
winget source update
winget upgrade --all
winget install Microsoft.Git

New-Item -Path "$env:USERPROFILE/.projects" -ItemType Directory

git clone git@github.com:wsgavin/wininit.git
```

Now, we can start the install scripts. The first one needs to be run by an admin.

```powershell
cd $env:USERPROFILE/.projects/wininit
init-admin.ps1
```

Now a script for user level.

```powershell
cd $env:USERPROFILE/.projects/wininit
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

winget install `
Microsoft.PowerShell  `
Microsoft.WSL `
Microsoft.WindowsTerminal `
Microsoft.PowerToys `
Microsoft.VisualStudioCode `
JanDeDobbeleer.OhMyPosh `
MartinStorsjo.LLVM-MinGW.MSVCRT `
Neovim.Neovim `
Burntsushi.ripgrep.MSVC `
sharkdp.fd `
OpenJS.NodeJS `
Python.Python.3.13 `
zig.zig `
7zip.7zip `
Logitech.OptionsPlus `
Google.Chrome `
Intel.IntelDriverAndSupportAssistant `
Adobe.Acrobat.Reader.64-bit `
Espanso.Espanso `
Grammarly.Grammarly `
LastPass.LastPass `
Readdle.Spark `
Spotify.Spotify `
Trimble.SketchUp.2025 `
Microsoft.Office `
Canonical.Ubuntu


Get-Service -Name ssh-agent | Set-Service -StartupType Automatic
Start-Service ssh-agent

if (-not (Get-Module -ListAvailable -Name Terminal-Icons)) {
  Install-Module -Name Terminal-Icons
}

if (-not (Get-Module -ListAvailable -Name Microsoft.WinGet.Client)) {
  Install-Module -Name Microsoft.WinGet.Client
}

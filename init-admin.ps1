winget source update
winget upgrade --all

winget install `
Microsoft.PowerShell  `
Microsoft.WSL `
Microsoft.WindowsTerminal `
Microsoft.PowerToys `
Microsoft.VisualStudioCode `
Microsoft.Git `
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
--accept-package-agreements

Get-Service -Name ssh-agent | Set-Service -StartupType Automatic
Start-Service ssh-agent

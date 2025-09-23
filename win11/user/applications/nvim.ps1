$nvimConfigDirectory = "$env:XDG_CONFIG_HOME\nvim"

if (-not (Test-Path -Path $nvimConfigDirectory -PathType Container)) {

  Write-Host "Installing LazyVim"
  git clone https://github.com/LazyVim/starter $nvimConfigDirectory
  Remove-Item $nvimConfigDirectory\.git -Recurse -Force

}
else {
  Write-Host "SKIPPING: LazyVim already exists."
}

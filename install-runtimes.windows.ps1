Function Command-Valid {
  Param ($command)
  Try {
    if (Get-Command $command -ErrorAction SilentlyContinue) {
      Return $true
    }
    Return $false
  } Catch {
    Return $false
  }
}

# Install Scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

scoop install pkg-config openssl

# Install GCC
scoop install gcc

# Install Python
scoop install python
. .\runtimes\python.windows.ps1

# Install Node
scoop install nvm
powershell (cat .\runtimes\node)
. .\runtimes\node.windows.ps1

# Install Rust
scoop install rustup
rustup update
# rustup install stable
# rustup default stable
# rustup component add rust-src

# Install utilities
scoop install neofetch

# == Legacy ==
# $emoji_warning = [System.Char]::ConvertFromUtf32(9888)
# $emoji_check = [System.Char]::ConvertFromUtf32(9989)

# $exists_gcc = Command-Valid gcc
# $exists_python = Command-Valid python((python --version) | Out-String).Split().Length -ge 2
# $exists_nvm = Command-Valid nvm
# $exists_rustup = Command-Valid rustup

# Write-Host "Checking requirements... " -ForegroundColor "Yellow"
# if ($exists_gcc) { Write-Host $emoji_check " GCC Detected." -ForegroundColor "Green" }
# else { Write-Host $emoji_warning " GCC not detected." -ForegroundColor "Red" }
# if ($exists_python) { Write-Host $emoji_check " Python Detected." -ForegroundColor "Green" }
# else { Write-Host $emoji_warning " Python not detected." -ForegroundColor "Red" }
# if ($exists_nvm) { Write-Host $emoji_check " NVM Detected." -ForegroundColor "Green" }
# else { Write-Host $emoji_warning " NVM not detected." -ForegroundColor "Red" }
# if ($exists_rustup) { Write-Host $emoji_check " Rustup Detected." -ForegroundColor "Green" }
# else { Write-Host $emoji_warning " Rustup not detected." -ForegroundColor "Red" }


# if (!(
#   $exists_gcc -and
#   $exists_python -and
#   $exists_nvm -and
#   $exists_rustup
# )) {
#   Write-Host "More than one of requirements are not installed. Please install requirements first."
#   exit
# }

# . .\runtimes\python.windows.ps1
# powershell (cat .\runtimes\nodejs)
# . .\runtimes\nodejs.windows.ps1
# Rust not needed additional work after run rustup toolchain installer.

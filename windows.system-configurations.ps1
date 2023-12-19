. .\system.windows\system-configurations.ps1

New-item -Force -Path $PROFILE -type file
cat .\shell.posh\functions.ps1 >> $PROFILE

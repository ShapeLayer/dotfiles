# Basic commands
Function which($name) { Get-Command $name -ErrorAction SilentlyContinue | Select-Object Definition }
Function touch($file) { "" | Out-File $file -Encoding utf8 }

# Sudo
Function sudo() {
  if ($args.Length -eq 1) {
    start-process $args[0] -verb "runAs"
  }
  if ($args.Length -gt 1) {
    start-process $args[0] -ArgumentList $args[1..$args.Length] -verb "runAs"
  }
}

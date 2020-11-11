$pwsh_uri = "https://github.com/PowerShell/PowerShell/releases/download/v7.0.3/PowerShell-7.0.3-win-x86.msi"
$pwsh_msi = Join-Path -Path $ENV:TEMP -ChildPath "PowerShell-7.0.3-win-x86.msi"

Invoke-WebRequest -Uri $pwsh_uri -OutFile $pwsh_msi -UseBasicParsing
msiexec.exe /package $pwsh_msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1
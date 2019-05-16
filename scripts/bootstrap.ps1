# PowerShell

Set-Culture -CultureInfo de-DE
Set-WinUserLanguageList -LanguageList de-DE -Force

Set-ExecutionPolicy Bypass -Scope Process -Force

if (-not (Get-Command choco.exe -errorAction SilentlyContinue)) {
  iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

choco install -y --no-progress notepadplusplus

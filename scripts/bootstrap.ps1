# PowerShell

$NeedsRestart = $FALSE

Set-Culture -CultureInfo de-DE
Set-WinUserLanguageList -LanguageList de-DE -Force

Set-ExecutionPolicy Bypass -Scope Process -Force

function Test-Installed([String] $Command) {
  if (Get-Command -Name $Command -errorAction SilentlyContinue) {
    return $TRUE
  } else {
    return $FALSE
  }
}

if (-not (Test-Installed choco.exe)) {
  iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
  $NeedsRestart = $TRUE
}

if (-not (Test-Installed notepad++.exe)) {
  choco install -y --no-progress notepadplusplus
}

if (-not (Test-Path C:\local)) {
  mkdir C:\local
}
if (-not (Test-Path C:\local\eval-rearm.ps1)) {
  echo "Rearming evaluation for the VM..."
  slmgr -rearm
  $NeedsRestart = $TRUE

  echo "slmgr -dlv" | Out-File C:\local\eval-status.ps1
  echo "slmgr -rearm" | Out-File C:\local\eval-rearm.ps1
}

if ($NeedsRestart) {
  Restart-Computer -Force
}

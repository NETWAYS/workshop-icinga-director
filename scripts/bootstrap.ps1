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

$networks = Get-NetConnectionProfile

foreach ($network in $networks) {
  if ($network.NetworkCategory -ne "Private") {
    Set-NetConnectionProfile -Name $network.Name -NetworkCategory Private
  }
}

# Update firewall
netsh advfirewall firewall set rule group="network discovery" new enable=yes
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=yes

# Will be done by the user:
#netsh advfirewall firewall add rule name="Icinga 2" dir=in action=allow program="C:\Program Files\ICINGA2\sbin\icinga2.exe" enable=yes

#-ErrorAction SilentlyContinue
if ((Get-ExecutionPolicy) -ne "Unrestricted") {
  Set-ExecutionPolicy -ExecutionPolicy Bypass -Force -Scope LocalMachine
}

if ($NeedsRestart) {
  Restart-Computer -Force
}

Lab: Windows Agent Installation
===============================

* Create new host for `agent-windows.icinga.local`
    - with address `192.168.56.22`
    - Use template `windows host`, zone `satellite` and enable agent

* Start VM `agent-windows`

* Download MSI package on Windows from https://packages.icinga.com/windows

* Install MSI and skip setup wizard
  - ignore the Smartscreen warning via "More Info"

* Open Icinga Director on the Windows VM (http://master/)
  * Download agent script from Director to the Windows VM

* Open PowerShell as Administrator and run the script as follows

```
> cd \Users\Vagrant\Downloads
> .\icinga2-agent-kickstart.ps1
```

* Allow icinga2.exe in the Firewall, full path: `C:/Program Files/icinga2/sbin/icinga2.exe`
    - Search in Start for "Allow an app through firewall"
    - Also enable for public
* Check local log file for cluster connection
    - See `C:/ProgramData/icinga2/var/log/icinga2/icinga2.log`

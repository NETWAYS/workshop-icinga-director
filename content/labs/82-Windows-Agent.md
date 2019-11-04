Lab: Windows Agent Installation
===============================

* Create new host for `agent-windows.icinga.local`
    - with address `192.168.56.22`
    - Use template `windows host`, zone `satellite` and enable agent

* Start VM `agent-windows`

### On the VM

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

* Allow Icinga 2 in the Firewall:

```
> netsh advfirewall firewall add rule name="Icinga 2" dir=in action=allow program="C:\Program Files\ICINGA2\sbin\icinga2.exe" enable=yes
```

* Or manually, search in Start for "Allow an app through firewall":
  - `C:\Program Files\icinga2\sbin\icinga2.exe`, also enable for public

* Check local log file for cluster connection
  - See `C:\ProgramData\icinga2\var\log\icinga2\icinga2.log`

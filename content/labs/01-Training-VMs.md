Lab: Training VMs
=================

### Passwords

**SSH Login:** vagrant / vagrant (same password also for root) \
**Icinga Web Admin:** icingaadmin / icinga

### Virtual Machines

* **master** 192.168.33.11
* **satellite** 192.168.33.12
* **agent-linux** 192.168.33.21
* **agent-windows** 192.168.33.22

Also see /etc/hosts on your Notebook.

### Tasks

* Press the Windows Key and search for "VirtualBox"
  or "Oracle VM VirtualBox"
* Start master and satellite VM
* Login to all VMs by `ssh <hostname>`
* Inspect Icinga 2 Installation on "master" and "satellite"
    - check /etc/icinga2
    - icinga2 daemon -C
    - Check log if master and satellite are connected
* Open Firefox and browse to `http://master/`
* Login with icingaadmin and check if Icinga is running

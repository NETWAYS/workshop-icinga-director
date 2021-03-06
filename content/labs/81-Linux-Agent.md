Lab - Linux Agent Installation
==============================

* Create new host for `agent-linux.icinga.local`
    - with address `192.168.56.21`
    - Use template `linux host`, zone `satellite` and enable agent
* Start VM `agent-linux`
* Configure Icinga 2 Repository and install packages

```
sudo yum install -y https://packages.icinga.com/epel/icinga-rpm-release-7-latest.noarch.rpm
sudo yum install -y nagios-plugins-all icinga2
```

> Note: Copy & Paste the link from [packages.icinga.com/epel](https://packages.icinga.com/epel)

* Open the host in Director, and download the agent script to your notebook
* Copy from your notebook to the VM

```
scp icinga2-agent-kickstart.bash agent-linux:
```

- Then execute the script on the VM

```
cd /home/vagrant
sudo bash icinga2-agent-kickstart.bash
sudo icinga2 daemon -C
sudo systemctl start icinga2
sudo systemctl enable icinga2
sudo systemctl status icinga2
```

* Check local log file for cluster connection

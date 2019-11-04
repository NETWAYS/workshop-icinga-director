Lab: Linux Agent Installation
=============================

* Create new host for `agent-linux.icinga.local`
    - with address `192.168.56.21`
    - Use template `linux host`, zone `satellite` and enable agent
* Start VM `agent-linux`
* Configure Icinga 2 Repository and install packages

    # yum install -y https://packages.icinga.com/epel/icinga-rpm-release-7-latest.noarch.rpm

    # yum install -y nagios-plugins-all icinga2

> Note: Copy & Paste the link from https://packages.icinga.com/epel

* Download agent script from Director
* `scp icinga2-agent-kickstart.bash agent-linux:` from your notebook
* Then execute the script on the VM

    $ sudo bash icinga2-agent-kickstart.bash
    $ sudo icinga2 daemon -C
    $ sudo systemctl start icinga2

* Check local log file for cluster connection

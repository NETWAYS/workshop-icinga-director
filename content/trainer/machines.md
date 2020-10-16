Virtual Machines
================

## Preparing VMs

```
sudo yum install git
sudo yum install https://releases.hashicorp.com/vagrant/2.2.6/vagrant_2.2.6_x86_64.rpm

vagrant plugin install vagrant-hosts

vagrant box add bento/centos-7.6 --provider virtualbox
vagrant box add StefanScherer/windows_10 --provider virtualbox
```

Now we can clone this repository and bootstrap the VMs.

```
git clone https://github.com/NETWAYS/workshop-icinga-director.git
# or
git clone git@github.com:NETWAYS/workshop-icinga-director.git

cd workshop-director/

vagrant up
```

Make sure all changes are applied and no errors appear, you can repeat the provisioning as well:

```
vagrant provision
```

## Re-create ssh key

```bash
ssh-keygen -f config/insecure_ssh_key -m pem -t rsa -b 2048 -C "INSECURE SSH KEY for Icinga Director Workshop"
```

And update `profile::linux::ssh_keys` in `puppet/hieradata/common.yaml`.

## Export VMs

```bash
vagrant halt

./scripts/export-vms.sh
```

## Import to fresh Notebook

See files under `config/` and store them with the exported VMs.

`README.txt` explains how to use it on training notebook.

## Linux Accounts

SSH Login: `vagrant` with password `vagrant`

Root passwort: `vagrant`

Windows Account: `vagrant` with password `vagrant` (but auto login is enabled)

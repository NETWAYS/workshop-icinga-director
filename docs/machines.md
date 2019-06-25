Virtual Machines
================

## Preparing VMs

```
sudo yum install git
sudo yum install https://releases.hashicorp.com/vagrant/2.2.4/vagrant_2.2.4_x86_64.rpm

vagrant plugin install vagrant-hosts

vagrant box add bento/centos-7.6 --provider virtualbox
vagrant box add StefanScherer/windows_10 --provider virtualbox
```

Now we can clone this repository and bootstrap the VMs.

```
git clone https://git.icinga.com/training-private/workshop-director.git
# or
git clone git@git.icinga.com:training-private/workshop-director.git

cd workshop-director/

vagrant up
```

Make sure all changes are applied and no errors appear.

```
vagrant provision
```

## Export VMs

```bash
vagrant halt

for vm in $(VBoxManage list vms | grep workshop-director | awk -F'"' '{print $2}'); do
  name="$(awk -F_ '{print $2}' <<<"$vm")"
  echo "Updating $vm -> $name"
  VBoxManage modifyvm "$vm" --groups "/Icinga Director"
  VBoxManage sharedfolder remove "$vm" --name vagrant
  VBoxManage modifyvm "$vm" --natpf1 delete ssh
  VBoxManage modifyvm "$vm" --natpf1 delete rdp &>/dev/null || true
  VBoxManage modifyvm "$vm" --natpf1 delete winrm &>/dev/null || true
  VBoxManage modifyvm "$vm" --natpf1 delete winrm-ssl &>/dev/null || true
  VBoxManage modifyvm "$vm" --name "$name"
done
```

## Import to fresh Notebook

See files under `config/` and store them with the exported VMs.

```
```

## Linux Accounts

SSH Login: `vagrant` with password `vagrant`

Root passwort: `vagrant`

Windows Account: `vagrant` with password `vagrant` (but auto login is enabled)

#!/bin/bash

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

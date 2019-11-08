#!/bin/bash

set -ex

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

if [ ! -d out ]; then
  mkdir out
fi

export_options=( \
  --ovf20 --manifest --options manifest
  --vsys 0
  --vendor "NETWAYS - Icinga Director Workshop"
  --vendorurl "https://github.com/NETWAYS/workshop-icinga-director"
)

rm -f out/*.ova

VBoxManage export master -o out/master.ova "${export_options[@]}"
VBoxManage export satellite -o out/satellite.ova "${export_options[@]}"
VBoxManage export agent-linux -o out/agent-linux.ova "${export_options[@]}"
VBoxManage export agent-windows -o out/agent-windows.ova "${export_options[@]}"

#!/bin/bash

set -ex

cat ssh_config >> ~/.ssh/config
cp insecure_ssh_key ~/.ssh/id_rsa
cp insecure_ssh_key.pub ~/.ssh/id_rsa.pub
chmod go= ~/.ssh/*

sudo tee -a /etc/hosts < hosts

VBoxManage import --options keepallmacs master.ova
VBoxManage snapshot master take init

VBoxManage import --options keepallmacs satellite.ova
VBoxManage snapshot satellite take init

VBoxManage import --options keepallmacs agent-linux.ova
VBoxManage snapshot agent-linux take init

VBoxManage import --options keepallmacs agent-windows.ova
VBoxManage snapshot agent-windows take init

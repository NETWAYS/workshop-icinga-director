You need to import the included OVA file to re-create all VMs in VirtualBox.

    cat ssh_config >> ~/.ssh/config
    cp insecure_ssh_key ~/.ssh/id_rsa
    cp insecure_ssh_key.pub ~/.ssh/id_rsa.pub
    chmod go= ~/.ssh/*

    sudo tee -a /etc/hosts < hosts

Should no longer be required:

    #ip link show dev vboxnet1 || VBoxManage hostonlyif create
    #VBoxManage hostonlyif ipconfig vboxnet1 --ip 192.168.56.1

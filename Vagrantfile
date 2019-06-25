# -*- mode: ruby -*-
# vi: set ft=ruby :

DOMAIN_NAME = 'icinga.local'.freeze

Vagrant.configure('2') do |config|
  config.vm.box_check_update = false

  # Disable updates of vbguest tools
  config.vbguest.auto_update = false if Vagrant.has_plugin?('vagrant-vbguest')

  new_linux_vm config, 'master', '192.168.33.11'
  new_linux_vm config, 'satellite', '192.168.33.12'

  new_linux_vm config, 'agent-linux', '192.168.33.21'
  new_windows_vm config, 'agent-windows', '192.168.33.22'

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = '512'
  end

  config.vm.provision :hosts, sync_hosts: true
end

def new_vm(config, name, ip)
  config.vm.define name do |host|
    # host.vm.box = 'bento/centos-7.6'
    host.vm.hostname = "#{name}.#{DOMAIN_NAME}"

    host.vm.network 'private_network', ip: ip

    host.vm.provider 'virtualbox' do |vb|
      vb.customize [
        'modifyvm',  :id,
        '--groups',  '/Icinga Director',
        '--audio',   'none',
        '--usb',     'on',
        '--usbehci', 'off'
      ]
    end

    yield(host) if block_given?
  end
end

def new_linux_vm(config, name, ip)
  new_vm config, name, ip do |host|
    host.vm.box = 'bento/centos-7.6'

    host.vm.provision 'shell', path: 'scripts/bootstrap.sh'
    host.vm.provision 'shell', path: 'scripts/puppet-modules.sh'

    provision_puppet host

    yield(host) if block_given?
  end
end

def new_windows_vm(config, name, ip)
  new_vm config, name, ip do |host|
    host.vm.box = 'StefanScherer/windows_10'
    host.vm.hostname = name

    host.vm.provision 'shell' do |shell|
      shell.path = 'scripts/bootstrap.ps1'
    end

    host.vm.provider 'virtualbox' do |vb|
      vb.gui = true
      vb.memory = '1024'
    end

    yield(host) if block_given?
  end
end

def provision_puppet(host)
  host.vm.provision 'puppet' do |puppet|
    # Note: only works with vboxsf
    puppet.manifests_path = ['vm', '/vagrant/puppet']
    puppet.options = '--show_diff --hiera_config /vagrant/puppet/hiera.yaml'
  end
end

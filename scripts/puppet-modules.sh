#!/bin/bash

set -eu

module_path=/etc/puppetlabs/code/environments/production/modules

module_install() {
  if ! puppet module list | grep -q "$1"; then
    puppet module install "$@"
  fi
}

symlink_module() {
  target="$1"
  module_name="$(basename "$target")"

  if [ ! -e "${module_path}/${module_name}" ]; then
    echo "Creating symlink at ${module_path}/${module_name}"
    ln -svf "${target}" "${module_path}/${module_name}"
  fi
}

module_install puppetlabs-apache
module_install puppetlabs-ntp
module_install puppetlabs-mysql
module_install puppetlabs-stdlib
#module_install puppetlabs-vcsrepo

module_install lazyfrosch-vagrantenv

module_install icinga-icinga2
module_install icinga-icingaweb2

symlink_module /vagrant/puppet/profile
symlink_module /vagrant/puppet/role

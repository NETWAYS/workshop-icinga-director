#!/bin/bash

set -eu

module_install() {
  if ! puppet module list | grep -q "$1"; then
    puppet module install "$@"
  fi
}

module_install puppetlabs-apache
module_install puppetlabs-ntp
module_install puppetlabs-stdlib
#module_install puppetlabs-vcsrepo

module_install lazyfrosch-vagrantenv

module_install icinga-icinga2
module_install icinga-icingaweb2

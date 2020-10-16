#!/bin/bash

set -eu

module_path=/etc/puppetlabs/code/environments/production/modules

module_install() {
  if ! puppet module list | grep -q "$1"; then
    puppet module install --ignore-dependencies --force "$@"
  fi
}

git_module_install() {
  local name="$1" url="$2" revision="$3"
  local target="${module_path}/${name}"
  if ! command -v git &>/dev/null; then
    echo "Installing git"
    yum install -y git
  fi
  if [ ! -e "$target" ]; then
    echo "Cloning module ${name} from ${url}"
    git clone "$url" "$target" -b "$revision"
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

sync_module() {
  target="$1"
  module_name="$(basename "$target")"

  if [ -L "${module_path}/${module_name}" ]; then
    echo "Deleting old symlink ${module_path}/${module_name}"
    rm -f "${module_path}/${module_name}"
  fi

  echo "Syncing module from ${target} to ${module_path}/${module_name}"
  rsync -rlt "${target}/" "${module_path}/${module_name}/"
}

# dependencies
module_install puppetlabs-stdlib -v 6.5.0
module_install puppetlabs-translate -v 2.2.0
module_install puppetlabs-concat -v 6.2.0

module_install puppetlabs-apache -v 5.6.0
module_install puppetlabs-ntp -v 8.4.0
module_install puppetlabs-mysql -v 10.7.1
module_install puppetlabs-vcsrepo -v 3.1.1

module_install lazyfrosch-vagrantenv -v 0.2.1
module_install puppet-alternatives -v 3.0.0

module_install icinga-icinga -v 1.0.2
module_install icinga-icinga2 -v 3.0.0
module_install icinga-icingaweb2 -v 3.0.0

sync_module /vagrant/puppet/profile
sync_module /vagrant/puppet/role

class role::icinga_master {
  class { 'profile::icinga2':
    is_master => true,
  }

  include profile::icinga2::ido
  include profile::icinga2::ca

  include profile::icingaweb2
  include profile::apache
}

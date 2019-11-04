define profile::icingaweb2::module(
  $revision,
  $source      = "https://github.com/Icinga/icingaweb2-module-${name}.git",
  $module_path = '/usr/share/icingaweb2/modules',
  $enable      = true,
) {
  ensure_packages(['git'])

  vcsrepo { "icingaweb2-module-${name}":
    ensure   => present,
    path     => "${module_path}/${name}",
    source   => $source,
    revision => $revision,
    provider => 'git',
  }

  if $enable {
    $_link_ensure = link
  } else {
    $_link_ensure = absent
  }

  file { "/etc/icingaweb2/enabledModules/${name}":
    ensure => $_link_ensure,
    target => "${module_path}/${name}",
  }
}

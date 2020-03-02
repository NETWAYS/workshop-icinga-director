define profile::icingaweb2::module(
  $revision,
  $source       = "https://github.com/Icinga/icingaweb2-module-${name}.git",
  $module_path  = '/usr/share/icingaweb2/modules',
  $enable       = true,
  $daemon       = false,
  $daemon_name  = "icinga-${name}",
  $daemon_user  = "icinga${name}",
  $daemon_group = "icinga${name}",
  $daemon_home  = "/var/lib/icinga${name}",
  $daemon_source = undef,
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

  if $daemon {
    if $daemon_user {
      group { $daemon_group:
        ensure => present,
        system => true,
      }

      user { $daemon_user:
        ensure     => present,
        gid        => $daemon_group,
        groups     => ['icingaweb2'],
        system     => true,
        shell      => '/bin/false',
        home       => $daemon_home,
        managehome => true,
      }
    }

    if $daemon_source {
      Vcsrepo["icingaweb2-module-${name}"]

      -> file { "/etc/systemd/system/${daemon_name}.service":
        ensure => file,
        owner  => root,
        group  => root,
        mode   => '0644',
        source => $daemon_source,
      }

      -> exec { "icingaweb2::module::${name} systemctl daemon-reload":
        command     => 'systemctl daemon-reload',
        user        => 'root',
        path        => $::path,
        refreshonly => true,
      }
    }

    service { $daemon_name:
      ensure => running,
      enable => true,
    }
  }
}

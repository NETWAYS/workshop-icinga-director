class profile::icingaweb2 (
  $db_dbname     = 'icingaweb2',
  $db_username   = 'icingaweb2',
  $db_password   = 'icingaweb2',
  $ido_dbname    = 'icinga2',
  $ido_username  = 'icinga2',
  $ido_password  = 'icinga2',
  $api_username  = 'root',
  $api_password  = 'root',
  $extra_modules = {},
  $resources     = {},
) {
  include profile::apache
  include profile::mysql

  mysql::db { $db_dbname:
    user     => $db_username,
    password => $db_password,
    grant    => ['ALL'],
  }

  -> class { 'icingaweb2':
    import_schema => true,
    db_type       => 'mysql',
    db_host       => 'localhost',
    db_username   => $db_username,
    db_password   => $db_password,
    db_name       => $db_dbname,
  }

  class { 'icingaweb2::module::monitoring':
    ido_type          => 'mysql',
    ido_host          => 'localhost',
    ido_db_username   => $ido_username,
    ido_db_password   => $ido_password,
    ido_db_name       => $ido_dbname,
    commandtransports => {
      icinga2 => {
        transport => 'api',
        username  => $api_username,
        password  => $api_password,
      },
    },
  }

  Class['icinga::repos'] -> Class['icingaweb2']

  apache::custom_config { 'icingaweb2':
    source  => 'puppet:///modules/profile/icingaweb2.conf',
  }

  # PHP extra modules for Director and modules
  ensure_packages([
    'rh-php73-php-process',
    'rh-php73-php-pcntl',
    'rh-php73-php-soap',
  ])

  service { 'rh-php73-php-fpm':
    ensure  => running,
    enable  => true,
    require => Package['icingaweb2'],
  }

  $extra_modules.each |$name, $config| {
    profile::icingaweb2::module { $name:
      * => $config,
    }
  }

  $resources.each |$name, $config| {
    icingaweb2::config::resource { $name:
      * => $config,
    }
  }
}

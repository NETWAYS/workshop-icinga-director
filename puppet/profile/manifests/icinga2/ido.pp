class profile::icinga2::ido(
  $ido_username = 'icinga2',
  $ido_password = 'icinga2',
  $ido_dbname = 'icinga2',
) {
  include profile::icinga2
  include mysql::server

  Class['Mysql::Server'] -> Class['icinga2']

  mysql::db { $ido_dbname:
    user     => $ido_username,
    password => $ido_password,
    grant    => ['ALL'],
  }

  -> class{ '::icinga2::feature::idomysql':
    user          => $ido_username,
    password      => $ido_password,
    database      => $ido_dbname,
    import_schema => true,
  }
}

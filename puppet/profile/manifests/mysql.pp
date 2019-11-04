class profile::mysql {
  contain mysql::server

  lookup('mysql::server::db', Hash[String, Hash], 'hash', {}).each |$name, $config| {
    mysql::db { $name:
      * => $config,
    }
  }
}

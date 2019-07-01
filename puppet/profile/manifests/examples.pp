class profile::examples(
  $cmdb_database = 'cmdb',
  $cmdb_username = 'cmdb',
  $cmdb_password = 'cmdb',
) {
  $source = '/vagrant/data'

  file {
    default:
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0644';
    '/opt/import':
      ensure => directory;
    '/opt/import/linux-cmdb.sql':
      source => "${source}/linux-cmdb.sql";
    '/opt/import/internet-sites.json':
      source => "${source}/internet-sites.json";
    '/opt/import/windows-hosts.csv':
      source => "${source}/windows-hosts.csv";
  }

  mysql::db { $cmdb_database:
    user     => $cmdb_username,
    password => $cmdb_password,
    grant    => ['ALL'],
    sql      => "${source}/linux-cmdb.sql",
  }
}

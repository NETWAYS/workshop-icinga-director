class profile::icinga2 (
  Boolean            $is_master   = false,
  String             $node_name   = $trusted['certname'],
  String             $zone_name   = $trusted['certname'],
  Optional[String]   $parent      = undef,
  Optional[String]   $ticket_salt = undef,
  Optional[String]   $ca_host     = undef,
  Hash[String, Hash] $endpoints   = {},
  Hash[String, Hash] $zones       = {},
  Hash[String, Hash] $apiusers    = {},
) {
  class { 'icinga2':
    confd       => 'local.d',
    features    => ['checker', 'mainlog', 'command'],
    manage_repo => true,
  }


  file { '/etc/icinga2/local.d':
    ensure => directory,
    owner  => $icinga2::globals::user,
    group  => $icinga2::globals::group,
  }
  ~> Class['icinga2::service']

  if $is_master {
    $_pki = 'none'
  } else {
    $_pki = 'icinga2'
  }

  if ! has_key($endpoints, $node_name) {
    $_endpoints = $endpoints + { $node_name => {} }

    if ! has_key($zones, $zone_name) {
      if ! $parent {
        fail ('profile::icinga2::parent needs to be configured')
      }

      $_zones = $zones + {
        $zone_name => {
          endpoints => [$node_name],
          parent    => $parent,
        }
      }
    } else {
      $_zones = $zones
    }
  } else {
    $_endpoints = $endpoints
    $_zones = $zones
  }

  class { '::icinga2::feature::api':
    pki             => $_pki,
    ticket_salt     => $ticket_salt,
    ca_host         => $ca_host,
    accept_commands => true,
    accept_config   => true,
    endpoints       => $_endpoints,
    zones           => $_zones,
  }

  icinga2::object::zone { 'director-global':
    global => true,
  }

  ensure_resources('icinga2::object::apiuser', $apiusers, {
    target => '/etc/icinga2/local.d/api-users.conf',
    })
}

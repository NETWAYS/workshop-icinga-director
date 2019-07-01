class profile::linux(
  Hash[String, Hash] $ssh_keys = {},
) {
  include ntp
  include vagrantenv

  $_root_ssh_keys = prefix($ssh_keys, 'root-')

  create_resources('ssh_authorized_key', $ssh_keys, {
    user => 'vagrant',
    type => 'ssh-rsa',
  })

  create_resources('ssh_authorized_key', $_root_ssh_keys, {
    user => 'root',
    type => 'ssh-rsa',
  })

  $files = lookup('files', Hash, 'hash', {})
  create_resources('file', $files, {
    user  => 'root',
    group => 'root',
    mode  => '0644',
  })
}

# == Class: profiles::ovirt
#
# firewall-cmd --zone=public --add-port=5666/tcp
#
class profiles::ovirt {

  nrpe::command { 'check_storage01':
    ensure  => present,
    command => 'check_disk -w 20% -c 10% -p /storage01'
  }

}

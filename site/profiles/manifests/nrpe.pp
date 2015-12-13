# == Class: profiles::nrpe
#
class profiles::nrpe {

  class { 'nrpe':
    allowed_hosts => [ '127.0.0.1', 'nagios.ism.local' ]
  }

  nrpe::command { 'check_disk':
    ensure  => present,
    command => 'check_disk -w 20% -c 10% -p /'
  }

  nrpe::command { 'check_load':
    ensure  => present,
    command => 'check_load -w 15,10,5 -c 30,25,20';
  }

}

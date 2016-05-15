# == Class: profiles::nagios
#
class profiles::nagios {

  # collect resources and populate /etc/nagios/nagios_*.cfg
  Nagios_host <<||>>
  Nagios_service <<||>>

  service { 'nagios':
    ensure     => running,
    enable     => true,
    hasrestart => true,
  }

}

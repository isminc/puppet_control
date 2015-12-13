# == Class: profiles::monitoring
#
# Base monitoring
#
class profiles::monitoring {

  @@nagios_host { $::fqdn:
    ensure  => present,
    alias   => $::hostname,
    address => $::ipaddress,
    use     => 'linux-server',
  }

  @@nagios_service { "check_ping_${::hostname}":
    check_command       => 'check_ping!100.0,20%!500.0,60%',
    use                 => 'generic-service',
    host_name           => $::fqdn,
    notification_period => '24x7',
    service_description => 'Check ping',
  }

  @@nagios_service { "check_disk_${::hostname}":
    use                 => 'generic-service',
    host_name           => $::fqdn,
    notification_period => '24x7',
    check_command       => 'check_nrpe!check_disk',
    service_description => 'Check disk',
  }

  @@nagios_service { "check_load_${::hostname}":
    use                 => 'generic-service',
    host_name           => $::fqdn,
    notification_period => '24x7',
    check_command       => 'check_nrpe!check_load',
    service_description => 'Check load',
  }

}

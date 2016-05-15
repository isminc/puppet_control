# == Class: profiles::base
#
# == Description: Base profile for ISM servers
#
class profiles::base (
  $dns_search,
  $rsyslog_server,
  $dns_nameserver = '127.0.0.1',
) {

  # Acurate time
  include '::ntp'

  # EPEL
  if $::osfamily == 'RedHat' {
    include '::epel'
  }

  # Ubuntu
  #if $::osfamily == 'Debian' and $::is_virtual {

  #  # Pick correct APT source
  #  $ovirt_apt_repo = $::lsbdistrelease ? {
  #    '12.04'  => 'http://download.opensuse.org/repositories/home:/evilissimo:/ubuntu:/12.04/xUbuntu_12.04/',
  #    '14.04'  => 'http://download.opensuse.org/repositories/home:/evilissimo:/ubuntu:/14.04/xUbuntu_14.04/',
  #    default  => fail('This verison is not supported')
  #  }

  #  apt::source { 'ovirt_tools':
  #    comment    => 'Ovirt Guest VM Tools',
  #    location   => $ovirt_apt_repo,
  #    release    => '',
  #    repos      => 'main',
  #    key        => {
  #      'id'     => '',
  #      'server' => '',
  #    },
  #  }
  #}

  # DNS
  class { 'resolv_conf':
    search     => $dns_search,
    nameserver => $dns_nameserver,
  }

  # Central Logging
  class { 'rsyslog':
    preserve_fqdn => true,
  }

  class { 'rsyslog::client':
    server        => $rsyslog_server,
    log_templates => [
      {
        name     => 'TmplAuth',
        template => '/var/log/rsyslog_custom/%HOSTNAME%/%PROGRAMNAME%.log',
      },
      {
        name     => 'TmplMsg',
        template => '/var/log/rsyslog_custom/%HOSTNAME%/%PROGRAMNAME%.log',
      },
    ]
  }

}

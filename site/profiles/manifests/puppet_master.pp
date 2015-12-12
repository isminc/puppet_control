# Class: profiles::puppet_master
#
class profiles::puppet_master {

  # Disable IPv6 on the Puppet Master
  # The puppetserver will bind to the IPv6 interface if its running
  sysctl { "net.ipv6.conf.all.disable_ipv6":
    ensure    => present,
    value => "1",
  }

  sysctl { "net.ipv6.conf.default.disable_ipv6":
    ensure    => present,
    value => "1",
  }

}

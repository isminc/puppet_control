# == Class: profiles::puppetdb
#
class profiles::puppetdb {

  # Configure puppetdb and its underlying database
  class { 'puppetdb':
    manage_firewall => false,
  }
  # Configure the puppet master to use puppetdb
  class { 'puppetdb::master::config': }

}

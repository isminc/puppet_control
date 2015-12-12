# == Class: roles::monitoring_master
#
class role::monitoring_master {
  include profiles::base
  include profiles::nagios
}

# == Class: roles::puppet_master
#
class role::puppet_master {
  include profiles::base
  include profiles::monitoring
  include profiles::puppet_master
}

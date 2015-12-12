# == Class: roles::puppet_master
#
class role::puppet_master {
  include profiles::base
  include profiles::puppet_master
}

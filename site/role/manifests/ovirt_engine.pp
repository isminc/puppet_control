# == Class: roles::ovirt_engine
#
class role::ovirt_engine {
  include profiles::base
  include profiles::monitoring
}

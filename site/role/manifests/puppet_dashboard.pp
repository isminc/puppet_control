# == Class: roles::puppet_dashboard
#
class role::puppet_dashboard {
  include profiles::base
  include profiles::monitoring
  include profiles::nrpe
}

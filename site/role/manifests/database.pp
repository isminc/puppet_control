# == Class: roles::database
#
class role::database {
  include profiles::base
  include profiles::monitoring
  include profiles::nrpe
}

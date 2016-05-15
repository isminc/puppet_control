# == Class: roles::ovirt_node
#
class role::ovirt_node {
  include profiles::monitoring
  include profiles::nrpe
}

# == Class: roles::ovirt_node
#
class role::ovirt_node {
  include profiles::monitoring
  include profiles::nrpe
  include profiles::ovirt_node
}

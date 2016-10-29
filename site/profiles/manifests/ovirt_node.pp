# == Class: profiles::ovirt_node
#
#
class profiles::ovirt_node {

  # Mount points
  mount {
  }

  # Monitoring
  nrpe::command { 'check_storage01_data':
    ensure  => present,
    command => 'check_disk -w 20% -c 10% -p /rhev/data-center/mnt/172.17.0.1:_exports_data'
  }

  nrpe::command { 'check_storage01_iso':
    ensure  => present,
    command => 'check_disk -w 20% -c 10% -p /rhev/data-center/mnt/172.17.0.1:_exports_iso'
  }

  nrpe::command { 'check_storage01_ova':
    ensure  => present,
    command => 'check_disk -w 20% -c 10% -p /rhev/data-center/mnt/172.17.0.1:_exports_ova'
  }

}

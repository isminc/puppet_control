# Class: profiles::puppetboard
#
class profiles::puppetboard {

  # Configure Apache on this server
  class { 'apache': }
  # Configure Puppetboard
  class { 'puppetboard':
    manage_git        => false,
    manage_virtualenv => false,
  }
  class { 'puppetboard::apache::vhost':
    vhost_name => 'pboard.puppet.ism.local',
    port       => 80,
  }

  class { 'apache::mod::wsgi':
    wsgi_socket_prefix => '/var/run/wsgi',
  }

}

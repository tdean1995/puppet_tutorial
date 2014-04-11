#Manage nginx webserver
class nginx {
  package { 'apache2.2-common':
  ensure => absent,
  }
    
  package { 'nginx':
    ensure => installed,
    require => 
    Package['apache2.2-common'],
    }
  
  service { 'nginx':
    ensure => running,
    enable => true,
    require => Package['nginx']
}

  file {'/etc/nginx/sites-enabled/default':
	ensure => absent,
  }

 file {'/etc/nginx/sites-enabled':
    ensure => directory
 } 
} 
 

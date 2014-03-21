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

  file { 'default':
      path => '/etc/nginx/sites-enabled/default',
      source => 'puppet:///modules/nginx/cat-pictures.conf',
      ensure => file,
      notify => Service['nginx'],
  }
  file {'cat-pictures':
     path => '/var/www/html/cat-pictures',
     ensure => directory,
     notify => File['index.html']
  }

  file { 'index.html':
	path => '/var/www/html/index.html',
	source => 'puppet:///modules/nginx/cat-pic-index.html',
        ensure => file,
	notify => Service['nginx'],
  }
} 
 

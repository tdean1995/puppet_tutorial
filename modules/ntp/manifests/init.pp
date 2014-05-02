#Manage NTP Server
class ntp($server = 'USNET') {

 package{ 'ntp': 
    ensure => installed,
 }

 file { '/etc/ntp.conf':
  content =>
  template ('ntp/ntp.conf.erb'),
    notify => Service['ntp'].
  }

  service {'ntp':
    ensure => running,
    enable => true,
    require => [ Package['ntp'],
      File['/etc/ntp.conf'] ],
  }
}

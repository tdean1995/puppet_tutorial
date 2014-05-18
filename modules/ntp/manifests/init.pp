#Manage NTP Server
class ntp($server = 'UNSET') {

 package{ 'ntp': 
    ensure => installed,
 }

 file { '/etc/ntp.conf':
  content =>
  template ('ntp/ntp.conf.erb'),
    notify => Service['ntp'],
  }

  service {'ntpd':
    ensure => running,
    enable => true,
    require => [ Package['ntp'],
      File['/etc/ntp.conf'] ],
  }
}

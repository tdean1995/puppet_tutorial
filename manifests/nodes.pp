node 'dean-ubu' {
  include nginx
  user { 'art':
   ensure => present,
   comment => 'Art Vanderlay',
   home => '/home/art',
   managehome => true,
 } 

}

node 'dean-aws1' {
  exec { 'Run my arbitrary command':
    command => 'bin/echo I ran this command on `/bin/date` > /tmp/command.output.txt',
  }

  include ssh
  include sudoers
  user { 'art':
    ensure => present,
    comment => 'Art Vanderlay',
    home => '/home/art',
    managehome => true,
  }
  ssh_authorized_key { 'art_ssh':
    user => 'art',
    type => 'rsa',
    key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDB3a6ha0D2kh/yrjsoel3Fa8rJtA2UYZQ1j2lwfobjPRFjIs2b6XNhcUh52RWsBartayix5m0dLEamiN12h+RoQ8j4nO89J62hQYatAhf9SYmgZlpzYG3aYLMl2incTbhUlZvyVwSd4UUZY5xCu4m0YbY2HCIlQyXLjzrAoHlIjzRCNDBYZwNUDkxPQGbOEgdf6iMhY8ra80DheGVLsEum3jxwuvG9vTFWNq2s2YEydXDq6oPmy1jj/YGi1AjGffOXnJ4RdCgi/4klI1JPWETCHmEGDOagTQ38Eiy98hC53qE3YJiL/nLk+Id8gjFOOnDC8GRvMyqUU0+GsWABCUIH',

}
}

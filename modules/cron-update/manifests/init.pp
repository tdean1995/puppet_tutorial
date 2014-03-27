



cron { 'Update puppet repo':
  command => '/usr/bin/git pull && sudo /usr/bin/puppet apply /etc/puppet/manifests/site.pp',
  minute => '*/15',
  user => 'wdean', 
}
  

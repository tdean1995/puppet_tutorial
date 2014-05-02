
node 'dean-aws1' {
   class { 'ntp':
      server => 'us.pool.ntp.org',
   }

}


node 'dean-aws1' {
  nginx::website{'adorable-animals':
    site_domain => 'adorable-animals.com',
  }
}

class subversion {
  package { 'subversion':
    ensure => 'present'
  }

  file { '/etc/subversion/servers':
    ensure  => file,
    source  => 'puppet:///modules/subversion/servers',
    owner   => 'root',
    group   => 'root',
    mode    => '644',
    require => Package['subversion']
  }
}

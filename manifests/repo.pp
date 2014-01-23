define subversion::repo (
    $remote,
    $revision,
    $auth_user,
    $auth_pass,
    $user,
    $group
  ) {

  file { $title:
    ensure  => directory,
    owner   => $user,
    group   => $group,
    mode    => '660',
    require => Vcsrepo[$title]
  }

  vcsrepo { $title:
    ensure              => present,
    provider            => svn,
    revision            => $revision,
    source              => $remote,
    basic_auth_username => $auth_user,
    basic_auth_password => $auth_pass,
    require             => Package['subversion']
  }
}

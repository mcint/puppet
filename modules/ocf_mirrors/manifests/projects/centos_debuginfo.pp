class ocf_mirrors::projects::centos_debuginfo {
  file { '/opt/mirrors/project/centos-debuginfo':
    ensure  => directory,
    source  => 'puppet:///modules/ocf_mirrors/project/centos-debuginfo/',
    owner   => mirrors,
    group   => mirrors,
    mode    => '0755',
    recurse => true,
  }

  ocf_mirrors::monitoring {
    'centos-debuginfo':
      type          => 'unix_timestamp',
      upstream_host => 'debuginfo.centos.org',
      upstream_path => '/',
      ts_path       => 'TIME';
  }

  ocf_mirrors::timer {
    'centos-debuginfo':
      exec_start => '/opt/mirrors/project/centos-debuginfo/sync-archive',
      hour       => '0/3',
      minute     => '56';
  }
}

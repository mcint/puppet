class ocf_spark {
  package { ['daemontools', 'daemontools-run', 'openjdk-7-jdk']:; }

  exec {
    'download-spark':
      command => 'curl http://d3kbcqa49mib13.cloudfront.net/spark-1.1.0-bin-hadoop1.tgz | tar xzf - -C /opt',
      creates => '/opt/spark-1.1.0-bin-hadoop1';
  }

  user { 'ocfspark':
    comment => 'OCF Spark',
    home    => '/opt/spark-1.1.0-bin-hadoop1',
    groups  => ['sys'],
    shell   => '/bin/false',
    require => Exec['download-spark'];
  }

  file {
    '/opt/spark-1.1.0-bin-hadoop1/logs':
      ensure  => directory,
      owner   => ocfspark,
      group   => ocfspark,
      recurse => true,
      require => User['ocfspark'];
  }
}

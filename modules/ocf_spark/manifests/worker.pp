class ocf_spark::worker {
  file {
    '/opt/spark-1.1.0-bin-hadoop1/work':
      ensure  => directory,
      owner   => ocfspark,
      group   => ocfspark,
      require => User['ocfspark'];
  }

  cron {
    'start-slave':
      special => reboot,
      command => "/opt/spark-1.1.0-bin-hadoop1/sbin/start-slave.sh ${::hostname} spark://spark-master.ocf.berkeley.edu:7077",
      user => ocfspark;
  }
}

class ocf_spark::master {
  cron {
    'forward-8080':
      command => '/sbin/iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to 8080',
      special => 'reboot';
    'start-master':
      command => '/opt/spark-1.1.0-bin-hadoop1/sbin/start-master.sh',
      user    => ocfspark,
      special => 'reboot';
  }
}

class ocf_desktop::udev {
  file { '/etc/udev/rules.d/udev-u2f.rules':
    source    => 'puppet:///modules/ocf_desktop/udev-u2f.rules',
    mode      => '0644',
  }
}

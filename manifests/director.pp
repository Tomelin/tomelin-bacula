class bacula::director {
  package { $::bacula::bacula_dir_package:
    ensure => 'present',
    before => Package['bacula-console']
  }

  # Install package
  package { 'bacula-console': ensure => 'present', }

  # start server
  service { $::bacula::bacula_dir_service:
    ensure     => 'running',
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Package[$::bacula::params::bacula_dir_package],
  }

  # Create file bacula-dir.conf
  file { "$::bacula::dirconf/bacula-dir.conf":
    ensure  => 'file',
    owner   => 'bacula',
    group   => 'bacula',
    content => template('bacula/bacula-dir.conf.erb'),
  }

  # Create file bconsole.conf
  file { "$::bacula::dirconf/bconsole.conf":
    ensure  => 'file',
    owner   => 'bacula',
    group   => 'bacula',
    content => template('bacula/bconsole.conf.erb'),
  }

  # Create directory  /bacula to save backup in file
  file { "$::bacula::dirBackupFile":
    ensure  => 'directory',
    recurse => true,
    owner   => 'bacula',
    group   => 'bacula',
  }

  # Create directory /etc/bacula/clients to save client conf
  file { "$::bacula::dirconf/clients":
    ensure  => 'directory',
    recurse => true,
    owner   => 'bacula',
    group   => 'bacula',
  }

  # Create directory /etc/bacula/jobs to save jobs conf
  file { "$::bacula::dirconf/jobs":
    ensure  => 'directory',
    recurse => true,
    owner   => 'bacula',
    group   => 'bacula',
  }

  # Create directory /etc/bacula/pool to save pool conf
  file { "$::bacula::dirconf/pool":
    ensure  => 'directory',
    recurse => true,
    owner   => 'bacula',
    group   => 'bacula',
  }

  # Create directory  /bacula to save backup in file
  if $::bacula::typebackup == 'file' {
    file { "$::bacula::dirBackupFile/backup":
      ensure  => 'directory',
      recurse => true,
      owner   => 'bacula',
      group   => 'bacula',
    }
  }

}

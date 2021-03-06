class bacula::director::pool (
  $pools = [
    {
      name               => 'PoolDiario3',
      poolType           => 'Backup',
      recycle            => 'yes',
      autoPrune          => 'yes',
      volumeRetention    => '30 days',
      maximumVolumeBytes => '1G',
      maximumVolumes     => '100',
      labelFormat        => 'Local-'
    }
    ,
    {
      name               => 'PoolDiario4',
      poolType           => 'Backup',
      recycle            => 'yes',
      autoPrune          => 'yes',
      volumeRetention    => '30 days',
      maximumVolumeBytes => '1G',
      maximumVolumes     => '100',
      labelFormat        => 'Local-'
    }

    ]) {
      
      /**
  $pools.each |$name, $pool| {
    notify { $pool: }
#    file { "/etc/bacula/pool/pool_$pool['name'].conf":
#      ensure  => 'file',
#      owner   => 'bacula',
#      group   => 'bacula',
#      content => template('bacula/director/pool_conf.erb')
#    }
  }
   */
  
  /*
  $teste = $pools[0]['name']

  file { "/etc/bacula/pool/pool_$teste.conf":
  *  */
  
  file { "/etc/bacula/pool/pool.conf":
    ensure  => 'file',
    owner   => 'bacula',
    group   => 'bacula',
    content => template('bacula/director/pool_conf.erb')
  }

  $database_profile_array = [cpu, sysctl]
  $database_profile_hash = {
    cpu              => {
      governor         => ondemand,
      energy_perf_bias => powersave,
    }
    ,
    sysctl           => {
      kernel_sched_min_granularity_ns    => 10000000,
      kernel_sched_wakeup_granularity_ns => 15000000,
      kernel_msgmnb => 6,
    }
  }
  
  #tenmplate
  /**
<% pools.each do |pool| -%>
Pool {
  Name = "<%= pool['name'] %>"
  Pool Type = "<%= pool['poolType'] %>"
  Recycle = <%= pool['recycle'] %>
  AutoPrune = <%= pool['autoPrune'] %>
  Volume Retention = <%= pool['volumeRetention'] %>
  Maximum Volume Bytes = <%= pool['maximumVolumeBytes'] %> 
  Maximum Volumes = <%= pool['maximumVolumes'] %>
  Label Format = "<%= pool['labelFormat'] %>"
}
<% end -%>
**/

}

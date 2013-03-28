# == Class: phpfpm
#
# See README.md
#
class phpfpm (
    $ensure = 'present',
) {
  $running = $ensure ? {
    absent  => 'stopped',
    default => 'running',
  }

  package { 'php5-fpm':
    ensure => $ensure,
  }

  service { 'php5-fpm':
    ensure  => $running,
    require => Package['nginx'],
  }
}
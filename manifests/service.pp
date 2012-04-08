class phpfpm::service {
	
	exec { 'switch_to_socket':
		command => '/bin/sed -i \'s/listen = 127.0.0.1:9000/listen = \/var\/run\/php5-fpm.sock/g\' /etc/php5/fpm/pool.d/www.conf',
		unless 	=> '/bin/grep "listen = /var/run/php5-fpm.sock" /etc/php5/fpm/pool.d/www.conf',
		require => Class['phpfpm::install'],
	}

	service { 'php5-fpm':
		ensure 	=> running,
		require => Exec['switch_to_socket'],
	}
	
}
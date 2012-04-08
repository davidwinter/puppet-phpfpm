class phpfpm::install {
	
	package { 'php5-fpm':
		ensure => installed,
	}

}
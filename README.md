This puppet module aims to be lightweight and help you get an nginx virtual host with php-fpm up and running quickly. It was developed with Vagrant in mind so that I could get a web environment up and running in as few lines as possible.

**Note**: This module depends on my other, [nginx](https://github.com/davidwinter/puppet-nginx), in order for nginx to be installed and started.

## How to use

Clone this into your modules directory. Then in your manifests file, add the following:

	include phpfpm

	phpfpm::nginx::vhost { 'vhost_name':
		server_name => 'your.domain.com',
		root		=> '/path/to/docroot',
		index       => 'app.php', # optional, defaults to index.php
		custom      => 'Your custom vhost.conf code', # optional
		upstream    => '/var/run/php5-fpm.sock', # optional, defaults to 127.0.0.1:9000
	}

That's it! If you was expecting more, well, sorry!

## Basic nginx virtual host?

If you're looking for basic nginx functionallity instead, check out my other module, [nginx](https://github.com/davidwinter/puppet-nginx).

## Contribute

Please feel free to submit pull requests for any other basic functionallity you think this module should include.

This puppet module aims to be lightweight and help you get an nginx virtual host with php-fpm up and running quickly. It was developed with Vagrant in mind so that I could get a web environment up and running in as few lines as possible.

## How to use

Clone this into your modules directory. Then in your manifests file, add the following:

	include phpfpm

	phpfpm::nginx::vhost { 'vhost_name':
		server_name => 'your.domain.com',
		root		=> '/path/to/docroot',
	}

That's it! If you was expecting more, well, there are a few additional options you can include:

 * `client_max_body_size`
 * `fastcgi_read_timeout`
 * `remove_indexphp_from_url` - adds a rewrite rule that removes `index.php` from url's
 * `static_paths` - an array containing directories that nginx should serve rather than php-fpm.
 * `maintenance_page` - a file path, that when present will redirect requests to it
 * `env_vars` - a hash of environment variables to pass through to php-fpm

These options are passed through in a hash to the options parameter. An example:

	phpfpm::nginx::vhost { 'vhost_name':
		root => '/vagrant/public',
		server_name => 'your.domain.com',
		options => {
			static_paths => [
				'uploads/images',
				'css',
				'js',
			],
			maintenance_page => 'maintenance.html',
			remove_indexphp_from_url => true,
			fastcgi_read_timeout => 1800,
			client_max_body_size => '100M',
			env_vars => { 
				'SITE_ENV' => 'development',
			},
		},
	}

## Basic nginx virtual host?

If you're looking for basic nginx functionallity instead, check out my other module, [nginx](https://github.com/davidwinter/puppet-nginx).

## Contribute

Please feel free to submit pull requests for any other basic functionallity you think this module should include.
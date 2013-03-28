# puppet-phpfpm

This puppet module aims to be lightweight and help you get an `nginx` virtual host with `php-fpm` up and running quickly. It was developed with `vagrant` in mind so that I could get a web environment up and running in as few lines as possible.

If you're looking for basic nginx functionallity instead, check out my other module, [nginx](https://github.com/davidwinter/puppet-nginx).

## Dependencies

 * [nginx](https://github.com/davidwinter/puppet-nginx)

## Install

With librarian-puppet, add the following to your Puppetfile:

	mod 'postfix',
		:git => 'git://github.com/davidwinter/puppet-phpfpm.git'

Then run `librarian-puppet install`.

## Usage

	class { 'phpfpm': }

	nginx::vhost { 'your.domain.com':
		root     => '/vagrant',
		index    => 'index.php',
		template => 'nginx/vhost.php.conf.erb',
	}

The main thing to note here is that we're using the `vhost.php.conf.erb` template from the `nginx` module instead of the default one. If you need to customise the PHP settings in the `nginx` virtual host, you should copy the original, make changes and then store them in your own module.

## Author

David Winter <i@djw.me>

## Licence

MIT


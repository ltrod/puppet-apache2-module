class apache2 {
        package {'apache2':
                ensure => present,
        }

        service {'apache2':
                ensure => "running",
                enable => "true",
                require => Package["apache2"],
        }
}

define apache2::vhost(
	$docroot,
	$port,
){
	file {"/etc/apache2/sites-enabled/${name}":
		owner => 'root',
		group => 'root',
		mode => '0640',
		require => Class['apache2'],
	}
}

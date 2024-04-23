package { 'nginx':
  ensure   => installed,
  provider => 'apt',
}

# Configure Nginx
class { 'nginx':
  listen_port  => 80,
  server_names => [],
}

# Create the custom root html
file { '/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!',
}

# Configure a location block for redirection
nginx::resource::location { 'redirect_me':
  ensure         => present,
  vhost          => 'default',
  location       => '/redirect_me',
  ensure_values  => [
    'return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;',
  ],
}

# Installs and configures a nginx server
package { 'nginx':
  ensure => 'installed'
}

# Create the custom root html
file { '/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!',
}

# Create the error file
file { '/var/www/html/404.html':
  ensure  => file,
  content => 'Ceci n\'est pas une page 
',
}

# Create the config file
file { '/etc/nginx/sites-available/default':
  ensure => file,
  content => 'server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;

        index index.html index.htm index.nginx-debian.html;

        server_name _;

        error_page 404 /404.html;

        location /redirect_me {
                return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
        }

        location / {
                try_files $uri $uri/ =404;
        }
}',
  notify => Service['nginx'],
}

Service { 'nginx':
  ensure  => 'running',
  require => File['/home/unchained/random'],
}

#package { 'nginx':
#  ensure => 'installed'
#}

# Create the custom root html
#file { '/var/www/html/index.html':
#  ensure  => file,
#  content => 'Hello World!',
#}

# Create the config file
file { '/home/unchained/random':
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
}'
}

# kills killmenow process
exec { 'killmenow':
  command => '/usr/bin/pkill killmenow',
  onlyif  => '/usr/bin/pgrep killmenow'
}
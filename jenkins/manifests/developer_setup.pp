exec { 'gnome':
  command => '/usr/bin/yum -y groupinstall "Desktop" "Desktop Platform" "X Window System" "Fonts"',
  timeout => 1800
}

package {"firefox":
  ensure => latest,
}

exec {"unzip webstorm":
  command => "/bin/tar -xf /vagrant/webstorm.tar.gz",
  cwd => "/tmp",
}
->
exec {"mv webstorm":
  command => "/bin/mv /tmp/WebStorm* /usr/local/webstorm ",
}

user { 'root':
  ensure           => 'present',
  password         => '$1$ibNGCMSR$vF8Qn9W9hrl5ggwywyC571',
}

file { "/root/.bashrc":
  ensure => present,
  mode => 0600,
  source => [ "/vagrant/bashrc" ],
}

package {'npm':
  ensure => latest,
}

package {'gcc':
  ensure => latest,
}

package { 'java-1.6.0-openjdk':
  ensure => installed
}

package { 'git':
  ensure => latest
}

exec {'curl epel':
    command => 'curl -L http://mirrors.syringanetworks.net/fedora-epel/6/i386/epel-release-6-8.noarch.rpm > epel-release-6-8.noarch.rpm',
    path => "/usr/local/bin:/usr/bin:/bin",
}

exec {'rpm epel':
    command => 'rpm -ivh epel-release-6-8.noarch.rpm',
    path => "/usr/local/bin:/usr/bin:/bin",
    require => [ Exec["curl epel"] ],
}

package {'openssl-devel':
    ensure => latest;
}

class { mongodb:
  enable_10gen => true,
}

exec {"unzip node":
  command => "/bin/tar -xf /vagrant/node.tar.gz",
  cwd => "/tmp",
}
->
exec {"mv node":
  command => "/bin/mv /tmp/node* /usr/local/node ",
}

file { "/root/.ssh/":
  ensure => "directory"
}

file { "/root/.ssh/id_rsa":
  ensure => present,
  mode => 0600,
  source => [ "/vagrant/id_rsa" ],
  require => [ File["/root/.ssh/"] ],
}

file { "/root/.ssh/known_hosts":
  ensure => present,
  mode => 0600,
  source => [ "/vagrant/known_hosts" ],
  require => [ File["/root/.ssh/"] ],
}

file { "/root/workspaces/":
  ensure => "directory"
}
->
vcsrepo { "/root/workspaces/SI":
  ensure => latest,
  owner => root,
  group => root,
  provider => git,
  source => "git@github.com:TheJumpCloud/SI.git",
  require => [ Package["git"], File["/root/.ssh/id_rsa"] ],
}

file { "/etc/resolv.conf":
  content => "nameserver	4.2.2.1",
}

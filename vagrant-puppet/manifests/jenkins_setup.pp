exec {'get jenkins':
    command => 'wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo',
    path => "/usr/local/bin:/usr/bin:/bin",
}
->
exec {'import jenkins':
    command => 'rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key',
    path => "/usr/local/bin:/usr/bin:/bin",
}
->
exec {'install jenkins':
    command => 'yum -y install jenkins',
    path => "/usr/local/bin:/usr/bin:/bin",
}
->
file { "/var/lib/jenkins/plugins":
  ensure => "directory"
  mode => 0755,
  owner => 'jenkins',
}
->
file { "/var/lib/jenkins/plugins/git.jpi":
  ensure => present,
  mode => 0755,
  owner => 'jenkins',
  source => [ "/vagrant/jenkins/git.jpi" ],
}
->
file { "/var/lib/jenkins/plugins/git-client.jpi":
  ensure => present,
  mode => 0755,
  owner => 'jenkins',
  source => [ "/vagrant/jenkins/git-client.jpi" ],
}
->
file { "/var/lib/jenkins/plugins/xvfb.jpi":
  ensure => present,
  mode => 0755,
  owner => 'jenkins',
  source => [ "/vagrant/jenkins/xvfb.jpi" ],
}
->
package {'xorg-x11-server-Xvfb':
  ensure => latest,
}
->
service {'jenkins':
  enable => true,
  ensure => "running",
}

package {"firefox":
  ensure => latest,
}


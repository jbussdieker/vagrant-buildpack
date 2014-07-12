class { 'rvm':
  version => '1.20.12'
}

rvm_system_ruby { 'ruby-2.0.0':
  ensure      => 'present',
  default_use => true,
  build_opts  => ['--binary'],
}

package { 'libpq-dev': }
# For ruby
package { 'libssl0.9.8': }
# For php
package { 'libltdl7': }

rvm_gem { 'foreman':
  ensure       => '0.74.0',
  name         => 'foreman',
  ruby_version => 'ruby-2.0.0',
  require      => Rvm_system_ruby['ruby-2.0.0'];
}

file { '/app':
  ensure => directory,
  owner  => 'vagrant',
  group  => 'vagrant',
  mode   => 0755,
}

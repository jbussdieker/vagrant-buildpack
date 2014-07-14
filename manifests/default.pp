package { 'libreadline5': }
package { 'libssl0.9.8': }
package { 'libpq-dev': }
package { 'libltdl7': }

package { 'foreman':
  ensure   => '0.74.0',
  provider => gem,
}

file { '/app':
  ensure => directory,
  owner  => 'vagrant',
  group  => 'vagrant',
  mode   => 0755,
}

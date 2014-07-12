#!/bin/bash -e

# Fix various stdin silliness with shell provisioners
#   eg (==> default: stdin: is not a tty)
sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile

# Keep dpkg and apt from trying to open stdin
#   eg (==> default: dpkg-preconfigure: unable to re-open stdin: No such file or directory)
export DEBIAN_FRONTEND=noninteractive

if [ ! -f /var/tmp/puppetlabs-release-precise.deb ]; then
  echo "Downloading puppetlabs installer..."
  wget -q https://apt.puppetlabs.com/puppetlabs-release-precise.deb -O /var/tmp/puppetlabs-release-precise.deb ||
    (echo "Failed" && exit 1)
fi

if [ ! -f /etc/apt/sources.list.d/puppetlabs.list ]; then
  echo "Installing puppetlabs apt source..."
  dpkg -i /var/tmp/puppetlabs-release-precise.deb > /var/tmp/puppetlabs-release-precise-install.log ||
    (echo "Failed" && exit 1)
fi

if ! apt-cache show hiera &> /dev/null; then
  echo "Updating apt-cache..."
  apt-get -y update > /var/tmp/apt-get-update.log ||
    (echo "Failed" && exit 1)
fi

if dpkg-query -W -f '${Version}' puppet-common | grep 2.7.11 > /dev/null; then
  echo "Installing puppet-common..."
  apt-get -y install puppet-common=3.2.2-1puppetlabs1 > /var/tmp/puppet-install.log ||
    (echo "Failed" && exit 1)
fi

if dpkg-query -W -f '${Version}' puppet | grep 2.7.11 > /dev/null; then
  echo "Installing puppet..."
  apt-get -y install puppet=3.2.2-1puppetlabs1 >> /var/tmp/puppet-install.log ||
    (echo "Failed" && exit 1)
fi

touch /etc/puppet/hiera.yaml

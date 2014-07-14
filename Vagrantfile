# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "http://cloud-images.ubuntu.com/vagrant/trusty/20140712/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.synced_folder "buildpacks", "/home/vagrant/buildpacks"
  config.vm.synced_folder "scripts", "/home/vagrant/bin"
  config.vm.synced_folder "samples", "/home/vagrant/samples"
  config.vm.synced_folder "cache", "/home/vagrant/cache"
  config.vm.synced_folder "logs", "/home/vagrant/logs"
  config.vm.synced_folder "slugs", "/home/vagrant/slugs"
  config.vm.provision "puppet"
end

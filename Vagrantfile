# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "http://cloud-images.ubuntu.com/vagrant/precise/20140619/precise-server-cloudimg-amd64-vagrant-disk1.box"

  # Scala wanted more than a 512MB box
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end

  config.vm.synced_folder "scripts", "/home/vagrant/bin"
  config.vm.synced_folder "samples", "/home/vagrant/samples"
  config.vm.synced_folder "cache", "/home/vagrant/cache"

  config.vm.provision "shell" do |shell|
    shell.path = "puppet/bootstrap.sh"
  end

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
  end
end

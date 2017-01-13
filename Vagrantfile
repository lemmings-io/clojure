# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-16.04"

  config.vm.network "private_network", ip: "10.61.6.31"
  config.vm.network "forwarded_port", guest: 7888, host: 7888
  config.vm.hostname = "lemmings"

  config.vm.synced_folder ".", "/lemmings"

  config.vm.provision "shell", path: "provision.sh"
end

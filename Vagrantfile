# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.network "private_network", ip: "192.168.10.222"
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", 2048]
    vb.customize ["modifyvm", :id, "--cpus", 2]
  end

  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "scorputty/centos-7.2"

  # I use the following plugin to keep a current VirtualBox Guest-Additions
  # $ vagrant plugin install vagrant-vbguest
  # link = https://github.com/dotless-de/vagrant-vbguest
  config.vbguest.auto_update = true
  config.vbguest.no_remote = false

  # Run Ansible from the Vagrant Host
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/main.yml"
    ansible.verbose = "false"
  end
  # Run remote like this"
  # ansible-playbook -i ~/ansible/hosts --ask-pass --user=vagrant --become provisioning/main.yml

end

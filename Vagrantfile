# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.define :cassandra do |x|
		x.vm.box = "hashicorp/precise64"
    x.vm.provision :shell, path: "bootstrap.sh"
    x.vm.hostname = "cassandra"
    x.vm.network :forwarded_port, host: 9160, guest: 9160
    x.vm.network :forwarded_port, host: 9042, guest: 9042
  end
end

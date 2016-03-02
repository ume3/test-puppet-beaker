Vagrant.configure("2") do |config|

  config.vm.provision :shell do |shell|
    shell.path = "provision/install.sh"
  end

  config.vm.define :test001 do |c|
    c.vm.box = "puppetlabs/centos-7.2-64-puppet"
    c.vm.hostname = "test001"
    c.vm.network :private_network, ip: "192.168.0.123"
  end

end

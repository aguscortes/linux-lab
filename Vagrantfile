# -*- mode: ruby -*-
# vi: set ft=ruby :

hosts = {"ipa" => "192.168.0.100", "web" => "192.168.0.101", "proxy" => "192.168.0.102","smtp" => "192.168.0.103"}
$msg = <<MSG
------------------------------------------------------
Welcome to the LINUX LAB environment"

URLS:
 - IPA Server  - http://192.168.0.100
 - WEB Server  - http://192.168.0.101

------------------------------------------------------
MSG

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  hosts.each do |name, ip|
    config.vm.define name do |machine|      
      machine.vm.hostname = name
      machine.vm.box_url = "centos/7"
      machine.vm.network :public_network, ip: ip
      machine.vm.post_up_message = $msg
      machine.vm.provider :virtualbox do |v|        
        v.customize ["modifyvm", :id, "--memory", 512]
        v.customize ["modifyvm", :id, "--name", name]
      end
      config.ssh.keep_alive = true 
      config.vm.provision "shell", path: "puppetprepare.sh"
      config.vm.provision "shell", path: name + ".sh"
      # config.vm.provision "puppet"
    end
  end  
end

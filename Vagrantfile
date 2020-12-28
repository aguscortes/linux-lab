# -*- mode: ruby -*-
# vi: set ft=ruby :

hosts = {"ipa" => "192.168.0.100", "web" => "192.168.0.101", "proxy" => "192.168.0.102","smtp" => "192.168.0.103"}
Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  hosts.each do |name, ip|
    config.vm.define name do |machine|      
      machine.vm.hostname = name
      machine.vm.box_url = "centos/7"
      machine.vm.network :public_network, ip: ip
      machine.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--memory", 512]
        v.customize ["modifyvm", :id, "--name", name]
      end
      config.ssh.keep_alive = true  
    end
  end  
end

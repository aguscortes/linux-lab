#!/bin/sh
sudo rpm -Uvh https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
sudo yum update -y
sudo yum install puppet-agent -y
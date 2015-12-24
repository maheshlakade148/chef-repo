#
# Cookbook Name:: sudo_user
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#

 pass = "test"
 system("useradd test")
 system("echo #{pass} | passwd test --stdin")
 system("mkdir /home/test")
 system(" chsh -s /bin/bash test")
 system("echo 'test  ALL=(ALL:ALL) ALL' >> /etc/sudoers")

#user "test1" do
 #
 # supports :manage_home => true
 # comment 'my User'
 # home '/home/test1'
 # shell '/bin/bash'
#end


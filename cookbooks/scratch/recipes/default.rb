#
# Cookbook Name:: scratch
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

remote_file "squeak-vm-4.10.2-1.1.x86_64.rpm" do
source "ftp://ftp.pbone.net/mirror/ftp5.gwdg.de/pub/opensuse/repositories/Education/CentOS_CentOS-6/x86_64/squeak-vm-4.10.2-1.1.x86_64.rpm"
action :create_if_missing
end

rpm_package "/squeak-vm-4.10.2-1.1.x86_64.rpm" do
action :install
end

# Downloading & installing scratch rpm file

 remote_file "scratch-1.4.0.7-32.1.x86_64.rpm" do
 source "ftp://ftp.pbone.net/mirror/ftp5.gwdg.de/pub/opensuse/repositories/home:/scratchduino/CentOS_CentOS-6/x86_64/scratch-1.4.0.7-32.1.x86_64.rpm"
 action :create_if_missing
 end

 rpm_package "/scratch-1.4.0.7-32.1.x86_64.rpm" do
 action :install
 end

 # Creating link of squeak in /usr/lib64

 execute "Creating link of squeak" do
 command "ln -s /usr/lib/squeak /usr/lib64/squeak"
 not_if { ::File.exists?("/usr/lib64/squeak")}
 end

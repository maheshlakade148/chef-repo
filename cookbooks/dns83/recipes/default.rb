#
# Cookbook Name:: dns83
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
list = ['bind', 'bind-utils']
list.each do |i|
       package "#{i}" do
       action :install
end
end

service "named" do
   action [:enable,:restart]
end


list1 = ['hostnamectl set-hostname server.labdns.lan', 'hostname', 'echo "192.168.10.83 server.labdns.lan" >> /etc/hosts', 'cat /etc/sysconfig/network']
     list1.each do |c|
     execute "list1" do
     command "#{c}"
     action :run
     end
end
 
cookbook_file "/etc/named.conf" do
       source "named.conf" 
       mode "0644"
end

cookbook_file "/var/named/labdns.lan" do
       source "ee.lan"
       mode "0644"
end

cookbook_file "/etc/resolv.conf" do
       source "resolv.conf"
       mode "0644"
end

service "named" do
   action [:restart]
end


list2 = ['firewall-cmd --permanent --add-port=53/tcp --zone=internal', 'firewall-cmd --permanent --add-port=53/udp --zone=internal', 'server.labdns.lan', 'firewall-cmd --reload', 'firewall-cmd --list-all']
    list2.each do |c|
    execute "list2" do
    command "#{c}"
    action :run
    end
end

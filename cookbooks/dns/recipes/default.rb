#
# Cookbook Name:: school_dns
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

list = ['bind', 'bind-utils']
list.each do |i|
       package "#{i}" do
       action :install
end
end

service "named" do
   action [:enable,:restart]
end


list1 = ['hostnamectl set-hostname server.mydemovm.lan', 'hostname', 'echo "192.168.100.251 server.mydemovm.lan server" >> /etc/hosts', 'cat /etc/sysconfig/network']
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

cookbook_file "/var/named/mydemovm.lan" do
       source "mydemovm.lan"
       mode "0644"
end

cookbook_file "/etc/resolv.conf" do
       source "resolv.conf"
       mode "0644"
end
#cookbook_file "/etc/hosts" do
#       source "hosts"
#       mode "0644"
#end

service "named" do
   action [:restart]
end


list2 = ['firewall-cmd --permanent --add-port=53/tcp --zone=internal', 'firewall-cmd --permanent --add-port=53/udp --zone=internal', 'dig server.mydemovm.lan', 'firewall-cmd --reload', 'firewall-cmd --list-all']
    list2.each do |c|
    execute "list2" do
    command "#{c}"
    action :run
    end
end

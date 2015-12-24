#
# Cookbook Name:: school_dhcpd
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute



package "dhcp" do
    action :install
end

#template "/etc/dhcp/dhcpd.conf" do
# source "dhcpd.conf.erb" 
# owner "root"
# group "root"
# mode "0644"
# notifies :stop, "service[dhcpd]"
#end
  cookbook_file "/etc/dhcp/dhcpd.conf" do
       source "dhcpd.conf" 
       mode "0644"
     end

service "dhcpd" do
  action [ :start ,:enable]
end

service "dhcpd" do
  action [ :stop ,:disable]
end

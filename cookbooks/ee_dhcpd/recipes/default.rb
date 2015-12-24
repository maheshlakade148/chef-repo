#
# Cookbook Name:: ee_dhcpd
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
#rization"]["sudo"]["groups"] = [ "sysadmin","wheel","admin" ]
## :sudoers_groups => node[:authorization][:sudo][:groups]
## variables({
##      :sudoers_groups => node[:authorization][:sudo][:groups],
##           :sudoers_users => node[:authorization][:sudo][:users]
##             })
# :sudoers_groups => node[:authorization][:sudo][:groups]
#default["authorisation"]["dhcpip"]["ip"] = [ "192.168.1.5" ]
# :sudoers_groups => node[:authorization][:sudo][:groups]


package "dhcp" do
    action :install
end

#template "/etc/dhcp/dhcpd.conf" do
# source "dhcpd.conf.erb"
# owner "root"
# group "root"
# mode "0644"
# notifies :stop, "service[dhcpd]"
#  variables({
 #    :ee_dhcpd => node[:authorization][:dhcpip][:ip]
 # })
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
        

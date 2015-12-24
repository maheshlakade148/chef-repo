#
# Cookbook Name:: dhcpdstop
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

service "dhcpd" do
 case node[:platform]
 when "centos","redhat"
      service_name "dhcpd"
 when "debian","ubuntu"
      service_name "isc-dhcp-server"
 end
  action [:disable, :stop]
end

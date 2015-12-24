#
# Cookbook Name:: dhcpd
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "dhcp" do
 case node[:platform]
  when "centos","redhat","fedora","suse"
      package_name "dhcp"
  when "debian","ubuntu"
      package_name "isc-dhcp-server"
  end
    action :install
end


template "/etc/dhcp/dhcpd.conf" do
 source "dhcpd.conf.erb"
 owner "root"
 group "root"
 mode "0644"
 notifies :restart, "service[dhcpd]"
end

service "dhcpd" do
 case node[:platform]
 when "centos","redhat"
      service_name "dhcpd"
 when "debian","ubuntu"
      service_name "isc-dhcp-server"
 end
  action [:enable, :restart]
end


#
# Cookbook Name:: squid
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

 package "squid" do

   action :install
end

   
cookbook_file "/etc/squid/squid.conf" do
       source "squid.conf" 
       mode "0644"
end

service "squid" do
   action [:enable,:restart]
end


#
# Cookbook Name:: my_monit
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
 package 'monit' do

      action :install
end

 cookbook_file '/etc/monitrc' do
     source 'monitrc'
     owner 'root'
     group 'root'
     action :create       
 end

execute 'add port 2812 in firewall' do
     command "firewall-cmd --add-port=2812/tcp --permanent"   
end

service 'monit' do
    action :restart
end

service 'httpd' do
    action :restart
end


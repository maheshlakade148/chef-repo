#include vhost;
# Cookbook Name:: vhost_raw
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user 'mysite' do
    home '/home/mysite'
    shell '/bin/bash'
    action :create
end

package 'nginx' do
   action :install
end

list = ['/etc/nginx/sites-available', '/home/mysite', '/home/mysite/log']
list.each do |l|
directory "#{l}" do
   owner 'mysite'
   group 'mysite'
   mode '0755'
   action :create
end
end


cookbook_file '/etc/nginx/nginx.conf' do
      source 'nginx.conf'
      mode '0755'
      action :create
end

list = ['/home/mysite/log/mysite.com.access.log', '/home/mysite/index.html']
list.each do |f|
file "#{f}" do
   content 'hi hello new file resource'
   owner 'mysite'
   group 'mysite'
   mode '0755'
   action :create
end
end

template "/etc/nginx/sites-available/mysite.conf" do
         source "mysite.conf.erb"
         owner 'mysite'
         group 'mysite'
         mode '0755'
end

service 'nginx' do
    action :restart
end

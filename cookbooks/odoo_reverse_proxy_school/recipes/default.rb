#
# Cookbook Name:: odoo_reverse_proxy_school
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
 package node[:odoo_reverse_proxy_school][:epel] do
  action :install
end

package node[:odoo_reverse_proxy_school][:'php-fpm'] do

        action :install
end
 package node[:odoo_reverse_proxy_school][:nginx] do

      action :install
end
 
directory '/etc/odoo' do
     owner 'root'
     group 'root'
     mode  '0755'
     action :create
end
     
template '/etc/odoo/crm.myshala.lan' do
  source  'crm.myshala.lan.erb'
  group 'root'
  owner 'root'
  mode '0755' 
end

cookbook_file '/etc/nginx/nginx.conf' do
         source 'nginx.conf'
         owner 'root'
         group 'root'
         mode  '0755' 
      action :create 
end

service 'nginx' do
     action :restart
end

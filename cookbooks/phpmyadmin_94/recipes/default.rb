#
# Cookbook Name:: phpmyadmin_94
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

list = ['epel-release', 'vim', 'phpMyAdmin', 'nginx', 'mariadb-server', 'mariadb', 'php-fpm']
list.each do |l|
  package $l
   action :install
end

 
user 'myshala' do
       supports :manage_home => true
       comment 'myshala User'
       home '/home/myshala'
       shell '/bin/bash'
  end

list2 = ['chown -R myshala:myshala /etc/share/phpMyAdmin/', 'chmod -R 755 /etc/share/phpMyAdmin/', 'chgrp -R myshala /etc/share/phpMyAdmin/', 'mkdir -p /etc/nginx/sites-enabled', 'mkdir -p /etc/nginx/sites-available']
     list2.each do |c|
     execute "list2" do
     command c
     action :run
     end
end

#cookbook_file "/etc/nginx/nginx.conf" do
#       source "nginx.conf" 
#       mode "0644"
#end

 cookbook_file "/etc/nginx/sites-available/phpMyAdmin" do
       source "phpMyAdmin"
       mode "0644"
end
     execute "soft link creation" do
          command "ln -s /etc/nginx/sites-available/phpMyAdmin /etc/nginx/sites-enable/phpMyAdmin"
          action :run
  end

execute "firewall_service_entry" do
     command "firewall-cmd --permanent --add-service=nginx"
     action :run
     end

   execute "firewall_port_entry" do
     command "firewall-cmd --permanent --add-port=80/tcp"
     action :run
     end

#cookbook_file "/etc/php-fpm.d/phpmyadmin_phpfpm.conf" do
#       source "phpmyadmin_phpfpm.conf"
#       mode "0644"
#end
service "nginx" do
  action [:enable, :restart]
end

service "php-fpm" do
  action [:enable, :restart]
end


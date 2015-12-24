#
# Cookbook Name:: lamp_server
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
include_recipe "sudo_user"

page = "<?php phpinfo(); ?>"

list = ['epel-release', 'vim', 'httpd', 'mariadb-server', 'mariadb', 'php', 'php-mysql', 'php-fpm' ]
list.each do |i|
package "#{i}" do
       action :install
end
end

service "httpd" do
  action [:enable, :restart]
end

service "mariadb" do
  action [:enable, :restart]
end


 execute "Test_http_default_webpage" do
    command "curl -I http://localhost/"
    action :run
    end

  

list2 = ['mkdir -p /var/www/html', 'echo $page >> /var/www/html/info.php', 'ls /var/www/html/info.php']
     list2.each do |c|
     execute "list2" do
     command "#{c}"
     action :run
     end
end


list1 = ['http', 'https']
    list1.each do|l|
 
    execute "list1" do
    command "sudo firewall-cmd --permanent --zone=public --add-service=#{l}"
    action :run
    end
    end

 execute "firewall_reload" do
    command "sudo firewall-cmd --reload"
    action :run
    end

execute "Test_http_default_webpage" do
    command "curl -I http://localhost/info.php"
    action :run
    end


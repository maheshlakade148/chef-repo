#
#
# Cookbook Name:: migration_myshala_cloud
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#i
# page = "<?php phpinfo(); ?>"

user 'myshala' do
       supports :manage_home => true
       comment 'myshala User'
       home '/home/myshala'
       shell '/bin/bash'
  end

list3 = ['epel-release', 'vim', 'nginx', 'mariadb-server', 'mariadb', 'php', 'php-mysql', 'php-fpm','php-cli']
list3.each do |i|
package i do
       action :install
end
end


#service "mariadb" do
#  action [:enable, :restart]
#end

list2 = ['mkdir -p /home/myshala/public_html', 'chown -R nginx:nginx /home/myshala/public_html', 'chmod 755 /home/myshala/public_html', 'mkdir -p /etc/nginx/sites-enabled','mkdir -p /etc/nginx/sites-available', 'echo "139.162.3.224 myshala.com www.myshala.com" >> /etc/hosts']
     list2.each do |c|
     execute "list2" do
     command c
     action :run
     end
end


cookbook_file "/home/myshala/public_html/index.php" do
       source "index.php" 
       mode "0644"
end

cookbook_file "/etc/nginx/nginx.conf" do
       source "nginx.conf" 
       mode "0644"
end

 cookbook_file "/etc/nginx/sites-available/myshala.com" do
       source "myshala.com"
       mode "0644"
end

#     execute "soft link creation" do
#     command "ln -s /etc/nginx/sites-available/myshala.com /etc/nginx/sites-enabled/myshala.com"
#     action :run
#     end

 execute "firewall_entry" do
     command "firewall-cmd --permanent --zone=public --add-service=http"
     action :run
     end

 execute "firewall_reload" do
    command "sudo firewall-cmd --reload"
    action :run
    end

service "nginx" do
  action [:enable, :restart]
end


list5 = ['ntp', 'zabbix22', 'zabbix22-agent', 'vsftpd']
list5.each do |i|
package i do
       action :install
end
end

list7 = ['ntpd', 'zabbix-agent', 'vsftpd']
list7.each do |i|
    service i do
    action [:enable, :restart]
end
end

list6 = ['"30 06 * * * /root/mysql_backups/backup_mysql.sh >  /tmp/bak.out 2>&1"', '"#0 20 * * * /usr/bin/php /var/www/myeshala/apps/myeshalaRoot/DataServices-debug/services/worklog-shortcuts/worklog-animators.php > /tmp/worklog_mails.log 2>&1"', '"#0 20 * * * /usr/bin/php /var/www/myeshala/apps/myeshalaRoot/DataServices-debug/services/worklog-shortcuts/worklog-contentwriters.php >> /tmp/worklog_mails.log 2>&1"', '"#0 20 * * * /usr/bin/php /var/www/myeshala/apps/myeshalaRoot/DataServices-debug/services/worklog-shortcuts/worklog-individual.php >> /tmp/worklog_mails.log 2>&1"']
    list6.each do |c|
     execute "crontabEntry" do
     command "(crontab -l ; echo #{c} ) | sort - | uniq - | crontab -"
     action :run
     end

end

 #execute "setenforce o" do
 #   command "setenforce 0"
 #   action :run
 #   end

cookbook_file "/etc/php.ini" do
       source "php.ini"
       mode "0644"
end

cookbook_file "/etc/php-fpm.d/myshala.conf" do
       source "myshala.conf"
       mode "0644"
end


service "php-fpm" do
  action [:enable, :start]
end


#
# Cookbook Name:: school_fail2ban
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

system("rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-1.noarch.rpm")
 
list = ['epel-release', 'fail2ban']

list.each do |i|

package "#{i}" do
       action :install
end
end


system("cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local")

service "fail2ban" do
  action [:enable, :restart]
end



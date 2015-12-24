#
# Cookbook Name:: fail2ban
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "fail2ban" do

    action :install
end

execute "fail2ban" do
  command "systemctl restart fail2ban; systemctl status fail2ban"
  action :run
end


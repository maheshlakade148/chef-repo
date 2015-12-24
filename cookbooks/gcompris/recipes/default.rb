#
# Cookbook Name:: gcompris
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

system("ip route replace default via 192.168.100.251 dev eth0  proto static")

cookbook_file "naulinuxschool.repo" do
        path "/etc/yum.repos.d/naulinuxschool.repo"
        action :create
end

cookbook_file "/opt/gcompris-9.5-4.el6.i686.rpm" do
       source "gcompris-9.5-4.el6.i686.rpm"
       mode "0644"
     end
   
   execute "gcompris" do
     command  "yum --enablerepo=naulinuxschool -y install /opt/gcompris* --skip-broken"
     action :run
    end


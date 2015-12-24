#
# Cookbook Name:: Lirboffice_database
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
 system("ip route replace default via 192.168.100.251 dev eth0  proto static")

execute "Libr office remove" do
    command  "yum remove openoffice* libreoffice*"
        action :run
      end
 execute "Libr office install" do
    command  "yum -y localinstall /root/Desktop/LibreOffice_4.4.3.2_Linux_x86-64_rpm/RPMS/*.rpm"
        action :run
      end

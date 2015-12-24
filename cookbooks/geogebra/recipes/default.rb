#
# Cookbook Name:: geogebra
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

list = ["geogebra-mime-data-1.0-1.2.noarch.rpm", "geogebra-4.2.36.0-7.1.noarch.rpm"]
 list.each do |l| 
   execute "geogebra" do
   command "yum install -y #{l}"
   end
 end                    


#
# Cookbook Name:: opextest
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

   #testupload
   package "apache2" do 
    action:install
  end
 
  cookbook_file "/var/www/html/index.html" do
       source "index.html"
       mode "0644"
    end 

  service "apache2" do
    action:restart
   end
 

#
# Cookbook Name:: ee_default_reliance
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redisend

system("touch /tmp/test.rb")


  #file "/tmp/test.rb" do
  #owner 'root'
  #group 'root'
  #mode '0755'
  #action :create
  #end

iplist = []

  for i in 11..131 do
    ip = "192.168.1.#{i}"
    iplist << ip
  end


 iplist.each do|ipprint|

  fileopen = open("/tmp/test.rb",'r+')
    execute "ip rule list" do
    command "ip rule list > /tmp/test.rb"
    action :run
    end
    str = fileopen.read
    if(str=~ /#{ipprint}(.*)/)
     puts "ip present #{ipprint}"
               else
                execute "ip add rule" do
                command "ip rule add from #{ipprint} lookup tata"
                action :run
                end 
               puts "success"
       end
       end


     list2 = ["192.168.1.36", "192.168.1.98", "192.168.1.99", "192.168.1.43", "192.168.1.44", "192.168.1.96", "192.168.1.97", "192.168.1.52"]
    list2.each do|l|
 
    execute "list2" do
    command "ip rule del from #{l} lookup tata"
    action :run
    end
    end

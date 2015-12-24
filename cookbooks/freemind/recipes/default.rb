#
# Cookbook Name:: freemind
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

#@interface = ""
       cookbook_file "/etc/yum.repos.d/freemind.repo" do
        source "freemind.repo"
        mode "0644"
       end 
       cookbook_file "/etc/yum.repos.d/jpackage.repo" do
        source "jpackage.repo"
        mode "0644"
       end

    #   execute "jre Install" do
    #      command "/root/Desktop/jrockit-jdk1.6.0_45-R28.2.7-4.1.0-linux-x64.bin"
    #      action :run
    #   end
       
 
    #list = ["PATH=/usr/java/jre1.6.0_05/bin:$PATH", "JAVA_HOME='/usr/java/jre1.6.0_05'", "CLASSPATH=.:/usr/java/jdk1.6.0_05"]
    # list.each do |l|
    #  execute "javapath1" do
    #  comnmand "export #{l}"
    #  action :run
    #end
  #endi
       #  interface = ip r | grep "default via" | awk '{print $5}'
    #    execute "get interface" do
    #      command "@interface=$(ip r | grep 'default via' | awk '{print $5}')"
    #      action :run
    #   end
    #      puts "interface name = #{@interface}"
 
      execute "route change" do
          command "ip route replace default via 192.168.100.251 dev $(ip r | grep 'default via' | awk '{print $5}')  proto static"
          action :run
       end
      execute "jre Install" do
          command "/root/Desktop/jrockit-jdk1.6.0_45-R28.2.7-4.1.0-linux-x64.bin"
          action :run
      end
    
      execute "path" do
          command "export PATH=/usr/java/jre1.6.0_05/bin:$PATH"
          action :run
       end
     execute "home" do
          command "export JAVA_HOME='/usr/java/jre1.6.0_05'"
          action :run
       end
     execute "classpath" do
          command "export CLASSPATH=.:/usr/java/jdk1.6.0_05"
          action :run
       end


        execute "freemind Install" do
          command "yum -y install /root/Desktop/freemind*"
          action :run
       end



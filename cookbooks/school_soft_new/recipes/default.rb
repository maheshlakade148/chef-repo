#
# Cookbook Name:: school_soft_new
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute



    execute "change route .83" do
    command "ip route replace default via 192.168.10.83 dev $(ip r | grep 'default via' | awk '{print $5}')  proto static"
    action :run
    ignore_failure true
     end
  

   execute "sshpass_install" do
    command "yum install -y http://dl.fedoraproject.org/pub/epel/6/i386/sshpass-1.05-1.el6.i686.rpm"
    action :run
    ignore_failure true
  end

execute "Copy all Packages" do
    command  "sshpass -p 'root' scp -o 'StrictHostKeyChecking no' -r root@192.168.10.83:/root/finalrpmcollection/* ~/Desktop/"
       action :run
       ignore_failure true
    end

pass = "12345"

  user 'student' do
       supports :manage_home => true
       comment 'student User'
       home '/home/student'
       shell '/bin/bash'
  end

list = ["echo #{pass} | passwd student --stdin", "mkdir -p /home/student"]
    list.each do |c|
     execute "list" do
     command "#{c}"
     action :run
     end
end


#syste("yum -y update")
 
    execute "geogebra" do
    command  "yum install -y ~/Desktop/geogebra-mime-data-1.0-1.2.noarch.rpm ~/Desktop/geogebra-4.2.36.0-7.1.noarch.rpm"
       action :run
       ignore_failure true
    end
    
     cookbook_file "freemind.repo" do
        path "/etc/yum.repos.d/freemind.repo"
        action :create
      end
 
     execute "freemind" do
    command  "yum -y install  ~/Desktop/freemind-plugins-svg-0.8.0-6.noarch.rpm --skip-broken"
       action :run
       ignore_failure true
    end
 

     execute "tuxpaint" do
     command  "yum localinstall -y ~/Desktop/tuxpaint-0.9.22-1.x86_64.rpm --skip-broken"
       action :run
       ignore_failure true
    end
     
    execute "mtpaint" do
    command  "yum -y install /root/Desktop/mtpaint-3.21-1.el6.rf.i686.rpm --skip-broken"
        action :run
        ignore_failure true
     end

    execute "Libr office remove" do
    command  "yum -y remove openoffice* libreoffice*"
        action :run
        ignore_failure true
      end
  
    execute "Libr office install" do
    command  "yum -y localinstall /root/Desktop/LibreOffice_4.4.3.2_Linux_x86-64_rpm/RPMS/*.rpm --skip-broken"
        action :run
         ignore_failure true
      end


  cookbook_file "naulinuxschool.repo" do
        path "/etc/yum.repos.d/naulinuxschool.repo"
        action :create
  end

   # list2 = ["epel-release", "clean metadata", "update"]
   # list2.each do |c|
   #  execute "list2" do
   #  command "yum -y #{c}"
   #  action :run
   #   ignore_failure true
   #  end
   # end
     
 
    execute "gcompris" do
    command  "yum --enablerepo=naulinuxschool -y install gcompris* --skip-broken"
        action :run
           ignore_failure true
   end

  #  execute "Basic 256" do
  #    command  "yum -y localinstall /root/Desktop/basic256-1.1.0.0-6.mga5.x86_64.rpm"
  #    action :run
  #  end

#system("yum install -y ld-linux.so.2 gtk2-devel.i686 libdbus-glib-1.so.2 libhal.so.1 rpm-devel.i686 libXt.so.6 --setopt=protected_multilib=false gnome-keyring-devel.i686 libDCOP.so.4 libxml2-devel.i686 nss-devel.i686 libxslt.i686 xterm rpm-build libgnome-keyring.i686 gtk2-engines gtk2-engines.i686 libcanberra-gtk2 libcanberra-gtk3 libcanberra-gtk2.i686 libcanberra-gtk3.i686 --skip-broken")

    execute "Air_Dependency" do
    command " yum install -y ld-linux.so.2 gtk2-devel.i686 libdbus-glib-1.so.2 libhal.so.1 rpm-devel.i686 libXt.so.6 --setopt=protected_multilib=false gnome-keyring-devel.i686 libDCOP.so.4 libxml2-devel.i686 nss-devel.i686 libxslt.i686 xterm rpm-build libgnome-keyring.i686 gtk2-engines gtk2-engines.i686 libcanberra-gtk2 libcanberra-gtk3 libcanberra-gtk2.i686 libcanberra-gtk3.i686 --skip-broken"
    action :run
    ignore_failure true
  end
      

     execute "AdobAir_Grant_execute" do
         command  "chmod +x /root/Desktop/AdobeAIRInstaller.bin"
         action :run
         ignore_failure true
       end
     
   execute "AdobAir" do
    command  "/root/Desktop/AdobeAIRInstaller.bin"
    action :run
     ignore_failure true
  end




#execute "mycommand" do
#  environment "PATH" => "/my/path/to/bin:#{ENV["PATH"]}"
#end

#system("yum --enablerepo=naulinux-school install gcompris")

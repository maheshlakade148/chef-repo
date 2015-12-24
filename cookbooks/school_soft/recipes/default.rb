#
# Cookbook Name:: school_soft
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#


%w{epel-release wget}.each do|pkg|
	package pkg do
		action :install
	end
end
                 execute "delete file" do
                 command "rm -rf /etc/yum.repo.d/"
                 action :run
                      end
         
#system("yum clean all")
#system("yum -y epel-release")
#system("yum clean metadata")

    # execute "copy files to install" do
    # command "echo 'root' | scp -r root@192.168.100.251:/root/Desktop/lab_soft_installation /root/Desktop/"
   #action :run
    # end


list1 = ["yum clean metadata", "yum -y update", "yum -y install mtpaint-3.21-1.el6.rf.i686.rpm", "yum -y install libreoffice opensips-mmgeoip", "yum -y localinstall tuxpaint-0.9.22-1.x86_64.rpm .", "yum -y localinstall geogebra-mime-data-1.0-76.1.noarch.rpm"]
    list1.each do |c|
     execute "list1 update yum mtpaint librooffice tuxpaint geogebra" do
      command "#{c}" 
    #command "cd /root/Desktop/lab_soft_installation/ && #{c}"
   action :run
     end
end

#execute "install mtpaint librooffice tuxpaint geogebra" do
#  command "/etc/init.d/tomcat6 start"
#  action :run
#end
#system("yum -y update")
#system("yum -y install mtpaint-3.21-1.el6.rf.i686.rpm")
#system("yum -y install libreoffice opensips-mmgeoip")
#system("yum -y localinstall tuxpaint-0.9.22-1.x86_64.rpm .")
#system("yum -y localinstall geogebra-mime-data-1.0-76.1.noarch.rpm")
#system("yum install -y adobeair.i386.rpm")
#system("yum -y install pygtk2-devel.i686 gtk2-devel.i686 libcanberra-gtk2.i686 gnome-keyring-devel rpm-devel.i686 libXt.i686 libXt-devel.i686  libxml2-devel.i686 glibc.i686")


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

cookbook_file "naulinux-school.repo" do
	path "/etc/yum.repos.d/naulinux-school.repo"
	action :create
end

system("yum install wget")
system("yum -y update")
system("wget http://downloads.naulinux.ru/pub/NauLinux/6x/i386/sites/School/RPMS/gcompris-9.5-4.el6.i686.rpm")
system("yum --enablerepo=naulinux-school install gcompris")
#system("yum -y install gcompris-9.5-4.el6.i686.rpm")
#
##      %w{gcompris}.each do|pkg|
##	package pkg do
##		action :install
##	end
##end
#
##system("yum install --enablerepo=naulinux_school gcompris")
#system("yum install -y ld-linux.so.2 gtk2-devel.i686 libdbus-glib-1.so.2 libhal.so.1 rpm-devel.i686 libXt.so.6 --setopt=protected_multilib=false gnome-keyring-devel.i686 libDCOP.so.4 libxml2-devel.i686 nss-devel.i686 libxslt.i686 xterm rpm-build libgnome-keyring.i686 gtk2-engines gtk2-engines.i686 libcanberra-gtk2 libcanberra-gtk3 libcanberra-gtk2.i686 libcanberra-gtk3.i686 --skip-broken")

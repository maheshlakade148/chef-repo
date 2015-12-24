#
# Cookbook Name:: skype
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "epel-release" do
      action :install
end

execute("rpm --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro")
execute("rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-1.el7.nux.noarch.rpm")

package "nux-dextop-release" do
      action :install
end
list = ['epel-release', 'alsa-lib', 'fontconfig.i686', 'freetype.i686', 'glib2.i686', 'libSM.i686', 'libXScrnSaver.i686','libXi', 'libXrandr.i686', 'libXrender.i686', 'libXv.i686','libstdc++.i686','pulseaudio-libs.i686','qt.i686', 'qt-x11.i686','zlib.i686', 'qtwebkit.i686']

list.each do |i|

package "#{i}" do
       action :install
end
end

execute 'download skype in temp' do
  cwd '/temp'
  command 'wget  http://www.skype.com/go/getskype-linux-dynamic'
  not_if { ::File.exists?('/temp/skype-4.3.0.37.tar.bz2') }  
end

execute 'extract skype in temp' do
  cwd '/opt/'
  command 'mkdir skype'
 not_if { ::File.exists?('/opt/skype') }

end

execute 'extract2 skype in temp' do
  cwd '/temp/'
  command 'tar -xvf skype-4.3* -C /opt/skype --strip-components=1'
  not_if 'bundle check' # This is not run inside /myapp
end




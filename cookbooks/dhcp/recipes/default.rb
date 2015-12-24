#
# Cookbook Name:: dhcp
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
list2 = ['add-service=ssh', 'add-port=3000/tcp', 'add-masquerade']

  list2.each do|l|
   execute "list2" do
  command "firewall-cmd --permanent --#{l} --zone=external"
  action :run
end
end

listdata ="192.168.1.5/24"
list1 = ['hostnamectl set-hostname gateway.ee.lan', 'hostnamectl set-hostname gateway.ee.lan', 'hostname', 'echo "192.168.1.5 gateway.ee.lan" >> /etc/hosts',  'cat /etc/sysconfig/network']

  list1.each do |c|
      execute "list1" do
     command "#{c}"
     action :run
     end
end

comm ="ls"
list3 = ["#{comm}","ps"]

  list3.each do|l|
   execute "list3" do
  command "#{l}"
  action :run
end
end

      h = {"4000" => "192.168.1.66", "50180" => "192.168.1.46", "8443" => "192.168.1.38", "2222" => "192.168.1.15", "8484" => "192.168.1.38", "8888" => "192.168.1.38", "9999" => "192.168.1.38", "16000" => "192.168.1.72", "9090" => "192.168.1.15"}
h.each do |p, ip|
      execute "list3" do
      command "firewall-cmd --permanent --add-forward-port=port=#{p}:proto=tcp:toport=#{p}:toaddr=#{ip} --zone=external"
      action :run
      end
end
 

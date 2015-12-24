
# Cookbook Name:: basicsoftware
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
#
#list = ['epel-release', 'vim', 'iptraf', 'netstat-nat']
list = ['epel-release', 'vim', 'iptraf', 'net-tools']

list.each do |i|

package "#{i}" do
       action :install
end
end

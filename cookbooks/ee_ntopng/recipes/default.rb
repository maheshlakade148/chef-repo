#
# Cookbook Name:: ntopng_installation
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

# Adding the EPEL repository and wget package

%w{epel-release wget}.each do|pkg|
	package pkg do
		action :install
	end
end

# Creating the ntopng repo

cookbook_file "ntop.repo" do
	path "/etc/yum.repos.d/ntop.repo"
	action :create
end

# Installing the packages ntopng and ntopng-data

%w{ntopng ntopng-data}.each do|pkg|
	package pkg do
		action :install
	end
end

# Copying ntopng.conf.sample file to ntopng.conf

#execute "Copying ntopng.conf.sample to ntopng.conf" do
#	command "cp /etc/ntopng/ntopng.conf.sample /etc/ntopng/ntopng.conf"
#end

# Starting ntopng service

service "ntopng" do
	action :start
end

# Installing redis server for ntopng

package "redis" do
	action :install
end

# Starting redis server

service "redis" do
	action :start
end

# Configuring firewall to allow traffic to 3000 port

execute "Configuring firewall" do
	command "firewall-cmd --direct --add-rule ipv4 filter IN_public_allow 0 -m tcp -p tcp --dport 3000 -s #{node[:ntopng_installation][:ip]} -j ACCEPT"
end

# Restarting ntopng service

service "redis" do
	action :restart
end

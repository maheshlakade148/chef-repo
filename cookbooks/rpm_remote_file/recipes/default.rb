#
# Cookbook Name:: rpm_remote_file
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file "gcompris-9.5-4.el6.i686.rpm" do
    not_if "rpm -qa | grep -qx 'http://downloads.naulinux.ru/pub/NauLinux/6x/i386/sites/School/RPMS/gcompris-9.5-4.el6.i686.rpm'"
end


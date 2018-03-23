#
# Cookbook Name:: remi
# Recipe:: default
#
# Copyright (C) 2018 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# epel
package 'epel-release.noarch' do
  action :install
end

#remi download
remote_file "#{Chef::Config[:file_cache_path]}/remi-release-7.rpm" do
  source "http://rpms.famillecollet.com/enterprise/remi-release-7.rpm"
  action :create
end

# remi install
rpm_package "remi-release-7" do
  source "#{Chef::Config[:file_cache_path]}/remi-release-7.rpm"
  action :install
end

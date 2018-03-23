#
# Cookbook Name:: resources
# Recipe:: default
#
# Copyright (C) 2018 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# create resources directory
directory "/vagrant/resources/sis" do
  owner "vagrant"
  group "vagrant"
  recursive true
  mode 0755
  action :create
  not_if {File.exist?("/vagrant/resources/sis")}
end

# set sample index file
template "index.php" do
  path "/vagrant/resources/sis/index.php"
  owner "vagrant"
  group "vagrant"
  mode 0644
end

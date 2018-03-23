#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (C) 2018 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

#install
%w[

  httpd
  httpd-devel
  mod_ssl
].each do |pkg|
  package "#{pkg}" do
    action :install
  end
end

#service
service "httpd" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

# template
#template "/etc/httpd/conf/httpd.conf" do
#  source "httpd-2.2.conf.erb"
#end

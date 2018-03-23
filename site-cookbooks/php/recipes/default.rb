#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright (C) 2018 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# install
%w[
  php
  php-pdo
  php-mbstring
  php-mysqlnd
  php-xml
  php-mcrypt
].each do |pkg|
  package "#{pkg}" do
    action :install
    options '--enablerepo=remi-php55'
  end
end

# setup php.ini
template "/etc/php.ini" do
  action :create
  notifies :restart, "service[httpd]", :immediately
  mode 0644
end

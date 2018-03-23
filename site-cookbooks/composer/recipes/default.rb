#
# Cookbook Name:: composer
# Recipe:: default
#
# Copyright (C) 2018 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# create Directory
directory "/vagrant/resources/cakephp" do
  owner "vagrant"
  group "vagrant"
  recursive true
  mode 0755
  action :create
  not_if {File.exist?("/vagrant/resources/cakephp")}
end

# composer install
bash "isntall composer" do
  code <<-EOF
    cd /vagrant/resources/cakephp
    pwd
    curl -s https://getcomposer.org/installer | php
  EOF
end
bash "move composer command" do
  user 'root'
  code <<-EOF
    cd /vagrant/resources/cakephp
    mv composer.phar /usr/local/bin/composer
    chmod a+x /usr/local/bin/composer
    /usr/local/bin/composer -v
  EOF
end

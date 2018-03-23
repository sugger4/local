#
# Cookbook Name:: cakephp
# Recipe:: default
#
# Copyright (C) 2018 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
# change export
bash "export http_proxy/https_proxy" do
  user 'root'
  code <<-EOF
    export http_proxy=192.168.115.242:3128
    export https_proxy=192.168.115.242:3128
  EOF
end

# set composer.json
template "composer.json" do
  path "/vagrant/resources/cakephp/composer.json"
end

# cakePHP install
bash "cakePHP install" do
  code <<-EOF
    cd /vagrant/resources/cakephp
    pwd
    /usr/local/bin/composer install
  EOF
end

# install exepect
package "expect" do
  action :install
end

# bake 
bash "cakePHP bake" do
  user 'root'
  code <<-EOF
    cd /vagrant/resources/cakephp
    pwd
    expect -c '
    spawn /usr/bin/sh /vagrant/resources/cakephp/Vendor/cakephp/cakephp/lib/Cake/Console/cake bake project app
    set timeout 1800
    expect {
      -regexp "Look okay? (y/n/q)\n [y] > *" {
        exp_send "y\r"
        exp_continue
      }
    }
    '  
  EOF
end

# set database file
template "database.php" do
  path "/vagrant/resources/cakephp/app/Config/database.php"
end


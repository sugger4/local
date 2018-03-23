#
# Cookbook Name:: firewalld
# Recipe:: default
#
# Copyright (C) 2018 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# allow services
%w[
  http
  https
].each do |service|
    execute "firewalld" do
      command "firewall-cmd --zone=public --add-service=#{service} --permanent"
#      notifies :restart, 'service[firewalld]', :immediately
    end
end

# allow 8888 port
bash "firewalld allow port of 8888" do
  user 'root'
  code <<-EOF
    firewall-cmd --zone=public --add-port=8888/tcp
  EOF
end

# restart firewalld
service "firewalld" do
    action :restart
end

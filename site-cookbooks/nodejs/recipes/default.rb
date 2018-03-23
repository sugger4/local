#
# Cookbook Name:: nodejs
# Recipe:: default
#
# Copyright (C) 2018 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# set git config for proxy
#bash "git proxy" do
#  code <<-EOF
#    git config --global http.proxy http://192.168.115.242:3128
#    git config --global https.proxy https://192.168.115.242:3128
#  EOF
#end

#install nvm
git "/usr/local/nvm" do
  repository "https://github.com/creationix/nvm.git"
  reference "master"
  action :sync
end

template "/etc/profile.d/nvm.sh" do
  source "nvm.sh.erb"
  mode 0644
end

directory "usr/local/nvm/alias/" do
  action :create
end

bash "install_nodejs" do
  user 'root'
  code <<-EOC
    chmod a+x /usr/local/nvm/nvm.sh
    source /usr/local/nvm/nvm.sh
    nvm install 5.5.0
  EOC
  
  # ここにnodeの本体がいる
  creates "/usr/local/nvm/5.5.0"
end

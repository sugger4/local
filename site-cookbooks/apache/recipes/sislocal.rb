template "/etc/httpd/conf.d/sislocal.conf" do
  source "sislocal.conf.erb"
end

#service
service "httpd" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

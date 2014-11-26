#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#package "httpd" do
# action :install
#end

#service "httpd" do
# action [ :enable, :start]
#end

template "httpd.conf" do
 path "/etc/httpd/conf/httpd.conf"
 source "httpd.conf.erb"
 owner "root"
 group "root"
 mode 0644
# notifies :restart, 'service[httpd]'
end

service "httpd" do
 action [ :restart]
end

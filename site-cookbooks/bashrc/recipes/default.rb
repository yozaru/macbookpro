#
# Cookbook Name:: bashrc
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
template "bashrc" do
 path "/home/a12426/.bashrc"
 source "bashrc.erb"
end

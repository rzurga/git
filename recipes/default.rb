#
# Cookbook Name:: git
# Recipe:: default
#
# Copyright 2016, vagrant@zurga.com
#
# All rights reserved - Do Not Redistribute
#

# Install git
package "git" do
  action :upgrade
end

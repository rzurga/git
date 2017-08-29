#
# Cookbook Name:: git
# Recipe:: gituser
#
# Copyright 2016, vagrant@zurga.com
#
# All rights reserved - Do Not Redistribute
#

# Setup git user

include_recipe "chef-solo-search"

node[:git_users].each do |user_id|
    user_entry = search(:users, "id:" + user_id).first
    git_user_name = user_entry["git_user_name"] || node[:git][:user] || user_id
    git_user_email = user_entry["git_user_email"] || node[:git][:email]

    bash "git_user setup" do
        user user_id
        code <<-EOD
            sudo su - #{user_id} -c "git config --global user.name '#{git_user_name}'"
            sudo su - #{user_id} -c "git config --global user.email '#{git_user_email}'"
        EOD
        action :run
    end
end

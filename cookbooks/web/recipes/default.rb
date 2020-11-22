#
# Cookbook:: web
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

include_recipe 'nginx'
include_recipe 'nodejs'

# CD のためにプロセス管理目的で導入
# ref: https://github.com/yoshikouki/yoshikouki.net/pull/3
execute 'install pm2' do
  command 'npm install -g pm2'
  action :run
end

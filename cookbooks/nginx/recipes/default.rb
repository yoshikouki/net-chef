#
# Cookbook:: nginx
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# nginx をインストール
package 'nginx' do
  action :install
end

# nginx を起動する
service 'nginx' do
  supports status: true,
           restart: true,
           reload: true
  action %i[enable start]
end

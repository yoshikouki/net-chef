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

# テンプレート設定ファイルを使用する
template 'nginx.conf' do
  path '/etc/nginx/nginx.conf'
  source 'nginx.conf.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :reload, 'service[nginx]'
end

# バーチャルホストの設定を配置するディレクトリを作成
directory '/etc/nginx/vhost.d' do
  owner 'root'
  group 'root'
  mode 0755
  recursive true
end

#
# Cookbook:: nginx
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# nginx をインストール
package 'nginx' do
  action :install
end

# ディレクトリを作成
%w[
  /etc/nginx
  /etc/nginx/vhost.d
  /var/www
  /var/www/yoshikouki.net
].each do |path|
  directory path do
    owner 'root'
    group 'root'
    mode 0755
    recursive true
  end
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

# nginx を起動する
service 'nginx' do
  supports status: true,
           restart: true,
           reload: true
  action %i[enable start]
end

cookbook_path ["cookbooks", "vendor/cookbooks"]
local_mode true
chef_repo_path File.expand_path('../', __FILE__)

knife[:ssh_attribute] = "knife_zero.host"
knife[:use_sudo] = true

## SSHエージェントを使ってないなら、SSHログイン用の鍵へのファイルパスを指定しましょう。
# knife[:identity_file] = "~/.ssh/id_rsa"

## Nodeの各種属性(attributes)はローカルにJSONファイルとして保存されていきます。
## automatic_attribute_whitelist オプションは、Nodeから収集したAttributeのうち、保存する対象を絞ることができます。
## NodeもGitで管理する場合は、現状に依存するディスク使用量などは無視してよいでしょう。
knife[:automatic_attribute_whitelist] = %w[
  fqdn
  os
  os_version
  hostname
  ipaddress
  roles
  recipes
  ipaddress
  platform
  platform_version
  cloud
  cloud_v2
  chef_packages
]

# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "jsanchez"
client_key               "#{current_dir}/jsanchez.pem"
chef_server_url          "https://jsanchez-ve6.mylabserver.com/organizations/chefbadge"
cookbook_path            ["#{current_dir}/../cookbooks"]

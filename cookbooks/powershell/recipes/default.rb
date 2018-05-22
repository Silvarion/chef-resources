#
# Cookbook:: powershell
# Recipe:: default
#
# Copyright:: 2018, Jesus Sanchez, All Rights Reserved.
#

if node['platform_family'] == 'rhel'
	notifies :run, 'execute[register-ps-repo-rhel]'
elsif node['platform_family'] == 'debian'
	notifies :run, 'execute[register-ps-repo-deb]'
	notifies :run, 'execute[register-ms-product-feed]'
end

execute 'register-ps-repo-rhel' do
	command 'curl https://packages.microsoft.com/config/rhel/7/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo'
	action :run
	not_if { File.exist?("/etc/yum.repos.d/microsoft.repo") }
end

execute 'register-ps-repo-deb' do
	command 'curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -'
	action :nothing
end

execute 'register-ms-product-feed' do
	command 'sudo sh -c \'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/microsoft.list\''
	action :nothing
end

package 'powershell-core' do
	package_name 'powershell'
	action :install
end

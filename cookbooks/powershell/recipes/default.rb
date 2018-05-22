#
# Cookbook:: powershell
# Recipe:: default
#
# Copyright:: 2018, Jesus Sanchez, All Rights Reserved.
#

if node['platform_family'] == 'rhel'
	execute 'reg-ps-repo-rhel' do
		command 'curl https://packages.microsoft.com/config/rhel/7/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo'
		action :run
		not_if { ::File.exist?("/etc/yum.repos.d/microsoft.repo") }
	end
	package 'dot-net-core' do
		action :install
		options '--force-yes'
elsif node['platform_family'] == 'debian'
	execute 'reg-ps-repo-deb' do
		command 'curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -'
		action :run
		not_if { ::File.exist?("/etc/apt/sources.list.d/microsoft.list") }
	end
	package 'apt-transport-https' do
		package_name 'apt-transport-https'
		action :install
		options '--force-yes'
	end
	execute 'reg-ms-product-feed' do
		command 'sudo sh -c \'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/microsoft.list\''
		action :run
		not_if { ::File.exist?("/etc/apt/sources.list.d/microsoft.list") }
	end
	execute 'update-repos-deb' do
		command 'sudo apt-get update'
		action :run
	end
end

package 'powershell-core' do
	package_name 'powershell'
	action :install
	options '--force-yes'
end

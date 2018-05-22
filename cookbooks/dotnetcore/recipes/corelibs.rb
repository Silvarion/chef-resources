#
# Cookbook:: dotnetcore
# Recipe:: corelibs
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#

if node['platform_family'] == 'rhel'
	case node['platform']
	when 'centos'
	when 'fedora'
		if node['platform_version'] ~> '26'
			package 'openssl' do
				package_name 'compat-openssl10'
				action :install
			end
		elsif node['platform_version'] ~> '27'
		end
	when 'oracle'
	when 'rhel'
	else
	end
	
%(libunwind libicu).each do |rpm_pack|
	package "rpm_pack" do
		action :install
		options "--force-yes"
	end
elsif node['platform_family'] == 'debian'
else
end

#
# Cookbook:: dotnetcore
# Recipe:: sdk
#
# Copyright:: 2018, The Authors, All Rights Reserved.
## RedHat Family ##
if node['platform_family'] == 'rhel'
  # CentOS
  case node['platform']
  when 'centos', 'oracle'
    Chef::Log.info('CentOS/Oracle platform detected')
    remote_file "#{Chef::Config[:file_cache_path]}/packages-microsoft-prod.rpm" do
      source 'https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm'
      notifies 'execute[reg-ms-repo-centos]',	:run,	:immediate
    end
  # Fedora
  when 'fedora'
    Chef::Log.info('Fedora platform detected')
    package 'openssl' do
      package_name 'compat-openssl10'
      action :install
    end
  # SUSE/OpenSUSE
  when 'suse'
    Chef::Log.info('SUSE platform detected')
    remote_file "#{Chef::Config[:file_cache_path]}/prod.repo" do
      source 'https://packages.microsoft.com/config/opensuse/42.2/prod.repo'
      notifies 'execute[reg-ms-repo-suse', :run, :immediate
    end
  end
  %(libunwind libicu).each do |rpm_pkg|
    package rpm_pkg do
      action :install
      options '--force-yes'
    end
  end
## Debian Family ##
elsif node['platform_family'] == 'debian'
  Chef::Log.info('Debian platform detected')
  # Do debian stuff
else
  Chef::Log.info('Other Linux type platform detected')
  # Do other's stuff
end

execute 'reg-ms-repo-centos' do
  command "sudo rpm -Uvh #{Chef::Config[:file_cache_path]}/packages-microsoft-prod.rpm ; yum update"
  action :nothing
end

execute 'reg-ms-repo-suse' do
  command "sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc ; sudo mv #{Chef::Config[:file_cache_path]}/prod.repo /etc/zypp/repos.d/microsoft-prod.repo"
  action :nothing
end

package 'dot-net-sdk' do
  package_name 'dotnet-sdk-2.1.200'
  action :install, 'delayed'
end

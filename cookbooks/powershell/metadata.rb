name 'powershell'
maintainer 'Jesus Sanchez'
maintainer_email 'jsanchez.consultant@gmail.com'
license 'MIT'
description 'Installs/Configures PowerShell Core on Linux machines'
long_description 'Installs/Configures PowerShell Core on Linux machines'
version '0.1.0'
chef_version '>= 12.14' if respond_to?(:chef_version)
supports 'debian', '>= 9'
supports 'centos', '= 7'
# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/powershell/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/silvarion/chef-resources/cookbooks/powershell'

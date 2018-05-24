#
# Cookbook:: workstation
# Recipe:: editors
#
# Copyright:: 2018, Jesus Sanchez, All Rights Reserved.

%w(vim gvim nano xed).each do |editor_pkg|
  package editor_pkg do
    action :install
  end
end

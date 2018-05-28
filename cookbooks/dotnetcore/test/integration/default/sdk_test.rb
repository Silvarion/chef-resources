# # encoding: utf-8

# Inspec test for recipe dotnetcore::sdk

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# Files
if node['platform'] == 'fedora'
describe file('') do
  
end


# Packages
describe package('libunwind') do
  it { should be_installed }
end

describe package('libicu') do
  it { should be_installed }
end

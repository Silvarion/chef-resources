# # encoding: utf-8

# Inspec test for recipe workstation::editors

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe package('vim'), :skip do
    it { should be_installed }
  end
  describe package('xed'), :skip do
    it { should be_installed }
  end
  describe package('nano'), :skip do
    it { should be_installed }
  end
  describe package('gvim'), :skip do
    it { should be_installed }
  end
end

# No ports listening
describe port(80), :skip do
  it { should_not be_listening }
end

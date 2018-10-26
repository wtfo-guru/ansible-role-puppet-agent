# Puppet install

puppet_package = 'puppet-agent'
puppet_package = 'puppet' if os.name =='arch'
puppet_package = 'app-admin/puppet' if os.name == 'gentoo'

puppet_service = 'puppet'

control 'install-01' do
  impact 1.0
  title 'Puppet-agent package'
  desc 'Puppet-agent should be installed'
  describe package(puppet_package) do
    it { should be_installed }
  end
end

control 'install-02' do
  impact 1.0
  title 'Puppet-agent service'
  desc 'Puppet-agent  service should be running and enabled'
  describe package(puppet_service) do
    it { should be_enabled }
    it { should be_running }
  end
end

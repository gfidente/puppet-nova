require 'spec_helper'

describe 'nova::vncproxy' do

  let :pre_condition do
    'include nova'
  end

  describe 'on debian platforms' do
    let :facts do
      { :osfamily => 'Debian' }
    end

    it { should contain_package('python-numpy').with_ensure('present') }

    it { should contain_nova_config('novncproxy_base_url').with(
      :value => 'http://127.0.0.1:6080/vnc_auto.html'
    )}
    #describe 'when deployed on the API server' do
    #  let :pre_condition do
    #    'include nova::api'
    #  end
    #  it { should contain_package('nova-vncproxy').with(
    #    'ensure' => 'present',
    #    'before' => 'Exec[initial-db-sync]'
    #  )}
    #end
  end
end

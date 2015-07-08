require 'serverspec'
require 'docker'

image = Docker::Image.build_from_dir('python_webapp/')

set :os, family: :redhat
set :backend, :docker
set :docker_image, image.id

describe 'Docker configuration' do
  it 'should expose port 80' do
    expect(image.json['Config']['ExposedPorts']).to include('80/tcp')
  end
end

describe package('nginx') do
  it { should be_installed }
end

describe command('pip') do
  its(:exit_status) { should eq 0 }
end

describe command('cat /etc/redhat-release') do
  its(:stdout) { should contain 'CentOS release 6' }
end

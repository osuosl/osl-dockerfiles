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

%w(gcc python-devel python-setuptools libffi-devel nginx).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe port(80) do
  it { should be_listening.with('tcp') }
end

describe command('pip') do
  its(:exit_status) { should eq 0 }
end

%w(gunicorn supervisor).each do |pkg|
  describe package(pkg) do
    it { should be_installed.by('pip') }
  end
end

describe command('cat /etc/redhat-release') do
  its(:stdout) { should contain 'CentOS release 6' }
end

describe file('/etc/supervisord.conf') do
  its(:content) { should include('files = /etc/supervisor.d/*.conf') }
end

describe file('/opt/app/conf/gunicorn_config.py') do
  it { should exist }
end

describe file('/etc/nginx/conf.d/app.conf') do
  it { should exist }
end

describe file('/etc/nginx/conf.d/default.conf') do
  it { should_not exist }
end

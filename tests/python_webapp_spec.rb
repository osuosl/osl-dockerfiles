require 'serverspec'
require 'docker'

describe 'python_webapp Dockerfile' do
  before(:all) do
    image = Docker::Image.build_from_dir('python_webapp/')

    set :os, family: :debian
    set :backend, :docker
    set :docker_image, image.id
  end

  it 'installs the right version of CentOS' do
    expect(os_version).to include('CentOS release 6.6')
  end

  it 'installs required packages' do
    expect(package('nginx')).to be_installed
  end

  def os_version
    command('cat /etc/redhat-release').stdout
  end
end

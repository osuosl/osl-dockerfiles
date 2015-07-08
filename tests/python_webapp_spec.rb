require 'serverspec'
require 'docker'

describe 'Dockerfile' do
  before(:all) do
    image = Docker::Image.build_from_dir('python_webapp/')

    set :os, family: :debian
    set :backend, :docker
    set :docker_image, image.id
  end

  it 'installs the right version of CentOS' do
    expect(os_version).to include('CentOS release 6.6')
  end

  def os_version
    command('cat /etc/redhat-release').stdout
  end
end

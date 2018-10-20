
package 'git'
action :install
end

include_recipe 'git'

package 'libcurl3' do
  action :install
end

package 'curl' do
  action :install
end

if node['nvm']['install_deps_to_build_from_source']
  package 'build-essential' do
    action :install
  end
  package 'libssl-dev' do
    action :install
  end
end

# Download nvm

git node['nvm']['directory'] do
  repository node['nvm']['repository']
  reference node['nvm']['reference']
  action :sync
end

# Install nvm

template '/etc/profile.d/nvm.sh' do
  source 'nvm.sh.erb'
  mode 0755
end
package 'nodejs' do
action :install
end
package 'docker-io' do
action :install
end
command "curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose"
file '/usr/local/bin/docker-compose'
chmode '+x'
end
package 'openssl'
action :install
end
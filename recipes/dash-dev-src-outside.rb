#
# Cookbook Name:: chef-dash
# Recipe:: dash-dev-src-outside
#
# Copyright 2014 pingworks - Alexander Birk und Christoph Lukas
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Dashboard src
bash 'link dash source' do
  user 'root'
  code <<-EOL
  [ -d #{node['chef-dash']['dev']['srcBaseDir']}/#{node['chef-dash']['dev']['srcdir']}.orig ] \
    && rm -Rf #{node['chef-dash']['dev']['srcBaseDir']}/#{node['chef-dash']['dev']['srcdir']}.orig
  mv #{node['chef-dash']['dev']['srcBaseDir']}/#{node['chef-dash']['dev']['srcdir']} #{node['chef-dash']['dev']['srcBaseDir']}/#{node['chef-dash']['dev']['srcdir']}.orig
  ln -s /vagrant_app_dash #{node['chef-dash']['dev']['srcBaseDir']}/#{node['chef-dash']['dev']['srcdir']}
  EOL
  only_if '[ -f /vagrant_app_dash/README ]'
end

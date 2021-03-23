# frozen_string_literal: true

require 'json'

config_file = 'config.json'
CONFIG = JSON.parse(File.read(config_file))

task 'chdir' do
  Dir.chdir CONFIG['path']
end

desc 'Install Gems'
task 'bundle:install' => [:chdir] do
  sh %(bundle install --standalone) do |ok, res|
    puts "fail to install gems (status = #{res.exitstatus})" unless ok
  end
end

desc 'Update Gems'
task 'bundle:update' => [:chdir] do
  sh %(bundle update && bundle install --standalone) do |ok, res|
    puts "fail to update gems (status = #{res.exitstatus})" unless ok
  end
end

desc 'Build Workflow'
task 'build' do
  sh %(python workflow-build.py src) do |ok, res|
    puts "fail to build workflow (status = #{res.exitstatus})" unless ok
  end
end

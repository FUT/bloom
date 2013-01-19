require 'sidekiq/capistrano'
require 'bundler/capistrano'

set :keep_releases, 2
set :application, "bloom"
set :deploy_to, "/home/ubuntu/#{application}"
set :rails_env, 'production'
set :branch, 'master'
server 'ec2-54-246-44-2.eu-west-1.compute.amazonaws.com', :web, :app, :db, :primary => true
set :normalize_asset_timestamps, false

set :use_sudo, false
set :user, "ubuntu"
set :scm, :git
set :repository, "git://github.com/FUT/bloom.git"
set :deploy_via, :checkout

namespace :deploy do
  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after "deploy:update", "deploy:cleanup"


abort "You must run this using 'bundle exec ...'" unless ENV['BUNDLE_BIN_PATH'] || ENV['BUNDLE_GEMFILE']

set :stages, %w[ production staging ]
require 'capistrano/ext/multistage'
require "bundler/capistrano"
require "whenever/capistrano"

set :application, 'upjs-demo'
set :whenever_command, "bundle exec whenever"
set :use_sudo, false
set :deploy_via, :export
set :repository, "git@code.makandra.de:henning.koch/lucidity.git"
set :scm, :git
set :branch, "master"
ssh_options[:forward_agent] = true

namespace :passenger do
  desc "Restart Application"
  task :restart do
    run "sudo passenger-config restart-app --ignore-app-not-running #{deploy_to} > /dev/null 2>&1"
  end
end

namespace :db do
  desc "Create database yaml in shared path"
  task :default do
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.yml"), "#{shared_path}/config/database.yml"
  end

  desc "Make symlink for database yaml"
  task :symlink do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  desc "Warn about pending migrations"
  task :warn_if_pending_migrations, :roles => :db, :only => { :primary => true } do
    rails_env = fetch(:rails_env, 'production')
    run "cd #{release_path}; bundle exec rake db:warn_if_pending_migrations RAILS_ENV=#{rails_env}"
  end

  desc "Do a dump of the DB on the remote machine using dumple"
  task :dump, :roles => :db, :only => { :primary => true } do
    rails_env = fetch(:rails_env, 'production')
    run "cd #{current_path}; dumple --fail-gently #{rails_env}"
  end

  desc "Show usage of ~/dumps/ on remote host"
  task :show_dump_usage do
    run "dumple -i"
  end

end

namespace :deploy do

  desc "Create storage dir in shared path"
  task :setup_storage do
    run "mkdir -p #{shared_path}/storage"
  end

  task :symlink_storage do
    run "ln -nfs #{shared_path}/storage #{release_path}/storage"
  end

  task :restart do
    passenger.restart
  end

  task :start do
  end

  task :stop do
  end

end

namespace :craken do

 desc "Install raketab"
 task :install, :roles => :cron do
   rails_env = fetch(:rails_env, 'production')
   run "cd #{release_path} && bundle exec rake craken:install RAILS_ENV=#{rails_env}"
 end

 desc "Uninstall raketab"
 task :uninstall do
   run "cd #{release_path} && bundle exec rake craken:uninstall"
 end

end


before "deploy:update_code", "db:dump"
before "deploy:setup", :db
after "deploy:update_code", "db:symlink"
after "deploy:update_code", "deploy:symlink_storage"
before "deploy:setup", 'deploy:setup_storage'
after "deploy:create_symlink", "db:warn_if_pending_migrations"
after "deploy:restart", "db:show_dump_usage"

after "deploy:restart", "deploy:cleanup"

load 'deploy/assets'


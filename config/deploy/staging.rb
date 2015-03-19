set :deploy_to, '/var/www/hollyapp-staging.makandra.de'
set :rails_env, 'staging'
set :branch, 'master'
set :user, "deploy-hollyapp_s"
server "c23.staging.makandra.de", :app, :web, :cron, :db, :primary => true
server "c42.staging.makandra.de", :app, :web

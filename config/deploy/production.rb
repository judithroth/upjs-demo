set :deploy_to, '/var/www/demo.upjs.io/'
set :rails_env, 'production'
set :branch, 'master'
set :user, "deploy-demo_upjs"
server "c23.makandra.makandra.de", :app, :web, :cron, :db, :primary => true
server "c42.makandra.makandra.de", :app, :web

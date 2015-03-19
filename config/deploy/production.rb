set :deploy_to, '/var/www/demo.upjs.io/'
set :rails_env, 'production'
set :branch, 'master'
set :user, "deploy-demo_upjs"
server "c23.customers.makandra.de", :app, :web, :cron, :db, :primary => true
server "c42.customers.makandra.de", :app, :web

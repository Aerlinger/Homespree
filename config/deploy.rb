require "bundler/capistrano"

server "178.xx.xxx.xxx", :web, :db, primary: true

set :recipient, "Ruby"
set :user, "deployer"
set :application, "Homespree"

set :deploy_via, :remote_cache

set :scm, "git"
set :repository,  "https://github.com/Aerlinger/Homespree.git"
set :branch,  "master"


default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup"

task :hello, roles: :db do
  puts "Hello #{fetch(:recipient, "World")}"

  run "#{sudo} cp ~/hello /hello"
end

task :goodbye do
  puts "Goodbye #{recipient}"
end

after :hello, :goodbye

role :web, "178.xxx.xxx.xxx"
role :app, "178.xxx.xxx.xxx"
role :db, "178.xxx.xxx.xxx", primary: true



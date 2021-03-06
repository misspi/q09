# SOURCES setup users: http://www.viget.com/extend/building-an-environment-from-scratch-with-capistrano-2/
# setup deploy: http://www.capify.org/getting-started/from-the-beginning/


require 'yaml'
GIT = YAML.load_file("#{File.dirname(__FILE__)}/git.yml")

default_run_options[:pty] = true
set :application, "q09"
set :deploy_to, "/home/deploy/#{application}"
set :user, "deploy"
set :use_sudo, false

set :scm, "git"
set :repository,  "git@github.com:misspi/q09.git"
set :branch, "master"
set :deploy_via, :remote_cache
set :scm_verbose, true # dont change!!
set :scm_passphrase, GIT['password']

role :app, "toami.net"
role :web, "toami.net"
role :db,  "toami.net", :primary => true

after "deploy:update_code", "config:copy_shared_configurations"

# Configuration Tasks
namespace :config do
  desc "copy shared configurations to current"
  task :copy_shared_configurations, :roles => [:app] do
    %w[database.yml].each do |f|
      run "ln -nsf #{shared_path}/config/#{f} #{release_path}/config/#{f}"
    end
  end
end


namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end


namespace :mysql do
  desc "Backup the remote production database"
  task :backup, :roles => :db, :only => { :primary => true } do
    filename = "#{application}.dump.#{Time.now.to_i}.sql.bz2"
    file = "/tmp/#{filename}"
    on_rollback { delete file }
    db = YAML::load(ERB.new(IO.read(File.join(File.dirname(__FILE__), 'database.yml'))).result)['production']
    run "mysqldump -u #{db['username']} --password=#{db['password']} #{db['database']} | bzip2 -c > #{file}"  do |ch, stream, data|
      puts data
    end
    `mkdir -p #{File.dirname(__FILE__)}/../backups/`
    get file, "backups/#{filename}"
    `gpg -c #{File.dirname(__FILE__)}/../backups/#{filename}`
    `rm #{File.dirname(__FILE__)}/../backups/#{filename}`
    # delete file
  end
end

namespace :log do
  desc "Download production log file"
  task :download, :only => {:primary => true } do
    filename = "#{application}.#{Time.now.to_i}.log"
    file = "tmp/#{filename}"
    on_rollback { delete file }
    
    log_filename = "#{shared_path}/log/production.log"
    run "bzip2 #{log_filename}"
    get "#{log_filename}.bz2", file
    run "rm #{log_filename}.bz2"
  end
end

desc "Backup the database before running migrations"
task :before_migrate do
  backup
end

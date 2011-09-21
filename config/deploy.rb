set :application, "Depuwatch"
set :repository,  "git@github.com:svnee/Depuwatch.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "85.93.211.139"                          # Your HTTP server, Apache/etc
role :app, "85.93.211.139"                          # This may be the same as your `Web` server
role :db,  "85.93.211.139", :primary => true        # This is where Rails migrations will run

set :port, 22

set :user, "chd"
set :deploy_to, "/var/www"
set :use_sudo, false
set :shared_database_path, "#{shared_path}/databases"
set :shared_config_path, "#{shared_path}/configs"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  desc "start unicorn"
  task :start, :roles => :app, :except => {:no_release => true} do
    run "cd #{current_path} && bundle exec unicorn_exec start"
  end
  desc "stop unicorn"
  task :stop, :roles => :app, :except => {:no_release => true} do
    run "#{current_path}/bundle exec unicorn_exec stop"
  end
  task :restart, :roles => :app, :except => {:no_release => true} do
    ;
  end
end
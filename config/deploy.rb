set :application, "Depuwatch"
set :repository,  "git@github.com:svnee/Depuwatch.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "depuwatch.sven.lu"                          # Your HTTP server, Apache/etc
role :app, "depuwatch.sven.lu"                          # This may be the same as your `Web` server
role :db,  "depuwatch.sven.lu", :primary => true # This is where Rails migrations will run

set :user, "chd"
set :deploy_to, "/home/chd"
set :use_sudo, false

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
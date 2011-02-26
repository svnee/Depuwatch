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
set :shared_database_path, "#{shared_path}/databases"
set :shared_config_path, "#{shared_path}/configs"

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

namespace :sqlite3 do
  desc "Generate a database configuration file"
  task :build_configuration, :roles => :db do
    db_options = {
      "adapter"  => "sqlite3",
      "database" => "#{shared_database_path}/chd.sqlite3"
    }
    config_options = {"production" => db_options}.to_yaml
    put config_options, "#{shared_config_path}/sqlite_config.yml"
  end
 
  desc "Links the configuration file"
  task :link_configuration_file, :roles => :db do
    run "ln -nsf #{shared_config_path}/sqlite_config.yml #{release_path}/config/database.yml"
  end
 
  desc "Make a shared database folder"
  task :make_shared_folder, :roles => :db do
    run "mkdir -p #{shared_database_path}"
  end
end

after "deploy:setup", "sqlite3:make_shared_folder"
after "deploy:setup", "sqlite3:build_configuration"

before "deploy:migrate", "sqlite3:link_configuration_file"
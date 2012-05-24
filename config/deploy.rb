set :stages, %w(prod)
set :default_stage, "prod"
require 'capistrano/ext/multistage'

require 'capatross'
 
set :application, "nexc2012"
set :repository,  "git@github.com:extension/nexc2012.git"
set :branch, "master"
set :scm, "git"
set :user, "pacecar"
set :use_sudo, false
set :keep_releases, 3
ssh_options[:forward_agent] = true
set :port, 24
#ssh_options[:verbose] = :debug

after "deploy:update_code", "deploy:link_and_copy_configs"
after "deploy:update_code", "deploy:cleanup"


namespace :deploy do
  
  # Link up various configs (valid after an update code invocation)
  task :link_and_copy_configs, :roles => :app do
   
      sharedpath = "#{application}"
      uploads = "/services/wordpress/nexc2012.extension.org/uploads"
      
    run <<-CMD
    rm -rf #{release_path}/wp-config.php &&
    ln -nfs /services/config/#{sharedpath}/wordpress/wp-config.php #{release_path}/wp-config.php &&
    ln -nfs #{uploads} #{release_path}/wp-content/uploads &&
    ln -nfs /services/config/#{sharedpath}/wordpress/robots.txt #{release_path}/robots.txt &&
    ln -nfs /services/config/#{sharedpath}/wordpress/.htaccess #{release_path}/.htaccess
    CMD
  end
  
end




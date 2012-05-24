set :deploy_to, '/services/apache/vhosts/nexc2012.extension.org/'
server 'nexc2012.extension.org', :app, :web, :db, :primary => true


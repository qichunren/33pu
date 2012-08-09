set :application, "33pu"
set :repository,  "git@github.com:qichunren/33pu.git"
set :keep_releases, 4

set :scm, :git
set :user, "qichunren"
set :use_sudo, false
set :branch, $1 if `git branch` =~ /\* (\S+)\s/m

set :deploy_to, "/home/qichunren/#{application}"
server "giteye.com", :app, :web, :db, :primary => true
# default_run_options[:pty] = true

set :default_environment, {
  'PATH' => "/home/qichunren/.rvm/gems/ruby-1.9.3-p194/bin:/home/qichunren/.rvm/rubies/ruby-1.9.3-p194/bin:/home/qichunren/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games",
  'RUBY_VERSION' => 'ruby-1.9.3-p194',
  'GEM_HOME'     => '/home/qichunren/.rvm/gems/ruby-1.9.3-p194',
  'GEM_PATH'     => '/home/qichunren/.rvm/gems/ruby-1.9.3-p194:/home/qichunren/.rvm/gems/ruby-1.9.3-p194@global'
}

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:update", "deploy:cleanup"
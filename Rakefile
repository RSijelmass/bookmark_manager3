require 'data_mapper'
require './app/app.rb'

namespace :db do
  desc 'Upgrade without deleting'
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
end

  desc 'Upgrade with deleting'
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Auto-upgrade complete (data loss)"
  end
end

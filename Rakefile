namespace :db do
  require 'active_record'

  task :establish_connection do
    require 'yaml'
    dbconfig = YAML::load(File.open('config/db.yml'))
    ActiveRecord::Base.establish_connection(dbconfig)
  end

  desc "Migrate the database"
  task :migrate => :establish_connection do
    require 'logger'
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate('db/migrate')
  end

  desc 'Rolls the schema back to the previous version (specify steps w/ STEP=n).'
  task :rollback => :establish_connection do
    step = ENV['STEP'] ? ENV['STEP'].to_i : 1
    ActiveRecord::Migrator.rollback('db/migrate', step)
  end
end

namespace :gd do
  task :update => 'db:establish_connection' do
    year   = '2012'
    month  = '06'
    day    = '01'
    league = 'aaa'

    require './GamedayFetcher'
    gdf = GamedayFetcher.new
    gdf.get_day(league,year,month,day)

    require './GamedayParser'
    gdp = GamedayParser.new
    gdp.parse_day(league,year,month,day)
  end
end

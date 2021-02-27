require 'bundler/setup'
Bundler.require(:default)
require_all 'app'

set(:database, {adapter: "sqlite3", database: "db/project2.sqlite3"})


# ENV['SINATRA_ENV'] ||= "development"

# require 'bundler/setup'
# Bundler.require(:default, ENV['SINATRA_ENV'])

# ActiveRecord::Base.establish_connection(ENV['Sinatra_ENV'].to_sym)

# require_all 'app'



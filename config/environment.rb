require 'bundler'
Bundler.require
require 'rake'
require 'pry'
require 'byebug'
require_all 'app'

ActiveRecord::Base.establish_connection({
  adapter: 'sqlite3',
  database: 'db/development.sqlite'
})

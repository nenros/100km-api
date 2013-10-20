require "./api"
require "sinatra/activerecord/rake"

require 'rspec/core'
require 'rspec/core/rake_task'

task :default => :spec

desc "Rozpoczynanie wszystkich testów"
RSpec::Core::RakeTask.new(:spec)
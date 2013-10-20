require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'
require 'json'
require 'pg' 
require 'newrelic_rpm'
require 'sinatra/reloader' if development?

Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/controllers/*.rb'].each {|file| require file }

class Api < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  helpers Sinatra::JSON

  set :json_content_type, :js

  configure :development do
    register Sinatra::Reloader
    set :database, 'sqlite:///db/sqlite.db'
  end

  configure :production do
    ActiveRecord::Base.establish_connection(ENV['HEROKU_POSTGRESQL_GREEN_URL'])
  end

  register Sinatra::Controllers::Main

end
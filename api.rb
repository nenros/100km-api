require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'
require 'json'
require 'pg' 
require 'newrelic_rpm'
require 'sinatra/cross_origin'
require 'sinatra/reloader' if development?

Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/controllers/*.rb'].each {|file| require file }

class Api < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::CrossOrigin
  helpers Sinatra::JSON

 
  before do
headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
headers['Access-Control-Allow-Origin'] = '*'
headers['Access-Control-Allow-Headers'] = 'accept, authorization, origin'
end
  
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

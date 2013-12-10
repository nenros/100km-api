require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'
require 'json'
require 'pg'
require "yaml"
require 'newrelic_rpm'

Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/controllers/*.rb'].each {|file| require file }

class Api < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  helpers Sinatra::JSON
  #use Rack::Session::Pool, :expire_after => 2592000
  set :json_encoder, :to_json
  set :json_content_type, :js
  ActiveRecord::Base.include_root_in_json = true
  #enable :sessions
  before do
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Headers'] = 'accept, authorization, origin'
  end
  configure :development, :test, :production do
    if ENV['VCAP_SERVICES'].nil?
      set :database, 'sqlite:///db/sqlite.db'
    else
      services = JSON.parse(ENV['VCAP_SERVICES'])
      postgresql_key = services.keys.select { |svc| svc =~ /postgresql/i }.first
      postgresql = services[postgresql_key].first['credentials']
      postgresql_conn = {:adapter  => "postgresql",:host => postgresql['hostname'], :port => postgresql['port'], :username => postgresql['user'], :password => postgresql['password'], :dbname => postgresql['name']}
      
      ActiveRecord::Base.establish_connection(postgresql_conn)
    end
  end
  
  configure :appfog do
    ActiveRecord::Base.establish_connection(YAML.load_file("config/appfog.yml"))
  end
  configure :development, :test do
    NEWRELIC_ENABLE=false
  end

  configure :production do   
    #set :session_secret, ENV['SESSION_SECRET']
  end
  

  register Controllers::Main
  register Controllers::Districts
  register Controllers::Users
  register Controllers::Units

end

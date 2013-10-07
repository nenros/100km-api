require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader' if development?

Dir[File.dirname(__FILE__) + '/modele/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/kontrolery/*.rb'].each {|file| require file }

class Aplikacja < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure :development do
    register Sinatra::Reloader
    set :database, 'sqlite:///db/sqlite.db'
  end

  configure :production do
    ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
  end

  get "/" do
    "Hello word"
  end

end
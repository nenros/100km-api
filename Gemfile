source 'https://rubygems.org'

gem "rake"
gem "sinatra"
gem "sinatra-contrib"
gem "activerecord"
gem "sinatra-activerecord"
gem 'bcrypt-ruby', '~> 3.0.0'
gem "sinatra-cross_origin"

group :development do
  gem "sqlite3"
  gem "shotgun"
  gem "tux"
end

group :development,:test do
  gem 'rspec'
  gem 'rack-test'
end

group :production do
  gem 'newrelic_rpm'
  gem "pg"
end
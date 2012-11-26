source "http://rubygems.org"

gem "rake"
gem "jekyll"
gem "sinatra"
gem "yajl-ruby"
gem "slingshot-rb"
gem "thin"

group :test do
  gem 'shoulda'
  gem 'mocha'
  gem 'rack-test'
  gem 'turn' unless ENV["TM_FILEPATH"]
end

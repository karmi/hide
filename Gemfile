source "http://rubygems.org"

gem "rake"
gem "jekyll"
gem "slingshot-rb", :git => 'git://github.com/karmi/slingshot.git'

group :test do
  gem 'shoulda'
  gem 'mocha'
  gem 'turn' unless ENV["TM_FILEPATH"]
end

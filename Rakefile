require 'bundler'
Bundler::GemHelper.install_tasks
Bundler.require :default

require File.expand_path( '../lib/hide', __FILE__ )

task :default => :test

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

namespace :index do

  desc "Remove the ElasticSearch index"
  task :destroy do
    site = Hide::Site.new(ENV['HIDE_WEBSITE'], :pages_directories => ['guide', 'community', 'tutorials', 'videos'])
    indexer = Hide::Indexer.new(site, 'elastic-search-website')
    indexer.destroy!
  end

  desc "Setup the ElasticSearch index (mapping)"
  task :setup do
    site = Hide::Site.new(ENV['HIDE_WEBSITE'], :pages_directories => ['guide', 'community', 'tutorials', 'videos'])
    indexer = Hide::Indexer.new(site, 'elastic-search-website')
    puts indexer.setup() ? 'Created index with mapping' : 'Index already exists'
  end

  desc "Import whole website into ElasticSearch"
  task :import do
    site = Hide::Site.new(ENV['HIDE_WEBSITE'], :pages_directories => ['guide', 'community', 'tutorials', 'videos'])
    indexer = Hide::Indexer.new(site, 'elastic-search-website')

    start = Time.now
    indexer.reindex!
    puts "-"*80, "Indexing finished in #{Time.now-start} seconds", ""
  end

end

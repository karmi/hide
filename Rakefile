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

  task :prepare do
    @site = Hide::Site.new(Hide.config(:path), :pages_directories => Hide.config(:directories))
    @indexer = Hide::Indexer.new(Hide.config(:index_name))
  end

  desc "Delete the ElasticSearch index"
  task :destroy => :prepare do
    if @indexer.destroy!
      puts "Deleted index '#{Hide.config(:index_name)}'"
    else
      puts "Error deleting index"
    end
  end

  desc "Setup the ElasticSearch index with proper mapping"
  task :setup => :prepare do
    if @indexer.setup 
      puts "Created index '#{Hide.config(:index_name)}' with mapping"
    else
      puts "Index '#{Hide.config(:index_name)}' already exists"
    end
  end

  desc "Import the website into ElasticSearch index"
  task :import => :prepare do
    @start = Time.now
    @indexer.reindex!
    puts "-"*80, "Indexing finished in #{Time.now-start} seconds", ""
  end

end

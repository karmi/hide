# Run me with `ruby -I lib example/indexer.rb` from the project directory

require 'rubygems'
require 'hide'

site = Hide::Site.new('/Users/karmi/Playground/ElasticSearch/Website/karmi-elasticsearch.github.com',
                         :pages_directories => ['guide', 'community', 'tutorials', 'videos'])
indexer = Hide::Indexer.new(site, 'elastic-search-website')

start = Time.now

indexer.reindex!

puts "-"*80, "Indexing finished in #{Time.now-start} seconds", ""

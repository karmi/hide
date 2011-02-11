$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'rubygems'
require File.expand_path('../../lib/hide', __FILE__)

site    = Hide::Site.new('/Users/karmi/Playground/ElasticSearch/Website/karmi-elasticsearch.github.com',
                         :pages_directories => ['guide', 'community', 'tutorials', 'videos'])
indexer = Hide::Indexer.new(site, 'elastic-search-website')

start = Time.now

indexer.index_all_pages!

puts "-"*80, "Indexing finished in #{Time.now-start} seconds", ""

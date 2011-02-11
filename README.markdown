Hide
======

Search for [Jekyll](https://github.com/mojombo/jekyll) websites.

Essentially a spike for the <http://www.elasticsearch.org> website.


Usage
-----

Run `example/indexer.rb`, but essentially:

    $LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

    require 'rubygems'
    require File.expand_path('../../lib/hide', __FILE__)

    site    = Hide::Site.new('/path/to/the/jekyll/site',
                             :pages_directories => ['pages', 'tutorial', 'etc'])
    indexer = Hide::Indexer.new(site, 'some-name-for-elasticsearch-index')

    start = Time.now

    indexer.index_all_pages!

    puts "-"*80, "Indexing finished in #{Time.now-start} seconds", ""


Todo
----

* Take site path etc from `ARGV` in indexer.rb
* Create some sane mapping (eg. boost for `title` fields, etc) for the index
* Embedded webserver for Github post-receive hook, re-index changed docs on `push`

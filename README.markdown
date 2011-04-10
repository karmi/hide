Hide
======

Search for [Jekyll](https://github.com/mojombo/jekyll) websites.

Implemented for the <http://www.elasticsearch.org> website, may be useful for others.

Installation
------------

1. Install [ElasticSearch](http://elasticsearch.org/guide/reference/setup/installation.html)
2. Clone this repository: `git clone git://github.com/karmi/hide.git`
3. Install the required gems: `bundle install`

Usage
-----

Clone the repository containing the Jekyll website, such as:

    git clone https://github.com/elasticsearch/elasticsearch.github.com.git

Create and edit the configuration file (be sure to set correct path and index name):

    cp config.example.rb config.rb
    vim config.rb

Run the following Rake tasks:

    rake index:destroy
    rake index:setup
    rake index:import

You can try out some queries in the browser: <http://localhost:9200/elastic-search-website/_search?pretty=true&q=filter>

There's also a server serving as an endpoint for [Github post-receive hooks](http://help.github.com/post-receive-hooks/).
You can run it as any Rack application, for example:

    bundle exec thin -R config.ru start

-----

[Karel Minarik](http://karmi.cz)

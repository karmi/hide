Hide
======

Search for [Jekyll](https://github.com/mojombo/jekyll) websites.

Implemented for the <http://www.elasticsearch.org> website.

Installation
------------

1. Install [ElasticSearch](http://elasticsearch.org/guide/reference/setup/installation.html)
2. Install the required gems: `bundle install`

Usage
-----

Clone the repository, such as:

    git clone https://github.com/elasticsearch/elasticsearch.github.com.git

Create and edit the configuration file (be sure to set correct path and index name):

    cp config.example.rb config.rb
    vim config.rb

Run the following Rake tasks:

    rake index:destroy HIDE_WEBSITE=/path/to/the/cloned/website/repo
    rake index:setup HIDE_WEBSITE=/path/to/the/cloned/website/repo
    rake index:import HIDE_WEBSITE=/path/to/the/cloned/website/repo

There's also a server serving as an endpoint for [Github post-receive hooks](http://help.github.com/post-receive-hooks/).

TODO: explain how to launch it. eg. bundle exec rackup

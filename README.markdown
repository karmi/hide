Hide
======

Search for [Jekyll](https://github.com/mojombo/jekyll) websites.

Implemented for the <http://www.elasticsearch.org> website.

Installation
------------

1. Install [ElasticSearch](http://elasticsearch.org/guide/reference/setup/installation.html)
2. Install the gems: `bundle install`

Usage
-----

Clone the repository, such as:

    git clone https://github.com/elasticsearch/elasticsearch.github.com.git

Run the following Rake tasks:

    rake index:destroy HIDE_WEBSITE=/path/to/the/cloned/website/repo
    rake index:setup HIDE_WEBSITE=/path/to/the/cloned/website/repo
    rake index:import HIDE_WEBSITE=/path/to/the/cloned/website/repo

There's also a server serving as an endpoint for [Github post-receive hooks](http://help.github.com/post-receive-hooks/).
Run it as any Ruby webserver (Thin, Passenger, etc).

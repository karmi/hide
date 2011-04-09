ENV['RACK_ENV'] = 'test'

require 'rubygems'
require 'test/unit'
require 'rack/test'
require 'shoulda'
require 'mocha'
require 'turn' unless ENV["TM_FILEPATH"]
require 'pathname'

module Hide
  extend self

  DEFAULT_CONFIG = {
    :path        => File.expand_path( 'site', File.dirname(__FILE__) ),
    :branch      => 'master',
    :directories => ['guide', 'blog'],
    :index_name  => 'elastic-search-website-test',

    :server      => {
      :username => 'admin',
      :password => 'admin'
    }
  }

  def config(key)
    @config ||= DEFAULT_CONFIG
    @config[key]
  end
end

require 'hide'

GITLOG =<<-GITLOG
1e5db8709c1e971e53b41696e8265ac14b9a8f74 :|: add percolator blog post
blog/_posts/2011-02-08-percolator.textile

9c9940a8813e61b8e86a0926d4c5f0f0de9efc1d :|: Adding @karmi/slingshot to the list of client libraries [Ruby]
guide/appendix/clients.textile

046d0a15bc24a066878fb4efbb57052ff313c57d :|: add elasticsearch-head to the list of front ends
guide/appendix/clients.textile

02583be0439939346a0c831ab6aa165ba4767399 :|: fix links and some tables
guide/reference/api/admin-cluster-health.textile
guide/reference/api/admin-cluster-state.textile
guide/reference/api/count.textile
guide/reference/api/delete-by-query.textile
guide/reference/api/index_.textile
guide/reference/api/search/uri-request.textile

0fc409d9245c8f30a41384e8d2934e2d231ead6a :|: fix optimize docs
guide/reference/api/admin-indices-optimize.textile
GITLOG

class Test::Unit::TestCase

  def path_to_test_site
    File.expand_path( 'site', File.dirname(__FILE__) )
  end

end

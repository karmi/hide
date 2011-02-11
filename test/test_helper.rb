require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'mocha'
require 'turn' unless ENV["TM_FILEPATH"]
require 'pathname'

require 'hide'

class Test::Unit::TestCase

  def test_site_path
    File.expand_path( 'wiki', File.dirname(__FILE__) )
  end

end

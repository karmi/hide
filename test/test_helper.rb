require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'mocha'
require 'turn' unless ENV["TM_FILEPATH"]
require 'pathname'

require 'hide'

class Test::Unit::TestCase

  def path_to_test_site
    File.expand_path( 'site', File.dirname(__FILE__) )
  end

end

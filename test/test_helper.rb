require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'mocha'
require 'turn' unless ENV["TM_FILEPATH"]
require 'pathname'

require 'deagol'

class Test::Unit::TestCase

  def wiki_path
    File.expand_path( 'wiki', File.dirname(__FILE__) )
  end

end

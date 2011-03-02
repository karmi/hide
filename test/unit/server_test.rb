require 'test_helper'

class ServerTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Hide::Server
  end

  PAYLOAD =<<-PAYLOAD
{
  "after": "d40c96be399e791db154e64cb90324e6b87e97a1", 
  "before": "a576986a5a50c98dfa556a2ef0863b3877742aa8", 
  "commits": [{
      "added": ["scripts\/jquery.placeholder.js"], 
      "author": { "email": "karmi@karmi.cz" }, 
      "id": "7d87ad32bdf0f06d12ac6d135d59cede7c725475", 
      "message": "..."
    }],
  "ref": "refs\/heads\/search",
  "repository": {}
}
  PAYLOAD

  context "Server" do

    should "raise error for invalid JSON" do
      post '/update', "DEVNULL"
      assert ! last_response.ok?
      assert_equal 500, last_response.status
    end

    should "raise error for inadequate JSON" do
      post '/update', '{"ok":"true"}'
      assert ! last_response.ok?
      assert_equal 500, last_response.status
    end

    should "perform index update for valid JSON" do
      Hide::Indexer.any_instance.expects(:update!).with('a576986a5a50c98dfa556a2ef0863b3877742aa8', 'd40c96be399e791db154e64cb90324e6b87e97a1')

      post '/update', PAYLOAD
      assert last_response.ok?, "#{last_response.status} is NOT OK."
    end

  end

end

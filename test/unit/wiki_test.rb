require 'test_helper'

module Deagol

  class WikiTest < Test::Unit::TestCase

    context "Wiki" do
      setup { @wiki = Deagol::Wiki.new(wiki_path) }

      should "should be initialized with repo" do
        assert_not_nil @wiki
      end

      should "have pages" do
        assert_not_nil @wiki.pages
        assert_equal 10, @wiki.pages.size
      end
    end

  end

end

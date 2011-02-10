require 'test_helper'

module Hide

  class WikiTest < Test::Unit::TestCase

    context "Wiki" do
      setup { @wiki = Hide::Wiki.new(wiki_path) }

      should "should be initialized with repo" do
        assert_not_nil @wiki
      end

      should "have pages" do
        assert_not_nil @wiki.pages
        assert_equal 10, @wiki.pages.size
        assert_instance_of Hide::Page, @wiki.pages.first
      end
    end

  end

end

require 'test_helper'

module Hide

  class PageTest < Test::Unit::TestCase

    context "Page" do
      setup do
        @wiki = Hide::Wiki.new(wiki_path)
        @page = @wiki.pages.first
      end

      should "should save title, path and content" do
        assert_equal 'You Know, for Search', @page.title
        assert_equal 'blog/_posts/2010-02-08-youknowforsearch.textile', @page.path
        assert_match Regexp.new(Regexp.escape("You Know, for Search")), @page.content
      end

      should "parse metadata from header" do
        assert_not_nil @page.meta
        assert_equal 'blog', @page.meta['cat']
        assert_equal 'You Know, for Search', @page.meta['title']
      end

      should "have a :to_indexed_json method" do
        assert_nothing_raised do
          json = @page.to_indexed_json
          hash = JSON.parse(json)
          assert_equal 'You Know, for Search', hash['title']
          assert_equal 'blog', hash['category']
        end
      end

    end

  end

end

require 'test_helper'

module Deagol

  class PageTest < Test::Unit::TestCase

    context "Page" do
      setup do
        @wiki = Deagol::Wiki.new(wiki_path)
        @page = @wiki.pages.first
      end

      should "should save title, path and content" do
        assert_equal '2010 02 08 youknowforsearch', @page.title
        assert_equal 'blog/_posts/2010-02-08-youknowforsearch.textile', @page.path
        assert_match Regexp.new(Regexp.escape("You Know, for Search")), @page.content
      end

      should "parse metadata from header" do
        assert_not_nil @page.meta
        assert_equal 'blog', @page.meta['cat']
        assert_equal 'You Know, for Search', @page.meta['title']
      end

    end

  end

end

require 'test_helper'

module Hide

  class PageTest < Test::Unit::TestCase

    def setup
      super
      @site = Hide::Site.new(path_to_test_site, :pages_directories => ['guide'])
    end

    context "Page" do
      setup do
        @page = @site.pages.first
      end

      should "should have title" do
        assert_equal 'Building from Source', @page.title
      end

      should "should have category" do
        assert_equal 'guide', @page.category
      end

      should "should have content" do
        assert_match Regexp.new(Regexp.escape("building an elasticsearch distribution is simple")), @page.content
      end

      should "should have url" do
        assert_equal '/guide/appendix/building-from-source.html', @page.url
      end

      should "have ID" do
        assert_equal 'guide___appendix___building-from-source', @page.id
      end

      should "have a :to_indexed_json method" do
        assert_nothing_raised do
          json = @page.to_indexed_json
          hash = JSON.parse(json)
          assert_equal 'Building from Source', hash['title']
          assert_equal 'guide',                hash['category']
        end
      end

    end

    context "Post" do
      setup do
        @post = @site.posts.first
      end

      should "should have title" do
        assert_equal 'You Know, for Search', @post.title
      end

      should "should have category" do
        assert_equal 'blog', @post.category
      end

      should "should have content" do
        assert_match Regexp.new(Regexp.escape("ElasticSearch itself was born out of my frustration")), @post.content
      end

      should "should have url" do
        assert_equal '/blog/2010/02/08/youknowforsearch.html', @post.url
      end

      should "have ID" do
        assert_equal 'blog___2010___02___08___youknowforsearch', @post.id
      end

      should "have a :to_indexed_json method" do
        assert_nothing_raised do
          json = @post.to_indexed_json
          hash = JSON.parse(json)
          assert_equal 'You Know, for Search', hash['title']
          assert_equal 'blog',                hash['category']
        end
      end

    end

  end

end

require 'test_helper'

module Hide

  class SiteTest < Test::Unit::TestCase

    context "Site" do
      setup { @site = Hide::Site.new path_to_test_site, :pages_directories => ['guide'] }

      should "have pages" do
        assert_not_nil @site.pages
        assert_equal 60, @site.pages.size
        assert_instance_of Hide::Page, @site.pages.first
      end

      should "have blog posts" do
        assert_not_nil @site.posts
        assert_equal 3, @site.posts.size
        assert_instance_of Hide::Page, @site.posts.first
      end
    end

  end

end

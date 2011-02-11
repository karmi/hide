require 'test_helper'

module Hide

  class SiteTest < Test::Unit::TestCase

    context "Site" do
      setup { @site = Hide::Site.new test_site_path }

      should "have pages" do
        assert_not_nil @site.pages
        assert_equal 10, @site.pages.size
        assert_instance_of Hide::Page, @site.pages.first
      end
    end

  end

end

require 'test_helper'

module Hide

  class UpdaterTest < Test::Unit::TestCase

    context "Updater" do

      setup do
        @site = Hide::Site.new path_to_test_site, :pages_directories => ['guide']
        @updater = Updater.new @site, 'abc123', 'def456'
      end

      should "return updated paths based on sha1 and sha2" do
        Git.any_instance.expects(:changed_files).returns( %w|blog/_posts/2011-02-08-percolator.textile guide/appendix/clients.textile| )
        assert_equal %w|blog/_posts/2011-02-08-percolator guide/appendix/clients|, @updater.updated_paths
      end

      should "return selected pages based on updated paths" do
        @updater.stubs(:updated_paths).returns( ['guide/reference/api/search/request-body'] )
        assert_equal 1, @updater.updated_pages.size
        assert_equal 'Search API - Request Body', @updater.updated_pages.first.title
      end

      should "return updated blog posts based on updated paths" do
        @updater.stubs(:updated_paths).returns( ['blog/2010/02/08/youknowforsearch'] )
        assert_equal 1, @updater.updated_posts.size
        assert_equal 'You Know, for Search', @updater.updated_posts.first.title
      end

    end

  end

end

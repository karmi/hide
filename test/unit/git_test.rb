require 'test_helper'

module Hide

  class GitTest < Test::Unit::TestCase

    context "Git" do

      setup do
        @git = Git.new path_to_test_site, 'abc123', 'def456'
      end

      should "return updated files" do
        command = %Q[log --no-merges --pretty="format:%H :|: %s" --stat --name-only --no-color abc123..def456]
        @git.expects(:in_repo).with(command).returns(GITLOG)

        assert_equal 10, @git.changed_files.size
      end

      should "update the repository" do
        @git.expects(:in_repo).with('fetch')
        @git.expects(:in_repo).with('reset origin/master --hard')

        @git.update_repo
      end

      should "execute git commands for changed_files only once" do
        command = %Q[log --no-merges --pretty="format:%H :|: %s" --stat --name-only --no-color abc123..def456]
        @git.expects(:in_repo).with(command).returns(GITLOG).once

        assert_equal 10, @git.changed_files.size
        assert_equal 10, @git.changed_files.size
      end

    end

  end

end

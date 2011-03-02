module Hide
  class GitError < Exception; end

  class Git

    def initialize(path, sha1, sha2)
      @path, @sha1, @sha2 = path, sha1, sha2
    end

    def changed_files
      command = %Q[log --no-merges --pretty="format:%H :|: %s" --stat --name-only --no-color #{@sha1}..#{@sha2}]
      output  = in_repo(command)
      parse output
    end

    def in_repo command
      output = %x[git --git-dir=#{@path}/.git #{command} 2>&1]
      raise GitError, output unless $?.success?
      output
    end

    def parse output
      output.split(/\n\n/).map do |commit|
        lines = commit.split("\n")
        sha   = lines.shift.split(':|:').shift.strip
        files = lines
        # { :sha => sha, :files => files }
        files
      end.flatten
    end

  end
end

module Hide
  class Git

    def initialize(path, sha1, sha2)
      @path, @sha1, @sha2 = path, sha1, sha2
    end

    def changed_files
      command = %Q[git log --no-merges --pretty="format:%H :|: %s" --stat --name-only --no-color #{@sha1}..#{@sha2}]
      output  = exec(command)
      parse output
    end

    def exec command
      output = %x[#{command} 2>&1]
      raise Exception, output unless $?.success?
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

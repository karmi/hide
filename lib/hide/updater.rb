module Hide
  class Updater

    attr_reader :site, :sha1, :sha2

    def initialize(site, sha1, sha2)
      @site, @sha1, @sha2 = site, sanitize_sha(sha1), sanitize_sha(sha2)
    end

    def git
      Git.new @site.path, @sha1, @sha2
    end

    def updated_pages
      updated_pages = []
      @site.pages.each do |page|
        updated_paths.each { |path| updated_pages << page if page.url.include?(path) }
      end
      updated_pages
    end

    def updated_posts
      updated_posts = []
      @site.posts.each do |post|
        updated_paths.each { |path| updated_posts << post if post.url.include?(path) }
      end
      updated_posts
    end

    def updated_paths
      git.changed_files.map do |file|
        [ File.dirname(file), File.basename(file, '.*') ].join('/')
      end
    end

    private

    def sanitize_sha(sha)
      sha.to_s.gsub(/[^0-9a-z]/, '')
    end

  end
end

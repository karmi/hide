module Hide
  class Updater

    def initialize(site, sha1, sha2)
      @site, @sha1, @sha2 = site, sha1, sha2
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

  end
end

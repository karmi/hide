module Hide
  class Site

    def initialize(path, options = {})
      old_stderr, $stderr = $stderr, StringIO.new # Mute Jekyll swearing
      @site    = Jekyll::Site.new Jekyll.configuration({}.merge 'source' => path)
      $stderr  = old_stderr
      @options = options
      @options[:blog_directory]    ||= 'blog'
      @options[:pages_directories] ||= []
      read_posts
      read_pages
    end

    def pages
      @site.pages.map { |page| Hide::Page.new(page) }
    end

    def posts
      @site.posts.map { |page| Hide::Page.new(page) }
    end

    private

    def read_posts
      @site.read_posts @options[:blog_directory]
    end

    def read_pages
      @options[:pages_directories].each do |dir|
        @site.read_directories dir
      end
    end

  end
end

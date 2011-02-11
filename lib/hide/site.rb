module Hide
  class Site

    def initialize(path)
      @site = Jekyll::Site.new Jekyll.configuration({})
    end

    def pages
      @site.pages
    end

    def posts
      @site.posts
    end

  end
end

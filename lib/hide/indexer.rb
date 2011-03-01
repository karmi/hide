module Hide
  class Indexer

    attr_reader :index

    def initialize(site, index_name)
      @site  = site
      @index = Slingshot.index index_name
    end

    def setup
      index.create
    end

    def reindex!
      (@site.pages + @site.posts).each do |page|
        next unless page.title
        p [page.category, page.id]
        p index.store( page.category.to_s, page)
      end

      index.refresh
    end

    def update! paths
      raise NoMethodError, "TODO, my friend."
    end

  end
end

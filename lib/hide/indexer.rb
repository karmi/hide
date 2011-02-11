module Hide
  class Indexer

    def initialize(site, index_name)
      @site       = site
      @index_name = index_name
    end

    def index_all_pages!
      index = Slingshot.index @index_name
      index.delete
      index.create

      (@site.pages + @site.posts).each do |page|
        next unless page.title
        p [page.category, page.id]
        p index.store( page.category.to_s, page)
      end

      index.refresh
    end

  end
end

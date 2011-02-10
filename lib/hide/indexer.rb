module Hide
  class Indexer

    def initialize(wiki, index_name)
      @wiki       = wiki
      @index_name = index_name
    end

    def index_all_pages!
      index = Slingshot.index @index_name
      index.delete
      index.create

      @wiki.pages.each do |page|
        p [page.category, page.id]
        p index.store( page.category.to_s, page)
      end

      index.refresh
    end

  end
end

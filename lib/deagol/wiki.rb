module Deagol
  class Wiki

    def initialize(path, options = {})
      @wiki = Gollum::Wiki.new(path, options)
    end

    def pages(treeish = nil)
      @wiki.pages(treeish).map { |p| Deagol::Page.new(p.title, p.path, p.raw_data) }
    end

  end
end

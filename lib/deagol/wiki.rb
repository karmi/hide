module Deagol
  class Wiki

    def initialize(path, options = {})
      @wiki = Gollum::Wiki.new(path, options)
    end

    def pages(treeish = nil)
      @wiki.pages(treeish)
    end

  end
end

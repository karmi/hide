module Hide
  class Page

    attr_reader :meta

    def initialize(page)
      @page = page
    end

    def title
    end

    def category
    end

    def content
    end

    def url
    end

    def id
      # path.tr('/', '__').gsub(/\..+$/, '')
    end

    def to_hash
      { :id => id, :title => title, :category => category, :content => content, :url => url  }
    end

    def to_indexed_json
      to_hash.to_json
    end

    private

  end
end

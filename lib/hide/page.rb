module Hide
  class Page

    def initialize(page)
      @page = page
    end

    def title
      @page.data['title']
    end

    def category
      @page.data['cat'] || 'document'
    end

    def content
      @page.content
    end

    def url
      @page.destination '/'
    end

    def id
      url.gsub(/^\//, '').gsub(/\//, '___').gsub(/\..+$/, '')
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

module Deagol
  class Page

    attr_reader :path, :content, :meta

    def initialize(title, path, content)
      @title, @path, @content = title, path, content
      parse_metadata
    end

    def title
      meta['title'] || @title
    end

    def category
      meta['cat'] || 'page'
    end

    def id
      path.tr('/', '__').gsub(/\..+$/, '')
    end

    def to_hash
      { :id => id, :title => title, :category => category, :content => content, :path => path  }
    end

    def to_indexed_json
      to_hash.to_json
    end

    private

    def parse_metadata
      meta  = @content.split("\n---\n").first.to_s
      @meta = YAML.load(meta)
    end

  end
end

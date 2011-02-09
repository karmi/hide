module Deagol
  class Page

    attr_reader :title, :path, :content, :meta

    def initialize(title, path, content)
      @title, @path, @content = title, path, content
      parse_metadata
    end

    private

    def parse_metadata
      meta  = @content.split("\n---\n").first.to_s
      @meta = YAML.load(meta)
    end

  end
end

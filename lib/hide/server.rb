require 'sinatra/base'
require 'hide'

module Hide

  class Server < Sinatra::Base

    enable :logging, :show_exceptions

    configure :production, :development do
      require File.expand_path('../../../config', __FILE__)
    end

    configure do
      set :website_path,        Hide.config(:path)
      set :website_directories, Hide.config(:directories)
    end

    post '/update' do
      begin
        json = Yajl::Parser.parse(params[:payload])
        before, after = json['before'], json['after']
        # p [before, after]

        site     = Hide::Site.new(settings.website_path, :pages_directories => settings.website_directories)
        @indexer = Hide::Indexer.new site, 'elastic-search-website'
        @indexer.update! before, after
        
      rescue Yajl::ParseError
        STEDRR.puts params[:payload]
        error 500, "Invalid JSON"
      rescue Hide::GitError
        STEDRR.puts params[:payload]
        error 500, "Invalid JSON payload -- shas missing?"
      end
    end

  end

end

Hide::Server.run! if __FILE__ == $0

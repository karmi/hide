require 'sinatra/base'
require 'hide'

module Hide

  class Server < Sinatra::Base

    enable :logging, :show_exceptions

    configure :production, :development do
      require File.expand_path('../../../config', __FILE__)
    end

    use Rack::Auth::Basic, "Hide Server" do |username, password|
      Hide.config(:server)[:username] == username && Hide.config(:server)[:password] == password
    end

    post '/update' do
      begin
        STDERR.puts "Starting the update process..."
        json = Yajl::Parser.parse(params[:payload])
        before, after = json['before'], json['after']
        # p [before, after]

        @indexer = Hide::Indexer.new Hide.config(:index_name)
        @indexer.update! before, after
        
      rescue Yajl::ParseError
        STDERR.puts "Invalid JSON", params[:payload]
        error 500,  "Invalid JSON"
      rescue Hide::GitError => e
        STDERR.puts "Invalid JSON payload -- shas missing?", params[:payload], e.inspect
        error 500,  "Invalid JSON payload -- shas missing?"
      end
    end

  end

end

Hide::Server.run! if __FILE__ == $0

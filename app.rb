require 'bundler'

Bundler.require

require_relative 'lib/carthfile_parser'

class CarthageParser < Sinatra::Base
  use Rack::Deflater

  configure do
    set :dump_errors, false
    set :raise_errors, true
    set :show_exceptions, false
  end

  post '/carthfile' do
    content_type :json
    CarthfileParser.new(:runtime, params[:body]).to_json
  end

  post '/carthfile.private' do
    content_type :json
    CarthfileParser.new(:development, params[:body]).to_json
  end

  post '/carthfile.resolved' do
    content_type :json
    CarthfileParser.new(:runtime, params[:body]).to_json
  end
end

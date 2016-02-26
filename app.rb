require 'bundler'

Bundler.require

require_relative 'lib/cartfile_parser'

class CarthageParser < Sinatra::Base
  use Rack::Deflater

  configure do
    set :dump_errors, false
    set :raise_errors, true
    set :show_exceptions, false
  end

  post '/cartfile' do
    content_type :json
    CartfileParser.new(:runtime, params[:body]).to_json
  end

  post '/cartfile.private' do
    content_type :json
    CartfileParser.new(:development, params[:body]).to_json
  end

  post '/cartfile.resolved' do
    content_type :json
    CartfileParser.new(:runtime, params[:body]).to_json
  end
end

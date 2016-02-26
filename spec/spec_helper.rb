ENV["RACK_ENV"] = "test"

require 'bundler'
Bundler.require :default, :test

require 'minitest/autorun'
require 'minitest/spec'

require 'rack/test'
include Rack::Test::Methods

require_relative '../app'

def app
  CarthageParser
end

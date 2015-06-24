$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
begin
  require 'simplecov'
  SimpleCov.start
end
require 'rimdb'
require 'webmock/rspec'
require_relative 'utils'

$:.unshift File.expand_path('../../lib', __FILE__)
puts File.expand_path('../../lib', __FILE__)
require 'geeklist'   
require 'minitest/spec'
require 'fivemat/minitest/autorun'
require 'purdytest' # i like colorful tests
require 'vcr'

VCR.config do |c|
  c.cassette_library_dir  = 'spec/fixtures/cassette_library'
  c.hook_into :webmock
  c.ignore_localhost      = true
end

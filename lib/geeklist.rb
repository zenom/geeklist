#require 'faraday'
#require 'json'


module Geeklist

  class GeeklistError < StandardError
    def configure
      yield self
      true
    end
  end

  autoload :Client, "geeklist/client"
end

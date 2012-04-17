require 'oauth'

module Geeklist

  class << self
    attr_accessor :token, :secret

    def configure
      yield self
      true
    end

  end

  autoload :Client, "geeklist/client"
  autoload :Helpers, "geeklist/helpers"
end

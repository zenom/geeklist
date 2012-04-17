require 'geeklist'

module Geeklist
  class Client

    attr_reader :consumer_token, :consumer_secret, :consumer_options

    def initialize(consumer_token=Geeklist.token, consumer_secret=Geeklist.token, options = {})
      @consumer_token   = consumer_token
      @consumer_secret  = consumer_secret
      @consumer_options = options
    end

  end
end

module Geeklist
  module Helpers
    module Auth

      OAUTH_OPTIONS = {
        :request_token_path => '/v1/oauth/request_token',
        :access_token_path  => '/v1/oauth/access_token',
        :authorize_path     => '/oauth/authorize',
        :api_host           => 'http://api.geekli.st',
        :auth_host          => 'http://geekli.st'
      }


      def consumer
        options = {
          :site               => OAUTH_OPTIONS[:auth_host],
          :authorize_path     => OAUTH_OPTIONS[:authorize_path],
          :access_token_path  => OAUTH_OPTIONS[:access_token_path],
          :request_token_path => OAUTH_OPTIONS[:request_token_path]
        }
        @consumer ||= ::OAuth::Consumer.new(@consumer_token, @consumer_secret, options)
      end


      def request_token(options = {})
        @request_token = consumer.get_request_token(options)
      end
      

    end
  end
end

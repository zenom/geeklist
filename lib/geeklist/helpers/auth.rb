module Geeklist
  module Helpers
    module Auth

      OAUTH_OPTIONS = {
        :request_token_path => '/v1/oauth/request_token',
        :access_token_path  => '/v1/oauth/access_token',
        :authorize_path     => '/oauth/authorize',
        :api_host           => 'http://sandbox-api.geekli.st',
        :auth_host          => 'http://sandbox.geekli.st'
      }


      def consumer
        options = {
          :site               => OAUTH_OPTIONS[:auth_host],
          :authorize_path     => OAUTH_OPTIONS[:authorize_path],
          :access_token_path  => OAUTH_OPTIONS[:access_token_path],
          :request_token_path => OAUTH_OPTIONS[:request_token_path]
        }
        @consumer ||= ::OAuth::Consumer.new(@consumer_token, @consumer_secret, oauth_options)
      end


      # :oauth_callback => '' as option
      def request_token(options = {})
        @request_token ||= consumer.get_request_token(options)
      end

      def access_token
        #@access_token ||= ::OAuth::AccessToken.new(consumer, 
      end

      # authorize from a web request
      def authorize_from_request
      end

      # authorize from access
      def authorize_from_access(auth_token, auth_secret)
        @auth_token, @auth_secret = auth_token, auth_secret
      end

      def oauth_options
        {
          :request_token_url => oauth_url(:request_token, :api_host),
          :access_token_url => oauth_url(:access_token, :api_host),
          :authorize_url => oauth_url(:authorize, :auth_host),
          :site => OAUTH_OPTIONS[:api_host]
        }
      end

      def oauth_url(request_type, host)
        type = "#{request_type}_path".to_sym
        "#{OAUTH_OPTIONS[host.to_sym]}#{OAUTH_OPTIONS[type]}"
      end

    end
  end
end

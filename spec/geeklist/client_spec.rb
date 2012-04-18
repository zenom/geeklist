require 'helper'

require 'ap'
describe Geeklist::Client do

  let(:client) do
    key     = ENV['GEEKLIST_CONSUMER_KEY'] || '1234'
    secret  = ENV['GEEKLIST_CONSUMER_SECRET'] || '1234' 
    Geeklist::Client.new(key, secret)
  end

  it 'should be able to set token and secret outside a block' do
    Geeklist.token = '1234'
    Geeklist.secret = '1234'

    Geeklist.token.must_equal '1234'
    Geeklist.secret.must_equal '1234'
  end


  it 'should be able to setup via a configure block' do
    Geeklist.configure do |config|
      config.token = '1234'
      config.secret = '1234'
    end

    Geeklist.token.must_equal '1234'
    Geeklist.secret.must_equal '1234'
  end


  describe "#oauth" do

    describe '#consumer' do
      let(:consumer) do
        client.consumer
      end


      it 'should have a consumer' do
        consumer.wont_be_nil
        consumer.site.must_equal 'http://sandbox-api.geekli.st' 
        consumer.request_token_url.must_equal 'http://sandbox-api.geekli.st/v1/oauth/request_token'
        consumer.access_token_url.must_equal 'http://sandbox-api.geekli.st/v1/oauth/access_token'
        consumer.authorize_url.must_equal 'http://sandbox.geekli.st/oauth/authorize' 
      end

    end # end #consumer


    describe '#request' do
      before do
        VCR.insert_cassette('request')
      end

      it 'should have a valid request token' do
        request_token = client.request_token
        #puts "token: #{request_token.token}  -- secret: #{request_token.secret}"
        #puts "auth_url: #{request_token.authorize_url}"
        
        request_token.must_be_instance_of OAuth::RequestToken
        request_token.authorize_url.must_include 'geekli.st/oauth/authorize?oauth_token'
        
        # only 1 request was made via webmock
        assert_requested(:post, 'http://sandbox-api.geekli.st/v1/oauth/request_token', :times => 1)
      end

      it "should work with a callback url as well" do
        skip('implement this')
      end

      after do
        VCR.eject_cassette
      end
    end # end request


    describe '#authorize_from_request' do

      before do
        VCR.insert_cassette('authorize_from_request')
      end

      let(:access_token) do
        client.authorize_from_request('o78mvhHr56ktmx-A3Brbh3ezuIs', 'ZN9cXhgv5KMOpkcH_5HTXj0wcox-Y65JxWuGEaqAvLM', '5953675')
      end

      it 'should  return a valid access token' do
        access_token.must_be_instance_of Array
        access_token[0].must_be_kind_of String
        access_token[1].must_be_kind_of String

        assert_requested(:post, 'http://sandbox-api.geekli.st/v1/oauth/access_token', :times => 1)
      end

      after do
        VCR.eject_cassette
      end

    end

    describe '#authorize_from_access' do
      let(:auth_token) do
        client.authorize_from_access('dummy-token' ,'dummy-secret')
      end

      it 'should return a valid auth token' do
        auth_token.must_be_instance_of Array
        auth_token[0].must_be_kind_of String
        auth_token[1].must_be_kind_of String
      end
    end


    describe '#access-token' do
      let(:access_token) do
        client.authorize_from_access('dummy-token', 'dummy-secret')
        client.access_token
      end

      it 'should return a valid access token' do
        access_token.must_be_instance_of OAuth::AccessToken
        access_token.token.must_be_kind_of String
      end
    end

  end # end oauth

end # end describe

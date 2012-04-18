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
        VCR.insert_cassette(__name__)
      end

      it 'should have a valid request token' do
        #ap client.request_token
        ap client
        ap client.consumer
        ap client.request_token
        #skip "Need to build out request stuff."
      end

      after do
        VCR.eject_cassette
      end
    end # end request


  end # end oauth

end # end describe

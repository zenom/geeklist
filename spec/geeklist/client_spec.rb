require 'helper'

require 'ap'
describe Geeklist::Client do

  before do
    Geeklist.token = nil
    Geeklist.secret = nil
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
    it 'should pass' do
      true
    end
  end


end

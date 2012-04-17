require 'helper'

require 'ap'
describe Geeklist::Client do

  before do
    #@client = Geeklist::Client.new('1234', '1234')
  end


  it "should be able to setup via a configure block" do
    Geeklist.configure do |config|
      config.token = '1234'
      config.secret = '1234'
    end

    Geeklist.token.must_equal '1234'
    Geeklist.secret.must_equal '1234'
  end


end

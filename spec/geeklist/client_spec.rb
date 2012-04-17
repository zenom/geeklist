require 'helper'

require 'ap'
describe Geeklist::Client do

  before do
    @client = Geeklist::Client.new('1234', '1234')
  end

  it "should pass the test" do
    ap @client
  end 

end

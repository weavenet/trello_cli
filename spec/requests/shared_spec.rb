require 'spec_helper'

describe RubyTrelloCli::Requests::Shared do

  before do 
    @object = Object.new
    @object.extend RubyTrelloCli::Requests::Shared
  end
  
  it "should connect to trello" do
    @object.stub :key   => 'dakey',
                 :token => 'datoken'

    Trello.should_receive(:configure).and_yield

    @object.connect_to_trello
  end
end

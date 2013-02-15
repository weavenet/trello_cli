require 'spec_helper'

describe RubyTrelloCli::CLI::Shared do

  before do 
    @object = Object.new
    @object.extend RubyTrelloCli::CLI::Shared
  end
  
  it "should connect to trello" do
    @object.stub :key   => 'dakey',
                 :token => 'datoken'

    Trello.should_receive(:configure).and_yield
    Trello.should_receive(:key)

    @object.connect_to_trello
  end
end

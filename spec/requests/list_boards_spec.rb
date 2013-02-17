require 'spec_helper'

describe RubyTrelloCli::Requests::ListBoards do
  before do
    Trello.should_receive(:configure)
  end

  it "should list the lists for given board" do
    Trello::Board.stub :all => ['123']
    lb = RubyTrelloCli::Requests::ListBoards.new
    lb.list.should == ['123']
  end
end

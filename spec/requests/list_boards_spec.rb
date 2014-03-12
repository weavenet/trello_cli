require 'spec_helper'

describe TrelloCli::Requests::ListBoards do
  before do
    Trello.should_receive(:configure)
  end

  it "should list the lists for given board" do
    Trello::Board.stub :all => ['123']
    subject.list.should == ['123']
  end
end

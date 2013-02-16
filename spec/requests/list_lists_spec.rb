require 'spec_helper'

describe RubyTrelloCli::Requests::ListLists do
  before do
    Trello.should_receive(:configure)
  end

  it "should list the lists for given board" do
    trello_board_mock = mock 'new'
    Trello::Board.should_receive(:new).with('id' => '123').
                  and_return trello_board_mock
    list_mock  = mock 'list'
    attributes = { :name => 'thename', :id => '321' }
    list_mock.stub :attributes => attributes
    trello_board_mock.stub :lists => [list_mock]
    ll = RubyTrelloCli::Requests::ListLists.new
    ll.should_receive(:puts).with("Name : thename ( 321 )")
    ll.list(:board_id => '123')
  end
end
